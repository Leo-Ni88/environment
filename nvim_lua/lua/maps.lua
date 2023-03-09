local function map(mode, lhs, rhs)
	vim.keymap.set(mode, lhs, rhs, { silent = true })
end

local status, telescope = pcall(require, "telescope.builtin")
if status then
	-- Telescope
	map("n", "<leader>ff", telescope.find_files)
	map("n", "<leader>fg", telescope.live_grep)
	map("n", "<leader>fb", telescope.buffers)
	map("n", "<leader>fh", telescope.help_tags)
	map("n", "<leader>fs", telescope.git_status)
	map("n", "<leader>fc", telescope.git_commits)
else
	print("Telescope not found")
end

-- <leader> = the space key

-- Save
map("n", "<leader>w", "<CMD>update<CR>")

-- Quit
map("n", "<leader>q", "<CMD>q<CR>")

-- Exit insert mode
map("i", "jk", "<ESC>")

-- Windows
map("n", "<leader>ñ", "<CMD>vsplit<CR>")
map("n", "<leader>p", "<CMD>split<CR>")

-- NeoTree
map("n", "<leader>e", "<CMD>Neotree toggle<CR>")
map("n", "<leader>o", "<CMD>Neotree focus<CR>")

-- Buffer
map("n", "<TAB>", "<CMD>bnext<CR>")
map("n", "<S-TAB>", "<CMD>bprevious<CR>")

-- Terminal
map("n", "<leader>th", "<CMD>ToggleTerm size=10 direction=horizontal<CR>")
map("n", "<leader>tv", "<CMD>ToggleTerm size=80 direction=vertical<CR>")

-- Markdown Preview
map("n", "<leader>m", "<CMD>MarkdownPreview<CR>")
map("n", "<leader>mn", "<CMD>MarkdownPreviewStop<CR>")

-- Window Navigation
map("n", "<C-h>", "<C-w>h")
map("n", "<C-l>", "<C-w>l")
map("n", "<C-k>", "<C-w>k")
map("n", "<C-j>", "<C-w>j")

-- Resize Windows
map("n", "<C-Left>", "<C-w><")
map("n", "<C-Right>", "<C-w>>")
map("n", "<C-Up>", "<C-w>+")
map("n", "<C-Down>", "<C-w>-")

-- Lspsaga
local keymap = vim.keymap.set
-- LSP finder - Find the symbol's definition
keymap("n", "gr", "<cmd>Lspsaga lsp_finder<CR>")
-- Peek definition
keymap("n", "gd", "<cmd>Lspsaga peek_definition<CR>")
-- Go to definition
keymap("n", "gd", "<cmd>Lspsaga goto_definition<CR>")
keymap('n', 'gD', vim.lsp.buf.declaration, bufopts)
-- Peek type definition
keymap("n", "gt", "<cmd>Lspsaga peek_type_definition<CR>")
-- Go to type definition
keymap("n","gt", "<cmd>Lspsaga goto_type_definition<CR>")
-- Toggle outline
keymap("n","<leader>o", "<cmd>Lspsaga outline<CR>")
-- Code action
keymap({"n","v"}, "<leader>ca", "<cmd>Lspsaga code_action<CR>")
-- Rename all occurrences of the hovered word for the entire file
keymap("n", "<leader>rn", "<cmd>Lspsaga rename<CR>")
-- Rename all occurrences of the hovered word for the selected files
keymap("n", "<leader>rn", "<cmd>Lspsaga rename ++project<CR>")
-- Call hierarchy
keymap("n", "<Leader>ci", "<cmd>Lspsaga incoming_calls<CR>")
keymap("n", "<Leader>co", "<cmd>Lspsaga outgoing_calls<CR>")

-- Hover Doc
keymap("n", "K", "<cmd>Lspsaga hover_doc<CR>")
-- If you want to keep the hover window in the top right hand corner,
keymap("n", "K", "<cmd>Lspsaga hover_doc ++keep<CR>")
-- Floating terminal
keymap({"n", "t"}, "<Leader>T", "<cmd>Lspsaga term_toggle<CR>")

-- Show line diagnostics
keymap("n", "<leader>sl", "<cmd>Lspsaga show_line_diagnostics<CR>")
-- Show cursor diagnostics
keymap("n", "<leader>sc", "<cmd>Lspsaga show_cursor_diagnostics<CR>")
-- Show buffer diagnostics
keymap("n", "<leader>sb", "<cmd>Lspsaga show_buf_diagnostics<CR>")
-- Diagnostic jump
keymap("n", "[e", "<cmd>Lspsaga diagnostic_jump_prev<CR>")
keymap("n", "]e", "<cmd>Lspsaga diagnostic_jump_next<CR>")
-- Diagnostic jump with filters such as only jumping to an error
keymap("n", "[E", function()
  require("lspsaga.diagnostic"):goto_prev({ severity = vim.diagnostic.severity.ERROR })
end)
keymap("n", "]E", function()
  require("lspsaga.diagnostic"):goto_next({ severity = vim.diagnostic.severity.ERROR })
end)
