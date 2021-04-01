# FRANCE


#####################
# Current situation #
#####################

# Country dependent

# Installed capacity in GW
installed_capacity = {'France': {'2020': {'nuclear': 63,
                                          'thermal': 18.9,
                                          'hydro': 25.7,
                                          'solar': 10.4,
                                          'wind': 17.6,
                                          'biomass': 2.2,
                                          }
                                 }
                      }

# Annual production values in TWh
annual_production = {'France': {'2020': {'nuclear': 335.4,
                                         'thermal': 37.6,
                                         'hydro': 65.1,
                                         'solar': 12.6,
                                         'wind': 39.7,
                                         'biomass': 9.6,
                                         }
                                }
                     }

# Average load factor
average_load_factor = {'France': {'nuclear': 0.65,
                                  'solar': 0.14,
                                  'wind_onshore': 0.25,
                                  'wind_offshore': 0.40}
                       }

# The minimum yearly load seen in France during the year
minimum_yearly_load = {'France': {'2020': 30}}

# Electricity demand in TWh
electricity_demand = {'France': {'2020': 473.}}


################
# System costs #
################

# Cost of system in $/kW
capital_costs = {'2020': {'nuclear': 6100,
                          'solar': 950,
                          'wind_onshore': 1436,
                          'wind_offshore': 4077}
                 }

dismantling_costs = {'2020': {'nuclear': 1000}}

# Cost of storage in $/kW for power capacity and $/kWh for energy capacity
# Note that the $/kWh is used
storage_costs = {'2020': {'pumped_hydro': {'energy_capacity': 105, 'power_capacity': 2638},
                          'compressed_air': {'energy_capacity': 155, 'power_capacity': 1669},
                          'batteries': {'energy_capacity': 375, 'power_capacity': 1446}}
                 }

# Cost of upgrading the grid in $/kW installed
grid_costs = {'2020': 500}


###############
# System data #
###############

# Round trip storage loss (https://www.eia.gov/todayinenergy/detail.php?id=46756,
# https://scholar.utc.edu/cgi/viewcontent.cgi?article=1130&context=theses&httpsredir=1&referer=)
storage_loss = {'pumped_hydro': 0.7,
                'batteries': 0.8,
                'compressed_air': 0.3}

# Lifetime of technologies in years
lifetimes = {'2020': {'pumped_hydro': 100,
                      'nuclear': 60,
                      'solar': 25,
                      'wind_onshore': 25,
                      'wind_offshore': 20,
                      'batteries': 15,
                      'grid': 50,
                      'compressed_air': 25}
             }

# Maximum production at any given time over a year. That is, 70% of wind onshore capacity being activated at the same
# time is the maximum you can expect, based on historical data.
# This is not considered in the storage need, as we assume that we would find localized ways of dealing with surplus
# by hydrogen creation, etc. This is nonetheless dangerous for the grid, as it means a very large load it may not be
# ready for.
maximum_renewable_production = {'wind_onshore': 0.7,
                                'wind_offshore': 0.7,
                                'solar': 0.8}

# This is the storage capacity expressed as a percent of the installed capacity. It depends on the
# fact that 80% of the production is performed by ~60% of the time (and thus, 20% of the production during the
# remaining 40%) for wind, and by ~20% of the time (and thus, 20% of the production during the remaining
# 80%) for solar. Consequently, we want to account for this low-generation period with storage abilities.
# Consequently, batteries are used to compensate for the 20% low-generation share.
backup_capacity = {'wind_onshore': 0.4,
                   'wind_offshore': 0.3,
                   'solar': 0.8}

# Storage capacity contains the information for given plants, in MW and MWh
storage_capacity = {'2020': {'batteries': {'energy_capacity': 240, 'power_capacity': 60}}}
