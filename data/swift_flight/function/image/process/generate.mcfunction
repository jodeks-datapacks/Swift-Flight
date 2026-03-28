#> swift_flight:image/process/generate
#
# This function generates the image data.

data modify storage swift_flight:image data.current.image_data set from storage swift_flight:image data.image_data
data modify storage swift_flight:image data.current.description set from storage swift_flight:image data.description
data modify storage swift_flight:image data.current.pixel_character set from storage swift_flight:image data.pixel_character.pixel

# Reset index score
scoreboard players set $index.image_data swift_flight.image 0
# Set width
execute store result score $width swift_flight.image run data get storage swift_flight:image data.width
# Set height
execute store result score $height swift_flight.image run data get storage swift_flight:image data.height
# Set length
scoreboard players operation $length swift_flight.image = $width swift_flight.image
scoreboard players operation $length swift_flight.image *= $height swift_flight.image
# Clear remaining entries in tellraw
data remove storage swift_flight:image data.tellraw

# Add spacing on top
function swift_flight:image/process/append/line_break
# Loop over image data
function swift_flight:image/process/loop_over_image_data
# Add spacing on bottom
function swift_flight:image/process/append/line_break