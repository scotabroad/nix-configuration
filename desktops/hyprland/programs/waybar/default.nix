{ config, inputs, pkgs, home-manager, ... }:

{
  # Manage waybar, might replace with eww
  programs.waybar = {
    enable = true;
    package = pkgs.waybar;
    settings = {
      mainBar = {
        layer = "top";
	position = "top";
	height = 30; #play around with this
      };
      #modules-left = [ "wlr/workspaces" "wlr/taskbar" ];
      #modules-center = [ "wlr/window" ];
      #modules-right = [ "mpd" "temperature" ];
    };
  };
}
