{ config, pkgs, lib, ... }: {
  dconf.settings = {
    "org/gnome/shell" = {
      enabled-extensions = ["blur-my-shell@aunetx" "dash-to-panel@jderose9.github.com" "date-menu-formatter@marcinjakubowski.github.com" "kimpanel@kde.org"];   
      favorite-apps=["org.gnome.Nautilus.desktop" "org.gnome.Console.desktop" "firefox.desktop" "code.desktop" "com.obsproject.Studio.desktop" "vlc.desktop" "obsidian.desktop" "thunderbird.desktop" "vesktop.desktop"]; 
    };

    "org/gnome/shell/extensions/blur-my-shell/panel" = {
      blur = false;
    };

    "org/gnome/shell/extensions/dash-to-panel" = {
      intellihide = true;
      animate-appicon-hover = true;
      animate-appicon-hover-animation-extent = "{'RIPPLE': 4, 'PLANK': 4, 'SIMPLE': 1}";

      panel-element-positions = ''{"MEL-24207930AJ":[{"element":"showAppsButton","visible":true,"position":"stackedTL"},{"element":"activitiesButton","visible":false,"position":"stackedTL"},{"element":"leftBox","visible":true,"position":"stackedTL"},{"element":"taskbar","visible":true,"position":"centerMonitor"},{"element":"centerBox","visible":true,"position":"stackedBR"},{"element":"rightBox","visible":true,"position":"stackedBR"},{"element":"dateMenu","visible":true,"position":"stackedBR"},{"element":"systemMenu","visible":true,"position":"stackedBR"},{"element":"desktopButton","visible":true,"position":"stackedBR"}]}'';

      trans-gradient-top-color = "#000000";
      trans-gradient-bottom-opacity = 1.0;
      trans-gradient-top-opacity = 0.0;
      trans-use-custom-gradient = true;
      trans-use-custom-opacity = true;

      show-window-previews = false;
      show-tooltip = false;
    };

    "org/gnome/shell/extensions/date-menu-formatter" = {
      pattern = "yyyy-MM-dd HH:mm:ss";
    };
  };
}
