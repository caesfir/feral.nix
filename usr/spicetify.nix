{ config, lib, pkgs, options, modulesPath, inputs, self, username, hostname, system, timezone, storage, ... }:

let
  spicePkgs = inputs.spicetify.legacyPackages.${pkgs.stdenv.hostPlatform.system};
in {
  programs.spicetify = {
    enable = true;
    wayland = true;
    enabledExtensions = with spicePkgs.extensions; [
      adblockify
    ];
#     theme = {
#       homeConfig = true;
#       injectCss = true;
#       injectThemeJs = true;
#       overwriteAssets = true;
#       replaceColors = true;
#       };
    };
}
