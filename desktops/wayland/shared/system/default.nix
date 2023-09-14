{ config, inputs, pkgs, lib, ... }:

let
  #Note: the usage of wlr-randr is specific to the 13" Framework laptop... fix to make more generic
  greetdCageScript = pkgs.writeScriptBin "greetd-cage-script" ''
    dbus-update-activation-environment --systemd WAYLAND_DISPLAY WAYLAND_SOCK XDG_CURRENT_DESKTOP
    ${pkgs.wlr-randr}/bin/wlr-randr --output eDP-1 --mode 2256x1504@59.999001Hz --scale 2.000000
    ${config.programs.regreet.package}/bin/regreet
  '';
in {
  imports = [
    ./programs
  ];

  environment = {
    systemPackages = with pkgs; [
      cage
      weston
      wlr-randr
    ];
    variables = {
      CLUTTER_BACKEND = "wayland";
      GDK_BACKEND = "wayland,x11";
      GDK_PIXBUF_MODULE_FILE = "${pkgs.librsvg}/lib/gdk-pixbuf-2.0/2.10.0/loaders.cache";
      GDK_SCALE = "2";
      QT_AUTO_SCREEN_SCALE_FACTOR = "1";
      QT_QPA_PLATFORM = "wayland;xcb";
      QT_WAYLAND_DISABLE_WINDOWDECORATION = "1";
      #SDL_VIDEODRIVER = "wayland"; #disable or set to x11 for older games with older SDL version
      XCURSOR_SIZE = "24";
    };
  };

  hardware.opengl.enable = true; #Sway and Weston need this

  programs.regreet = {
    enable = true;
    package = pkgs.regreet-git;
  };
  
  security = {
    pam.services.swaylock.text = "auth include login";
  };
  
  services = {
    greetd = {
      #enable = true;
      settings.default_session.command =  "${lib.getExe pkgs.cage} -s -- sh -c ${greetdCageScript}/bin/greetd-cage-script";
    };
  };
}
