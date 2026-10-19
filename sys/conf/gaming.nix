{ config, lib, pkgs, options, modulesPath, inputs, self, username, hostname, system, timezone, storage, ... }:

{

  hardware = {
    steam-hardware = {
      enable = lib.mkForce false;
    };
  };

  programs = {

  # Gamemode
    gamemode = {
      enable = true;
      enableRenice = true;
      settings = {
        general = {
          desiredgov="performance";
          desiredprof="performance";
          softrealtime="on";
          renice=10;
          ioprio=0;
          inhibit_screensaver=1;
          disable_splitlock=1;
        };
        cpu = {
        };
        gpu = {
        };
      };
    };

  # Gamescope
    gamescope = {
      enable = true;
      enableWsi = true;
      capSysNice = true;
#       args = [
#         ];
#       env = {
#       };
    };

  # Steam App
      steam = {
      enable = true;
#       package = pkgs.millennium-steam;
      extest.enable = lib.mkForce false;
      protontricks.enable = false;
      extraPackages = with pkgs; [
        ];
      gamescopeSession = {
        enable = true;
        steamArgs = [
#         # VR
#           "-vrskip"
#           "-vrdisable"
#         # Controller
#           "-nojoy"
#           "-disable-libusb"
#         # Steam Feat
#           "-console"
          "-bigpicture"
#           "-showallbetas"
#           "-pipewire"
          "-pipewire-dmabuf"
#           "-usepipewireaudio"
#           "-compat-force-slr"
#           "-compat-disable-filtering"
#         # CEF Feat
#           "-cef-force-gpu"
#           "-cef-use-vulkan"
#           "-no-cef-sandbox"
#           "-cef-enable-vaapi"
#           "-cef-force-hw-video-decode"
#           "-cef-enable-low-delay-live-stream"
#         # Steam Perf
#           "-nocrashmonitor"
#           "-disablevulkanlayer"
#           "-no-hardware-updater"
#           "-disable-overlay-gpu-pri"
#           "-disable-overlay-wait-for-cef-frame"
#         # CEF Perf
#           "-cef-disable-breakpad"
#           "-cef-disable-logging"
#           "-cef-disable-js-logging"
#           "-cef-disable-xcomposite-workaround"
#           "-cef-disable-touch-focus-workaround"
#           "-cef-disable-safe-shutdown-workaround"
        ];
        args = [
#           "-W 2560" # Upscaler Width
#           "-H 1440" # Upscaler Height
#           "-w 1920" # Native Width
#           "-h 1080" # Native Height
#           "-r 210" # Refresh Rate
#           "-m 2" # Max Scale Multiplier
#           "-S fit" # Scaling Method
#           "-F fsr" # Scaler Method
#           "--sharpness=10" # Scaler Sharpness
#           "-s 1" # Mouse Sensitivity

          "--expose-wayland"
          "--backend=drm"
          "--rt" # Realtime Scheduling
          "-e" # Steam integration
          "--prefer-vk-device=10de:21c4" # NVIDIA 1660 Super
          "--adaptive-sync" # VRR
          "--immediate-flips" # Tearing
          "--generate-drm-mode=fixed" # cvt / fixed
          "-O DP-3" # Output to use

#           "-C 3000" # Hide cursor image after delay.
#           "--force-orientation=normal"
#           "--force-windows-fullscreen"
#             # HDR
#           "--hdr-enabled"
#           "--sdr-gamut-wideness=1"
#           "--hdr-sdr-content-nits=400"
#           "--hdr-itm-enabled"
#           "--hdr-itm-sdr-nits=100"
#           "--hdr-itm-target-nits=1000"
#
#           "--framerate-limit 60" # Max FPS
#           "--default-touch-mode=passthrough"
#           "--keep-alive"
        ];
        env = {
          LIBVA_DRIVER_NAME = "nvidia";
          __GLX_VENDOR_LIBRARY_NAME = "nvidia";
          GBM_BACKEND = "nvidia-drm";
          NVD_BACKEND = "direct";
          WLR_BACKENDS = "drm";
          WLR_RENDERER = "vulkan";
          WLR_NO_HARDWARE_CURSORS = "1";

        };
      };

      # Steam Firewall
      remotePlay = {
        openFirewall = true;
      };
      dedicatedServer = {
        openFirewall = true;
      };
      localNetworkGameTransfers = {
        openFirewall = true;
      };
    };
  };

}
