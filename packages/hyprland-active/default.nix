{ pkgs }:

final: prev: {
  hyprland-active = pkgs.writeScriptBin "hyprland-active" (builtins.readFile ./hyprland-active.sh);
}
