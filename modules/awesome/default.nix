
{ pkgs, lib, config, ... }:

with lib;
let cfg = config.modules.awesome;

in { 
  options.modules.awesome = { enable = mkEnableOption "awesome"; };
  config = mkIf cfg.enable {
    home.file.".config/awesome" = {
      source = ./awesome;
      recursive = true;
    };
    
    xsession = {
      enable = true;
      windowManager.awesome = {
        enable = true;
        luaModules = with pkgs.LuaPackages; [
          luarocks
        ];
      };
    };

    home.packages = with pkgs; [
        picom
	    ];
    services.picom.enable = true;
  };
}
