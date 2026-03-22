{ config, pkgs, ... }:

{
  imports = [
    ./hardware-configuration.nix
    ../../users/naruko_hstk.nix
  ];

  networking.hostName = "nix";
  networking.domain = "naruko.studio";

  time.timeZone = "Asia/Tokyo";
  i18n.defaultLocale = "en_US.UTF-8";

  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  services.openssh = {
    enable = true;
    settings = {
      PasswordAuthentication = false;
      PermitRootLogin = "no";
    };
  };

  environment.systemPackages = with pkgs; [
    git
    curl
    wget
    btop
    fastfetch
    neovim
    zsh
    eza
  ];

  programs.neovim.defaultEditor = true;

  nix.settings.experimental-features = [ "nix-command" "flakes" ];

  system.stateVersion = "25.11";
}
