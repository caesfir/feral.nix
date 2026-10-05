{ config, lib, pkgs, options, modulesPath, inputs, self, username, hostname, system, timezone, storage, ... }:

{

# Services
  services = {

  # Resolved
    resolved = {
      enable = true;
      settings = {
        Resolve = {
          DNSOverTLS = false; # Will break VPNs if enabled.
          DNSSEC     = false; # Will break VPNs if enabled.
          };
        };
      };
  # SCX
    scx = {
      enable = true;
      scheduler = "scx_lavd";
      };
  # PPD
    power-profiles-daemon.enable = true;
  # UPower
    upower.enable = true;
  # envfs
    envfs.enable = true;
  # fwupd
    fwupd = {
      enable = true;
      extraRemotes = [ "lvfs" "lvfs-embargo" "lvfs-testing" "vendor" "vendor-directory" ];
    };
  # X
    xserver = {
      enable = false;
      videoDrivers = [ "nvidia" ];
    };
  # Pipewire
    pipewire = {
      enable = true;
      audio.enable = true;
      alsa.enable = true;
      pulse.enable = true;
      jack.enable = true;
      wireplumber.enable = true;
      socketActivation = true;
      raopOpenFirewall = true;
      systemWide = false; # Do NOT enable this.
      };
  # Flatpak
    flatpak.enable = true;
  # Desktop Manager
    desktopManager = {
    # Cosmic
      cosmic = {
        enable = true;
        xwayland.enable = true;
      };
    # Plasma
      plasma6.enable = true;
    # GNOME
      gnome.enable = true;
    };
  # Display Manager
    displayManager = {
      enable = true;
    # Plasma Login Manager
      plasma-login-manager.enable = true;
    };

  };

}
