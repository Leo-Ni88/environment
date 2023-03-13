local status, transparent = pcall(require, "transparent")
if not status then
	return
end

transparent.setup({
    enable = true,
    -- extra_group = "all",
	extra_groups = {
        "BufferlineBuffer",
        "BufferlineBufferSelected",
        "BufferlineBufferVisible",
        "BufferLineSeparator",
        "BufferLineSeparatorSelected",
        "BufferLineSeparatorVisible",
        "BufferLineNumbers",
        "BufferLineNumbersSelected",
        "BufferLineNumbersVisible",
        "BufferLineCloseButton",
        "BufferLineCloseButtonSelected",
        "BufferLineCloseButtonVisible",
        "BufferLineIndicatorSelected",
        "BufferLineIndicatorVisible",
        "BufferLineBackground",
        "BufferLineTabClose",
        "BufferLineFill",
        "BufferLineGroupSeparator",
        "OutlinePreviewNormal",
        "SagaShadow",
        "SagaCollapse",
        "SagaBorder",
        "SagaNormal",
        "SagaExpand",
        "SagaWinbarArray",
        "SagaWinbarUnitNeoTreeFloatNormal",
	},
	exclude = {},
})
