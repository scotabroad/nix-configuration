{ config, inputs, lib, home-manager, pkgs, ... }:

{
  dconf.settings = {
    "org/cinnamon/desktop/wm/preferences" = {
      action-double-click-titlebar = "toggle-maximize";
      action-middle-click-titlebar = "lower";
      button-layout = "close:maximize";
    }
  };
}
