vim.pack.add({ { src = "https://github.com/catppuccin/nvim", name = "catppuccin" } })

require("catppuccin").setup({})

-- setup must be called before loading
vim.cmd.colorscheme("catppuccin-mocha")
