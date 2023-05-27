{ config, inputs, pkgs, home-manager, ... }:

{
  # Manage zsh
  programs.zsh = {
    enable = true;
    enableCompletion = true;
    shellAliases = {
      rm = "rm -i";
    };
    zplug = {
      enable = true;
      plugins = [
        { name = "lib/clipboard"; tags = [ from:oh-my-zsh ]; }
        { name = "lib/history"; tags = [ from:oh-my-zsh ]; }
        { name = "lib/key-bindings"; tags = [ from:oh-my-zsh ]; }
        { name = "lib/theme-and-appearance"; tags = [ from:oh-my-zsh ]; }
        { name = "plugins/command-not-found"; tags = [ from:oh-my-zsh ]; }
        { name = "plugins/sudo"; tags = [ from:oh-my-zsh ]; }
        { name = "chisui/zsh-nix-shell"; }
        { name = "zpm-zsh/ls"; }
        { name = "zsh-users/zsh-syntax-highlighting"; }
        { name = "romkatv/powerlevel10k"; tags = [ as:theme depth:1 ]; }
      ];
    };
    defaultKeymap = "emacs"; #emacs, vicmd, or viins (vim mode bad)
    history = {
      size = 5000;
      extended = true;
      ignoreDups = true;
      expireDuplicatesFirst = true;
      save = 5000;
      path = "$HOME/.zsh_history";
    };
    #Prevent interference from /etc/zshrc
    envExtra = ''
      setopt no_global_rcs
    '';
    initExtra = ''
      export PATH=$HOME/bin:$PATH
      [[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
    '';
  };

  home.file = {
    ".p10k.zsh".source = ./.p10k.zsh;
  };
}
