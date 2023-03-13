
{ pkgs, lib, config, ... }:

with lib;
let cfg = config.modules.neovim;

in {
  options.modules.neovim = { enable = mkEnableOption "neovim"; };
  config = mkIf cfg.enable {
    # home.file.".config/kitty" = {
    #   source = ./kitty;
    #   recursive = true;
    # };
    
    programs.neovim = {
      enable = true;
      defaultEditor = true;
      viAlias = true;
      vimAlias = true;
    };
  };
}
