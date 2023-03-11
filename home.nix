{ config, pkgs, ... }:

{
  config = {
    home.stateVersion = "22.11";
    programs.home-manager.enable = true;
  };
  imports = [ ./modules/default.nix ];
  config.modules = {
    # Packages
    packages.enable = true; 


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

