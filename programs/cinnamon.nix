{ config, inputs, pkgs, ... }:

{
  imports = [
    ./emacs
    ./exa
    ./feh
    ./git
    ./kitty
    ./neovim
    ./zsh
  ];
}
