{ config, inputs, pkgs, home-manager, ... }:

{
  # Manage kitty
  programs.kitty = {
    enable = true;
    package = pkgs.kitty;
    #TODO: Move font config into each theme... adwaita will not use Ubuntu
    #font = {
    #  name = "Ubuntu Mono Nerd Font Mono";
    #  package = pkgs.nerdfonts;
    #};
    #keybindings = {
    #  "ctrl+c" = "copy_or_interrupt";
    #  "ctrl+v" = "paste_from_clipboard";
    #  "ctrl+x" = "copy_and_clear_or_interrupt";
    #};
  };
}
