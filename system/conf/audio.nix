{ config, lib, pkgs, options, modulesPath, inputs, self, username, hostname, system, timezone, storage, ... }:

### AUDIO

{

  security = {
    rtkit = {
      enable = true;
    };
  };

  services = {
    pipewire = {
      enable = true;
      audio.enable = true;
      alsa.enable = true;
      pulse.enable = true;
      jack.enable = true;
      wireplumber.enable = true;
      socketActivation = true;
      raopOpenFirewall = true;
      systemWide = false; # Do NOT enable this.
    };
  };

}
