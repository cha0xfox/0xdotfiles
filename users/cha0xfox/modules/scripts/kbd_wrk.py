import os
from pynput.keyboard import Key, Controller
from evdev import InputDevice, categorize, ecodes
dev = InputDevice('/dev/input/event258')
dev.grab()

keyboard = Controller()

for event in dev.read_loop():
  if event.type == ecodes.EV_KEY:
    key = categorize(event)
    if key.keystate == key.key_down:
      if key.keycode == 'KEY_A':
        keyboard.type("c")
        keyboard.press(Key.shift)
        keyboard.type("rl")
        keyboard.release(Key.shift)
        keyboard.type("sc")
        keyboard.press(Key.shift)
        keyboard.type("m")
        keyboard.release(Key.shift)
        keyboard.type("6")
        keyboard.press(Key.shift)
        keyboard.type("s")
        keyboard.release(Key.shift)
        keyboard.type("u")
        keyboard.press(Key.shift)
        keyboard.type("n")
        keyboard.release(Key.shift)
        keyboard.type("8")
        keyboard.press(Key.shift)
        keyboard.type("r")
        keyboard.release(Key.shift)
        keyboard.type("hz")
        keyboard.press(Key.shift)
        keyboard.type("b")
        keyboard.release(Key.shift)
        keyboard.type("m")
      if key.keycode == 'KEY_D':
        keyboard.type("t")
        keyboard.press(Key.shift)
        keyboard.type("cv")
        keyboard.release(Key.shift)
        keyboard.type("t")
        keyboard.press(Key.shift)
        keyboard.type("c")
        keyboard.release(Key.shift)
        keyboard.type("8")
        keyboard.press(Key.shift)
        keyboard.type("qd")
        keyboard.release(Key.shift)
        keyboard.type("kvx5w8c")
        keyboard.press(Key.shift)
        keyboard.type("u")
        keyboard.release(Key.shift)
      if key.keycode == 'KEY_SPACE':
        os.system('bash /home/cha0xfox/0xdotfiles/users/cha0xfox/modules/scripts/ytmpv.sh &')
