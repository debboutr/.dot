return {
  {
    'nvim-telescope/telescope-symbols.nvim',
    enabled = true,
    lazy = false,
    config = function ()
      vim.keymap.set("n", "<leader>fe", "<cmd>Telescope symbols<CR>")
    end
  }
}
