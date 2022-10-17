{ pkgs }:

final: prev: {
  waybar-pipewire = pkgs.writeScriptBin "waybar-pipewire" (builtins.readFile ./waybar-pipewire.sh);
}
