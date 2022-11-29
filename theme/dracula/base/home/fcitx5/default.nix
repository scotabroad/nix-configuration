{ config, inputs, pkgs, ... }:

{
  home.file.".config/fcitx5/conf/classicui.conf".source = ./classicui.conf;
  home.file.".local/share/fcitx5/themes/dracula".source = pkgs.fcitx5-dracula-theme;
}
