{ pkgs, ... }:

final: prev: {
  steam = prev.steam.override {
    extraPkgs = pkgs:
      with pkgs; [
        gamescope
        # Xorg libraries for gamescope
        keyutils
        libkrb5
        libpng
        libpulseaudio
        libvorbis
        stdenv.cc.cc.lib # Provides libstdc++.so.6
        xorg.libXcursor
        xorg.libXi
        xorg.libXinerama
        xorg.libXScrnSaver
      ];
    #extraProfile = "export GDK_SCALE=2";
  };
}
