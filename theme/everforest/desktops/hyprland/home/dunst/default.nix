{ config, inputs, pkgs, home-manager, ... }:

{
  # Manage dunst
  services.dunst = {
    settings = {
      urgency_low = {
        background = "#272e33";
        foreground = "#d3c6aa";
      };

      urgency_normal = {
        background = "#272e33";
        foreground = "#d3c6aa";
      };

      urgency_critical = {
        background = "#1e2326";
        foreground = "#e67e80";
      };
    };
  };
}
