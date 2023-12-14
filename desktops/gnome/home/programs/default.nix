{ config, inputs, pkgs, ... }:

{
  imports = [
    ./gnome-terminal
  ];

  programs.kitty.settings = {
    linux_display_server = "x11";
  };
}
