{ config, inputs, pkgs, home-manager, ... }:

{
  # Manage dunst
  services.dunst = {
    settings = {
      urgency_low = {
        background = "#1f1d2e";
        foreground = "#908caa";
      };

      urgency_normal = {
        background = "#1f1d2e";
        foreground = "#e0def4";
      };

      urgency_critical = {
        background = "#191724";
        foreground = "#eb6f92";
      };
    };
  };
}
