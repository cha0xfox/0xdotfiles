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
        keyboard.type("b6")
        keyboard.press(Key.shift)
        keyboard.type("h")
        keyboard.release(Key.shift)
        keyboard.type("aw")
        keyboard.press(Key.shift)
        keyboard.type("w")
        keyboard.release(Key.shift)
        keyboard.type("rc4")
        keyboard.press(Key.shift)
        keyboard.type("q")
        keyboard.release(Key.shift)
        keyboard.type("3")
        keyboard.press(Key.shift)
        keyboard.type("g")
        keyboard.release(Key.shift)
        keyboard.type("uh")
      if key.keycode == 'KEY_D':
        keyboard.press(Key.shift)
        keyboard.type("l")
        keyboard.release(Key.shift)
        keyboard.type("uwx5")
        keyboard.press(Key.shift)
        keyboard.type("dh")
        keyboard.release(Key.shift)
        keyboard.type("qzjo")
        keyboard.press(Key.shift)
        keyboard.type("jx")
        keyboard.release(Key.shift)
        keyboard.type("3")

      if key.keycode == 'KEY_X':
        os.system('bash /home/cha0xfox/0xdotfiles/users/cha0xfox/modules/scripts/ytmpv.sh &')