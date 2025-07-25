{ config, inputs, lib, pkgs, ... }:

{
  environment = {
    gnome = {
      excludePackages = with pkgs; [
        gnome-console
      ];
    };
    systemPackages = with pkgs; [
      aisleriot
    ];
  };
  
  i18n = {
    inputMethod = {
      enable = true;
      type = "ibus";
      ibus.engines = with pkgs.ibus-engines; [
        libpinyin
        rime
        table-chinese
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
      core-apps.enable = true;
      core-developer-tools.enable = false;
      evolution-data-server.enable = true;
      games.enable = false;
      gnome-browser-connector.enable = true;
      localsearch.enable = true;
      tinysparql.enable = true;
      sushi.enable = true;
    };

    hardware = {
      bolt.enable = true;
    };
    
    desktopManager = {
      gnome = {
        enable = true;
      };
    };
    
    displayManager = {
      defaultSession = "gnome";
      gdm = {
        enable = true;
        autoSuspend = true;
        autoLogin.delay = 0;
        wayland = true;
      };
    };
    
    xserver = {
      enable = false;
    };
  };
}
