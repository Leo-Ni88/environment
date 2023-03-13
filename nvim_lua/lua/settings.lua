local global = vim.g
local opt = vim.opt
local o = vim.o

-- Map <leader> = the space key

-- global.mapleader = " "
-- global.maplocalleader = " "

-- Editor options

o.tabstop = 4
o.softtabstop = 4
o.shiftwidth = 4
o.expandtab = true
o.autoindent = true
--o.copyindent = true
o.clipboard = "unnamedplus"

o.hidden = true
o.number = true
o.relativenumber = true
o.showcmd = true
o.cursorline = true
--o.cursorcolum = true
o.wildmenu = true
o.showmatch = true
--o.laststatus = 2
--o.nobaskup = true
--o.noswapfile = true
o.wrap = false
o.mouse = "a"
--o.scrolloff = 12
--o.updatetime = 10
--o.nofsync = true
o.undofile = true
o.undodir = "~/.vim/undodir"
o.syntax = "on"
o.encoding = "UTF-8"
o.ruler = true
o.title = true
o.ttimeoutlen = 0
o.inccommand = "split"
o.splitbelow = "splitright"
o.autoread = true

-- disable netrw at the very start of your init.lua (strongly advised by nvim-tree)
global.loaded_netrw = 1
global.loaded_netrwPlugin = 1

-- set termguicolors to enable highlight groups
opt.termguicolors = true

vim.cmd([[
    if has("autocmd")
        autocmd BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
    endif

    autocmd CursorHold  <buffer> lua vim.lsp.buf.document_highlight()
    autocmd CursorHoldI <buffer> lua vim.lsp.buf.document_highlight()
    autocmd CursorMoved <buffer> lua vim.lsp.buf.clear_references()
]])
