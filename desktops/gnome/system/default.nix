{ config, inputs, lib, pkgs, ... }:

{
  environment = {
    gnome = {
      excludePackages = [
      ];
    };
  };
  
  i18n = {
    inputMethod = {
      enabled = "ibus";
      ibus.engines = with pkgs.ibus-engines; [
        table
        table-others
      ];
    };
  };

  programs = {
    evince.enable = true;
    file-roller.enable = true;
    firefox.nativeMessagingHosts.packages = with pkgs; [
      gnome-browser-connector
    ];
    gnome-disks.enable = true;
    gnome-terminal.enable = true;
    seahorse.enable = true;
  };

  services = {
    gnome = {
      core-os-services.enable = true;
      core-shell.enable = true;
      core-utilities.enable = true;
      core-developer-tools.enable = false;
      evolution-data-server.enable = true;
      games.enable = false;
      gnome-browser-connector.enable = true;
      tracker.enable = true;
      tracker-miners.enable = true;
      sushi.enable = true;
    };

    hardware = {
      bolt.enable = true;
    };
    
    xserver = {
      enable = true;
      displayManager.gdm = {
        enable = true;
        autoSuspend = true;
        autoLogin.delay = 0;
        wayland = true;
      };
      desktopManager.gnome = {
        enable = true;
      };
    };
  };
}
