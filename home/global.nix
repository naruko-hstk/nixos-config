{ pkgs, ... }:

{
  programs.zsh = {
    enable = true;
    envExtra = ''
      [ -f ~/.zshenv.local ] && source ~/.zshenv.local
    '';
    profileExtra = ''
      [ -f ~/.zprofile.local ] && source ~/.zprofile.local
    '';
    initContent = ''
      [ -f ~/.zshrc.local ] && source ~/.zshrc.local
    '';
    enableCompletion = false;
  };

  programs.neovim = {
    enable = true;
    defaultEditor = true;
    viAlias = true;
    vimAlias = true;
  };

  programs.git = {
    enable = true;
    settings = {
      init.defaultBranch = "master";
      pull.rebase = true;
    };
  };

  programs.fastfetch.enable = true;
  services.gpg-agent = {
    enable = true;
    pinentryPackage = pkgs.pinentry-curses;
  };
}
