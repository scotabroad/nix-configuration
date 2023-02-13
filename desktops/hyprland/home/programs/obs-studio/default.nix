{ config, inputs, pkgs, ... }:

{
  programs.obs-studio.plugins = with pkgs.obs-studio-plugins; [
    wlrobs
    obs-pipewire-audio-capture
  ];
}
