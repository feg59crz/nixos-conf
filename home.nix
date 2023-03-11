{ config, pkgs, ... }:

{
  config = {
    home.stateVersion = "22.11";
    programs.home-manager.enable = true;
  };
  imports = [ ./modules/default.nix ];
  config.modules = {

    packages.enable = true; 

    git.enable = true;
    
    # wm
    awesome.enable = true;

    # terminal
    kitty.enable = true;
    tmux.enable = true;
    nano.enable = true;

    python.enable = true;
  };
}

