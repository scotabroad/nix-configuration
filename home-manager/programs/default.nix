{ config, inputs, pkgs, ... }:

{
  imports = [
    ./exa
    ./fzf
    ./git
    ./kitty
    ./neovim
    ./zoxide
    ./zsh
  ];
}
