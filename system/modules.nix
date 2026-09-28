{ config, lib, pkgs, options, modulesPath, inputs, self, username, hostname, system, timezone, ... }:

{

  imports = with inputs; [
    lix-module.nixosModules.default         # Lix Package Manager
    home-manager.nixosModules.home-manager  # Home Manager
    chaotic.nixosModules.default            # Chaotic Nyx
    nur.modules.nixos.default               # Nix User Repository
    nix-ld.nixosModules.nix-ld              # Nix LD
    noctalia.nixosModules.default           # Noctalia
    ];

}
