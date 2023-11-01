{ config, inputs, pkgs, ... }:

{
  imports = [
    ./config.nix
    ./programs
    inputs.hyprland.homeManagerModules.default
  ];

  home = {
    packages = with pkgs; [
      hyprpaper
      hyprpicker
      nwg-launchers
      waybar
    ];
  };

  wayland.windowManager.hyprland = {
    enable = true;
    package = inputs.hyprland.packages.${pkgs.system}.hyprland;
    plugins = [
      inputs.hyprland-plugins.packages.${pkgs.system}.hyprbars
    ];
    systemdIntegration = true;
    xwayland = {
      enable = true;
    };
  };
}
