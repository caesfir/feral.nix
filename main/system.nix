{ config, lib, pkgs, options, modulesPath, inputs, self, username, hostname, system, timezone, storage, ... }:

{

  system.stateVersion = "26.11";

  ### Import
  imports =
    [
    ### Nix
      ../system/boot.nix
      ../system/chaotic.nix
      ../system/environment.nix
      ../system/exclude.nix
      ../system/fileSystems.nix
      ../system/firefox.nix
      ../system/fonts.nix
      ../system/hardware.nix
      ../system/libraries.nix
      ../system/modules.nix
      ../system/multilib.nix
      ../system/overlay.nix
      ../system/programs.nix
      ../system/services.nix
      ../system/virtualisation.nix
    ];

    nix.extraOptions = ''
      !include /etc/nix/git.conf
    '';

    appstream.enable = true;

  # XDG
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
        NIXOS_OZONE_WL = "1";
       # Container
        DBX_CONTAINER_MANAGER = "podman";
        LILIPOD_HOME="/ZIN/Linux/db";
       # PATH
        PATH = [
          "/ZIN/Linux/PATH"
          "/ZIN/Linux/AppImage"
          ];
        };
      };

  # Sudo password
  security = {
    rtkit = {
      enable = true;
      };
    sudo = {
    extraConfig = ''
      Defaults pwfeedback
      Defaults insults
      '';
    };
  };

  # Time Zone
  time.timeZone = timezone; # Timezone

  # Network
  networking = {
    hostId = "88888888"; # Machine ID
    hostName = hostname; # HostName
    nftables = {
      enable = true;
      };
    nameservers = [
      "1.1.1.1"  # CloudFlare | Primary
      "9.9.9.9"  # Quad9      | Secondary
      ];
    enableIPv6 = true;
    firewall = {
      enable = true;
      backend = "nftables";
      };
    resolvconf = {
      enable = false;
      };
    networkmanager = {
      enable              = true;
      logLevel            = "OFF";
      dhcp                = "internal";
      dns                 = "systemd-resolved";
      ethernet.macAddress = "AA:AA:AA:AA:AA:AA";
      wifi.macAddress     = "random";
      };
    };

 # QT
  qt = {
    enable = true;
    style = "breeze";
    platformTheme = "kde";
    };

 # Locales
   i18n = {
     defaultCharset = "UTF-8";
     defaultLocale = "en_US.UTF-8";
     inputMethod.enable = false;
     };
   console = {
     font = "Lat2-Terminus16";
     keyMap = "us";
   };

# System
  system = {
    autoUpgrade = {
      enable = true;
      allowReboot = true;
      channel = "https://channels.nixos.org/nixos-unstable";
      operation = "boot";
      runGarbageCollection = true;
      upgrade = true;
        };

#     nixos = {
#       codeName    = lib.mkForce "ZIN";
#       label       = lib.mkForce "Feral As Fuck";
#       release     = lib.mkForce "69";
#       tags        = lib.mkForce [ "x86-64-v3" "nvidia-gpu" "intel-cpu" "amd-cpu" "desktop" "laptop" ];
#       variantName = lib.mkForce "Personal Computer";
#       variant_id  = lib.mkForce "pc";
#         };

    switch = {
      enable = true;
        };
      };
  
# Nix
  nix = {
    enable = true;
#     package =
    channel.enable = true;
    checkConfig = true;
    daemon = {
      enable = true;
        };
    daemonUser = "root";
    daemonGroup = "root";
    daemonIOSchedClass = "best-effort";
    daemonIOSchedPriority = 3;
    daemonCPUSchedPolicy = "batch";
    firewall = {
      enable = false;
        };
    optimise = {
      automatic = true;
        };
    gc = {
      automatic = true;
        };
    settings = {
      substituters = [
        "https://cache.nixos.org"                   # NixPKGs
        "https://nix-community.cachix.org"          # NixCommunity
        "https://afnix-hydra.s3-bulk-web.afnix.fr"  # LixPM
        "https://nyx-cache.chaotic.cx"              # ChaoticNyx
        "https://hyprland.cachix.org"               # Hyprland
        "https://noctalia.cachix.org"               # Noctalia
        ];
      trusted-public-keys = [
        "cache.nixos.org-1:6NCHdD59X431o0gWypbMrAURkbJ16ZPMQFGspcDShjY="           # NixPKGs
        "nix-community.cachix.org-1:mB9FSh9qf2dCimDSUo8Zy7bkq5CX+/rkCWyvRCYg3Fs="  # NixCommunity
        "afnix:oqt801y+IwJ09XRtNDQYCKb7zuCw9DQXQk8fDWPkwxM="                       # LixPM
        "nyx-cache.chaotic.cx:dJxTrgMC3V3cFfyIiBQDQorG6k1LsqurH/srpMSq7qk="        # ChaoticNyx
        "hyprland.cachix.org-1:a7pgxzMz7+chwVL3/pzj6jIBMioiJM7ypFP8PwtkuGc="       # Hyprland
        "noctalia.cachix.org-1:pCOR47nnMEo5thcxNDtzWpOxNFQsBRglJzxWPp3dkU4="       # Noctalia
        ];
      cores = 4;
      max-jobs = 4;
      sandbox = true;
      require-sigs = true;
      allowed-users = [ "root" "@wheel" ];
      trusted-users = [ "root" "@wheel" ];
      auto-optimise-store = true;
      experimental-features = [ "nix-command" "flakes" ];
#       download-buffer-size = 10000000000;
        };
    };

  services.printing.enable = lib.mkForce false;

  ### UnFree
  nixpkgs.config.allowUnfree = true;

  ### Users / Groups
  users.users.${username} = {
    shell = pkgs.zsh;
    isNormalUser = true;
    uid = 1000;
    group = username;
    extraGroups = [ username "wheel" "gamemode" ];
    packages = with pkgs; [
      ];
    subGidRanges = [{
        count    = 65536;
        startGid = 100000;
      }];
    subUidRanges = [{
        count    = 65536;
        startUid = 100000;
      }];
    };

  users.groups.${username} = {
    gid = 1000;
  };

}

