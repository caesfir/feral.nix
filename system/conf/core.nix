{ config, lib, pkgs, options, modulesPath, inputs, self, username, hostname, system, timezone, storage, ... }:

{

  # Sudo
  security = {
    sudo = {
    extraConfig = ''
      Defaults pwfeedback
      Defaults insults
      '';
    };
  };

  # Time Zone
  time.timeZone = timezone; # Timezone

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
    switch = {
      enable = true;
    };
  };

# Nix
  nix = {
    enable = true;
#     package = pkgs.lixPackageSets.latest.lix
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

  nixpkgs = {
    hostPlatform = system; # Arch
    config = {
      allowUnfree = true; # UnFree
    };
  };

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

