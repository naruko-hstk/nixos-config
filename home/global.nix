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
    initExtra = ''
      [ -f ~/.zshrc.local ] && source ~/.zshrc.local
    '';
  };

  programs.neovim = {
    enable = true;
    defaultEditor = true;
    viAlias = true;
    vimAlias = true;
  };

  programs.git = {
    enable = true;
    extraConfig = {
      init.defaultBranch = "main";
      pull.rebase = true;
    };
  };

  programs.fastfetch.enable = true;
}
