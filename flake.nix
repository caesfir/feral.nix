{
  description = "Nix Flake";

  inputs = {
### Core
   # NixPKGs
    nixpkgs = {
      url = "github:nixos/nixpkgs?ref=nixos-unstable";
      };
   # Chaotic Nyx
    chaotic = {
      url = "github:chaotic-cx/nyx/nyxpkgs-unstable";
      };
   # Home Manager
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
      };
   # NUR
    nur = {
      url = "github:nix-community/NUR";
      inputs.nixpkgs.follows = "nixpkgs";
      };
   # Lix
    lix = {
      url = "https://git.lix.systems/lix-project/lix/archive/main.tar.gz";
      flake = false;
      };
   # Lix Module
    lix-module = {
      url = "https://git.lix.systems/lix-project/nixos-module/archive/main.tar.gz";
      inputs.nixpkgs.follows = "nixpkgs";
      inputs.lix.follows = "lix";
      };
### Configs
   # Nix Software Center
    nix-software-center = {
      url = "github:snowfallorg/nix-software-center";
      inputs.nixpkgs.follows = "nixpkgs";
      };
   # NixOS Conf Editor
    nixos-conf-editor = {
      url = "github:snowfallorg/nixos-conf-editor";
      inputs.nixpkgs.follows = "nixpkgs";
      };
### Apps
   # FireFox Nightly
    firefox-nightly = {
      url = "github:nix-community/flake-firefox-nightly";
      inputs.nixpkgs.follows = "nixpkgs";
      };
   # Steam Millennium
    millennium = {
      url = "github:SteamClientHomebrew/Millennium?dir=packages/nix";
      inputs.nixpkgs.follows = "nixpkgs";
      };
### WM
   # Hyprland
    hyprland = {
      url = "github:hyprwm/Hyprland";
      };
   # Quickshell
    quickshell = {
      url = "git+https://git.outfoxxed.me/quickshell/quickshell";
      inputs.nixpkgs.follows = "nixpkgs";
      };
   # Noctalia
    noctalia = {
      url = "github:noctalia-dev/noctalia";
      };
   # Caelestia
    caelestia = {
      url = "github:caelestia-dots/shell";
      inputs.nixpkgs.follows = "nixpkgs";
      };
### Tools
   # Plasma Manager
    plasma-manager = {
      url = "github:nix-community/plasma-manager";
      inputs.nixpkgs.follows = "nixpkgs";
      inputs.home-manager.follows = "home-manager";
      };
   # Nix LD
    nix-ld = {
      url = "github:nix-community/nix-ld";
      inputs.nixpkgs.follows = "nixpkgs";
      };
   # Stylix
    stylix = {
      url = "github:nix-community/stylix";
      inputs.nixpkgs.follows = "nixpkgs";
      };
   # Helix
    helix = {
      url = "github:helix-editor/helix";
      inputs.nixpkgs.follows = "nixpkgs";
      };
### Third Party
  ## Nix Alien
    nix-alien = {
      url = "github:thiagokokada/nix-alien";
      };
  ## Spicetify
    spicetify = {
      url = "github:Gerg-L/spicetify-nix";
      inputs.nixpkgs.follows = "nixpkgs";
      };

  };

  outputs = inputs@{
    self,
    nixpkgs,
    ...
    }: {

  # Nix
    nixosConfigurations = {
      ZIN = nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";
        specialArgs = { inherit inputs self;
          username = "Feral";
          hostname = "ZIN";
          system = "x86_64-linux";
          timezone = "Asia/Kolkata";
          storage = {
            uuid = {
              root = "/dev/disk/by-uuid/22222222-7469-7469-7469-222222222222"; # UUID of Root | /
              boot = "/dev/disk/by-uuid/3333-7469";                            # UUID of Boot | /boot
              home = "/ZIN/Linux/Home/Nix";                                    # UUID of Home | /home
              };
            fs = {
              root = "btrfs"; # File System of Root | /
              boot = "vfat";  # File System of Boot | /boot
              home = "none";  # File System of Home | /home
              };
            };
          };
        modules = [
          ./main/system.nix
          ./main/user.nix
        ];
      };
    };

  };
}
