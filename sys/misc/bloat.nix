{ config, lib, pkgs, options, modulesPath, inputs, self, username, hostname, system, timezone, storage, ... }:

{

  programs = {
    xwayland = {
      enable = lib.mkForce false; # Does NOT affect DEs and WMs with XWayland support.
    };
  };

  fonts = {
    fontconfig = {
      cache32Bit   = lib.mkForce false; # Force disable 32bit support | Does NOT affect Steam.
    };
  };

  hardware = {
    graphics = {
      enable32Bit = lib.mkForce false; # Force disable 32bit support | Does NOT affect Steam.
    };
  };

  services = {
    xserver = {
      enable = lib.mkForce false; # Force disable X Server support. Does NOT affect Wayland DEs and WMs.
    };
    printing = {
      enable = lib.mkForce false; # Force disable Printer support.
    };
    pipewire.alsa.support32Bit  = lib.mkForce false; # Force disable 32bit support | Does NOT affect Steam.
    pulseaudio.support32Bit     = lib.mkForce false; # Force disable 32bit support | Does NOT affect Steam.
    jack.alsa.support32Bit      = lib.mkForce false; # Force disable 32bit support | Does NOT affect Steam.
  };

  documentation = {
    enable = lib.mkForce false; # Force disable documentation.

    dev = {
      enable = lib.mkForce false;
    };

    doc = {
      enable = lib.mkForce false;
    };

    info = {
      enable = lib.mkForce false;
    };

    man = {
      enable = lib.mkForce false;
    };

    nixos = {
      enable = lib.mkForce false;
    };

  };

}
