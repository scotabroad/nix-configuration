{ config, inputs, pkgs, ... }:

{
  imports = [
    ./config.nix
    ./dconf
    ./programs
    ./services
    inputs.hyprland.homeManagerModules.default
  ];

  home = {
    packages = with pkgs; [
      gnome.gnome-calculator
      gnome.nautilus
      grim
      hyprpaper
      hyprpicker
      networkmanagerapplet
      nwg-launchers
      slurp
      socat #for waybar-close
      swaylock
    ];
  };

  wayland.windowManager.hyprland = {
    enable = true;
    systemdIntegration = true;
    xwayland = {
      enable = true;
      hidpi = true; #Added as default package has now disabled this by default
    };
  };
}
