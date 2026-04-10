# Generated via dconf2nix: https://github.com/gvolpe/dconf2nix
{ lib, ... }:

with lib.hm.gvariant;

{
  dconf.settings = {
    "org/gnome/desktop/app-folders" = {
      folder-children = [ "System" "Utilities" "YaST" "Pardus" "ba005824-9756-4ad4-957f-7d262c606307" "cb8123cf-2f4f-48f9-a863-274f75e02268" "5e410d6e-8d15-49ec-b426-81693933a862" "909807a5-d8b5-496f-8d1d-eb1a9fc2b3ed" "b43c161e-83e7-470d-aaaa-92d02e754ef5" "3299278e-7cc4-4e40-9327-1205d7d46f16" "ea008060-9d22-48ad-ae22-efa1bbae1554" "0afb67a7-0b69-4fae-803d-f32f4ebeb014" ];
    };

    "org/gnome/desktop/app-folders/folders/0afb67a7-0b69-4fae-803d-f32f4ebeb014" = {
      apps = [ "lmms.desktop" "cockos-reaper.desktop" "vital.desktop" ];
      name = "DTM";
      translate = false;
    };

    "org/gnome/desktop/app-folders/folders/3299278e-7cc4-4e40-9327-1205d7d46f16" = {
      apps = [ "org.gnome.gedit.desktop" "vim.desktop" "gvim.desktop" ];
      name = "Editors";
      translate = false;
    };

    "org/gnome/desktop/app-folders/folders/5e410d6e-8d15-49ec-b426-81693933a862" = {
      apps = [ "org.fcitx.Fcitx5.desktop" "fcitx5-configtool.desktop" "org.fcitx.fcitx5-migrator.desktop" "kbd-layout-viewer5.desktop" ];
      name = "Fcitx";
      translate = false;
    };

    "org/gnome/desktop/app-folders/folders/909807a5-d8b5-496f-8d1d-eb1a9fc2b3ed" = {
      apps = [ "winetricks.desktop" "Waydroid.desktop" ];
      name = "Emulator";
      translate = false;
    };

    "org/gnome/desktop/app-folders/folders/Pardus" = {
      categories = [ "X-Pardus-Apps" ];
      name = "X-Pardus-Apps.directory";
      translate = true;
    };

    "org/gnome/desktop/app-folders/folders/System" = {
      apps = [ "org.gnome.baobab.desktop" "org.gnome.DiskUtility.desktop" "org.gnome.Logs.desktop" "org.gnome.SystemMonitor.desktop" "xterm.desktop" ];
      name = "X-GNOME-Shell-System.directory";
      translate = true;
    };

    "org/gnome/desktop/app-folders/folders/Utilities" = {
      apps = [ "org.gnome.Decibels.desktop" "org.gnome.Connections.desktop" "org.gnome.Papers.desktop" "org.gnome.font-viewer.desktop" "org.gnome.Loupe.desktop" ];
      name = "X-GNOME-Shell-Utilities.directory";
      translate = true;
    };

    "org/gnome/desktop/app-folders/folders/YaST" = {
      categories = [ "X-SuSE-YaST" ];
      name = "suse-yast.directory";
      translate = true;
    };

    "org/gnome/desktop/app-folders/folders/b43c161e-83e7-470d-aaaa-92d02e754ef5" = {
      apps = [ "steam.desktop" "VRChat.desktop" ];
      name = "Games";
    };

    "org/gnome/desktop/app-folders/folders/ba005824-9756-4ad4-957f-7d262c606307" = {
      apps = [ "org.gnome.Calculator.desktop" "org.gnome.Calendar.desktop" "org.gnome.clocks.desktop" "org.gnome.Maps.desktop" "org.gnome.Showtime.desktop" "org.gnome.Snapshot.desktop" "org.gnome.TextEditor.desktop" "org.gnome.Weather.desktop" "org.gnome.Contacts.desktop" "org.gnome.seahorse.Application.desktop" "org.gnome.Epiphany.desktop" "org.gnome.Yelp.desktop" "org.gnome.Tour.desktop" "org.gnome.Geary.desktop" "org.gnome.Music.desktop" "org.gnome.Characters.desktop" "org.gnome.SimpleScan.desktop" "cups.desktop" "nixos-manual.desktop" ];
      name = "System Apps";
      translate = false;
    };

    "org/gnome/desktop/app-folders/folders/cb8123cf-2f4f-48f9-a863-274f75e02268" = {
      apps = [ "org.gnome.Settings.desktop" "org.gnome.Extensions.desktop" ];
      name = "Tweaks";
      translate = false;
    };

    "org/gnome/desktop/app-folders/folders/ea008060-9d22-48ad-ae22-efa1bbae1554" = {
      apps = [ "waydroid.com.android.inputmethod.latin.desktop" "waydroid.org.lineageos.jelly.desktop" "waydroid.com.android.calculator2.desktop" "waydroid.org.lineageos.etar.desktop" "waydroid.org.lineageos.aperture.desktop" "waydroid.com.android.deskclock.desktop" "waydroid.com.android.contacts.desktop" "waydroid.com.android.documentsui.desktop" "waydroid.com.android.gallery3d.desktop" "waydroid.org.lineageos.eleven.desktop" "waydroid.org.lineageos.recorder.desktop" "waydroid.com.android.settings.desktop" "waydroid.com.google.android.gms.desktop" "waydroid.com.aurora.store.desktop" "waydroid.com.google.android.inputmethod.latin.desktop" "waydroid.org.mozilla.firefox.desktop" "waydroid.org.fdroid.fdroid.desktop" "waydroid.com.android.vending.desktop" "waydroid.com.google.android.contacts.desktop" "waydroid.com.google.android.apps.messaging.desktop" "waydroid.com.bilibili.trickcal.desktop" ];
      name = "Android";
      translate = false;
    };

    "org/gnome/desktop/background" = {
      color-shading-type = "solid";
      picture-options = "zoom";
      picture-uri = "file:///home/furcht968/.local/share/backgrounds/2026-03-06-11-47-46-%E3%82%AA%E3%82%BF%E3%83%9E%E3%83%B3%E6%9F%84.jpg";
      picture-uri-dark = "file:///home/furcht968/.local/share/backgrounds/2026-03-06-11-47-46-%E3%82%AA%E3%82%BF%E3%83%9E%E3%83%B3%E6%9F%84.jpg";
      primary-color = "#000000000000";
      secondary-color = "#000000000000";
    };

    "org/gnome/desktop/break-reminders/eyesight" = {
      play-sound = true;
    };

    "org/gnome/desktop/break-reminders/movement" = {
      duration-seconds = mkUint32 300;
      interval-seconds = mkUint32 1800;
      play-sound = true;
    };

    "org/gnome/desktop/input-sources" = {
      mru-sources = [ (mkTuple [ "xkb" "jp" ]) ];
      sources = [ (mkTuple [ "xkb" "jp" ]) ];
      xkb-options = [];
    };

    "org/gnome/desktop/interface" = {
      color-scheme = "prefer-dark";
      icon-theme = "Numix-Circle";
    };

    "org/gnome/desktop/notifications" = {
      application-children = [ "gnome-about-panel" "org-gnome-console" "firefox" "vesktop" "org-gnome-nautilus" "org-gnome-gedit" "cockos-reaper" "org-gnome-settings" ];
    };

    "org/gnome/desktop/notifications/application/cockos-reaper" = {
      application-id = "cockos-reaper.desktop";
    };

    "org/gnome/desktop/notifications/application/firefox" = {
      application-id = "firefox.desktop";
    };

    "org/gnome/desktop/notifications/application/gnome-about-panel" = {
      application-id = "gnome-about-panel.desktop";
    };

    "org/gnome/desktop/notifications/application/org-gnome-console" = {
      application-id = "org.gnome.Console.desktop";
    };

    "org/gnome/desktop/notifications/application/org-gnome-gedit" = {
      application-id = "org.gnome.gedit.desktop";
    };

    "org/gnome/desktop/notifications/application/org-gnome-nautilus" = {
      application-id = "org.gnome.Nautilus.desktop";
    };

    "org/gnome/desktop/notifications/application/org-gnome-settings" = {
      application-id = "org.gnome.Settings.desktop";
    };

    "org/gnome/desktop/notifications/application/vesktop" = {
      application-id = "vesktop.desktop";
    };

    "org/gnome/desktop/peripherals/mouse" = {
      speed = -0.32478632478632474;
    };

    "org/gnome/desktop/peripherals/touchpad" = {
      two-finger-scrolling-enabled = true;
    };

    "org/gnome/desktop/screensaver" = {
      color-shading-type = "solid";
      picture-options = "zoom";
      picture-uri = "file:///home/furcht968/.local/share/backgrounds/2026-03-06-11-47-46-%E3%82%AA%E3%82%BF%E3%83%9E%E3%83%B3%E6%9F%84.jpg";
      primary-color = "#000000000000";
      secondary-color = "#000000000000";
    };

    "org/gnome/desktop/search-providers" = {
      sort-order = [ "org.gnome.Settings.desktop" "org.gnome.Contacts.desktop" "org.gnome.Nautilus.desktop" ];
    };

    "org/gnome/desktop/session" = {
      idle-delay = mkUint32 0;
    };

    "org/gnome/desktop/wm/preferences" = {
      button-layout = "appmenu:minimize,maximize,close";
    };

  };
}
