{ config, lib, pkgs, options, modulesPath, inputs, self, username, hostname, system, timezone, storage, ... }:

{

  hardware = {
    display = {
      edid = {
        enable = true;
        packages = [
          (pkgs.runCommand "edid" { compressFirmware = false; } ''
            mkdir -p "$out/lib/firmware/edid"
              cp ${../bob/edid/DP-3.bin}     "$out/lib/firmware/edid/DP-3.bin"
              cp ${../bob/edid/HDMI-A-1.bin} "$out/lib/firmware/edid/HDMI-A-1.bin"
            ''
          )
        ];
      };
      outputs = {
        "DP-3".edid     = "DP-3.bin";
        "HDMI-A-1".edid = "HDMI-A-1.bin";
      };
    };
    firmware = [
      (pkgs.runCommand "audio" { compressFirmware = false; } ''
        mkdir -p "$out/lib/firmware"
          cp ${../bob/fw/audio.fw} "$out/lib/firmware/audio.fw"
      '')
    ];
  };

  boot = {
    extraModprobeConfig = ''
      options snd-hda-intel patch=audio.fw
    '';
  };

}
