#> harnessenchantment:image/set_image_data
#
# This function sets the image data.
#
# @input $(image_data) {string[][]} The data to set  
# @input $(width) {number} The width of the image  
# @input $(height) {number} The height of the image  
# @input $(background_color) {string} The background color of the image  
# @input $(description) {string[]} The description on the right hand side  
# @writes storage harnessenchantment:image image_data  
# @writes storage harnessenchantment:image width  
# @writes storage harnessenchantment:image height  
# @writes storage harnessenchantment:image background_color  
# @writes storage harnessenchantment:image description  
# @writes storage harnessenchantment:image pixel_character.blank  
# @writes storage harnessenchantment:image pixel_character.chat  
# @writes storage harnessenchantment:image pixel_character.lore

data remove storage harnessenchantment:image image_data
data remove storage harnessenchantment:image width
data remove storage harnessenchantment:image height
data remove storage harnessenchantment:image background_color
data remove storage harnessenchantment:image description

$data modify storage harnessenchantment:image image_data set value $(image_data)
$data modify storage harnessenchantment:image width set value $(width)
$data modify storage harnessenchantment:image height set value $(height)
$data modify storage harnessenchantment:image background_color set value "$(background_color)"
$data modify storage harnessenchantment:image description set value $(description)

data modify storage harnessenchantment:image pixel_character.blank set value "　"
data modify storage harnessenchantment:image pixel_character.pixel set value "▌▌"
data modify storage harnessenchantment:image pixel_character.line_break set value '\n'

function harnessenchantment:image/process/generate
