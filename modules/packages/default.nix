
{ pkgs, lib, config, ... }:

with lib;
let cfg = config.modules.packages;

in {
    options.modules.packages = { enable = mkEnableOption "packages"; };
    config = mkIf cfg.enable {
      home.packages = with pkgs; [
        # cli
        bat fd ripgrep
        neofetch

        
        # gui
        discord
        glmark2
        obs-studio
        obsidian
        qbittorrent
        firefox
        qutebrowser
        gnome.nautilus
        libreoffice-qt

        # virtualization 
        # distrobox xorg.xhost

        wget curl
	      openssh

        # games
        grapejuice
	    ];
    };
}
