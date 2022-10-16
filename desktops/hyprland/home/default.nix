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
      fuzzel
      cinnamon.nemo
      grim
      hyprpaper
    ];
  };

  wayland.windowManager.hyprland = {
    enable = true;
    systemdIntegration = true;
  };
}
