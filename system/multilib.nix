{ config, lib, pkgs, options, modulesPath, inputs, self, username, hostname, system, timezone, storage, ... }:

{

  fonts.fontconfig.cache32Bit   = lib.mkForce false;

  hardware.graphics.enable32Bit = lib.mkForce false;

  services = {
    pipewire.alsa.support32Bit  = lib.mkForce false;
    pulseaudio.support32Bit     = lib.mkForce false;
    jack.alsa.support32Bit      = lib.mkForce false;
    };

}
