{ config, inputs, pkgs, ... }:

{
  programs.swaylock.settings = {
    color = "faf4ed";
    bs-hl-color = "b4637a";
    key-hl-color = "56949f";
    font = "Ubuntu";
    indicator-radius = "50";
    indicator-thickness = "10";
    line-uses-inside = true;
    separator-color = "faf4ed00";

    inside-color = "faf4ed";
    ring-color = "286983";
    text-color = "575279";

    text-caps-lock-color = "ea9d34";

    inside-clear-color = "ea9d34";
    ring-clear-color = "ea9d34";
    text-clear-color = "faf4ed";

    inside-ver-color = "286983";
    ring-ver-color = "286983";
    text-ver-color = "faf4ed";

    inside-wrong-color = "b4637a";
    ring-wrong-color = "b4637a";
    text-wrong-color = "faf4ed";
  };
}
