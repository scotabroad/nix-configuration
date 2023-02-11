{ pkgs }:

final: prev: {
  hyprland-move = pkgs.writeScriptBin "hyprland-move" (builtins.readFile ./hyprland-move.sh);
}
