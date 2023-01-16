{ config, name, inputs, pkgs, ... }:

{
  programs.firefox.profiles.${name} = {
    settings = {
      #Make UI more GNOME-like
      "browser.uiCustomization.state" = "{\"placements\":{\"widget-overflow-fixed-list\":[],\"unified-extensions-area\":[],\"nav-bar\":[\"back-button\",\"forward-button\",\"stop-reload-button\",\"new-tab-button\",\"customizableui-special-spring1\",\"urlbar-container\",\"customizableui-special-spring2\",\"library-button\"],\"toolbar-menubar\":[\"menubar-items\"],\"TabsToolbar\":[\"tabbrowser-tabs\",\"alltabs-button\"],\"PersonalToolbar\":[\"personal-bookmarks\"]},\"seen\":[\"developer-button\"],\"dirtyAreaCache\":[\"nav-bar\",\"TabsToolbar\"],\"currentVersion\":18,\"newElementCount\":1}";

      # Enable customChrome.css
      "toolkit.legacyUserProfileCustomizations.stylesheets" = true;
      # Set UI density to normal
      "browser.uidensity" = 0;

      # Enable SVG context-properties
      "svg.context-properties.content.enabled" = true;
    };
    userChrome = ''
    @import "firefox-nordic-theme/userChrome.css";
    @import "firefox-nordic-theme/theme/hide-single-tab.css";
    @import "firefox-nordic-theme/theme/matching-autocomplete-width.css";
    @import "firefox-nordic-theme/theme/system-icons.css";
    @import "firefox-nordic-theme/theme/symbolic-tab-icons.css";
    '';
  };
  
  #Patched version of EliverLara's firefox-nordic-theme for Firefox v108.1
  home.file.".mozilla/firefox/${name}/chrome/firefox-nordic-theme".source = pkgs.fetchFromGitHub {
    owner = "glasket";
    repo = "firefox-nordic-theme";
    rev = "bef92bc8cf06d0e23e2a2241b9e04195cb8e4193";
    sha256 = "b+q+/hAjCv2NapVsV0nOfExcwyfuAO9cGBW4HfSZbX0=";
  };
}
