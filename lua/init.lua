local AutoHeader = {}

local function author_docblock()
	local date = os.date("%m/%d/%y")
	return string.format(
		[[
<?php
/**
 * @author    Vidoje Šević
 * @website   https://www.vsevic.com
 * @email     vidoje@vsevic.com
 * @date      %s
 */
]],
		date
	)
end

function AutoHeader.setup()
	vim.api.nvim_create_autocmd("BufNewFile", {
		pattern = "*.php",
		callback = function()
			vim.api.nvim_buf_set_lines(0, 0, 0, false, vim.fn.split(author_docblock(), "\n"))
		end,
	})
end

return AutoHeader
