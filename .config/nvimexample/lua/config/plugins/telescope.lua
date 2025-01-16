-- plugins/telescope.lua:
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
	pickers = {
	  find_files = {
	    theme = "ivy"
	  }
	},
	extensions = {
	  fzf = {}
	}
      }
      require('telescope').load_extension('fzf')

      vim.keymap.set("n", "<space>fk", require('telescope.builtin').keymaps, {desc="Find Keymappings!!"})
      vim.keymap.set("n", "<space>ff", require('telescope.builtin').find_files, {desc="Find Files in this director!"})
      vim.keymap.set("n", "<space>fh", require('telescope.builtin').help_tags, {desc="Find Help tags!!"})
      vim.keymap.set("n", "<space>fc", function ()
	  require('telescope.builtin').find_files {
	    cwd = vim.fn.stdpath("config") 
	  }
	end, {desc="Find Files in your config!!"})
      vim.keymap.set("n", "<space>fp", function ()
	  require('telescope.builtin').find_files {
	    cwd = vim.fs.joinpath(vim.fn.stdpath("data"), "lazy") 
	  }
      end)
      require("config.telescope.multigrep").setup()
      end
  }
}
