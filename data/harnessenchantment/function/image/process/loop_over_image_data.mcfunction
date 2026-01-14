# Copy current pixel
data modify storage harnessenchantment:image current.pixel_color set \
  from storage harnessenchantment:image current.image_data[0]
data modify storage harnessenchantment:image current.description_text set \
  from storage harnessenchantment:image current.description[0]

scoreboard players add $index.image_data harnessenchantment.image 1

# Calculate column
scoreboard players operation $index.column harnessenchantment.image = $index.image_data harnessenchantment.image
scoreboard players operation $index.column harnessenchantment.image %= $width harnessenchantment.image

# Calculate row
scoreboard players operation $index.row harnessenchantment.image = $index.image_data harnessenchantment.image
scoreboard players operation $index.row harnessenchantment.image /= $width harnessenchantment.image

# Append start spacing
execute if score $index.column harnessenchantment.image matches 1 run \
  function harnessenchantment:image/process/append/blank

# Append colored pixel
execute unless data storage harnessenchantment:image current{pixel_color: ''} run \
  function harnessenchantment:image/process/append/pixel
# Append background pixel
execute if data storage harnessenchantment:image current{pixel_color: ''} run \
  function harnessenchantment:image/process/append/background

# Append description
execute if score $index.column harnessenchantment.image matches 0 run \
    function harnessenchantment:image/process/image_end/description

# Remove first element from the image_data array
data remove storage harnessenchantment:image current.image_data[0]
# Loop over rows
execute if score $index.row harnessenchantment.image < $height harnessenchantment.image run \
  function harnessenchantment:image/process/loop_over_image_data
 