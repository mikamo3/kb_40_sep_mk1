# Initialize a Keyboard
kbd = Keyboard.new

# `split=` should happen before `init_pins`
kbd.split = true

kbd.init_pins(
  [  9,10,12,13 ],            # row0, row1,... respectively
  [ 2,3,4,5,6,7,8 ] # col0, col1,... respectively
)

kbd.add_layer :default, %i(
ESC_CTL  KC_Q   KC_W   KC_E    KC_R    KC_T    KC_MINS  KC_EQL  KC_Y   KC_U    KC_I    KC_O    KC_P    KC_BSPC
TAB_SFT  KC_A   KC_S   KC_D    KC_F    KC_G    KC_LBRC  KC_RBRC KC_H   KC_J    KC_K    KC_L    KC_SCLN KC_BSLS
KC_NO    KC_Z   KC_X   KC_C    KC_V    KC_B    KC_NO    KC_NO   KC_N   KC_M    KC_COMM KC_DOT  KC_SLSH KC_NO
KC_NO    KC_NO  KC_NO  KC_LALT KC_LGUI RAISE   ESC_CTL  BS_SFT  LOWER  KC_RGUI KC_RALT KC_NO   KC_NO   KC_NO

)
kbd.add_layer :raise, %i(
KC_GRAVE KC_EXLM  KC_AT    KC_HASH  KC_DLR  KC_PERC  KC_DQUO  KC_QUOT  KC_CIRC  KC_AMPR  KC_ASTER KC_LPRN  KC_RPRN  KC_DEL
EN_JA    KC_1     KC_2     KC_3     KC_4    KC_5     KC_LCBR  KC_RCBR  KC_6     KC_7     KC_8     KC_9     KC_0     KC_GRV
KC_NO    KC_Z     KC_X     KC_C     KC_V    KC_B     KC_NO    KC_NO    KC_N     KC_M     KC_COMM  KC_DOT   KC_SLSH  KC_NO
KC_NO    KC_NO    KC_NO    KC_LALT  KC_LGUI RAISE    KC_LCTL  KC_DEL   LOWER    KC_RGUI  KC_RALT  KC_NO    KC_NO  KC_NO

)
kbd.add_layer :lower, %i(
KC_ESC  KC_F1   KC_F2   KC_F3   KC_F4   KC_F5  KC_F11  KC_F12  KC_F6  KC_F7   KC_F8   KC_F9   KC_F10   KC_DEL
EN_JA   KC_HOME KC_PGDN KC_PGUP KC_END  KC_NO  KC_NO   KC_NO   KC_LEFT KC_DOWN KC_UP   KC_RIGHT KC_NO   KC_NO
KC_NO   KC_PSCREEN KC_INS  KC_SLCK KC_PAUS KC_B   KC_NO   KC_NO   KC_N    KC_M    KC_COMM KC_DOT  KC_SLSH KC_NO
KC_NO   KC_NO   KC_NO   KC_LALT KC_LGUI RAISE  KC_LCTL KC_RSFT LOWER   KC_RGUI KC_RALT KC_NO   KC_NO   KC_NO

)

kbd.add_layer :ctrl, [
:ESC_CTL, :KC_Q,  :KC_W,  :KC_E,   :KC_R,   :KC_T,   :KC_MINS, :KC_EQL, :KC_Y,  :KC_U,   :KC_I,   :KC_O,   :KC_P,   :KC_BSPC,
:TAB_SFT, :KC_A,  :KC_S,  :KC_D,   :KC_F,   :KC_G,   :KC_LBRC, :KC_RBRC,:KC_H,  :KC_J,   :KC_K,   :KC_L,   :KC_SCLN,:KC_BSLS,
:KC_NO,   :KC_Z,  :KC_X,  :KC_C,   :KC_V,   :KC_B,   :KC_NO,   :KC_NO,  :KC_N,  :KC_M,   :KC_COMM,:KC_DOT, :KC_SLSH,:KC_NO,
:KC_NO,   :KC_NO, :KC_NO, :KC_LALT,:KC_LGUI,:RAISE,  :ESC_CTL, :BS_SFT, :LOWER, :KC_RGUI,:KC_RALT,:KC_NO,  :KC_NO,  :KC_NO
]
kbd.add_layer :shift, [
:ESC_CTL, :KC_Q,  :KC_W,  :KC_E,   :KC_R,   :KC_T,   :KC_MINS, :KC_EQL, :KC_Y,  :KC_U,   :KC_I,   :KC_O,   :KC_P,   :KC_BSPC,
:TAB_SFT, :KC_A,  :KC_S,  :KC_D,   :KC_F,   :KC_G,   :KC_LBRC, :KC_RBRC,:KC_H,  :KC_J,   :KC_K,   :KC_L,   :KC_SCLN,:KC_BSLS,
:KC_NO,   :KC_Z,  :KC_X,  :KC_C,   :KC_V,   :KC_B,   :KC_NO,   :KC_NO,  :KC_N,  :KC_M,   :KC_COMM,:KC_DOT, :KC_SLSH,:KC_NO,
:KC_NO,   :KC_NO, :KC_NO, :KC_LALT,:KC_LGUI,:RAISE,  :ESC_CTL, :BS_SFT, :LOWER, :KC_RGUI,:KC_RALT,:KC_NO,  :KC_NO,  :KC_NO
]

kbd.define_mode_key :RAISE, [ :KC_SPACE, :raise, 200, 200 ]
kbd.define_mode_key :LOWER, [ :KC_ENT, :lower, 200, 200 ]
kbd.define_mode_key :TAB_SFT, [ :KC_TAB, :KC_LSFT, 200, 200 ]
kbd.define_mode_key :ESC_CTL, [ :KC_ESC, :KC_LCTL, 200, 200 ]
kbd.define_mode_key :BS_SFT, [ :KC_BSPC, :KC_RSFT, 200, 200 ]
kbd.define_composite_key :EN_JA,   %i(KC_GRAVE KC_LALT )

encoder_1 = RotaryEncoder.new(14, 15)
encoder_1.configure :left
encoder_1.clockwise do
  kbd.send_key %i(KC_LGUI KC_DOWN)
end
encoder_1.counterclockwise do
  kbd.send_key %i(KC_LGUI KC_UP)
end
kbd.append encoder_1

encoder_2 = RotaryEncoder.new(14, 15)
encoder_2.configure :right
encoder_2.clockwise do
  kbd.send_key %i(KC_LGUI KC_LEFT)
end
encoder_2.counterclockwise do
  kbd.send_key %i(KC_LGUI KC_RIGHT)
end
kbd.append encoder_2
rgb = RGB.new(
  16,
  1,
  0,
  false
)
rgb.effect =:breath
kbd.append rgb
kbd.start!
