-- C/C++
require'lspconfig'.clangd.setup {}

-- Python
require'lspconfig'.pyright.setup {}

-- Rust
require'lspconfig'.rust_analyzer.setup {}

-- Lua
local sumneko_root_path = '/usr/share/lua-language-server'
local sumneko_binary = '/usr/bin/lua-language-server'

require'lspconfig'.sumneko_lua.setup {
    cmd = {sumneko_binary, '-E', sumneko_root_path .. '/main.lua'},
    settings = {
        Lua = {
            runtime = {version = 'LuaJIT', path = vim.split(package.path, ';')},
            diagnostics = {globals = {'vim'}},
            workspace = {
                library = {
                    [vim.fn.expand('$VIMRUNTIME/lua')] = true,
                    [vim.fn.expand('$VIMRUNTIME/lua/vim/lsp')] = true
                }
            },
            telemetry = {enable = false}
        }
    }
}

-- Efm
require'lspconfig'.efm.setup {
    init_options = {documentFormatting = true},
    filetypes = {'lua'},
    settings = {
        rootMarkers = {'.git/'},
        languages = {
            lua = {{formatCommand = 'lua-format -i', formatStdin = true}}
        }
    }
}

