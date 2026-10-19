{ config, lib, pkgs, options, modulesPath, inputs, self, username, hostname, system, timezone, storage, ... }:

{

  imports = with inputs; [
                spicetify.homeManagerModules.spicetify
                ];

}
