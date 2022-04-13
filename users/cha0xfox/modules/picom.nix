{ pkgs, lib, ... }:

{

  services.picom = {
        enable = true;
        activeOpacity = "0.9";
        inactiveOpacity = "0.75";
        backend = "glx";
        #blur = true;
        #shadow = true;
        #shadowOpacity = "0.85";
        experimentalBackends = true;

        extraOptions = ''
          corner-radius = 8;
         # round-borders = 8;
          rounded-corners-exclude = [
            "class_g *?= 'polybar'",
            "class_g *?= 'rofi'"
          ]
          blur: {
          # requires: https://github.com/ibhagwan/picom
          method = "kawase";
          #method = "kernel";
          strength = 5;
          # deviation = 1.0;
          # kernel = "11x11gaussian";
          background = false;
          background-frame = false;
          background-fixed = false;
          kern = "3x3box";
          }

          # Exclude conditions for background blur.
          blur-background-exclude = [
          #"window_type = 'dock'",
          #"window_type = 'desktop'",
          #"class_g = 'URxvt'",
          #
          # prevents picom from blurring the background
          # when taking selection screenshot with `main`
          # https://github.com/naelstrof/maim/issues/130
          "class_g = 'slop'",
          "_GTK_FRAME_EXTENTS@:c"
          ];
        '';

        #experimentalBackends = true;

        #shadowExclude = [
        #  "bounding_shaped && !rounded_corners"
        #];

        fade = true;
        fadeDelta = 4;
        opacityRule = [
          "100:class_g   *?= 'Chromium-browser'"
          "100:class_g   *?= 'Firefox'"
          "100:class_g   *?= 'Kotatogram'"
          "100:class_g   *?= 'Telegram'"
          #"100:class_g   *?= 'emacs'"
          "100:class_g   *?= 'Discord'"
          "100:class_g   *?= 'mpv'"
          "100:class_g   *?= 'virt-viewer'"
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
