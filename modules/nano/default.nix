
{ pkgs, lib, config, ... }:

with lib;
let cfg = config.modules.nano;

in {
    options.modules.nano = { enable = mkEnableOption "nano"; };
    config = mkIf cfg.enable {
      home.file.".nanorc" = {
        source = ./.nanorc;
        recursive = true;
      };
      home.packages = with pkgs; [
        nano
       ];
    };
}
