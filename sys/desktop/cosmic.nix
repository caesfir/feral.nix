{ config, lib, pkgs, options, modulesPath, inputs, self, username, hostname, system, timezone, storage, ... }:

### COSMIC

{

  services = {
    desktopManager = {
      cosmic = {
        enable = true; # Core COSMIC Desktop Environment.
        xwayland.enable = true; # XWayland Support.
      };
    };
  };

  environment = {
    cosmic = {
      excludePackages = with pkgs; [ # Removes bloat packages bundled with COSMIC.
      cosmic-wallpapers
      ];
    };
  };

}
