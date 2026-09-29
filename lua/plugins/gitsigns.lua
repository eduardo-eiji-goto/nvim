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

		-- Resolve the remote ref for the current branch (upstream, falling back to origin/HEAD)
		local function remote_ref()
			local cwd = vim.fn.fnamemodify(vim.api.nvim_buf_get_name(bufnr), ":p:h")
			for _, ref in ipairs({ "@{upstream}", "origin/HEAD" }) do
				local result = vim.system(
					{ "git", "rev-parse", "--abbrev-ref", "--symbolic-full-name", ref },
					{ cwd = cwd, text = true }
				):wait()
				if result.code == 0 then
					return vim.trim(result.stdout)
				end
			end
		end

		-- Show the remote version of the file side by side with the local one
		vim.keymap.set("n", "<leader>gd", function()
			local ref = remote_ref()
			if not ref then
				vim.notify("No remote ref found for this branch", vim.log.levels.WARN)
				return
			end
			gitsigns.diffthis(ref, { vertical = true })
		end, { buffer = bufnr, desc = "[G]it [D]iff against remote" })
	end,
})
