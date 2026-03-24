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
  boot.loader.efi.efiSysMountPoint = "/boot/efi";
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
    gnupg
    pinentry-curses
  ];

  programs.neovim.defaultEditor = true;

  nix.settings.experimental-features = [ "nix-command" "flakes" ];

  environment.pathsToLink = [ "/share/zsh" ];

  programs.zsh.enableCompletion = false;

  system.stateVersion = "25.11";
}
