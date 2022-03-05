{ pkgs, lib, ... }:

{

  services.picom = {
        enable = true;
        #activeOpacity = "0.90";
        inactiveOpacity = "0.75";
        backend = "glx";
        blur = true;
        shadow = true;
        shadowOpacity = "0.85";

        extraOptions = ''
          corner-radius = 8;
          round-borders = 8;
          blur-method = "dual_kawase";
          blur-strength = "85";
          xinerama-shadow-crop = true;
          xrender-sync-fence = true;
          blur-background-exclude = [
            "class_g = 'slop'",
            "class_g = 'gromit-mpx'"
          ];
          rounded-corners-exclude = [
            "class_g *?= 'polybar'",
            "class_g *?= 'rofi'"
          ]
        '';

        #experimentalBackends = true;

        shadowExclude = [
          "bounding_shaped && !rounded_corners"
        ];

        fade = true;
        fadeDelta = 4;
        vSync = true;
        opacityRule = [
          "100:class_g   *?= 'Chromium-browser'"
          "100:class_g   *?= 'Firefox'"
          "100:class_g   *?= 'Kotatogram'"
          "100:class_g   *?= 'Telegram'"
          "100:class_g   *?= 'emacs'"
          "100:class_g   *?= 'Discord'"
          "100:class_g   *?= 'mpv'"
          "100:class_g   *?= 'virt-viewer'"
          "100:class_g   *?= 'mailspring'"
          "100:class_g   *?= 'element'"
        ];

        package = pkgs.picom.overrideAttrs(o: {
          src = pkgs.fetchFromGitHub {
            repo = "picom";
            owner = "ibhagwan";
            rev = "c4107bb6cc17773fdc6c48bb2e475ef957513c7a";
            sha256 = "035fbvb678zvpm072bzzpk8h63npmg5shkrzv4gfj89qd824a5fn";
          };
        });
      };

}
