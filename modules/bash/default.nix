
{ pkgs, lib, config, ... }:

with lib;
let cfg = config.modules.bash;

in {
    options.modules.bash = { enable = mkEnableOption "bash"; };
    config = mkIf cfg.enable {
      programs.bash = {
        enable = true;
        shellAliases = {
          mp3 = "nvidia-offload yt-dlp -f bestaudio --extract-audio --audio-format mp3 --audio-quality 0";
        };
        
      };
    };
}
