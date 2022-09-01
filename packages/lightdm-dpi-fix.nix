{ pkgs }:

final: prev: {
  lightdm-dpi-fix = pkgs.writeShellScript "lightdm-dpi-fix" ''
    # -*- Mode: sh; indent-tabs-mode: nil; tab-width: 4 -*-
    #
    # Wrapper to run around LightDM Greeter X sessions.

    # hidpi
    export GDK_SCALE=2
    export GDK_DPI_SCALE=0.5
    QT_AUTO_SCREEN_SCALE_FACTOR=1

    # run greeter
    exec $@
  '';
}
