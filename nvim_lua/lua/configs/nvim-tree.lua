local status, tree = pcall(require, "nvim-tree")
if not status then
	return
end

tree.setup({
    open_on_setup_file = false,
    view = {
        adaptive_size = true,
        side = "left",
    },
    renderer = {
      highlight_git = false,
      highlight_opened_files = "name",
      symlink_destination = false,
    },
    update_focused_file = {
      enable = true,
      update_root = false,
      ignore_list = {},
    },
    git = {
      enable = true,
      ignore = false,
      timeout = 400,
    },
    log = {
      enable = false,
      truncate = true,
      types = {
        all = true,
        profile = true,
        watcher = true,
      },
    },
})
