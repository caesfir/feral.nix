{ config, lib, pkgs, options, modulesPath, inputs, self, username, hostname, system, timezone, storage, ... }:

{

  environment = {
    systemPackages = lib.flatten
  ## pkgs
      (with pkgs; [
    ## Discord
        (discord.override {
        withOpenASAR = true;
        })
        (discord-canary.override {
        withOpenASAR = true;
        })
        (discord-development.override {
        withOpenASAR = true;
        })
    ## AppImage Override
        (appimage-run.override {
        extraPkgs = pkgs: with pkgs; [
        zstd
        ];
        })
    ## Core
        curl
        wget
        cachix
    ## Container
        distrobox
        lilipod
    ## Extras
        efibootmgr
        gparted
        gnome-tweaks
        chromium
        steamcmd
        kitty
    ## File Systems
        btrfs-progs                     # BTRFS
        e2fsprogs                       # EXT4
        ntfsprogs-plus                  # NTFS
        exfatprogs                      # EXFAT
        dosfstools                      # FAT32
        mtools                          # FAT32
    ## Steamy
        jq
        gnutar
        unzip
        libnotify
    ## MSR
        playwright
        typescript
    ## inputs
        (with inputs; [
          nixos-conf-editor.packages.${stdenv.hostPlatform.system}.nixos-conf-editor     # Nix Editor
          nix-software-center.packages.${stdenv.hostPlatform.system}.nix-software-center # Nix Store
        ])
      ]);
  };

}
