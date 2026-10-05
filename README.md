# feral.nix
Just a backup of my NixOS configs.

Feel free to use them; however, keep in mind that you may need to make some changes based on your own configuration. Here are some of the most important configurations to consider:
- Meant to target Nvidia 16xx-series and above GPUs. You might want to consider removing some configs and editing others if you use AMD, Intel, or an **End-Of-Life** Nvidia GPU.
- Many security measures which are normally enabled by default have been force-disabled to prioritize raw performance over security.
- Uses [**Lix**](https://lix.systems) instead of [**Nix**](https://nixos.org) as the package manager.
- Uses the Linux Zen Kernel.
- nix-ld is used to make some FHS applications run normally(-ish).
- [**Plasma**](https://kde.org/plasma-desktop), [**GNOME**](https://www.gnome.org), [**COSMIC**](https://system76.com/cosmic), and [**Hyprland**](https://hypr.land) are all enabled by default.
- Xwayland is enabled by default across all **Desktop Environments** and **Window Managers**.
- Many [**Plasma**](https://kde.org/plasma-desktop) and [**GNOME**](https://www.gnome.org) packages have been explicitly excluded to avoid (what I consider) bloat.
- Plasma Login Manager is used as the default **Display Manager**.
- You will need to configure your own username, hostname, timezone, filesystems, and directories. Even if you don't bother changing the first three, you **must** configure filesystems and directories to match your hardware.
- There are plenty of flakes included that I am not currently using, but I have decided to keep them around in case I ever bother to use them.

| Directories | File types |
|:---:|:---|
| edid/ | Contains custom EDID files for my monitors. |
| fw/ | Currently only contains custom .fw files for my audio. |
| main/ | Main configuration files; imports from `system` and `user`. |
| system/ | System configuration files. |
| user/ | User configuration files. |
