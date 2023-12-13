{ config, inputs, pkgs, ... }:

{
  imports = [
    ./dconf
    ./programs
  ];

  # Additional Packages
  home = {
    packages = with pkgs; [
      gnome.dconf-editor
      gnome.gnome-tweaks
    ];
  };
}
