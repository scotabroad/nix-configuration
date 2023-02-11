{ pkgs }:

final: prev: {
  hyprland-close = pkgs.writeScriptBin "hyprland-close" (builtins.readFile ./hyprland-close.sh);
}
