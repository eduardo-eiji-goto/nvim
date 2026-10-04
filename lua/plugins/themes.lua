vim.pack.add({
	{ src = "https://github.com/catppuccin/nvim", name = "catppuccin" },
	{ src = "https://github.com/rebelot/kanagawa.nvim" },
	{ src = "https://github.com/ellisonleao/gruvbox.nvim" },
})

require("catppuccin").setup({})
require("kanagawa").setup({})
require("gruvbox").setup({})

-- setup must be called before loading
vim.cmd.colorscheme("catppuccin-mocha")
