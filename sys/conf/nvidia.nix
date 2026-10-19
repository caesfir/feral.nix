{ config, lib, pkgs, options, modulesPath, inputs, self, username, hostname, system, timezone, storage, ... }:

### NVIDIA

{

  services = {
    xserver = {
      videoDrivers = [ "nvidia" ];
    };
  };

  hardware = {

  # Container
    nvidia-container-toolkit = {
      enable = true;
      mount-nvidia-executables = true;
      device-name-strategy = "index";
      discovery-mode = "nvml";
    };

  # Driver
    nvidia = {
      open = true;
      nvidiaPersistenced = true;
      nvidiaSettings = true;
      videoAcceleration = true;
      branch = "bleeding_edge";
      gsp.enable = true;
      modesetting.enable = true;
      dynamicBoost.enable = true;
      powerManagement = {
        enable = true;
        finegrained = false;
        kernelSuspendNotifier = true;
      };
    };

  };

}
