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

-- Save
map("n", "<leader>w", "<CMD>update<CR>")
map("n", "<leader>W", "<CMD>wa<CR>")

-- Quit
map("n", "<leader>q", "<CMD>q<CR>")
map("n", "<leader>Q", "<CMD>qa!<CR>")

-- Save and Quit
map("n", "<leader>wq", "<CMD>wq<CR>")

-- Exit insert mode
map("i", "jk", "<ESC>")

-- Buffer
map("n", "<TAB>", "<CMD>bnext<CR>")
map("n", "<S-TAB>", "<CMD>bprevious<CR>")

-- No highlight search
map("n", "<leader>nh", "<CMD>nohlsearch<CR>")

-- Windows
map("n", "<leader>ñ", "<CMD>vsplit<CR>")
map("n", "<leader>p", "<CMD>split<CR>")

-- NeoTree
map("n", "<leader>e", "<CMD>Neotree toggle<CR>")
map("n", "<leader>o", "<CMD>Neotree focus<CR>")

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
keymap("n", "gr", "<cmd>Lspsaga lsp_finder<CR>")                      -- LSP finder - Find the symbol's definition
keymap("n", "gd", "<cmd>Lspsaga peek_definition<CR>")                 -- Peek definition
keymap("n", "gd", "<cmd>Lspsaga goto_definition<CR>")                 -- Go to definition
keymap('n', 'gD', vim.lsp.buf.declaration, bufopts)                   -- Go to declaration
keymap("n", "gt", "<cmd>Lspsaga peek_type_definition<CR>")            -- Peek type definition
keymap("n","gt", "<cmd>Lspsaga goto_type_definition<CR>")             -- Go to type definition
keymap("n","<leader>o", "<cmd>Lspsaga outline<CR>")                   -- Toggle outline
keymap({"n","v"}, "<leader>ca", "<cmd>Lspsaga code_action<CR>")       -- Code action
keymap("n", "<leader>rn", "<cmd>Lspsaga rename<CR>")                  -- Rename all occurrences of the hovered word for the entire file
keymap("n", "<leader>rn", "<cmd>Lspsaga rename ++project<CR>")        -- Rename all occurrences of the hovered word for the selected files
keymap("n", "<Leader>ci", "<cmd>Lspsaga incoming_calls<CR>")          -- Call hierarchy
keymap("n", "<Leader>co", "<cmd>Lspsaga outgoing_calls<CR>")          -- Call hierarchy
keymap("n", "K", "<cmd>Lspsaga hover_doc<CR>")                        -- Hover Doc
keymap("n", "K", "<cmd>Lspsaga hover_doc ++keep<CR>")                 -- If you want to keep the hover window in the top right hand corner
keymap({"n", "t"}, "<Leader>T", "<cmd>Lspsaga term_toggle<CR>")       -- Floating terminal
keymap("n", "<leader>sl", "<cmd>Lspsaga show_line_diagnostics<CR>")   -- Show line diagnostics
keymap("n", "<leader>sc", "<cmd>Lspsaga show_cursor_diagnostics<CR>") -- Show cursor diagnostics
keymap("n", "<leader>sb", "<cmd>Lspsaga show_buf_diagnostics<CR>")    -- Show buffer diagnostics
keymap("n", "[e", "<cmd>Lspsaga diagnostic_jump_prev<CR>")            -- Diagnostic jump to prev
keymap("n", "]e", "<cmd>Lspsaga diagnostic_jump_next<CR>")            -- Diagnostic jump to next
                                                                      -- Diagnostic jump with filters such as only jumping to an error
keymap("n", "[E", function()
  require("lspsaga.diagnostic"):goto_prev({ severity = vim.diagnostic.severity.ERROR })
end)
keymap("n", "]E", function()
  require("lspsaga.diagnostic"):goto_next({ severity = vim.diagnostic.severity.ERROR })
end)

-- Mywords
map("n", "<leader>h", "<CMD>lua require'mywords'.hl_toggle()<CR>")
map("n", "<leader>H", "<CMD>lua require'mywords'.uhl_all()<CR>")

-- Telescope
map("n", "<leader>ff", "<CMD>lua require('telescope.builtin').find_files()<CR>")
map("n", "<leader>fg", "<CMD>lua require('telescope.builtin').live_grep()<CR>")
map("n", "<leader>tb", "<CMD>lua require('telescope.builtin').buffers()<CR>")
map("n", "<leader>ma", "<CMD>lua require('telescope.builtin').help_tags()<CR>")


