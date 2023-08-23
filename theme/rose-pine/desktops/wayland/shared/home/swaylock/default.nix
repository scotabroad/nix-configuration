{ config, inputs, pkgs, ... }:

{
  programs.swaylock.settings = {
    color = "191724";
    bs-hl-color = "eb6f92";
    key-hl-color = "9ccfd8";
    font = "Ubuntu";
    indicator-radius = "50";
    indicator-thickness = "10";
    line-uses-inside = true;
    separator-color = "19172400";

    inside-color = "191724";
    ring-color = "31748f";
    text-color = "e0def4";

    text-caps-lock-color = "f6c177";

    inside-clear-color = "f6c177";
    ring-clear-color = "f6c177";
    text-clear-color = "191724";

    inside-ver-color = "31748f";
    ring-ver-color = "31748f";
    text-ver-color = "191724";

    inside-wrong-color = "eb6f92";
    ring-wrong-color = "eb6f92";
    text-wrong-color = "191724";
  };
}
