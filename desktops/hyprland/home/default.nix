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
      gnome.gnome-calculator
      gnome.nautilus
      grim
      hyprpaper
      hyprpicker
      nwg-launchers
    ];
    sessionVariables = {
      GDK_PIXBUF_MODULE_FILE = "${pkgs.librsvg}/lib/gdk-pixbuf-2.0/2.10.0/loaders.cache";
    };
  };

  wayland.windowManager.hyprland = {
    enable = true;
    systemdIntegration = true;
  };
}
