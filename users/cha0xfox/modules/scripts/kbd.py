import os
from evdev import InputDevice, categorize, ecodes
dev = InputDevice('/dev/input/event258')
dev.grab()

for event in dev.read_loop():
  if event.type == ecodes.EV_KEY:
    key = categorize(event)
    if key.keystate == key.key_down:
      if key.keycode == 'KEY_ESC':
        os.system('bash /home/cha0xfox/.config/nixpkgs/modules/scripts/soundbrd.sh fart.mp3 &')
      if key.keycode == 'KEY_A':
        os.system('bash /home/cha0xfox/.config/nixpkgs/modules/scripts/soundbrd.sh crybaby.mp3 &')
      if key.keycode == 'KEY_S':
        os.system('bash /home/cha0xfox/.config/nixpkgs/modules/scripts/soundbrd.sh reverbfart.mp3 &')
      if key.keycode == 'KEY_Q':
        os.system('bash /home/cha0xfox/.config/nixpkgs/modules/scripts/soundbrd.sh sad.mp3 &')
      if key.keycode == 'KEY_B':
        os.system('bash /home/cha0xfox/.config/nixpkgs/modules/scripts/soundbrd.sh bruh.mp3 &')
      if key.keycode == 'KEY_P':
        os.system('bash /home/cha0xfox/.config/nixpkgs/modules/scripts/soundbrd.sh elevator.mp3 &')
      if key.keycode == 'KEY_M':
        os.system('bash /home/cha0xfox/.config/nixpkgs/modules/scripts/soundbrd.sh monke.mp3 &')
      if key.keycode == 'KEY_W':
        os.system('bash /home/cha0xfox/.config/nixpkgs/modules/scripts/soundbrd.sh ahhhh.mp3 &')
      if key.keycode == 'KEY_Y':
        os.system('bash /home/cha0xfox/.config/nixpkgs/modules/scripts/soundbrd.sh yooo.mp3 &')
      if key.keycode == 'KEY_E':
        os.system('bash /home/cha0xfox/.config/nixpkgs/modules/scripts/soundbrd.sh shiiiet.mp3 &')
      if key.keycode == 'KEY_R':
        os.system('bash /home/cha0xfox/.config/nixpkgs/modules/scripts/soundbrd.sh ochosiento.mp3 &')
      if key.keycode == 'KEY_T':
        os.system('bash /home/cha0xfox/.config/nixpkgs/modules/scripts/soundbrd.sh bingchilling.mp3 &')
      if key.keycode == 'KEY_Z':
        os.system('bash /home/cha0xfox/.config/nixpkgs/modules/scripts/soundbrd.sh sheesh.mp3 &')
      if key.keycode == 'KEY_N':
        os.system('bash /home/cha0xfox/.config/nixpkgs/modules/scripts/soundbrd.sh nechest.mp3 &')
      if key.keycode == 'KEY_X':
        os.system('bash /home/cha0xfox/.config/nixpkgs/modules/scripts/soundbrd.sh xqcwow.mp3 &')
      if key.keycode == 'KEY_C':
        os.system('bash /home/cha0xfox/.config/nixpkgs/modules/scripts/soundbrd.sh aneurysm.mp3 &')
      if key.keycode == 'KEY_V':
        os.system('bash /home/cha0xfox/.config/nixpkgs/modules/scripts/soundbrd.sh mebad.mp3 &')
      if key.keycode == 'KEY_G':
        os.system('bash /home/cha0xfox/.config/nixpkgs/modules/scripts/soundbrd.sh kuku.mp3 &')
      if key.keycode == 'KEY_H':
        os.system('bash /home/cha0xfox/.config/nixpkgs/modules/scripts/soundbrd.sh kuku2.mp3 &')
      if key.keycode == 'KEY_UP':
        os.system('bash /home/cha0xfox/.config/nixpkgs/modules/scripts/soundbrd.sh Sound2/yes.mp3 &')
      if key.keycode == 'KEY_DOWN':
        os.system('bash /home/cha0xfox/.config/nixpkgs/modules/scripts/soundbrd.sh Sound2/no.mp3 &')
      if key.keycode == 'KEY_LEFT':
        os.system('bash /home/cha0xfox/.config/nixpkgs/modules/scripts/soundbrd.sh Sound2/succ.mp3 &')
      if key.keycode == 'KEY_RIGHT':
        os.system('bash /home/cha0xfox/.config/nixpkgs/modules/scripts/soundbrd.sh Sound2/scream.mp3 &')
      if key.keycode == 'KEY_RIGHTCTRL':
        os.system('bash /home/cha0xfox/.config/nixpkgs/modules/scripts/soundbrd.sh Sound2/kringe.mp3 &')
      if key.keycode == 'KEY_RIGHTSHIFT':
        os.system('bash /home/cha0xfox/.config/nixpkgs/modules/scripts/soundbrd.sh Sound2/megagood.mp3 &')
      if key.keycode == 'KEY_SEMICOLON':
        os.system('bash /home/cha0xfox/.config/nixpkgs/modules/scripts/soundbrd.sh Sound2/whatisit.mp3 &')
      if key.keycode == 'KEY_K':
        os.system('bash /home/cha0xfox/.config/nixpkgs/modules/scripts/soundbrd.sh keyboard2.mp3 &')
