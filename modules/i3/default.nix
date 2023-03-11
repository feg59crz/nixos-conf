
{ pkgs, lib, config, ... }:

with lib;
let cfg = config.modules.i3;

in { 
  options.modules.i3 = { enable = mkEnableOption "i3"; };
  config = mkIf cfg.enable {
    xsession = {
      enable = true;
      windowManager.i3 = {
        enable = true;
        package = pkgs.i3-gaps;
      };
    };

    home.packages = with pkgs; [
        # picom
	    ];
    # services.picom.enable = true;

#    home.file.".config/i3" = {
#      source = ./i3;
#      recursive = true;
#    };
  };
}
