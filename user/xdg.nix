{ config, lib, pkgs, options, modulesPath, inputs, self, username, hostname, system, timezone, storage, ... }:

{

  home.preferXdgDirectories = true;


  xdg = {
    enable = true;
    localBinInPath = true;
    terminal-exec = {
      enable = true;
      };
    autostart = {
      enable = true;
      };
#     portal = {
#       enable = true;
#       xdgOpenUsePortal = true;
#       };
    mime = {
      enable = true;
      };
    mimeApps = {
      enable = true;
      };
    binHome    = "/ZIN/Linux/Home/Nix/Feral/.local/bin";
    cacheHome  = "/ZIN/Linux/Home/Nix/Feral/.cache";
    configHome = "/ZIN/Linux/Home/Nix/Feral/.config";
    dataHome   = "/ZIN/Linux/Home/Nix/Feral/.local/share";
    stateHome  = "/ZIN/Linux/Home/Nix/Feral/.local/state";
    userDirs = {
      enable = true;
      createDirectories = true;
      desktop =         "/ZIN/Linux/XDG/Desktop";
      documents =       "/ZIN/Linux/XDG/Documents";
      download =        "/ZIN/Linux/XDG/Downloads";
      music =           "/ZIN/Linux/XDG/Music";
      pictures =        "/ZIN/Linux/XDG/Pictures";
      projects =        "/ZIN/Linux/XDG/Projects";
      publicShare =     "/ZIN/Linux/XDG/Public";
      templates =       "/ZIN/Linux/XDG/Templates";
      videos =          "/ZIN/Linux/XDG/Videos";
      };
    };
}
