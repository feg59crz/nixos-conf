
{ pkgs, lib, config, ... }:

with lib;
let
  cfg = config.modules.neovim;
  concatFiles = files:
    pkgs.lib.strings.concatMapStringsSep "\n" builtins.readFile files;

in
{
  options.modules.neovim = { enable = mkEnableOption "neovim"; };
  config = mkIf cfg.enable {
    # home.file.".config/kitty" = {
    #   source = ./kitty;
    #   recursive = true;
    # };
    
    programs.neovim = with pkgs; {
      enable = true;
      defaultEditor = true;
      viAlias = true;
      vimAlias = true;

      extraConfig = ''
        luafile $DOT_FILES/modules/neovim/lua/settings.lua
      '';

      extraPackages = [
        rust-analyzer
        tree-sitter
      ];
      plugins = with pkgs.vimPlugins; [
        # File
        nvim-web-devicons
        {
          plugin = nvim-tree-lua;
          config = ''
            lua require("nvim-tree").setup()
          '';
        }

        vim-nix

        nvim-treesitter.withAllGrammars
      ];
    };
  };
}
