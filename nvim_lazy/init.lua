require("settings")
require("maps")
require("plugins")

local themeStatus, kanagawa = pcall(require, "kanagawa")

if themeStatus then
	vim.cmd("colorscheme kanagawa")
else
	return
end
