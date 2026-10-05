{ config, lib, pkgs, options, modulesPath, inputs, self, username, hostname, system, timezone, storage, ... }:

{

  imports =
    [ (modulesPath + "/installer/scan/not-detected.nix")
    ];

### Boot
  boot = {
    initrd = {
      availableKernelModules = [ "xhci_pci" "nvme" "ahci" "usbhid" "uas" "usb_storage" "sd_mod" ];
      kernelModules = [ "nvidia" "nvidia_modeset" "nvidia_uvm" "nvidia_drm" ];
      extraFiles = {
      "/lib/firmware/edid/DP-3".source = ../edid/DP-3;
      "/lib/firmware/edid/HDMI-A-1".source = ../edid/HDMI-A-1;
      };
    };
    kernel = {
      enable = true;
      sysctl = {
        "vm.max_map_count" = 2147483642;
        };
      };
    kernelPackages = pkgs.linuxPackages_zen;
    kernelModules = [ "kvm-intel" "kvm-amd" "ntsync" ];
    kernelParams = [ "quiet" "splash" "nosgx" "clocksource=tsc" "tsc=reliable" "random.trust_cpu=on" "split_lock_detect=off" "nowatchdog" "apparmor=0" "selinux=0" "audit=0" "intel_iommu=off" "amd_iommu=off" "iommu=off" "tsx=on" "mitigations=off" "drm.edid_firmware=DP-3:edid/DP-3,HDMI-A-1:edid/HDMI-A-1" ];
    extraModprobeConfig = ''
      options snd-hda-intel patch=hda-jack-retask.fw
    '';
  };

### ZRAM
  services.zram-generator = {
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

  nixpkgs.hostPlatform = system;

  boot = {
    tmp = {
      useTmpfs = true;
      };
    };

### Grub
  boot = {
    consoleLogLevel = 0;
    initrd.verbose = false;
  # Playmouth
    plymouth = {
      enable = true;
      theme = "catppuccin-mocha";
      themePackages = [(pkgs.catppuccin-plymouth.override {
        variant = "mocha";
        })];
      };
    loader = {
      timeout = 3;
    # EFI
      efi = {
        canTouchEfiVariables = true;
        efiSysMountPoint = "/boot";
        };
    # SystemD Boot
#       systemd-boot = {
#         enable = true;
#         configurationLimit = 3;
#         consoleMode = "keep";
#         editor = false;
#         edk2-uefi-shell =  {
#           enable = false;
#           sortKey = "";
#           };
#         extraEntries = {
#          # Arch
#           "arch.conf" = ''
#             title Arch
#             efi   /EFI/Arch/grubx64.efi
#           '';
#          # Windows
#           "windows.conf" = ''
#             title Windows
#             efi   /EFI/Boot/bootx64.efi
#           '';
#           };
#         };
    # GRUB
      grub = {
        enable = true;
        default = "saved";
        efiSupport = true;
        configurationName = "Nix";
        configurationLimit = 3;
        gfxpayloadEfi = "keep";
        gfxmodeEfi = "2560x1440x32";
        splashMode = "normal";
        theme = (pkgs.catppuccin-grub.override {
          flavor = "mocha";
          });
        extraEntries = ''

          menuentry "Arch" --class arch {
          insmod part_gpt
          insmod fat
          insmod search_fs_uuid
          insmod chain
          search --fs-uuid --set=root 5555-7469
          chainloader /EFI/Arch/grubx64.efi
          }

          menuentry "Windows" --class windows {
          insmod part_gpt
          insmod fat
          insmod search_fs_uuid
          insmod chain
          search --fs-uuid --set=root 6666-6666
          chainloader /EFI/Boot/bootx64.efi
          }

          menuentry "UEFI" --class efi {
          fwsetup
          }

        '';
        mirroredBoots = [
          {
           devices = [ "nodev" ];
           path = "/boot";
           efiBootloaderId = "Nix";
          }
        ];
      };
    };
  };

}
