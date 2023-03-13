local opt = vim.opt
local g = vim.g


local lua_path = os.getenv("DOT_FILES") .. "/modules/neovim/lua/?.lua"

package.path = package.path .. ";" .. lua_path
local utils = require("utils")
require("nvim-tree").setup()

g.mapleader = ' '



utils.map("n", "<Leader>q", ":wq", { silent = true })
utils.map("n", "<Leader>tf", ":NvimTreeFocus")
utils.map("n", "<leader>tt", ":NvimTreeToggle")
utils.map("n", "<Leader>tc", ":NvimTreeCollapse")
utils.map("n", "<Leader>tff", ":NvimTreeFindFile")

vim.cmd [[
    set nowrap
    set nobackup
    set nowritebackup
    set noerrorbells
    set noswapfile
]]


-- Indent
opt.smartindent = true
opt.autoindent = true
opt.tabstop = 4
opt.shiftwidth = 4
opt.expandtab = true


-- mouse
opt.mouse = "a"

opt.termguicolors = true
opt.cursorline = true
opt.number = true


