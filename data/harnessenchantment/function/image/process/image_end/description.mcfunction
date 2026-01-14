# Append blank
function harnessenchantment:image/process/append/blank

data modify storage harnessenchantment:image tellraw append \
  from storage harnessenchantment:image current.description_text

# Append blank
function harnessenchantment:image/process/append/blank

# Append line_break
execute unless score $index.image_data harnessenchantment.image = $length harnessenchantment.image \
  run function harnessenchantment:image/process/append/line_break

# Remove first element from the description
data remove storage harnessenchantment:image current.description[0]
 