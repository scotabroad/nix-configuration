{ config, inputs, lib, home-manager, pkgs, ... }:

{
  imports = [
    ./extensions.nix
    ./ibus.nix
    ./keybindings.nix
  ];

  dconf.settings = {
    "org/gnome/desktop/interface" = {
      clock-format = "12h";
      enable-hot-corners = false;
    };

    "org/gnome/mutter" = {
      dynamic-workspaces = true;
      edge-tiling = true;
    };
    
    "org/gnome/shell/app-switcher" = {
      current-workspace-only = false;
    };

  };
}
