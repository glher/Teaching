import database as db

renewables = ['hydro', 'solar', 'wind', 'biomass']
clean_non_renewables = ['nuclear']
fossils = ['thermal']


def get_energy_need(scenario, year='2020'):
    """
    Here the goal is to assess the need in TWh to satisfy, and the corresponding installed capacity needed.
    We assess the quantity of non-renewable electricity to replace to meet the demand, assuming that we set ourselves
    in a no imports, no exports situation.
    """
    rebuild_need = db.electricity_demand[year]
    if scenario == '100_renewable':
        initial_need = db.electricity_demand[year] - sum([db.annual_production[year][i] for i in renewables])
    elif scenario == '100_nuclear':
        initial_need = db.electricity_demand[year] - sum([db.annual_production[year][i]
                                                          for i in renewables + clean_non_renewables])
    else:
        raise ValueError(f'The scenario given ({scenario}) does not exist')
    return rebuild_need, initial_need


def get_power_capacity_need(source, rebuild_need, initial_need, year='2020'):
    """
    Here we want to get the installed power capacity needed to reach the energy production need, given the load factor.
    """
    production_source, _ = source
    initial_p_installed = initial_need / (db.average_load_factor[production_source] * 8760 * 1e-3)
    rebuild_p_installed = rebuild_need / (db.average_load_factor[production_source] * 8760 * 1e-3)

    return initial_p_installed, rebuild_p_installed


def get_storage(source, rebuild_p_installed):
    production_source, _ = source
    storage_installed = db.storage_capacity[production_source] * rebuild_p_installed
    return storage_installed


def get_power_capacity_need_with_storage(source, rebuild_p_installed, storage_installed, year='2020'):
    """
    Here we want to get the installed power capacity needed to reach the energy production need, given the load factor.
    """
    production_source, storage_source = source
    p_installed = rebuild_p_installed + storage_installed * (1 / db.storage_loss[storage_source] - 1)

    return p_installed


def get_cost(source, rebuild_capacity, storage_capacity, timeframe=100, year='2020'):
    production_source, storage_source = source

    # Number of production builds:
    n_prod_build = int((timeframe - 1) / float(db.lifetimes[year][production_source])) + 1
    # Number of storage builds
    if storage_capacity > 0:
        n_stor_build = int((timeframe - 1) / float(db.lifetimes[year][storage_source])) + 1
    # Number of grid builds
    n_grid_build = int((timeframe - 1) / float(db.lifetimes[year]['grid'])) + 1

    # Costs in millions $
    investment_cleanup = db.dismantling_costs[year]['nuclear'] * db.installed_capacity[year]['nuclear']
    print(f'Dismantling of current nuclear: ${1e-3 * investment_cleanup:.1f} billions')
    investment_production = n_prod_build * rebuild_capacity * db.capital_costs[year][production_source]
    print(f'Deployment of the production means: ${1e-3 * investment_production:.1f} billions')
    investment_grid = n_grid_build * db.grid_costs[year] * rebuild_capacity
    print(f'Upgrade to the grid: ${1e-3 * investment_grid:.1f} billions')
    if storage_capacity > 0:
        investment_storage = n_stor_build * storage_capacity * db.storage_costs[year][storage_source]
    else:
        investment_storage = 0
    print(f'Investment into storage technology: ${1e-3 * investment_storage:.1f} billions')

    # Cost in trillions $
    total_investments = 1e-6 * (investment_cleanup + investment_production + investment_grid + investment_storage)
    print(f'Total investments over {timeframe} years: ${total_investments:.2f} trillions')


scenario = '100_renewable'
sub_scenario = ('wind_onshore', 'pumped_hydro')
year = '2020'
print(f'Scenario: {scenario.replace("_", "% ")}')
print(f'  --> Sub-Scenario: {sub_scenario[0].replace("_", " ")} with {sub_scenario[1].replace("_", " ")} storage')
rebuild_need, initial_need = get_energy_need(scenario, year=year)
initial_capacity, rebuild_capacity = get_power_capacity_need(sub_scenario, rebuild_need, initial_need, year=year)
storage_installed = 0
if scenario == '100_renewable':
    # storage
    # Here we calculate the maximum production that will need to be stored, based on a low demand
    # Note that this can be lowered by using the surplus energy for different needs (desalination, hydrogen production,
    # etc). However, enough needs to be stored in batteries to account for the inverse maximal production/demand peak
    storage_installed = get_storage(sub_scenario, rebuild_capacity)
    rebuild_capacity = get_power_capacity_need_with_storage(sub_scenario, rebuild_capacity, storage_installed,
                                                            year=year)
    # max_storage = maximum_renewable_production[sub_scenario] * rebuild_capacity - minimum_yearly_load[year]
    # print(max_storage)
get_cost(sub_scenario, rebuild_capacity, storage_installed, timeframe=100, year=year)
