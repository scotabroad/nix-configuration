{ config, name, inputs, pkgs, ... }:

{
  imports = [
    ./settings.nix
  ];

  #Firefox config
  programs.firefox = {
    enable = true;
    package = pkgs.firefox;
    profiles.${name} = {
      isDefault = true;
      extensions.packages = with pkgs.nur.repos.rycee.firefox-addons; [
        user-agent-string-switcher
      ];
      search = {
        default = "DuckDuckGo";
        engines = {
          "Arch Wiki" = {
            urls = [{
              template = "https://wiki.archlinux.org/index.php?search={searchTerms}";
            }];
            iconUpdateURL = "https://wiki.archlinux.org/favicon.ico";
            updateInterval = 24 * 60 * 60 * 1000; # every day
            definedAliases = [ "@aw" ];
          };
          "DuckDuckGo".metaData.alias = "@d";
          "Nix Options" = {
            urls = [{
              template = "https://search.nixos.org/options";
              params = [
                { name = "channel"; value = "unstable"; }
                { name = "type"; value = "options"; }
                { name = "query"; value = "{searchTerms}"; }
              ];
            }];

            icon = "${pkgs.nixos-icons}/share/icons/hicolor/scalable/apps/nix-snowflake.svg";
            definedAliases = [ "@no" ];
          };
          "Nix Packages" = {
            urls = [{
              template = "https://search.nixos.org/packages";
              params = [
                { name = "channel"; value = "unstable"; }
                { name = "type"; value = "packages"; }
                { name = "query"; value = "{searchTerms}"; }
              ];
            }];

            icon = "${pkgs.nixos-icons}/share/icons/hicolor/scalable/apps/nix-snowflake.svg";
            definedAliases = [ "@np" ];
          };
          "Unofficial NixOS Wiki" = {
            urls = [{
              template = "https://nixos.wiki/index.php?search={searchTerms}";
            }];
            iconUpdateURL = "https://nixos.wiki/favicon.png";
            updateInterval = 24 * 60 * 60 * 1000; # every day
            definedAliases = [ "@nu" ];
          };
          "Official NixOS Wiki" = {
            urls = [{
              template = "https://wiki.nixos.org/w/index.php?search={searchTerms}";
            }];
            iconUpdateURL = "https://wiki.nixos.org/favicon.ico";
            updateInterval = 24 * 60 * 60 * 1000; # every day
            definedAliases = [ "@nw" ];
          };
          "Wiktionary" = {
            urls = [{
              template = "https://en.wiktionary.org/wiki/{searchTerms}";
            }];
            iconUpdateURL = "https://en.wiktionary.org/favicon.ico";
            updateInterval = 24 * 60 * 60 * 1000; # every day
            definedAliases = [ "@wk" ];
          };
          "Wiktionary Latin" = {
            urls = [{
              template = "https://en.wiktionary.org/wiki/{searchTerms}#Latin";
            }];
            iconUpdateURL = "https://en.wiktionary.org/favicon.ico";
            updateInterval = 24 * 60 * 60 * 1000; # every day
            definedAliases = [ "@wl" ];
          };
        };
        force = true;
        order = [
          "DuckDuckGo"
          "Nix Packages"
          "Nix Options"
          "Official NixOS Wiki"
          "Unofficial NixOS Wiki"
          "Arch Wiki"
          "Wiktionary"
          "Wiktionary Latin"
        ];
      };
    };
  };
}
