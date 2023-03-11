
{ pkgs, lib, config, ... }:

with lib;
let cfg = config.modules.awesome;

in {
  options.modules.awesome = { enable = mkEnableOption "awesome"; };
  config = mkIf cfg.enable {
    home.packages = with pkgs; [
      awesome
    ];
      
    xsession.windowManager.awesome = {
      enable = true;
    };
  };
}
