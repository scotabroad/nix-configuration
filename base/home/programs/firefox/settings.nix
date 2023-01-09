{ config, name, inputs, pkgs, ... }:

{
  programs.firefox.profiles.${name}.settings = {
    "browser.startup.homepage" = "about:home";

    #Disable Activity Stream
    #"browser.newtabpage.activity-stream.default.sites" = "https://www.youtube.com/,https://www.facebook.com/,https://www.amazon.com/,https://www.reddit.com/,https://www.wikipedia.org/,https://twitter.com/";
    "browser.newtabpage.activity-stream.default.sites" = "https://nixos.org/,https://nixos.wiki/"; #Do "" after tests
    "browser.newtabpage.activity-stream.discoverystream.enabled" = false;
    "browser.newtabpage.activity-stream.discoverystream.personalization.enabled" = false;
    "browser.newtabpage.activity-stream.discoverystream.spocs.personalized" = false;
    "browser.newtabpage.activity-stream.enabled" = false;
    #Experiment with these ones!!!
    "browser.newtabpage.activity-stream.feeds.aboutpreferences" = true;
    "browser.newtabpage.activity-stream.feeds.discoverystreamfeed" = true;
    "browser.newtabpage.activity-stream.feeds.favicon" = true;
    "browser.newtabpage.activity-stream.feeds.newtabinit" = true;
    "browser.newtabpage.activity-stream.feeds.places" = true;
    "browser.newtabpage.activity-stream.feeds.prefs" = true;
    "browser.newtabpage.activity-stream.feeds.recommendationprovider" = true;
    "browser.newtabpage.activity-stream.feeds.section.highlights" = false; #Good
    "browser.newtabpage.activity-stream.feeds.section.topstories" = false; #Good
    "browser.newtabpage.activity-stream.feeds.sections" = true; #Good
    "browser.newtabpage.activity-stream.feeds.snippets" = false;
    "browser.newtabpage.activity-stream.feeds.system.topsites" = false; #Keep false (not supposed to set system stuff)
    "browser.newtabpage.activity-stream.feeds.system.topstories" = false; #Keep false
    "browser.newtabpage.activity-stream.feeds.systemtick" = false;
    "browser.newtabpage.activity-stream.feeds.telemetry" = false;
    "browser.newtabpage.activity-stream.feeds.topsites" = true; #Ideally true
    "browser.newtabpage.activity-stream.improvesearch.topSiteSearchShortcuts" = false; #owo, what's this?
    "browser.newtabpage.activity-stream.improvesearch.topSiteSearchShortcuts.havePinned" = "";
    "browser.newtabpage.activity-stream.improvesearch.topSiteSearchShortcuts.searchEngines" = "";
    #"browser.newtabpage.activity-stream.sectionOrder" = "topsites,topstories,highlights" #Only want topsites
    "browser.newtabpage.activity-stream.sectionOrder" = "topsites"; #Only want topsites

    #Disable Pocket
    "browser.newtabpage.activity-stream.section.highlights.includePocket" = false;
    "extensions.pocket.enabled" = false;

    #Disable Sponsors (sorry Mozilla)
    "browser.newtabpage.activity-stream.showSponsored" = false;
    "browser.newtabpage.activity-stream.showSponsoredTopSites" = false;

    #Don't save passwords
    "signon.rememberSignons" = false;

    #Remove ads from newtabpage
    "browser.newtabpage.enhanced" = false;
    "browser.newtabpage.preload" = false;

    #Always ask where to download
    "browser.download.useDownloadDir" = false;

    #Disable bookmarks in toolbar
    "browser.toolbars.bookmarks.visibility" = "never";

    #Make things a bit more GNOME-ey
    "browser.uiCustomization.state" = "{\"placements\":{\"widget-overflow-fixed-list\":[],\"unified-extensions-area\":[],\"nav-bar\":[\"back-button\",\"forward-button\",\"stop-reload-button\",\"home-button\",\"new-tab-button\",\"customizableui-special-spring1\",\"urlbar-container\",\"customizableui-special-spring2\",\"save-to-pocket-button\",\"library-button\"],\"toolbar-menubar\":[\"menubar-items\"],\"TabsToolbar\":[\"tabbrowser-tabs\",\"alltabs-button\"],\"PersonalToolbar\":[\"personal-bookmarks\"]},\"seen\":[\"developer-button\"],\"dirtyAreaCache\":[\"nav-bar\",\"TabsToolbar\"],\"currentVersion\":18,\"newElementCount\":5}";
  };
}
