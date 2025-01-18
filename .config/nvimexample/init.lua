require("config.lazy")

mycoolfunction = function () print("this is from the function!!") end
if false then
  mycoolfunction()
end


local P = function(v)
  print(vim.inspect(v))
  return v
end
-- local harpoon = require "harpoon"
-- harpoon:setup()
-- P(harpoon.info())

-- for lua filetypes!! THIS IS A WAY TO CONFIG KEYWORDS!!
-- vim.cmd [[ hi @function.builtin.lua guifg=yellow ]]
-- for all filetypes!!
-- vim.cmd [[ hi @function.builtin guifg=yellow ]]

vim.opt.shiftwidth = 2
vim.opt.clipboard = "unnamedplus"
vim.opt.number = true
vim.opt.relativenumber = true
vim.o.textwidth = 80
 -- make the background transparent
vim.cmd [[
  highlight Normal guibg=none
  highlight NonText guibg=none
  highlight Normal ctermbg=none
  highlight NonText ctermbg=none
]]

-- source the whole file!!!
vim.keymap.set("n", "<space><space>x", "<cmd>source %<CR>", {desc = "Source the whole file!!"})
-- source the current line in lua!!
vim.keymap.set("n", "<space>x", ":.lua<CR>", {desc = "Source the whole file!!"})
-- source the visual selection!!
vim.keymap.set("v", "<space>x", ":lua<CR>", {desc = "Source the whole file!!"})

vim.api.nvim_create_autocmd('TextYankPost', {
  desc = "Highlight when yanking text",
  group = vim.api.nvim_create_augroup('tutuorial-highlight-yank', { clear = true}),
  callback = function ()
    vim.highlight.on_yank()
  end,
})

-- these are useful after populating the quickfixlist!!
vim.keymap.set("n", "<M-j>", "<cmd>cnext<CR>", {desc = "Go to the next item in quickfixlist!!"})
vim.keymap.set("n", "<M-k>", "<cmd>cprev<CR>", {desc = "Go to the previous item in quickfixlist!!"})

vim.api.nvim_create_autocmd('TermOpen', {
  group = vim.api.nvim_create_augroup('custom-term-open', { clear = true}),
  callback = function ()
    vim.opt.number = false
    vim.opt.relativenumber = false
  end,
})

local job_id = 0

vim.keymap.set("n", "<space>st", function ()
  vim.cmd.vnew()
  vim.cmd.term()
  vim.cmd.wincmd("L")
  -- vim.api.nvim_win_set_width(0, 47)
  job_id = vim.bo.channel
  vim.fn.chansend(job_id, { "/home/rick/.venv/bin/ipython\r\n"})
  vim.fn.feedkeys("L", "n")
end)

vim.keymap.set("n", "<space><space>x", "<cmd>source %<CR>", {desc = "Source the whole file!!"})
vim.keymap.set("n", "<space>x", ":.lua<CR>", {desc = "Source the line that you're on!!"})

vim.keymap.set("n", "<space>rr", function ()
  local line = vim.api.nvim_get_current_line()
  vim.fn.chansend(job_id, { line.."\r\n"})
end, { desc = ""})

-- import pandas as pd
-- data = {'Name': ['John', 'Mary', 'Peter'], 'Age': [20, 25, 30]}
-- df = pd.DataFrame(data)
-- print(df)
-- print(sum(df.Age))

vim.keymap.set("n", "<space>dock", function ()
  -- vim.fn.chansend(job_id, { "docker ps\r\n" })
  vim.fn.chansend(job_id, { "docker ps --format '{{.Names}}'\r\n"})
end, { desc = "call docker ps in the terminal that was brought up by the command above!!"})

vim.keymap.set("t", "<Esc><Esc>", "<C-\\><C-n>", { desc = "Escape insert mode in terminal!!" })
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv", { desc = "Move visual selection down!!" })
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv", { desc = "Move visual selection up!!" })

