{ config, lib, pkgs, options, modulesPath, inputs, self, username, hostname, system, timezone, storage, ... }:

{

  hardware = {
    firmware = [
     # EDID
      (pkgs.runCommand "edid" {} ''
        mkdir -p $out/lib/firmware/edid
          cp ${../../blob/edid/DP-3} $out/lib/firmware/edid/DP-3
          cp ${../../blob/edid/HDMI-A-1} $out/lib/firmware/edid/HDMI-A-1
      '')
     # HDA-Jack-Retask
      (pkgs.runCommand "audio" {} ''
        mkdir -p $out/lib/firmware
          cp ${../../blob/fw/hda-jack-retask.fw} $out/lib/firmware/hda-jack-retask.fw
      '')
    ];
  };

  boot = {
    initrd = {
      extraFiles = {
        "/lib/firmware/edid/DP-3".source = ../../blob/edid/DP-3;
        "/lib/firmware/edid/HDMI-A-1".source = ../../blob/edid/HDMI-A-1;
      };
    };
    extraModprobeConfig = ''
      options snd-hda-intel patch=hda-jack-retask.fw
    '';
  };

}
