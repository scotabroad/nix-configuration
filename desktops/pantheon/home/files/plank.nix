{ config, inputs, pkgs, ... }:

{
  home = { 
    file = {
      ".config/plank/dock1/launchers/discord.dockitem".text = ''
[PlankDockItemPreferences]
Launcher=file://${pkgs.discord}/share/applications/discord.desktop
'';
      ".config/plank/dock1/launchers/element-desktop.dockitem".text = ''
[PlankDockItemPreferences]
Launcher=file://${pkgs.element-desktop}/share/applications/element-desktop.desktop
'';
      ".config/plank/dock1/launchers/firefox.dockitem".text = ''
[PlankDockItemPreferences]
Launcher=file://${pkgs.firefox}/share/applications/firefox.desktop
'';
      ".config/plank/dock1/launchers/io.elementary.files.dockitem".text = ''
[PlankDockItemPreferences]
Launcher=file://${pkgs.pantheon.elementary-files}/share/applications/io.elementary.files.desktop
'';
      ".config/plank/dock1/launchers/io.elementary.switchboard.dockitem".text = ''
[PlankDockItemPreferences]
Launcher=file://${pkgs.pantheon.switchboard-with-plugs}/share/applications/io.elementary.switchboard.desktop
'';
      ".config/plank/dock1/launchers/kitty.dockitem".text = ''
[PlankDockItemPreferences]
Launcher=file://${pkgs.kitty}/share/applications/kitty.desktop
'';
      ".config/plank/dock1/launchers/vivaldi-stable.dockitem".text = ''
[PlankDockItemPreferences]
Launcher=file://${pkgs.vivaldi}/share/applications/vivaldi.desktop
'';
    };
  };
}
