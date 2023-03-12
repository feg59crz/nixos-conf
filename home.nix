{ config, pkgs, ... }:

{
  config = {
    home.stateVersion = "22.11";
    programs.home-manager.enable = true;
    
    # Search and append installed fonts
    fonts.fontconfig.enable = true;
    
         
    home.sessionVariables = rec {
      DOT_FILES = "\${HOME}/.dotfiles";
      XDG_CACHE_HOME  = "\${HOME}/.cache";
      XDG_CONFIG_HOME = "\${HOME}/.config";
      XDG_BIN_HOME    = "\${HOME}/.local/bin";
      XDG_DATA_HOME   = "\${HOME}/.local/share";
    };
  };
  imports = [ ./modules/default.nix ];
  config.modules = {
    # Packages
    packages.enable = true; 

    # fonts
    fonts.enable = true;
    git.enable = true;
    
    # wm
    i3.enable = false;
    awesome.enable = true;

    # Terminal
    kitty.enable = true;
    tmux.enable = false;
    nano.enable = true;

    python.enable = true;

    ## coding
    vscode.enable = true;
  };
}

