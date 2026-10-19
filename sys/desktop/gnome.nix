{ config, lib, pkgs, options, modulesPath, inputs, self, username, hostname, system, timezone, storage, ... }:

### GNOME

{

  services = {
    desktopManager = {
      gnome = {
        enable = true; # Core GNOME Desktop Environment.
      };
    };
  };

  environment = {
    gnome = {
      excludePackages = with pkgs; [ # Removes bloat packages bundled with GNOME.
        gnome-backgrounds
        gnome-tour
        gnome-user-docs
        baobab
        decibels
        epiphany
        gnome-text-editor
        gnome-calculator
        gnome-calendar
        gnome-clocks
        gnome-console
        gnome-contacts
        gnome-font-viewer
        gnome-logs
        gnome-maps
        gnome-music
        gnome-system-monitor
        gnome-tecla
        gnome-weather
        loupe
        nautilus
        papers
        gnome-connections
        showtime
        simple-scan
        snapshot
        yelp
      ];
    };
  };

}
