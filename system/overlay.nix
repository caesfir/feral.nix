{ config, lib, pkgs, options, modulesPath, inputs, self, username, hostname, system, timezone, ... }:

{

  nixpkgs.overlays = with inputs; [
    millennium.overlays.default  # Steam Millennium
    nix-alien.overlays.default   # Nix Alien
    ];

}
