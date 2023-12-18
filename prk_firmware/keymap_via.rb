require "via"
kbd = Keyboard.new

# This should happen before `kbd.init_pins`
kbd.via = true

kbd.via_layer_count = 1

kbd.init_pins(
  [  9,10,12,13 ],            # row0, row1,... respectively
  [ 2,3,4,5,6,7,8 ] # col0, col1,... respectively
)

kbd.start!
