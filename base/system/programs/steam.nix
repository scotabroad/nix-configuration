{ config, inputs, pkgs, ... }:

{ 
  environment.systemPackages = with pkgs; [
    gamescope
  ];

  hardware = {
    # Enable steam hardware
    steam-hardware.enable = true;
  };

  # Configure steam which requires 32-bit libraries
  programs = {
    steam = {
      enable = true;
      dedicatedServer.openFirewall = true; # Open ports in the firewall for Source Dedicated Server
      remotePlay.openFirewall = true; # Open ports in the firewall for Steam Remote Play
    };
  };
}
