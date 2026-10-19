{ config, lib, pkgs, options, modulesPath, inputs, self, username, hostname, system, timezone, storage, ... }:

{

    home-manager = {
      useGlobalPkgs = true;
      useUserPackages = true;
      extraSpecialArgs = { inherit inputs self username hostname system; };
      minimal = false;
      startAsUserService = false;
      verbose = false;
      enableLegacyProfileManagement = false;
      users.${username} = {
        home = {
          stateVersion = "22.11";
          username = username;
          homeDirectory = "/home/${username}";
          };
        imports = [
          ../usr/addon.nix
          ../usr/env.nix
          ../usr/modpac.nix
          ../usr/spicetify.nix
          ../usr/variables.nix
          ];
        };
      };

}
