vim.pack.add({ { src = "https://github.com/stevearc/conform.nvim" } })

require("conform").setup({
	formatters_by_ft = {
		lua = { "stylua" },
		python = { "isort", "black" },
		go = { "gofmt" },
		html = { "prettier" },
		json = { "prettier" },
		css = { "prettier" },
		javascript = { "prettier" },
		typescript = { "prettier" },
		jsx = { "prettier" },
		javascriptreact = { "prettier" },
		vue = { "prettier" },
		markdown = { "prettier" },
	},
	format_on_save = {
		-- These options will be passed to conform.format()
		timeout_ms = 500,
		lsp_format = "fallback",
	},
})
