{ config, lib, pkgs, options, modulesPath, inputs, self, username, hostname, system, timezone, storage, ... }:

{

#   programs.plasma = {
#     enable = true;
#     workspace = {
#       cursor = {
#         theme = "Bibata-Modern-Ice";
#         size = 24;
#         };
#       };
#     };

  fonts.fontconfig.enable = false;

#   wayland.windowManager.hyprland = {
#     enable = true;
#     sourceFirst = true;
#     configType = "lua";
#     systemd = {
#       enable = true;
#       enableXdgAutostart = true;
#       variables = ["--all"];
#       };
#     xwayland = {
#       enable = true;
#       };
#     package = inputs.hyprland.packages.${pkgs.stdenv.hostPlatform.system}.hyprland;
#     portalPackage = inputs.hyprland.packages.${pkgs.stdenv.hostPlatform.system}.xdg-desktop-portal-hyprland;
#     };

  systemd = {
    user = {
      enable = true;
      startServices = true;
#       sessionVariables = {
#         NIXOS_OZONE_WL = "1";
#         };
      };
    };

#   home = {
#     sessionVariables = {
#       NIXOS_OZONE_WL = "1";
#       };
#     };

  xdg.configFile."uwsm/env".source = "${config.home.sessionVariablesPackage}/etc/profile.d/hm-session-vars.sh";

}
