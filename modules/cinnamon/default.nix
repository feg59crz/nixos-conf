
{ pkgs, lib, config, ... }:

with lib;
let cfg = config.modules.awesome;

in { 
  options.modules.awesome = { enable = mkEnableOption "awesome"; };
  config = mkIf cfg.enable {
    xsession.enable = true;
          
    xsession.desktopManager.cinnamon = {
      enable = true;
    };
  };
}
