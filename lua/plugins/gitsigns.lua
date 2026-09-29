vim.pack.add({ { src = "https://github.com/lewis6991/gitsigns.nvim" } })

require("gitsigns").setup({
	signs = {
		add = { text = "+" }, ---@diagnostic disable-line: missing-fields
		change = { text = "~" }, ---@diagnostic disable-line: missing-fields
		delete = { text = "_" }, ---@diagnostic disable-line: missing-fields
		topdelete = { text = "‾" }, ---@diagnostic disable-line: missing-fields
		changedelete = { text = "~" }, ---@diagnostic disable-line: missing-fields
	},
	on_attach = function(bufnr)
		local gitsigns = require("gitsigns")

		-- Show last commit and author of the current line in a floating window
		vim.keymap.set("n", "<leader>gb", function()
			gitsigns.blame_line({ full = true })
		end, { buffer = bufnr, desc = "[G]it [B]lame line" })
	end,
})
