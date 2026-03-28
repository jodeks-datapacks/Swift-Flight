# Copy current pixel
data modify storage swift_flight:image data.current.pixel_color set \
  from storage swift_flight:image data.current.image_data[0]
data modify storage swift_flight:image data.current.description_text set \
  from storage swift_flight:image data.current.description[0]

scoreboard players add $index.image_data swift_flight.image 1

# Calculate column
scoreboard players operation $index.column swift_flight.image = $index.image_data swift_flight.image
scoreboard players operation $index.column swift_flight.image %= $width swift_flight.image

# Calculate row
scoreboard players operation $index.row swift_flight.image = $index.image_data swift_flight.image
scoreboard players operation $index.row swift_flight.image /= $width swift_flight.image

# Append start spacing
execute if score $index.column swift_flight.image matches 1 run \
  function swift_flight:image/process/append/blank

# Append colored pixel
execute unless data storage swift_flight:image data.current{pixel_color: ''} run \
  function swift_flight:image/process/append/pixel
# Append background pixel
execute if data storage swift_flight:image data.current{pixel_color: ''} run \
  function swift_flight:image/process/append/background

# Append description
execute if score $index.column swift_flight.image matches 0 run \
    function swift_flight:image/process/image_end/description

# Remove first element from the image_data array
data remove storage swift_flight:image data.current.image_data[0]
# Loop over rows
execute if score $index.row swift_flight.image < $height swift_flight.image run \
  function swift_flight:image/process/loop_over_image_data
 