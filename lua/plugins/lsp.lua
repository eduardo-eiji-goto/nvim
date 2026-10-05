vim.pack.add({
	{ src = "https://github.com/neovim/nvim-lspconfig" },
})

-- Folding: default to indent, switch to LSP folding ranges when supported
vim.o.foldmethod = "indent"
vim.o.foldlevelstart = 99 -- open all folds when opening a file

vim.api.nvim_create_autocmd("LspAttach", {
	callback = function(args)
		local client = vim.lsp.get_client_by_id(args.data.client_id)
		if client and client:supports_method("textDocument/foldingRange") then
			local win = vim.api.nvim_get_current_win()
			vim.wo[win][0].foldmethod = "expr"
			vim.wo[win][0].foldexpr = "v:lua.vim.lsp.foldexpr()"
			vim.wo[win][0].foldtext = "v:lua.vim.lsp.foldtext()"
		end
	end,
})
