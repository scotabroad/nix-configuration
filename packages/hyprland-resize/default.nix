{ pkgs }:

final: prev: {
  hyprland-resize = pkgs.writeScriptBin "hyprland-resize" (builtins.readFile ./hyprland-resize.sh);
}
