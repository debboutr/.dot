-- require('telescope.pickers.layout_strategies').horizontal_merged = function(picker, max_columns, max_lines, layout_config)
  -- 	local layout = require('telescope.pickers.layout_strategies').horizontal(picker, max_columns, max_lines, layout_config)
  --
  --     layout.prompt.title = ''
  --     layout.prompt.borderchars = { '─', '│', '─', '│', '┌', '┐', '┘', '└' }
  --
  --     layout.results.title = ''
  --     layout.results.borderchars = { '─', '│', '─', '│', '├', '┤', '┘', '└' }
  -- 	layout.results.line = layout.results.line - 1
  -- 	layout.results.height = layout.results.height + 1
  --
  --     layout.preview.title = ''
  --     layout.preview.borderchars = { '─', '│', '─', '│', '┌', '┐', '┘', '└' }
  --
  -- 	return layout
  -- end
  return {
    {
      'nvim-telescope/telescope.nvim',
      tag = '0.1.8',
      -- or                              , branch = '0.1.x',
      dependencies = { 
	'nvim-lua/plenary.nvim',
	{ 'nvim-telescope/telescope-fzf-native.nvim', build='make' },
      },
      config = function ()
	require("telescope").setup {
	  defaults = {
	    prompt_title = "",
	    results_title = "",
	    preview_title = "",
	    layout_strategy = 'horizontal',
	    layout_config = {
	      height = 0.55,
	      width = 0.55,
	      prompt_position = 'top',
	    },
	  },
	  pickers = {
	    find_files = {
	      theme = "ivy",
	      sorting_strategy = "ascending",
	      prompt_title = "",
	      prompt_prefix = "🔎 ",
	      results_title = "",
	      preview_title = "",
	    },
	    keymaps = {
	      theme = "ivy",
	      sorting_strategy = "ascending",
	      prompt_title = "",
	      border = false,
	    },
	    help_tags = {
	      theme = "ivy",
	      sorting_strategy = "ascending",
	      prompt_title = "",
	      prompt_prefix = " ",
	      results_title = "",
	      preview_title = "",
	    },
	    buffers = {
	      theme = "ivy",
	    }
	  },
	  extensions = {
	    fzf = {}
	  }
	}
	require('telescope').load_extension('fzf')

	vim.keymap.set("n", "<space>fd", vim.cmd.Ex, {desc="Netrw Files!!"})
	vim.keymap.set("n", "<space>fk", require('telescope.builtin').keymaps, {desc="Find Keymappings!!"})
	vim.keymap.set("n", "<space>ff", require('telescope.builtin').find_files, {desc="Find Files in this director!"})
	vim.keymap.set("n", "<space>fh", require('telescope.builtin').help_tags, {desc="Find Help tags!!"})
	vim.keymap.set("n", "<space>fc", function ()
	  require('telescope.builtin').find_files {
	    cwd = vim.fn.stdpath("config") 
	  }
	end, {desc="Find Files in your config!!"})
	vim.keymap.set("n", "<space>fp", function ()
	  require('telescope.builtin').live_grep {
	    cwd = vim.fs.joinpath(vim.fn.stdpath("data"), "lazy"),
	    prompt_title = "Search word/s in lazy plugins",
	  }
	end, {desc="Find Files in your plugin repos!!"})
	-- search for words and file regex's
	require("config.telescope.multigrep")
	-- buffer navigation w/ delete
	require("config.telescope.buffers")
      end
      }
    }
