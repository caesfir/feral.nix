{ config, lib, pkgs, options, modulesPath, inputs, self, username, hostname, system, timezone, storage, ... }:

### Hyprland

{

  programs = {
    hyprland = {
      enable = true;
      withUWSM = true;
      xwayland.enable = true;
      systemd.setPath.enable = false;
      package = inputs.hyprland.packages.${pkgs.stdenv.hostPlatform.system}.hyprland;
      portalPackage = inputs.hyprland.packages.${pkgs.stdenv.hostPlatform.system}.xdg-desktop-portal-hyprland;
    };
  };

}
