import yaml
# import database as db

renewables = ['hydro', 'solar', 'wind', 'biomass']
clean_non_renewables = ['nuclear']
fossils = ['thermal']


def get_energy_need(scenario, f, year=2020):
    """
    Here the goal is to assess the need in TWh to satisfy, and the corresponding installed capacity needed.
    We assess the quantity of non-renewable electricity to replace to meet the demand, assuming that we set ourselves
    in a no imports, no exports situation.
    """
    rebuild_need = f * db['electricity_demand'][year]
    # if scenario == '100_renewable':
    #     initial_need = db['electricity_demand'][year] - sum([db['annual_production'][year][i] for i in renewables])
    # elif scenario == '100_nuclear':
    #     initial_need = db['electricity_demand'][year] - sum([db['annual_production'][year][i]
    #                                                          for i in renewables + clean_non_renewables])
    # else:
    #     raise ValueError(f'The scenario given ({scenario}) does not exist')
    # return rebuild_need, initial_need
    return rebuild_need


def get_power_capacity_need(source, rebuild_need, year=2020):
    """
    Here we want to get the installed power capacity needed to reach the energy production need, given the load factor.
    """
    production_source, _ = source[0], source[1]
    # initial_p_installed = initial_need / (db['average_load_factor'][year][production_source] * 8760 * 1e-3)
    rebuild_p_installed = rebuild_need / (db['average_load_factor'][year][production_source] * 8760 * 1e-3)
    print('\nInitial\n========')
    print(f'Installation: {rebuild_p_installed:.1f} GW without storage')
    # return initial_p_installed, rebuild_p_installed
    return rebuild_p_installed


def get_storage(source, rebuild_p_installed, period=24, year=2020, backup=-1):
    production_source = source[0]
    # Energy capacity in GWh (X% of time for 20% lowest production for energy power need, for one day)
    # print(db.electricity_demand[year] * db.storage_capacity[production_source] * period * 1e-3)
    # energy_capacity = db['electricity_demand'][year] * db['backup_capacity'][year][production_source]
    # print('\nStorage\n========')
    # print(f'{1e-3 * energy_capacity * period:.1f} TWh needs to cover {period / 24:.1f} day')
    # Get the demand per hour (annual TWh/ #h year) and multiply this by the number of hours needed
    print(f'backup: {backup}')
    if backup < 0:
        energy_capacity = 1e3 * db['electricity_demand'][year] / 8760. * db['backup_capacity'][year][production_source]
    else:
        energy_capacity = 1e3 * db['electricity_demand'][year] / 8760. * backup
    energy_capacity *= source[2]

    print('\nStorage\n========')
    print(f'{1e-3 * energy_capacity * period:.1f} TWh needs to cover {period / 24:.1f} day')
    # energy_capacity = rebuild_p_installed * db['backup_capacity'][year][production_source]
    # print('\nStorage\n========')
    # print(f'{1e-3 * energy_capacity * period:.1f} TWh needs to cover {period / 24:.1f} day')

    # Power capacity
    ideal_storage_installed = (db['maximum_renewable_production'][year][production_source]
                               * db['electricity_demand'][year] - db['minimum_yearly_load'][year]) * source[2]
    print(f'{ideal_storage_installed:.1f} GW ideal installed storage')
    # Get the equivalent given the storage option
    # for batteries:
    # Use a grid scale: 60 MW ; 240 MWh --> 90 millions
    # $1500 per kW ; $375 per kWh

    # We need to install db.electricity_demand[year] * backup_capacity and assume the load factor
    # to be inconsequential as we run it when needed only.
    # storage_installed = db.electricity_demand[year] * db.backup_capacity[production_source]
    print(f'{energy_capacity:.1f} GW installed storage effectively')
    if ideal_storage_installed - energy_capacity < 0:
        print(f'The storage power capacity is met and {energy_capacity - ideal_storage_installed} are unused')
    else:
        print(f'{ideal_storage_installed - energy_capacity:.1f} GW to use or lose (hydrogen)')
    # How many batteries?
    # Option 1: Discrete battery option:
    # print(db.storage_capacity[year][storage_source]['energy_capacity'])
    # nbatteries = math.ceil(energy_capacity * 1e6 / db.storage_capacity[year][storage_source]['energy_capacity'])
    # storage_installed = nbatteries * db.storage_capacity[year][storage_source]['power_capacity'] * 1e-3
    # print(f'{nbatteries} installed, which correspond to {storage_installed:.1f} GW installed effectively')
    # if ideal_storage_installed - storage_installed < 0:
    #     print(f'The storage power capacity is met and {storage_installed - ideal_storage_installed} GW are unused')
    # else:
    #     print(f'{ideal_storage_installed - storage_installed:.1f} GW to use or lose (hydrogen)')

    # Option 2: Install a la carte
    # We decide that for batteries, we can pick exactly the amount of GW and the amount of TWh, and pay for each
    # separately, at a cost of 1500 per kW and 375 per kWh for example. They can be seen essentially as two distinct
    # systems. However, due to the real world, they are not independent. The cost option will allow to pick just
    # the kWh cost as it's (I think) defined dependently in the literature (and at least it's pretty easy to see that
    # the kW value grows much faster and will be met if the kWh is met)

    # energy_capacity is the GW installed (Or GWh/h). It needs to be multiplied by the period to get the energy
    # capacity
    return energy_capacity


def get_power_capacity_need_with_storage(source, rebuild_p_installed, storage_installed, year=2020, doit=False):
    """
    Here we want to get the installed power capacity needed to reach the energy production need, given the load factor.
    """
    if doit:
        storage_source = source[1]
        p_installed = rebuild_p_installed + storage_installed * (1 / db['storage_loss'][year][storage_source] - 1)
    else:
        p_installed = rebuild_p_installed

    return p_installed


def get_dismantling():
    # Costs in trillions $
    investment_cleanup = 1e-6 * db['dismantling_costs'][year]['nuclear'] * db['installed_capacity'][year]['nuclear']
    print(f'Dismantling of current nuclear: ${1e3 * investment_cleanup:.1f} billions')
    return investment_cleanup


def get_co2(source, rebuild_capacity, storage_capacity, timeframe=100, year=2020, period=24):
    production_source, storage_source = source[0], source[1]

    # Number of production builds:
    n_prod_build = int((timeframe - 1) / float(db['lifetimes'][year][production_source])) + 1
    # Number of storage builds
    if storage_capacity > 0:
        n_stor_build = int((timeframe - 1) / float(db['lifetimes'][year][storage_source])) + 1
    # Number of grid builds
    # n_grid_build = int((timeframe - 1) / float(db['lifetimes'][year]['grid'])) + 1
    
    print('\nCarbon\n======')
    # Costs in millions $
    carbon_production = n_prod_build * rebuild_capacity * db['carbon_costs'][year][production_source] # megatons
    # print(f'Installation: {rebuild_capacity:.1f} GW')
    print(f'Deployment of the production means: {carbon_production:.1f} megatons')

    if storage_capacity > 0:
        carbon_storage = n_stor_build * storage_capacity * period * db['carbon_costs'][year][storage_source]  # megatons
    else:
        carbon_storage = 0
    print(f'Deployment of storage technology: {carbon_storage:.1f} megatons')

    # investment_grid = n_grid_build * db['grid_costs'][year] * rebuild_capacity
    # print(f'Upgrade to the grid: ${1e-3 * investment_grid:.1f} billions')
    total_carbon = carbon_production + carbon_storage
    return total_carbon


def get_cost(source, rebuild_capacity, storage_capacity, timeframe=100, year=2020, period=24):
    production_source, storage_source = source[0], source[1]

    # Number of production builds:
    n_prod_build = int((timeframe - 1) / float(db['lifetimes'][year][production_source])) + 1
    # Number of storage builds
    if storage_capacity > 0:
        n_stor_build = int((timeframe - 1) / float(db['lifetimes'][year][storage_source])) + 1
    # Number of grid builds
    n_grid_build = int((timeframe - 1) / float(db['lifetimes'][year]['grid'])) + 1

    print('\nCosts\n======')
    # Costs in millions $
    investment_production = n_prod_build * rebuild_capacity * db['capital_costs'][year][production_source]
    print(f'Installation: {rebuild_capacity:.1f} GW')
    print(f'Deployment of the production means: ${1e-3 * investment_production:.1f} billions')
    investment_grid = n_grid_build * db['grid_costs'][year] * rebuild_capacity
    print(f'Upgrade to the grid: ${1e-3 * investment_grid:.1f} billions')
    if storage_capacity > 0:
        investment_storage = (n_stor_build * storage_capacity * period
                              * db['storage_costs'][year][storage_source]['energy_capacity'])
    else:
        investment_storage = 0
    print(f'Storage: {storage_capacity:.1f} GW')
    print(f'Investment into storage technology: ${1e-3 * investment_storage:.1f} billions')

    # Cost in trillions $
    total_investments = 1e-6 * (investment_production + investment_grid + investment_storage)
    print(f'Total investments over {timeframe} years: ${total_investments:.2f} trillions')
    return total_investments


investments = 0
carbon = 0
scenarios = {
    'S1a': {'scenario': '100_renewable',
            'sub_scenario': [('wind_onshore', 'pumped_hydro', 1.0)],
            'backup': 1.0},
    'S1b': {'scenario': '100_renewable',
            'sub_scenario': [('wind_onshore', 'batteries', 1.0)],
            'backup': 1.0},
    'S1c': {'scenario': '100_renewable',
            'sub_scenario': [('wind_offshore', 'pumped_hydro', 1.0)],
            'backup': 1.0},
    'S1d': {'scenario': '100_renewable',
            'sub_scenario': [('wind_offshore', 'batteries', 1.0)],
            'backup': 1.0},
    'S1e': {'scenario': '100_renewable',
            'sub_scenario': [('solar', 'pumped_hydro', 1.0)],
            'backup': 1.0},
    'S1f': {'scenario': '100_renewable',
            'sub_scenario': [('solar', 'batteries', 1.0)],
            'backup': 1.0},
    'S2a': {'scenario': '100_renewable',
            'sub_scenario': [('wind_onshore', 'pumped_hydro', 0.375),
                             ('wind_offshore', 'pumped_hydro', 0.125),
                             ('solar', 'pumped_hydro', 0.5)],
            'backup': 0.1},
    'S2b': {'scenario': '100_renewable',
            'sub_scenario': [('wind_onshore', 'batteries', 0.375),
                             ('wind_offshore', 'batteries', 0.125),
                             ('solar', 'batteries', 0.5)],
            'backup': 0.1},
    'S2c': {'scenario': '100_renewable',
            'sub_scenario': [('wind_onshore', 'pumped_hydro', 0.225),
                             ('wind_offshore', 'pumped_hydro', 0.075),
                             ('solar', 'pumped_hydro', 0.7)],
            'backup': 0.1},
    'S2d': {'scenario': '100_renewable',
            'sub_scenario': [('wind_onshore', 'batteries', 0.225),
                             ('wind_offshore', 'batteries', 0.075),
                             ('solar', 'batteries', 0.7)],
            'backup': 0.1},
    'S2e': {'scenario': '100_renewable',
            'sub_scenario': [('wind_onshore', 'pumped_hydro', 0.525),
                             ('wind_offshore', 'pumped_hydro', 0.175),
                             ('solar', 'pumped_hydro', 0.3)],
            'backup': 0.1},
    'S2f': {'scenario': '100_renewable',
            'sub_scenario': [('wind_onshore', 'batteries', 0.525),
                             ('wind_offshore', 'batteries', 0.175),
                             ('solar', 'batteries', 0.3)],
            'backup': 0.1},
    'S3a': {'scenario': '100_nuclear',
            'sub_scenario': [('nuclear', '', 1.0)]},
    'S4a': {'scenario': 'nuclear_renewable',
            'sub_scenario': [('nuclear', '', 0.5),
                             ('wind_onshore', '', 0.15),
                             ('wind_offshore', '', 0.05),
                             ('solar', '', 0.3)]},
    'S4b': {'scenario': 'nuclear_renewable',
            'sub_scenario': [('nuclear', '', 0.5),
                             ('wind_onshore', '', 0.2),
                             ('wind_offshore', '', 0.1),
                             ('solar', '', 0.2)]},
    'S4c': {'scenario': 'nuclear_renewable',
            'sub_scenario': [('nuclear', '', 0.25),
                             ('wind_onshore', '', 0.225),
                             ('wind_offshore', '', 0.075),
                             ('solar', '', 0.45)]},
    'S4d': {'scenario': 'nuclear_renewable',
            'sub_scenario': [('nuclear', '', 0.25),
                             ('wind_onshore', '', 0.3),
                             ('wind_offshore', '', 0.15),
                             ('solar', '', 0.3)]},
    'S4e': {'scenario': 'nuclear_renewable',
            'sub_scenario': [('nuclear', '', 0.75),
                             ('wind_onshore', '', 0.075),
                             ('wind_offshore', '', 0.025),
                             ('solar', '', 0.15)]},
    'S4f': {'scenario': 'nuclear_renewable',
            'sub_scenario': [('nuclear', '', 0.75),
                             ('wind_onshore', '', 0.1),
                             ('wind_offshore', '', 0.05),
                             ('solar', '', 0.1)]},
}
sn = 'S3a'
country = 'france'
year = 2020
period = 24*7
timeframe = 100

scenario_type = scenarios[sn]
scenario = scenario_type['scenario']
backup = -1
print(f'Scenario: {sn}\n\n')
for sub_scenario in scenario_type['sub_scenario']:

    # Right now, the only things that changes between countries are:
    # Consumption
    # Minimum installed capacity consumed
    # Load factors
    with open(f"{country}.yml", 'r') as stream:
        try:
            db = yaml.safe_load(stream)
        except yaml.YAMLError as exc:
            print(exc)

    print(f'\n\n  --> Sub-Scenario: {sub_scenario[0].replace("_", " ")}'
          f' with {sub_scenario[1].replace("_", " ")} storage,'
          f' at {100 * sub_scenario[2]:.0f}%')
    rebuild_need = get_energy_need(scenario, sub_scenario[2], year=year)
    rebuild_capacity = get_power_capacity_need(sub_scenario, rebuild_need, year=year)
    energy_capacity = 0
    if scenario == '100_renewable':
        # storage
        # Here we calculate the maximum production that will need to be stored, based on a low demand
        # Note that this can be lowered by using the surplus energy for different needs (desalination, hydrogen
        # production, etc). However, enough needs to be stored in batteries to account for the inverse maximal
        # production/demand peak
        if 'backup' in scenario_type.keys():
            backup = scenario_type['backup']
        energy_capacity = get_storage(sub_scenario, rebuild_capacity, period=period, year=2020, backup=backup)
        rebuild_capacity = get_power_capacity_need_with_storage(sub_scenario, rebuild_capacity, energy_capacity,
                                                                year=year)
        # max_storage = maximum_renewable_production[sub_scenario] * rebuild_capacity - minimum_yearly_load[year]
        # print(max_storage)
    total_investments = get_cost(sub_scenario, rebuild_capacity, energy_capacity,
                                 timeframe=timeframe, year=year, period=period)
    total_carbon = get_co2(sub_scenario, rebuild_capacity, energy_capacity,
                           timeframe=timeframe, year=year, period=period)
    investments += total_investments
    carbon += total_carbon

cost_dismantling = get_dismantling()
investments += cost_dismantling
print(f'\n\nCombined investments: ${investments:.2f} trillions')
print(f'Combined carbon: {carbon:.2f} MT')
