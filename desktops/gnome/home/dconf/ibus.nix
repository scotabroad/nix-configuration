{ config, inputs, lib, home-manager, pkgs, ... }:

let
  mkUint32 = lib.hm.gvariant.mkUint32;
  mkTuple = lib.hm.gvariant.mkTuple;
in {
  dconf.settings = {
    "com/github/libpinyin/ibus-libpinyin/libpinyin" = {
      init-simplified-chinese = false;
      lookup-table-orientation = 0;
    };

    "desktop/ibus/general" = {
      engines-order = ["table:ipa-x-sampa"];
      preload-engines = ["table:ipa-x-sampa"];
      #version= "1.5.26";
    };

    "desktop/ibus/general/hotkey" = {
      triggers = ["<Alt>space"];
    };

    #"desktop/ibus/panel" = {
    #  show-icon-on-systray = true;
    #};

    "desktop/ibus/panel/emoji" = {
      font = "UbuntuMono Nerd Font Mono 16";
      hotkey = ["<Control><Alt><Shift><Meta><Escape>space"]; # Can I set this to null?
    };

    "org/freedesktop/ibus/engine/table/ipa-x-sampa" = {
      inputmode = 1;
    };

    "org/gnome/desktop/input-sources" = {
      current= (mkUint32 0);
      sources = [(mkTuple ["xkb" "us"])
                 (mkTuple ["ibus" "table:ipa-x-sampa"])
                 (mkTuple ["ibus" "libpinyin"])
                ];
      xkb-options = [ "grp:alt_shift_toggle" ];
    };
  };
}
