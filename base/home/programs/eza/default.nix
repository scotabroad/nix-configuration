{ config, inputs, lib, pkgs, home-manager, ... }:

let
  aliases = {
    ls = "eza --git";
    l = "eza --git-ignore";
    ll = "eza --header --long --git";
    la = "eza -a --git";
    lt = "eza --tree --git";
    lla = "eza -a --header --long --git";
  };
in {
  # Manage eza, replacement for the now unmaintained exa
  programs.eza = {
    enable = true;
    enableBashIntegration = true;
    enableFishIntegration = false;
    enableZshIntegration = true;
    enableIonIntegration = false;
    enableNushellIntegration = false;
    extraOptions = [
      "--icons"
      "--classify"
      "--group-directories-first"
      "--time-style=long-iso"
      "--group"
      "--color=auto"
    ];
  };
  programs.bash.shellAliases = lib.mkIf config.programs.bash.enable aliases;
  programs.zsh.shellAliases = lib.mkIf config.programs.zsh.enable aliases;
}
