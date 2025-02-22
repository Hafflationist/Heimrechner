{ pkgs, inputs, ... }:

{
  home.file = {
    ".mozilla/firefox/default/chrome/theme" = {
      source = ./FF_ULTIMA/theme;
      recursive = true;
    };
    ".mozilla/firefox/default/chrome/userChrome.css" = {
      source =./FF_ULTIMA/userChrome.css;
    };
    ".mozilla/firefox/default/chrome/userContent.css" = {
      source =./FF_ULTIMA/userContent.css;
    };
  };
  programs.firefox = {
    enable = true;
    languagePacks = [ "de" "en-GB" ];
    profiles.default = {
      # userChrome = builtins.readFile(./userChrome.css);
      # userContent = builtins.readFile(./userContent.css);
      # Enable WebGL, cookies and history
      settings = {
        #"privacy.resistFingerprinting" = false;
        "privacy.clearOnShutdown.cookies" = false;
        "privacy.clearOnShutdown.history" = false;
        "network.cookie.lifetimePolicy" = 0;
        #"webgl.disabled" = false;
        "toolkit.legacyUserProfileCustomizations.stylesheets" = true;
        "layers.acceleration.force-enabled" = true;
        "gfx.webrender.all" = true;
        "gfx.webrender.enabled" = true;
        "layout.css.backdrop-filter.enabled" = true;
        "svg.context-properties.content.enabled" = true;
        "browser.tabs.allow_transparent_browser" = true;
      };
    };
  };
}
