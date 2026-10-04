{ config, lib, pkgs, options, modulesPath, inputs, self, username, hostname, system, timezone, storage, ... }:

{

  programs = {
    fastfetch = {
      enable = true;
      };
#     mangohud = {
#       enable = true;
#       };
#     distrobox = {
#       enable = true;
#       enableSystemdUnit = true;
#
#      # Settings
#       settings = {
#         container_additional_volumes = "/ZIN:/ZIN /I:/I /II:/II /III:/III";
#         container_always_pull = "1";
#         container_generate_entry = 1;
#         container_manager = "podman";
#         non_interactive = "0";
#         skip_workdir="0";
#         };
#
#      # Containers
#       containers = {
#
#       # Arch Linux
#         arch = {
#           entry = true;
#           nvidia = true;
#           init = false;
#           root = false;
#           pull = true;
#           image = "archlinux:latest";
#           home = "/ZIN/Linux/db/home/arch";
#           hostname = hostname;
#           volume= [ "/ZIN:/ZIN" "/I:/I" "/II:/II" "/III:/III" ];
#           additional_flags = [ "--device=nvidia.com/gpu=all" ];
#           additional_packages = [ "git" "nano" ];
#           };
#
#         };
#
#       };
    };

}
