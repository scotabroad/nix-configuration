{ config, inputs, pkgs, ... }:

{
  imports = [
    ./eza
    ./firefox
    ./fzf
    ./git
    ./neovim
    ./obs-studio
    #./vscode
    ./zoxide
    ./zsh
  ];
}
