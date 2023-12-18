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
:ESC_CTL, :CT_Q,  :CT_W,  :CT_E,   :CT_R,   :CT_T,   :CT_MINS, :CT_EQL, :CT_Y,  :CT_U,   :CT_I,   :CT_O,   :CT_P,   :CT_BSPC,
:TAB_SFT, :CT_A,  :CT_S,  :CT_D,   :CT_F,   :CT_G,   :CT_LBRC, :CT_RBRC,:CT_H,  :CT_J,   :CT_K,   :CT_L,   :CT_SCLN,:CT_BSLS,
:KC_NO,   :CT_Z,  :CT_X,  :CT_C,   :CT_V,   :CT_B,   :KC_NO,   :KC_NO,  :CT_N,  :CT_M,   :CT_COMM,:CT_DOT, :CT_SLSH,:KC_NO,
:KC_NO,   :KC_NO, :KC_NO, :CT_LALT,:CT_LGUI,:CT_SPC,  :CT_ESC, :CT_BSPC, :CT_ENT, :CT_RGUI,:CT_RALT,:KC_NO,  :KC_NO,  :KC_NO
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
kbd.define_mode_key :ESC_CTL, [ :KC_ESC, :ctrl, 200, 200 ]
kbd.define_mode_key :BS_SFT, [ :KC_BSPC, :KC_RSFT, 200, 200 ]
kbd.define_composite_key :EN_JA,   %i(KC_GRAVE KC_LALT )
kbd.define_composite_key :CT_A ,%i(KC_LCTL KC_A)
kbd.define_composite_key :CT_B ,%i(KC_LCTL KC_B)
kbd.define_composite_key :CT_C ,%i(KC_LCTL KC_C)
kbd.define_composite_key :CT_D ,%i(KC_LCTL KC_D)
kbd.define_composite_key :CT_E ,%i(KC_LCTL KC_E)
kbd.define_composite_key :CT_F ,%i(KC_LCTL KC_F)
kbd.define_composite_key :CT_G ,%i(KC_LCTL KC_G)
kbd.define_composite_key :CT_H ,%i(KC_LCTL KC_H)
kbd.define_composite_key :CT_I ,%i(KC_LCTL KC_I)
kbd.define_composite_key :CT_J ,%i(KC_LCTL KC_J)
kbd.define_composite_key :CT_K ,%i(KC_LCTL KC_K)
kbd.define_composite_key :CT_L ,%i(KC_LCTL KC_L)
kbd.define_composite_key :CT_M ,%i(KC_LCTL KC_M)
kbd.define_composite_key :CT_N ,%i(KC_LCTL KC_N)
kbd.define_composite_key :CT_O ,%i(KC_LCTL KC_O)
kbd.define_composite_key :CT_P ,%i(KC_LCTL KC_P)
kbd.define_composite_key :CT_Q ,%i(KC_LCTL KC_Q)
kbd.define_composite_key :CT_R ,%i(KC_LCTL KC_R)
kbd.define_composite_key :CT_S ,%i(KC_LCTL KC_S)
kbd.define_composite_key :CT_T ,%i(KC_LCTL KC_T)
kbd.define_composite_key :CT_U ,%i(KC_LCTL KC_U)
kbd.define_composite_key :CT_V ,%i(KC_LCTL KC_V)
kbd.define_composite_key :CT_W ,%i(KC_LCTL KC_W)
kbd.define_composite_key :CT_X ,%i(KC_LCTL KC_X)
kbd.define_composite_key :CT_Y ,%i(KC_LCTL KC_Y)
kbd.define_composite_key :CT_Z ,%i(KC_LCTL KC_Z)
kbd.define_composite_key :CT_1 ,%i(KC_LCTL KC_1)
kbd.define_composite_key :CT_2 ,%i(KC_LCTL KC_2)
kbd.define_composite_key :CT_3 ,%i(KC_LCTL KC_3)
kbd.define_composite_key :CT_4 ,%i(KC_LCTL KC_4)
kbd.define_composite_key :CT_5 ,%i(KC_LCTL KC_5)
kbd.define_composite_key :CT_6 ,%i(KC_LCTL KC_6)
kbd.define_composite_key :CT_7 ,%i(KC_LCTL KC_7)
kbd.define_composite_key :CT_8 ,%i(KC_LCTL KC_8)
kbd.define_composite_key :CT_9 ,%i(KC_LCTL KC_9)
kbd.define_composite_key :CT_0 ,%i(KC_LCTL KC_0)
kbd.define_composite_key :CT_ENT 	,%i(KC_LCTL KC_ENTER )
kbd.define_composite_key :CT_ESC 	,%i(KC_LCTL KC_ESCAPE )
kbd.define_composite_key :CT_BSPC 	,%i(KC_LCTL KC_BSPACE )
kbd.define_composite_key :CT_TAB ,%i(KC_LCTL KC_TAB )
kbd.define_composite_key :CT_SPC,%i(KC_LCTL KC_SPACE)
kbd.define_composite_key :CT_MINS,%i(KC_LCTL KC_MINUS)
kbd.define_composite_key :CT_EQL,%i(KC_LCTL KC_EQUAL)
kbd.define_composite_key :CT_LBRC,%i(KC_LCTL KC_LBRACKET)
kbd.define_composite_key :CT_RBRC,%i(KC_LCTL KC_RBRACKET)
kbd.define_composite_key :CT_BSLS,%i(KC_LCTL KC_BSLASH)
kbd.define_composite_key :CT_SCLN,%i(KC_LCTL KC_SCOLON)
kbd.define_composite_key :CT_QUOTE,%i(KC_LCTL KC_QUOTE)
kbd.define_composite_key :CT_GRAVE,%i(KC_LCTL KC_GRAVE)
kbd.define_composite_key :CT_COMM,%i(KC_LCTL KC_COMMA)
kbd.define_composite_key :CT_DOT ,%i(KC_LCTL KC_DOT )
kbd.define_composite_key :CT_SLSH,%i(KC_LCTL KC_SLASH)
kbd.define_composite_key :CT_LSFT,%i(KC_LCTL KC_LSFT)
kbd.define_composite_key :CT_LALT,%i(KC_LCTL KC_LALT)
kbd.define_composite_key :CT_LGUI,%i(KC_LCTL KC_LGUI)
kbd.define_composite_key :CT_RSFT,%i(KC_LCTL KC_RSFT)
kbd.define_composite_key :CT_RALT,%i(KC_LCTL KC_RALT)
kbd.define_composite_key :CT_RGUI,%i(KC_LCTL KC_RGUI)
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
