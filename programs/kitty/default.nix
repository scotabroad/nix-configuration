{ config, inputs, pkgs, home-manager, ... }:

{
  # Manage kitty
  programs.kitty = {
    enable = true;
    package = pkgs.kitty;
    font = {
      name = "Ubuntu Mono Nerd Font Complete Mono";
      package = pkgs.nerdfonts;
      size = 24;
    };
    keybindings = {
      "ctrl+c" = "copy_or_interrupt";
      "ctrl+v" = "paste_from_clipboard";
      "ctrl+x" = "copy_and_clear_or_interrupt";
    };
    settings = {
      background_opacity = "0.9";
    };
    theme = "Nord";
  };
}
