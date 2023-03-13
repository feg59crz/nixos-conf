
{ pkgs, lib, config, ... }:

with lib;
let
  cfg = config.modules.neovim;
  concatFiles = files:
    pkgs.lib.strings.concatMapStringsSep "\n" builtins.readFile files;

  pluginGit = ref: repo: pkgs.vimUtils.buildVimPluginFrom2Nix {
    pname = "${lib.strings.sanitizeDerivationName repo}";
    version = ref;
    src = builtins.fetchGit {
      url = "https://github.com/${repo}.git";
      ref = ref;
    };
  };
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
        nvim-tree-lua
        vim-nix
        {
        plugin = (pluginGit "master" "ckolkey/ts-node-action");
        type = "lua";
        config = ''
          require("ts-node-action").setup({})
          vim.keymap.set({ "n" }, "<F12>", require("ts-node-action").node_action, { desc = "Trigger Node Action" })
        '';
        }
      ];
    };
  };
}
