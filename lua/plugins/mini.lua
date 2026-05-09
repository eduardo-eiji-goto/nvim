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
  header = [[Yesterday is history,
tomorrow is a mystery,
but today is a gift, that is why it is called the present.

- Oogway]],
  items = {
    { action = ":enew",                 name = "New File",    section = "" },
    { action = ":Telescope find_files", name = "Find Files",  section = "" },
    { action = ":Telescope live_grep",  name = "Grep Files",  section = "" },
    { action = ":q",                    name = "Quit Neovim", section = "" },
  },
  footer = "",
})

-- Keymap Extra Config
local map_multistep = require("mini.keymap").map_multistep

map_multistep("i", "<Tab>", { "pmenu_next" })
map_multistep("i", "<S-Tab>", { "pmenu_prev" })
map_multistep("i", "<CR>", { "pmenu_accept", "minipairs_cr" })
map_multistep("i", "<BS>", { "minipairs_bs" })
