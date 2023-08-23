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
      socat #for waybar-close
      waybar-hyprland
    ];
  };

  wayland.windowManager.hyprland = {
    enable = true;
    systemdIntegration = true;
    xwayland = {
      enable = true;
    };
  };
}
