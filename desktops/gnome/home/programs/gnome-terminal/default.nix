{ config, inputs, pkgs, ... }:

{
  programs.gnome-terminal = {
    enable = false; #Why? Because scope changed from pkgs.gnome.gnome-terminal to just pkgs.gnome-terminal
    profile = {
      "6df3d4ab-f391-4e2f-9917-e8dd0cfa4763" = {
        allowBold = true;
        audibleBell = true;
        backspaceBinding = "ascii-delete";
        boldIsBright = true;
        cursorBlinkMode = "system";
        cursorShape = "block";
        customCommand = null; #will this be zsh?
        default = true;
        deleteBinding = "delete-sequence";
        loginShell = false; #what if true?
        #scrollbackLines = null; #null means infinite
        showScrollbar = false;
        visibleName = "Terminal"; #what does this setting do?
      };
    };
    showMenubar = true; #set to false once everything is settled
    themeVariant = "default";
  };
}
