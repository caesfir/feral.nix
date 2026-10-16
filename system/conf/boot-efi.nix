{ config, lib, pkgs, options, modulesPath, inputs, self, username, hostname, system, timezone, storage, ... }:

{

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

          menuentry "Guix" --class guix {
          insmod part_gpt
          insmod fat
          insmod search_fs_uuid
          insmod chain
          search --fs-uuid --set=root 6666-7469
          chainloader /EFI/Guix/grubx64.efi
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
