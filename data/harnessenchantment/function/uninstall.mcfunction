#> harnessenchantment:uninstall
# Function to uninstall the datapack

data remove storage harnessenchantment:image image_data
data remove storage harnessenchantment:image width
data remove storage harnessenchantment:image height
data remove storage harnessenchantment:image background_color
data remove storage harnessenchantment:image description
data remove storage harnessenchantment:image tellraw

advancement revoke @a only jodek:harnessenchantment
advancement revoke @a only jodek:utility
advancement revoke @a only jodek:root

scoreboard objectives remove harnessenchantment.image

say Successfully uninstalled Swift Flight!