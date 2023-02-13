{ config, inputs, pkgs, ... }:

{
  programs.obs-studio = {
    enable = true;
    plugins = with pkgs.obs-studio-plugins; [
      obs-source-record
      obs-vaapi
      obs-vkcapture
    ];
  };
}
