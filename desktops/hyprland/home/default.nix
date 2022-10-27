{ config, inputs, pkgs, ... }:

{
  imports = [
    ./config.nix
    ./dconf
    ./files
    ./programs
    ./services
    inputs.hyprland.homeManagerModules.default

  ];

  home = {
    packages = with pkgs; [
      cinnamon.nemo
      #gnome.nautilus
      grim
      hyprpaper
      hyprpicker
      nwg-launchers
      wofi
    ];
  };

  wayland.windowManager.hyprland = {
    enable = true;
    systemdIntegration = true;
  };
}
