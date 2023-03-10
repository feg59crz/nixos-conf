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
  imports = [ 
    ./modules/default.nix 
  ];
  config.modules = {
    # Packages
    packages.enable = true; 

    # Fonts
    fonts.enable = true;

    # Git
    git.enable = true;
    
    # WM
    i3.enable = false;
    awesome.enable = true;

    # Terminal
    kitty.enable = true;
    tmux.enable = false;
    nano.enable = true;
    bash.enable = true;
    neovim.enable = true;    

    # Python
    python.enable = true;

    vscode.enable = false;

  };

}

