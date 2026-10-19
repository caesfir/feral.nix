{ config, lib, pkgs, options, modulesPath, inputs, self, username, hostname, system, timezone, storage, ... }:

{

  system.stateVersion = "22.11";

  ### Import
  imports =
    [
    # app
    ../sys/app/addon.nix
    ../sys/app/envpac.nix
    ../sys/app/firefox.nix
    ../sys/app/modpac.nix

    # conf
    ../sys/conf/audio.nix
    ../sys/conf/boot-efi.nix
    ../sys/conf/container.nix
    ../sys/conf/core.nix
    ../sys/conf/env.nix
    ../sys/conf/filesystem.nix
    ../sys/conf/font.nix
    ../sys/conf/gaming.nix
    ../sys/conf/network.nix
    ../sys/conf/nvidia.nix
    ../sys/conf/opti-perf.nix

    # desktop
    ../sys/desktop/cosmic.nix
    ../sys/desktop/gnome.nix
    ../sys/desktop/hyprland.nix
    ../sys/desktop/plasma.nix

    # misc
    ../sys/misc/bloat.nix
    ../sys/misc/chaotic.nix
    ../sys/misc/fhs.nix

    ];

    nix.extraOptions = ''
      !include /etc/nix/git.conf
    '';

}
