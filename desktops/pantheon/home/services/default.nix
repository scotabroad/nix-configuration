{ config, inputs, pkgs, ... }:

{
  systemd.user = {
    services = {
      wingpanel-indicator-ayatana = {
        Unit = {
          Description = "Ayatana Compatibility Indicator for Wingpanel";
        };
        Service = {
          ExecStart = "${pkgs.indicator-application-gtk3}/libexec/indicator-application/indicator-application-service";
	  Restart = "always";
	  RestartSec = 1;
        };
      	Install = {
      	  WantedBy = ["default.target"]; #perhaps this is the wrong target?
      	};
      };
      monitor = {
        Unit = {
	  Description = "wingpanel monitor indicators";
	};
	Service = {
	  ExecStart = "${pkgs.monitor}/bin/com.github.stsdc.monitor";
	  Restart = "always";
	  RestartSec = 1;
	};
	Install = {
	  WantedBy = ["default.target"];
	};
      };
    };
  };
}
