{ config, inputs, pkgs, ... }:

{
  imports = [
    ./dconf
    ./programs
  ];

  # Additional Packages
  home = {
    packages = with pkgs; [
      dconf-editor
      gnome-terminal #for now
      gnome-tweaks
    ];
  };
}
