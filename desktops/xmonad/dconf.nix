{ config, inputs, lib, home-manager, pkgs, ... }:

{
  dconf.settings = {
    "apps/light-locker" = {
      idle-hint = false;
      late-locking = true;
      lock-after-screensaver = "uint32 5";
      lock-on-lid = true;
      lock-on-suspend = true;
    };
  };
}
