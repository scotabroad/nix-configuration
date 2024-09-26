{ pkgs, ... }:

final: prev: {
  aisleriot = prev.aisleriot.overrideAttrs (oldAttrs: {
    patches = [ ./aisleriot.patch ];
  });
}
