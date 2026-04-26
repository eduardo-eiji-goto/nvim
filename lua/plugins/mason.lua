vim.pack.add({
	{ src = "https://github.com/mason-org/mason.nvim" },
	{ src = "https://github.com/mason-org/mason-lspconfig.nvim" },
})

require("mason").setup()

require("mason-lspconfig").setup({
	ensure_installed = {
		-- Lua
		"lua_ls",
		-- Python
		"pyright",
		-- Golang
		"gopls",
		-- PHP
		"intelephense",
		-- Javascript
		"ts_ls",
		"eslint",
	},
	automatic_installation = true,
})

vim.lsp.config("lua_ls", {})
vim.lsp.config("pyright", {})
vim.lsp.config("gopls", {})
vim.lsp.config("intelephense", {})
vim.lsp.config("ts_ls", {})
vim.lsp.config("eslint", {})

vim.lsp.enable("lua_ls")
