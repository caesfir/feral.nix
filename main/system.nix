{ config, lib, pkgs, options, modulesPath, inputs, self, username, hostname, system, timezone, storage, ... }:

{

  system.stateVersion = "22.11";

  ### Import
  imports =
    [
    # app
    ../system/app/addon.nix
    ../system/app/envpac.nix
    ../system/app/firefox.nix
    ../system/app/modpac.nix

    # conf
    ../system/conf/audio.nix
    ../system/conf/boot-efi.nix
    ../system/conf/container.nix
    ../system/conf/core.nix
    ../system/conf/env.nix
    ../system/conf/filesystem.nix
    ../system/conf/font.nix
    ../system/conf/gaming.nix
    ../system/conf/network.nix
    ../system/conf/nvidia.nix
    ../system/conf/opti-perf.nix

    # desktop
    ../system/desktop/cosmic.nix
    ../system/desktop/gnome.nix
    ../system/desktop/hyprland.nix
    ../system/desktop/plasma.nix

    # misc
    ../system/misc/bloat.nix
    ../system/misc/blob.nix
    ../system/misc/chaotic.nix
    ../system/misc/fhs.nix

    ];

    nix.extraOptions = ''
      !include /etc/nix/git.conf
    '';

}
