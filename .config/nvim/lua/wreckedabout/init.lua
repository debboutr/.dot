require("wreckedabout.packer")
require("wreckedabout.set")
require("wreckedabout.remap")
-- require("wreckedabout.autocmd")

local autocmd = vim.api.nvim_create_autocmd
local augroup = vim.api.nvim_create_augroup

local yank_group = augroup('HighlightYank', {})

autocmd('TextYankPost', {
    group = yank_group,
    pattern = '*',
    callback = function()
        vim.highlight.on_yank({
            higroup = 'IncSearch',
            timeout = 40,
        })
    end,
})

autocmd("FileType", {
	pattern = {"html", "css", "lua"},
	callback = function()
		vim.opt_local.shiftwidth = 2
		vim.opt_local.tabstop = 2
	end
})
-- vim.cmd("autocmd BufEnter * silent! lcd %:p:h")
vim.cmd("autocmd BufEnter * silent! :Glcd")
vim.g.netrw_browse_split = 0
vim.g.netrw_banner = 1
vim.g.netrw_winsize = 25
