{ config, lib, pkgs, options, modulesPath, inputs, self, username, hostname, system, timezone, storage, ... }:

{

### APPSTREAM
  appstream = {
    enable = true;
  };

### PROGRAMS
  programs = {
    appimage = {
      enable = true; # AppImage integration.
      binfmt = true; # appimage-run integration.
    };
  };

### HARDWARE
  hardware = {
    enableRedistributableFirmware = true;
    firmwareCompression = "zstd";
    bluetooth = {
      enable = true; # Bluetooth
    };
  };

### SERVICES
  services = {
    flatpak = {
      enable = true; # Flatpak integration.
    };
    envfs = {
      enable = true;
    };
    fwupd = {
      enable = true;
      extraRemotes = [ "lvfs" "lvfs-embargo" "lvfs-testing" "vendor" "vendor-directory" ];
    };
    displayManager = {
      enable = true; # Display Manager
      plasma-login-manager.enable = true; # Plasma Login Manager
    };
  };

### XDG
  xdg = {
    autostart = {
      enable = true;
      install = true;
    };
    icons.enable = true;
    menus.enable = true;
    mime.enable = true;
    portal = {
      enable = true;
      xdgOpenUsePortal = true;
    };
    sounds.enable = true;
    terminal-exec.enable = true;
  };

### ENVIRONMENT
  environment = {
    homeBinInPath = true;
    localBinInPath = true;
    stub-ld = {
      enable = true;
    };
    sessionVariables = {
      # LuaTools Moon
      LUATOOLS_MOON_SLS_CHANNEL    = "beta";
      LUATOOLS_MOON_PLUGIN_CHANNEL = "beta";
      LUATOOLS_MOON_LUMEN_CHANNEL  = "beta";
      # SDL
      SDL_VIDEODRIVER = "wayland";
      SDL_AUDIODRIVER = "pipewire";
      # Electron
      ELECTRON_OZONE_PLATFORM_HINT = "wayland";
      NIXOS_OZONE_WL = "1";
      # Container
      DBX_CONTAINER_MANAGER = "podman";
      LILIPOD_HOME="/ZIN/Linux/db";
      # PATH
      PATH = [ # Custom PATH
        "/ZIN/Linux/PATH"
        "/ZIN/Linux/AppImage"
      ];
    };
  };

}

