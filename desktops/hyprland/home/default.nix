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
      fuzzel
      #gnome.nautilus
      grim
      hyprpaper
      hyprpicker
    ];
  };

  wayland.windowManager.hyprland = {
    enable = true;
    systemdIntegration = true;
  };
}
