# Append blank
function swift_flight:image/process/append/blank

data modify storage swift_flight:image data.tellraw append \
  from storage swift_flight:image data.current.description_text

# Append blank
function swift_flight:image/process/append/blank

# Append line_break
execute unless score $index.image_data swift_flight.image = $length swift_flight.image \
  run function swift_flight:image/process/append/line_break

# Remove first element from the description
data remove storage swift_flight:image data.current.description[0]
 