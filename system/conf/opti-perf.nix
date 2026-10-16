{ config, lib, pkgs, options, modulesPath, inputs, self, username, hostname, system, timezone, storage, ... }:

{

### Boot
  boot = {
    kernelModules = [ "ntsync" "kvm-intel" "kvm-amd" ];
    kernelParams = [ "quiet" "splash" "nosgx" "clocksource=tsc" "tsc=reliable" "random.trust_cpu=on" "split_lock_detect=off" "nowatchdog" "apparmor=0" "selinux=0" "audit=0" "intel_iommu=off" "amd_iommu=off" "iommu=off" "tsx=on" "mitigations=off" "drm.edid_firmware=DP-3:edid/DP-3,HDMI-A-1:edid/HDMI-A-1" ];
    initrd = {
      enable = true;
      kernelModules = [ "nvidia" "nvidia_modeset" "nvidia_uvm" "nvidia_drm" ];
      availableKernelModules = [ "xhci_pci" "nvme" "ahci" "usbhid" "uas" "usb_storage" "sd_mod" ];
    };
    tmp = {
      useTmpfs = true; # Mount /tmp on RAM
    };
    kernel = {
      enable = true;
      sysctl = {
        "vm.max_map_count" = 2147483642; # MAX
        "kernel.yama.ptrace_scope" = 0;
      };
    };
    kernelPackages = pkgs.linuxPackages_zen; # Linux Zen Kernel
  };

### Hardware
  hardware = {
    graphics = {
      enable = true; # Graphics
    };
    cpu = {
      amd = {
        updateMicrocode = true; # AMD Microcode
      };
      intel = {
        updateMicrocode = true; # Intel Microcode
      };
    };
  };

### Services
  services = {

    # ZRAM
    zram-generator = {
      enable = true;
      settings = {
        zram0 = {
          zram-size = 8192;
          compression-algorithm = "zstd";
          swap-priority = 100;
          fs-type = "swap";
        };
      };
    };

    # Scheduler
    scx = {
      enable = true;
      scheduler = "scx_lavd";
    };

    # Power Profile
    power-profiles-daemon = {
      enable = true;
    };

    # Power Monitor
    upower = {
      enable = true;
    };

  };

}
