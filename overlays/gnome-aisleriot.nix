{ pkgs, ... }:

final: prev: {
  gnome = prev.gnome.overrideScope (gfinal: gprev: {
    aisleriot = gprev.aisleriot.overrideAttrs (oldAttrs: {
      patches = [ ./aisleriot.patch ];
    });
  });
}
