{ config, inputs, pkgs, ... }:

{
  home.file.".config/fcitx5/conf/classicui.conf".source = ./classicui.conf;
  home.file.".local/share/fcitx5/themes".source = pkgs.fcitx5-rose-pine;
}
