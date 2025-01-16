return {
  {
    'nvim-telescope/telescope-symbols.nvim',
    enabled = true,
    config = function ()
      vim.keymap.set("n", "<leader>fe", "<cmd>Telescope symbols<CR>")
    end
  },
  {
    'echasnovski/mini.nvim',
    -- enabled = false,
    enabled = true,
    config = function ()
      local statusline = require "mini.statusline"
      local active = function()
	local mode, mode_hl = statusline.section_mode({ trunc_width = 1000 }) -- this is the only change that I've made
	local git           = statusline.section_git({ trunc_width = 75 }) -- along w/ the %m to the end of the filename
	local diagnostics   = statusline.section_diagnostics({ trunc_width = 75 }) -- string below!!!
	local fileinfo      = statusline.section_fileinfo({ trunc_width = 120 })
	local location      = statusline.section_location({ trunc_width = 75 })
	local search        = statusline.section_searchcount({ trunc_width = 75 })

	return statusline.combine_groups({
	  { hl = mode_hl,                  strings = { mode } },
	  { hl = 'MiniStatuslineDevinfo',  strings = { git, diagnostics } },
	  '%<', -- Mark general truncate point
	  -- Highlight directory part of file name differently
	  '%#MiniStatuslineFilePrefix# %{expand("%:p:~:.:h")}/%#MiniStatuslineFilename#%t%m ',
	  '%=', -- End left alignment
	  { hl = 'MiniStatuslineFileinfo', strings = { fileinfo } },
	  { hl = mode_hl,                  strings = { search, location } },
	})
      end

      statusline.setup { use_icons = true , content = { active = active }}
      -- statusline.setup { use_icons = true }
    end
  }
}

-- local r = require("mini.statusline").section_mode({trunc_width=900})
-- print(vim.inspect(r))
-- print(vim.inspect(r.section_fileinfo))

-- vim.fn.fnamemodify(vim.fn.expand('%:x'), ':p:~:.')
-- a, b = require('mini.statusline').section_mode({ trunc=120})
-- print(vim.inspect(b))
