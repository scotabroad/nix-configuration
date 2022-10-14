{ config, inputs, lib, home-manager, pkgs, ... }:

let
  mkTuple = lib.hm.gvariant.mkTuple;
in {
  dconf.settings = {
    "io/elementary/terminal/saved-state" = {
      focused-tab = 0;
      tabs = [];
      tab-zooms = ["1"];
      window-position = mkTuple [188 109];
      window-size = mkTuple [752 564];
      window-state = "Normal";
    };

    "io/elementary/terminal/settings" = {
      theme = "custom";
    };
  };
}
