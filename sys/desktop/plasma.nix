{ config, lib, pkgs, options, modulesPath, inputs, self, username, hostname, system, timezone, storage, ... }:

### KDE plasma

{

  services = {
    desktopManager = {
      plasma6 = {
        enable = true; # Core Plasma Desktop Environment.
      };
    };
  };

  programs = {
    kde-pim = {
      enable = false; # Removes bloat KDE packages bundled with Plasma.
    };
  };

  environment = {
    plasma6 = {
      excludePackages = with pkgs.kdePackages; [ # Removes bloat KDE packages bundled with Plasma.
        drkonqi
        ocean-sound-theme
        kdeplasma-addons
        kinfocenter
        plasma-workspace-wallpapers
        elisa
        okular
        khelpcenter
        baloo-widgets
        krdp
        plasma-keyboard
        qtvirtualkeyboard
      ];
    };
  };

}
