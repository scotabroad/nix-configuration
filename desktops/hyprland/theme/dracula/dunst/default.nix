{ config, inputs, pkgs, home-manager, ... }:

{
  # Manage dunst
  services.dunst = {
    settings = {
      urgency_low = {
        background = "#282a36";
        foreground = "#6272a4";
      };

      urgency_normal = {
        background = "#282a36";
        foreground = "#bd93f9";
      };

      urgency_critical = {
        background = "#ff5555";
        foreground = "#f8f8f2";
	frame_color = "#ff5555";
      };
    };
  };
}
