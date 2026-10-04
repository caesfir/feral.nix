{ config, lib, pkgs, options, modulesPath, inputs, self, username, hostname, system, timezone, storage, ... }:

{

  virtualisation = {
    podman = {
      enable = true;
      dockerCompat = true;
      dockerSocket = {
        enable = true;
        };
      autoPrune = {
        enable = true;
        dates = "daily";
        flags = [ "--all" ];
        };
      };
    };

}
