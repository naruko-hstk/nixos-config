{ pkgs, ... }:

{
  imports = [ ./global.nix ];

  home.username = "naruko_hstk";
  home.homeDirectory = "/home/naruko_hstk";
  home.stateVersion = "25.11";

  home.packages = with pkgs; [
    bun
    nodejs
    rustup
    go
    kotlin
  ];

  programs.zsh = {
    envExtra = ''
      export GOPATH="$HOME/.go"
      export PATH="$PATH:$GOPATH/bin"
      [ -f ~/.zshenv.local ] && source ~/.zshenv.local
    '';
    initExtra = ''
      [ -f ~/.zshrc.local ] && source ~/.zshrc.local
    '';
  };
}
