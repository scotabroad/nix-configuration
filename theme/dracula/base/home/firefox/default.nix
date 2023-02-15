{ config, name, inputs, pkgs, ... }:

{
  programs.firefox = {
    profiles.${name} = {
      extensions = with pkgs.nur.repos.rycee.firefox-addons; [
        dracula-dark-colorscheme
      ];
      settings = {
        "browser.uiCustomization.state" = "{\"placements\":{\"widget-overflow-fixed-list\":[],\"unified-extensions-area\":[],\"nav-bar\":[\"back-button\",\"forward-button\",\"stope-reload-button\",\"customizableui-special-spring1\",\"urlbar-container\",\"customizableui-special-spring2\",\"library-button\"],\"toolbar-menubar\":[\"menubar-items\"],\"TabsToolbar\":[\"TabToolbar\":[\"tabbrowser-tabs\",\"new-tab-button\",\"alltabs-button\"],\"PersonalToolbar\":[\"personal-bookmarks\"]},\"seen\":[\"developer-button\"],\"dirtyAreaCache\":[\"nav-bar\",\"TabsToolbar\",\"toolbar-menubar\",\"PersonalToolbar\"],\"currentVersion\":18,\"newElementCount\":1}";
      };
    };
  };
}
