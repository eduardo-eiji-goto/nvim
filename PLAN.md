# Replace Mason with mise

Mason used to install the LSP binaries and (via mason-lspconfig) call
`vim.lsp.enable()` for them. External tools are now meant to be managed by
[mise](https://mise.jdx.dev), outside Neovim; the Neovim config only configures
and enables servers that are already on `PATH`.

## Done (Neovim config)

- Removed `lua/plugins/mason.lua` and its `require` in `init.lua`.
- `lua/plugins/lsp.lua` now holds the `lua_ls` settings and calls
  `vim.lsp.enable({ "lua_ls", "pyright", "gopls", "intelephense", "ts_ls", "eslint" })`.
- `lua/plugins/conform.lua` is unchanged; conform finds formatters on `PATH`.

## To do (outside Neovim)

### 1. Install mise

```sh
curl https://mise.run | sh            # installs ~/.local/bin/mise
echo 'eval "$(mise activate zsh)"' >> ~/.zshrc
```

Neovim inherits `PATH` from the shell, so start it from an activated shell.

### 2. Declare the tools in `~/.config/mise/config.toml`

```toml
[tools]
# Runtimes the backends need
node = "22"            # optional: replaces nvm
go = "latest"          # optional: replaces /usr/bin/go
uv = "latest"          # the pipx backend uses uv when it is present

# Lua
"aqua:LuaLS/lua-language-server" = "latest"
"aqua:JohnnyMorganz/StyLua" = "latest"
# Python
"npm:pyright" = "latest"
"pipx:black" = "latest"
"pipx:isort" = "latest"
# Go (gofmt ships with go)
"go:golang.org/x/tools/gopls" = "latest"
# PHP
"npm:intelephense" = "latest"
# JS/TS
"npm:typescript-language-server" = "latest"
"npm:typescript" = "latest"
"npm:vscode-langservers-extracted" = "latest"   # provides vscode-eslint-language-server
"npm:@fsouza/prettierd" = "latest"
"npm:prettier" = "latest"
```

Then run `mise install`. To upgrade later, run `mise upgrade`.

If you want the config versioned in this repo, keep it here as `mise.toml`
and symlink it to `~/.config/mise/config.toml`.

### 3. Clean up Mason leftovers

- In Neovim, run `:lua vim.pack.del({ "mason.nvim", "mason-lspconfig.nvim" })`.
  This also updates `nvim-pack-lock.json`.
- Delete `~/.local/share/nvim/mason/`.

## Verification

- `which lua-language-server stylua pyright-langserver gopls intelephense typescript-language-server vscode-eslint-language-server prettierd black isort`
  should print a path under `~/.local/share/mise/` for each one.
- Inside Neovim, `:echo $PATH` should not contain `mason/bin`.
- Open a `.lua`, `.py`, `.go`, `.php` and `.ts` file. `:checkhealth vim.lsp`
  should show a client attached. `:ConformInfo` should list the formatters as
  available. Save a file to confirm format-on-save works.
