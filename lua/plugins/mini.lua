vim.pack.add({ { src = "https://github.com/nvim-mini/mini.nvim" } })

require("mini.basics").setup()
require("mini.statusline").setup()
require("mini.keymap").setup()
require("mini.comment").setup()
require("mini.pairs").setup()
require("mini.completion").setup()
require("mini.snippets").setup()
require("mini.notify").setup()

require("mini.starter").setup({
	header = [[Don't communicate by sharing memory, share memory by communicating.
Concurrency is not parallelism.
Channels orchestrate; mutexes serialize.
The bigger the interface, the weaker the abstraction.
Make the zero value useful.
interface{} says nothing.
Gofmt's style is no one's favorite, yet gofmt is everyone's favorite.
A little copying is better than a little dependency.
Syscall must always be guarded with build tags.
Cgo must always be guarded with build tags.
Cgo is not Go.
With the unsafe package there are no guarantees.
Clear is better than clever.
Reflection is never clear.
Errors are values.
Don't just check errors, handle them gracefully.
Design the architecture, name the components, document the details.
Documentation is for users.
Don't panic.]],
	items = {
		{ action = ":enew", name = "New File", section = "" },
		{ action = ":Telescope find_files", name = "Find Files", section = "" },
		{ action = ":Telescope live_grep", name = "Grep Files", section = "" },
		{ action = ":q", name = "Quit Neovim", section = "" },
	},
	footer = "",
})

-- Keymap Extra Config
local map_multistep = require("mini.keymap").map_multistep

map_multistep("i", "<Tab>", { "pmenu_next" })
map_multistep("i", "<S-Tab>", { "pmenu_prev" })
map_multistep("i", "<CR>", { "pmenu_accept", "minipairs_cr" })
map_multistep("i", "<BS>", { "minipairs_bs" })
