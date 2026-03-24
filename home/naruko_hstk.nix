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

  programs.git = {
    userName = "naruko-hstk";
    userEmail = "naruko@naruko.studio";
    signing = {
      key = "BCAFDD3A59626911612C8238787FCE0CAB1551FD";
      signByDefault = true;
    };
};

}
