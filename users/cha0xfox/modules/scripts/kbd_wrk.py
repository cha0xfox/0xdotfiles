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
        keyboard.type("b4")
        keyboard.press(Key.shift)
        keyboard.type("k")
        keyboard.release(Key.shift)
        keyboard.type("3e")
        keyboard.press(Key.shift)
        keyboard.type("F")
        keyboard.release(Key.shift)
        keyboard.type("h")
        keyboard.press(Key.shift)
        keyboard.type("C")
        keyboard.release(Key.shift)
        keyboard.type("9axw")
        keyboard.press(Key.shift)
        keyboard.type("uwbq")
        keyboard.release(Key.shift)
      if key.keycode == 'KEY_D':
        keyboard.press(Key.shift)
        keyboard.type("pp")
        keyboard.release(Key.shift)
        keyboard.type("y7")
        keyboard.press(Key.shift)
        keyboard.type("b")
        keyboard.release(Key.shift)
        keyboard.type("7a")
        keyboard.press(Key.shift)
        keyboard.type("S")
        keyboard.release(Key.shift)
        keyboard.type("u")
        keyboard.press(Key.shift)
        keyboard.type("Q")
        keyboard.release(Key.shift)
        keyboard.type("sfs")
        keyboard.press(Key.shift)
        keyboard.type("TS")
        keyboard.release(Key.shift)
        keyboard.type("7")
        #keyboard.type("PPy7B7aSuQsfsTS7")
      if key.keycode == 'KEY_SPACE':
        os.system('bash /home/cha0xfox/0xdotfiles/users/cha0xfox/modules/scripts/ytmpv.sh &')
