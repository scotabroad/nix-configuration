{ config, inputs, pkgs, ... }:

{
  imports = [
    ./flameshot
  ];

  systemd.user = {
    services = {
      # An attempt to get cinnamon screensaver working on NixOS with systemd
      cinnamon-screensaver = {
        Unit = {
          Description = "Cinnamon Screensaver";
	  After = ["graphical-session-pre.target"];
	  PartOf = ["graphical-session.target"];
        };
        Service = {
          ExecStart = "${pkgs.cinnamon.cinnamon-screensaver}/bin/cinnamon-screensaver";
	  Restart = "always";
	  RestartSec = 15;
        };
      };
    };
  };
}
