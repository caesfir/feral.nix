{ config, lib, pkgs, options, modulesPath, inputs, self, username, hostname, system, timezone, storage, ... }:

{

  programs = {

  # NeoVim
    neovim = {
      enable = true;
      viAlias = true;
      vimAlias = true;
      withNodeJs = true;
      withPython3 = true;
      defaultEditor = true;
    };
  # NPM
    npm = {
      enable = true;
    };
  # Nix Index
    nix-index = {
      enable = true;
      enableZshIntegration = true;
      enableBashIntegration = true;
      package = inputs.nix-index-database.packages.${pkgs.stdenv.hostPlatform.system}."nix-index-with-db";
    };
  # Comma
    comma = {
      enable = true;
      enableZshIntegration = true;
      enableBashIntegration = true;
    };
  # Starship
    starship = {
      enable = true;
      enableZshIntegration = true;
      enableBashIntegration = true;
    };
  # Plasma Browser Integration
    chromium = {
      enable = true;
      enablePlasmaBrowserIntegration = true;
    };
  # ZSH
    zsh = {
      enable = true;
    };
  # Git
    git.enable = true;
  # KDEConnect
    kdeconnect.enable = true;
  # CoolerControl
    coolercontrol.enable = true;

  };

}
