--    _      _ __    __
--   (_)__  (_) /_  / /_ _____ _
--  / / _ \/ / __/ / / // / _ `/
-- /_/_//_/_/\__(_)_/\_,_/\_,_/
--

vim.cmd('colorscheme tokyonight')

require('plugins')

vim.g.python3_host_prog = '~/.venvs/neovim/bin/python'

-- Options {{{
local scopes = {o = vim.o, b = vim.bo, w = vim.wo}
local function opt(scope, key, value)
    scopes[scope][key] = value
    if scope ~= 'o' then scopes['o'][key] = value end
end

local indent = 4

opt('o', 'ignorecase', true) -- Ignore case
opt('o', 'smartcase', true) -- No ignore case with capitals

opt('o', 'scrolloff', 4) -- Lines of context
opt('w', 'wrap', false) -- Disable line wrap
opt('o', 'lazyredraw', true) -- Make macros faster
opt('w', 'list', true) -- Show invisible chars
opt('w', 'number', true) -- Show line numbers
opt('w', 'relativenumber', true) -- Show relative line numbers

opt('o', 'termguicolors', true) -- True color support

opt('o', 'hidden', true) -- Enable hidden buffers
opt('o', 'splitbelow', true) -- Put new window below current one
opt('o', 'splitright', true) -- Put new window right of current one

opt('o', 'mouse', 'a') -- Enable mouse support

opt('o', 'showmode', false) -- Don't show mode in status line

opt('o', 'clipboard', 'unnamedplus') -- Copy & paste

opt('b', 'undofile', true) -- Enable undo persistence
opt('b', 'formatoptions', 'crqnj') -- Automatic formatting options
opt('o', 'showmatch', true) -- Jump to matching bracket
opt('o', 'joinspaces', false) -- No double spaces when joining lines

opt('b', 'tabstop', indent) -- Size of a tab
opt('b', 'shiftwidth', indent) -- Size of an indent
opt('b', 'expandtab', true) -- Use spaces instead of tabs

opt('o', 'foldlevelstart', 99) -- Start with no folds closed
opt('w', 'foldmethod', 'expr') -- Which kind of folding to use
opt('w', 'foldexpr', 'nvim_treesitter#foldexpr()')

opt('o', 'timeoutlen', 500) -- Faster timeout wait time

opt('o', 'writebackup', false) -- No backup before overwriting

opt('w', 'signcolumn', 'yes') -- Always show sign column
-- }}}

-- Mappings
local function map(mode, lhs, rhs, opts)
    local options = {noremap = true, silent = true}
    if opts then options = vim.tbl_extend('force', options, opts) end
    vim.api.nvim_set_keymap(mode, lhs, rhs, options)
end

vim.g.mapleader = ','

map('n', '<C-S-Right>', ':bn<CR>')
map('n', '<C-S-Left>', ':bp<CR>')

map('n', '<C-l>', ':nohlsearch<CR>')
map('n', '<F3>', ':lua utils.toggle_opt("w", "relativenumber")<CR>')
map('n', '<F4>', ':lua utils.toggle_opt("w", "wrap")<CR>')

-- EasyAlign
map('x', 'ga', '<Plug>(EasyAlign)', {noremap = false})
map('n', 'ga', '<Plug>(EasyAlign)', {noremap = false})

-- LSP
map('n', '<space>]', '<cmd>lua vim.lsp.diagnostic.goto_prev()<CR>')
map('n', '<space>[', '<cmd>lua vim.lsp.diagnostic.goto_next()<CR>')
map('n', '<space>a', '<cmd>lua vim.lsp.buf.code_action()<CR>')
map('n', '<space>d', '<cmd>lua vim.lsp.buf.definition()<CR>')
map('n', '<space>f', '<cmd>lua vim.lsp.buf.formatting()<CR>')
map('n', '<space>h', '<cmd>lua vim.lsp.buf.hover()<CR>')
map('n', '<space>m', '<cmd>lua vim.lsp.buf.rename()<CR>')
map('n', '<space>r', '<cmd>lua vim.lsp.buf.references()<CR>')
map('n', '<space>s', '<cmd>lua vim.lsp.buf.document_symbol()<CR>')

-- Commands

-- Functions
-- local function toggle_opt(scope, key)
--   local value = not scopes[scope][key]
--   opt(scope, key, value)
-- end

-- vim: ts=4 sw=4 et fdm=marker fdl=0

