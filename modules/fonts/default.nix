
{ pkgs, lib, config, ... }:

with lib;
let cfg = config.modules.fonts;

in {
    options.modules.fonts = { enable = mkEnableOption "fonts"; };
    config = mkIf cfg.enable {
      home.packages = with pkgs; [
        noto-fonts
        noto-fonts-cjk
        noto-fonts-emoji
        liberation_ttf
        fira-code
        fira-code-symbols
        mplus-outline-fonts.githubRelease
        dina-font
	    ];
    };
}
