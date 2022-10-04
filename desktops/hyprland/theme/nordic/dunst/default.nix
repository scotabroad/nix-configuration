{ config, inputs, pkgs, home-manager, ... }:

{
  # Manage dunst
  services.dunst = {
    settings = {
      urgency_low = {
        background = "#2e3440";
        foreground = "#eceff4";
      };

      urgency_normal = {
        background = "#2e3440";
        foreground = "#eceff4";
      };

      urgency_critical = {
        background = "#1d2128";
        foreground = "#bf616a";
      };
    };
  };
}
