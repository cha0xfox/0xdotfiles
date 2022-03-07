import os
import pyautogui as pg
from evdev import InputDevice, categorize, ecodes
dev = InputDevice('/dev/input/event259')
dev.grab()

for event in dev.read_loop():
  if event.type == ecodes.EV_KEY:
    key = categorize(event)
    if key.keystate == key.key_down:
      if key.keycode == 'KEY_A':
        pg.typewrite("b4K3eFhC9axwUWBQ")
      if key.keycode == 'KEY_D':
        pg.typewrite("PPy7B7aSuQsfsTS7")
      if key.keycode == 'KEY_SPACE':
        os.system('bash /home/cha0xfox/0xdotfiles/users/cha0xfox/modules/scripts/ytmpv.sh')
