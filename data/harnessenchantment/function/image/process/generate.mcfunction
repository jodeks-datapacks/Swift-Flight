#> harnessenchantment:image/process/generate
#
# This function generates the image data.

data modify storage harnessenchantment:image current.image_data set from storage harnessenchantment:image image_data
data modify storage harnessenchantment:image current.description set from storage harnessenchantment:image description
data modify storage harnessenchantment:image current.pixel_character set from storage harnessenchantment:image pixel_character.pixel

# Reset index score
scoreboard players set $index.image_data harnessenchantment.image 0
# Set width
execute store result score $width harnessenchantment.image run data get storage harnessenchantment:image width
# Set height
execute store result score $height harnessenchantment.image run data get storage harnessenchantment:image height
# Set length
scoreboard players operation $length harnessenchantment.image = $width harnessenchantment.image
scoreboard players operation $length harnessenchantment.image *= $height harnessenchantment.image
# Clear remaining entries in tellraw
data remove storage harnessenchantment:image tellraw

# Add spacing on top
function harnessenchantment:image/process/append/line_break
# Loop over image data
function harnessenchantment:image/process/loop_over_image_data
# Add spacing on bottom
function harnessenchantment:image/process/append/line_break