{ config, pkgs, ... }:

{

  environment.systemPackages = with pkgs; [
  (texlive.combine {
    inherit (texlive) 
      collection-basic
      graphics
      latexmk 
      xetex
      wrapfig
      amsmath
      xits
      metafont
      ulem
      xecyr
      polyglossia
      collection-latexextra
      collection-xetex
      collection-langcyrillic
      collection-fontsrecommended
      collection-fontsextra;
    })
  ];

}
