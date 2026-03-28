#> swift_flight:app/setup
# Called on load

scoreboard objectives add jodek.config dummy
execute unless score &swift_flight_load_message jodek.config = &swift_flight_load_message jodek.config run scoreboard players set &swift_flight_load_message jodek.config 1
execute unless score &swift_flight_advancements jodek.config = &swift_flight_advancements jodek.config run scoreboard players set &swift_flight_advancements jodek.config 1

# Initiate all scoreboard objectives
scoreboard objectives add swift_flight.image dummy

# Print the image
function swift_flight:config/image
