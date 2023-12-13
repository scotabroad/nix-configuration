{ pkgs, ... }:

final: prev: {
  steam = prev.steam.override {
    extraPkgs = pkgs:
      with pkgs; [
        gamescope
        keyutils
        libkrb5
        libpng
        libpulseaudio
        libvorbis
        stdenv.cc.cc.lib
        xorg.libXcursor
        xorg.libXi
        xorg.libXinerama
        xorg.libXScrnSaver
      ];
    #extraProfile = "export GDK_SCALE=2";
  };
}
