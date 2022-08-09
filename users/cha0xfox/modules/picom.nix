{ pkgs, lib, ... }:

{

  services.picom = {
        enable = true;
        activeOpacity = 0.95;
        inactiveOpacity = 0.85;
        backend = "glx";
        vSync = true;
        experimentalBackends = true;

        settings = {
          corner-radius = 8;
          rounded-corners-exclude = [
            "class_g *?= 'polybar'"
            "class_g *?= 'rofi'"
          ];
          method = "kawase";
          strength = 5;
          kern = "3x3box";
          blur-background-exclude = [
            "class_g = 'slop'"
            "_GTK_FRAME_EXTENTS@:c"
          ];
        };

        fade = true;
        fadeDelta = 2;
        opacityRules = [
          "100:class_g   *?= 'Chromium-browser'"
          "100:class_g   *?= 'Firefox'"
          "100:class_g   *?= 'Kotatogram'"
          "100:class_g   *?= 'Telegram'"
          #"100:class_g   *?= 'emacs'"
          "100:class_g   *?= 'Discord'"
          "100:class_g   *?= 'mpv'"
          "100:class_g   *?= 'virt-viewer'"
          "100:class_g   *?= 'virt-manager'"
          #"100:class_g   *?= 'mailspring'"
          #"100:class_g   *?= 'element'"
        ];

        package = pkgs.picom.overrideAttrs(o: {
          src = pkgs.fetchFromGitHub {
            repo = "picom";
            owner = "jonaburg";
            rev = "e3c19cd7d1108d114552267f302548c113278d45";
            sha256 = "19nglw72mxbr47h1nva9fabzjv51s4fy6s1j893k4zvlhw0h5yp2";
          };
        });
      };

}
