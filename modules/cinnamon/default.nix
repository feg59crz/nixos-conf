
{ pkgs, lib, config, ... }:

with lib;
let cfg = config.modules.cinnamon;

in { 
  options.modules.cinnamon = { enable = mkEnableOption "cinnamon"; };
  config = mkIf cfg.enable {
    xsession.enable = true;
          
    services.xserver.desktopManager.cinnamon = {
      enable = true;
    };
  };
}
