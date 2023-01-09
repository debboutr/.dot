-- This file can be loaded by calling `lua require('plugins')` from your init.vim

-- Only required if you have packer configured as `opt`
vim.cmd.packadd('packer.nvim')

return require('packer').startup(function(use)
  -- Packer can manage itself
  use 'wbthomason/packer.nvim'

  use {
	  'nvim-telescope/telescope.nvim', tag = '0.1.0',
	  -- or                            , branch = '0.1.x',
	  requires = { {'nvim-lua/plenary.nvim'} }
  }

  use({
	  'ellisonleao/gruvbox.nvim',
	  as = 'gruvbox',
	  config = function()
          vim.o.background = "dark"
		  vim.cmd('colorscheme gruvbox')
	  end
  })

  use 'kyazdani42/nvim-web-devicons'

  use {
      'nvim-lualine/lualine.nvim',
      requires = { 'kyazdani42/nvim-web-devicons', opt = true }
  }

  use({'nvim-treesitter/nvim-treesitter', run = ':TSUpdate'})
  -- use('nvim-treesitter/playground')

  use('theprimeagen/harpoon')
  use('mbbill/undotree')
  use('tpope/vim-fugitive')
  use('tpope/vim-commentary')
  use("vimwiki/vimwiki")

  use("mhinz/vim-signify")

end)

