{
  home.file.gnomeMonitors = {
    source = ./monitors.xml;
    target = ".config/monitors.xml";
  };

  dconf.settings = {
    "org/gnome/desktop/interface" = {
      font-name = "Inter 11";
      document-font-name = "Atkinson Hyperlegible 11";
      monospace-font-name = "JetBrainsMono Nerd Font Mono 11";
    };
    "org/gnome/mutter" = {
      experimental-features = [ "scale-monitor-framebuffer" ];
    };
    "org/gnome/shell" = {
      enabled-extensions = [
        "appindicatorsupport@rgcjonas.gmail.com"
        "rounded-window-corners@yilozt"
      ];
      favorite-apps =
        [ "firefox.desktop" "org.gnome.Nautilus.desktop" "Alacritty.desktop" ];
    };
    "org/gnome/settings-daemon/plugins/power" = {
      sleep-inactive-ac-type = "blank";
    };
    "org/gnome/nautilus/preferences" = {
      default-folder-viewer = "list-view";
      search-filter-time-type = "last_modified";
    };
    "org/gnome/nautilus/list-view" = { default-zoom-level = "small"; };
    "org/gnome/desktop/background" = {
      color-shading-type = "solid";
      picture-opacity = 100;
      picture-options = "zoom";
      picture-uri =
        "file:///run/current-system/sw/share/backgrounds/gnome/blobs-l.svg";
      picture-uri-dark =
        "file:///run/current-system/sw/share/backgrounds/gnome/blobs-d.svg";
      primary-color = "#241f31";
      secondary-color = "#000000";
      show-desktop-icons = false;
    };
  };
}
