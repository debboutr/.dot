return {
  {
    'vimwiki/vimwiki',
    lazy = false,
    branch = "dev",
    enabled = true,
  },
  {
    'mbbill/undotree',
    lazy = false,
    branch = "master",
    enabled = true,
    config = function()
      vim.keymap.set("n", "<leader>u", "<cmd>UndotreeToggle<CR>", { desc = "Open UndoTree" })
    end
  }
}

