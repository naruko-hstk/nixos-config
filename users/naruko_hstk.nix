{ pkgs, ... }:

{
  users.users.naruko_hstk = {
    isNormalUser = true;
    extraGroups = [ "wheel" ];
    hashedPassword = "$2b$05$59BZjTGWGd3wa4df6gKayeZf5JfH/R0nxHYvc1VCrbqoX.UcTpsSi";
    shell = pkgs.zsh;
    openssh.authorizedKeys.keys = [
      "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIErbvQbFM9H/hY0X1IUV4jLCbxw+F/oDd7SXlF+mZEdz naruko_hstk@MacBook-Air.local"
    ];
  };

  programs.zsh.enable = true;
  security.sudo.wheelNeedsPassword = true;
}
