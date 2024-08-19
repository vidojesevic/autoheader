local AutoHeader = {}
AutoHeader.config = {
	extension = "php",
	name = "Example Author",
	website = "www.example.com",
	email = "example@example.com",
}

local function author_docblock()
	local date = os.date("%m/%d/%y")
	return string.format(
		[[
<?php
/**
 * @author    %s
 * @website   %s
 * @email     %s
 * @date      %s
 */
]],
		AutoHeader.config.name,
		AutoHeader.config.website,
		AutoHeader.config.email,
		date
	)
end

function AutoHeader.setup(user_config)
	user_config = user_config or {}
	AutoHeader.config = vim.tbl_deep_extend("force", AutoHeader.config, user_config)

	vim.api.nvim_create_autocmd("BufNewFile", {
		pattern = "*." .. AutoHeader.config.extension,
		callback = function()
			vim.api.nvim_buf_set_lines(0, 0, 0, false, vim.fn.split(author_docblock(), "\n"))
		end,
	})
end

return AutoHeader
