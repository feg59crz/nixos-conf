{ pkgs, lib, config, ... }:

with lib;
let cfg = config.modules.vscode;

in {
    options.modules.vscode = { enable = mkEnableOption "vscode"; };
    config = mkIf cfg.enable {
      
      programs.vscode = {
        enable = true;
        extensions = with pkgs; [
          # vscode-extensions.ms-python.python
          # vscode-extensions.ms-vscode.cpptools
          # vscode-extensions.ms-pyright.pyright
          vscode-extensions.ms-ceintl.vscode-language-pack-pt-br
        ];
      };
    };
}
