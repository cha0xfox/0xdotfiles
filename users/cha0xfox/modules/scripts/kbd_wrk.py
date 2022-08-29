import os
from pynput.keyboard import Key, Controller
from evdev import InputDevice, categorize, ecodes
dev = InputDevice('/dev/input/by-id/usb-SINO_WEALTH_Mechanical_Keyboard-event-kbd')
dev.grab()

keyboard = Controller()

for event in dev.read_loop():
  if event.type == ecodes.EV_KEY:
    key = categorize(event)
    if key.keystate == key.key_down:
      if key.keycode == 'KEY_A':
        keyboard.press(Key.shift)
        keyboard.type("b")
        keyboard.release(Key.shift)
        keyboard.type("3")
        keyboard.press(Key.shift)
        keyboard.type("t")
        keyboard.release(Key.shift)
        keyboard.type("m7ni")
        keyboard.press(Key.shift)
        keyboard.type("h")
        keyboard.release(Key.shift)
        keyboard.type("a")
        keyboard.press(Key.shift)
        keyboard.type("x")
        keyboard.release(Key.shift)
        keyboard.type("zb")
        keyboard.press(Key.shift)
        keyboard.type("m")
        keyboard.release(Key.shift)
        keyboard.type("8")
      if key.keycode == 'KEY_D':
        keyboard.press(Key.shift)
        keyboard.type("qdr")
        keyboard.release(Key.shift)
        keyboard.type("xc")
        keyboard.press(Key.shift)
        keyboard.type("b")
        keyboard.release(Key.shift)
        keyboard.type("f")
        keyboard.press(Key.shift)
        keyboard.type("va")
        keyboard.release(Key.shift)
        keyboard.type("96p")
        keyboard.press(Key.shift)
        keyboard.type("d")
        keyboard.release(Key.shift)
        keyboard.type("q")
      if key.keycode == 'KEY_X':
        os.system('bash /home/cha0xfox/0xdotfiles/users/cha0xfox/modules/scripts/ytmpv.sh &')