local status, telescope = pcall(require, "telescope")
if not status then
	return
end

telescope.setup({
  defaults = {
    mappings = {
        i = {
            ["<C-j>"] = require('telescope.actions').move_selection_next,
            ["<C-k>"] = require('telescope.actions').move_selection_previous,
        }
    },
    layout_strategy = "horizontal", -- center/horizontal ..
    layout_config = {
        height = 0.90,
        width = 0.90,
        mirror = false,
        prompt_position = "bottom",
    },
  },
})
