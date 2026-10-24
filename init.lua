vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Make tools installed by mise (formatters, LSP servers) visible on PATH
local mise_shims = vim.fn.expand("~/.local/share/mise/shims")
if not vim.env.PATH:find(mise_shims, 1, true) then
	vim.env.PATH = mise_shims .. ":" .. vim.env.PATH
end

require("opts")

require("plugins.themes")
require("plugins.lsp")
require("plugins.conform")
require("plugins.telescope")
require("plugins.mini")
require("plugins.which-key")
require("plugins.gitsigns")

require("keymaps")
