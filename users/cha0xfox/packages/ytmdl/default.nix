{
python3Packages
, ffmpeg
}:

python3Packages.buildPythonApplication rec {
  pname = "ytmdl";
  version = "2022.03.16";

  src = python3Packages.fetchPypi {
    inherit pname;
    version = builtins.replaceStrings [ ".0" ] [ "." ] version;
    sha256 = "f5ef23dcba89aaf2307baf4ffc2326dc5c02324f646e5e5748219ed328202af4";
  };

  postPatch = ''
    substituteInPlace setup.py \
      --replace "bs4" "beautifulsoup4" \
      --replace "/etc/bash_completion.d" "share/bash-completion/completions" \
      --replace "/usr/share/zsh/functions/Completion/Unix" "share/zsh/site-functions"
  '';

  propagatedBuildInputs = with python3Packages; [
    ffmpeg-python
    musicbrainzngs
    rich
    simber
    pydes
    youtube-search-python
    unidecode
    pyxdg
    downloader-cli
    beautifulsoup4
    itunespy
    mutagen
    pysocks
    youtube-dl
    ytmusicapi
    spotipy
  ];

}
