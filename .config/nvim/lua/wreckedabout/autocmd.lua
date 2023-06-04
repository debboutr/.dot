vim.api.nvim_create_autocmd("BufWritePre", {
  --group = vim.api.nvim_create_augroup("tutGroup", {clear=true}),
  pattern = "*.py",
  command = [[ !/home/rick/.venv/bin/black % ]]
  -- callback = function()
  --   print("saving....")
  --   ret = vim.fn.jobstart({"/home/rick/.venv/bin/black", runner})
  --   print(ret)
  -- end
})
