require("config.lazy")

-- for lua filetypes!! THIS IS A WAY TO CONFIG KEYWORDS!!
-- vim.cmd [[ hi @function.builtin.lua guifg=yellow ]]
-- for all filetypes!!
-- vim.cmd [[ hi @function.builtin guifg=yellow ]]

vim.opt.shiftwidth = 2
vim.opt.clipboard = "unnamedplus"
vim.opt.number = true
vim.opt.relativenumber = true
vim.o.textwidth = 80
vim.o.ignorecase = true

vim.opt.undodir = vim.fn.stdpath("data") .. "/undodir"
vim.opt.undofile = true

 -- make the background transparent
vim.cmd [[
  highlight Normal guibg=none
  highlight NonText guibg=none
  highlight Normal ctermbg=none
  highlight NonText ctermbg=none
]]

-- clear highlighting
vim.keymap.set("n", "<space><space>c", "<cmd>nohl<CR>", {desc = "Clear highlighting nohl!"})
-- source the whole file!!!
vim.keymap.set("n", "<space><space>x", "<cmd>source %<CR>", {desc = "Source the whole file!!"})
-- source the current line in lua!!
vim.keymap.set("n", "<space>x", ":.lua<CR>", {desc = "Source the whole file!!"})
-- source the visual selection!!
vim.keymap.set("v", "<space>x", ":lua<CR>", {desc = "Source the whole file!!"})
vim.keymap.set("n", "}", "}zz", {desc = "center the highlighted selection"})
vim.keymap.set("n", "{", "{zz", {desc = "center the highlighted selection"})
vim.keymap.set("n", "n", "nzz", {desc = "center the highlighted selection"})
vim.keymap.set("n", "N", "Nzz", {desc = "center the highlighted selection"})

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
  vim.fn.feedkeys("L", "n")
  vim.fn.chansend(job_id, { "/home/rick/.venv/bin/ipython\r\n"})
  vim.fn.chansend(job_id, { "%clear\r\n"})
  vim.fn.feedkeys(":wincmd h\r\n", "n")
end)

vim.keymap.set("n", "<space>rr", function ()
  local line = vim.api.nvim_get_current_line()
  vim.fn.chansend(job_id, { line.."\r\n"})
end, { desc = ""})

vim.keymap.set("v", "<leader>rr", function ()
  start = vim.fn.getpos("v")
  stop = vim.fn.getpos(".")
  P(start)
  if stop[2] < start[2] then
    start, stop = stop, start
  end
  -- apply the length of the last line for the
  -- column value to the end of the line
  if not (#vim.fn.getline(stop[2]) == 0) then
    stop[3] = #vim.fn.getline(stop[2])
  end
  lines = vim.fn.getregion(start, stop, {type = "V"})
  bufnr = vim.api.nvim_get_current_buf()
  start_space = vim.fn.match(lines[0], '\\S')
  stop_space = vim.fn.match(lines[#lines], '\\S')
  for _, line in pairs(lines) do
    code = vim.fn.trim(line)
    vim.fn.chansend(job_id, { code.."\r" })
  end
  if not (start_space == stop_space) then
    vim.fn.chansend(job_id, { "\r\n" })
  end
end, { desc = "run python from visual mode!"})

vim.keymap.set("n", "<space>dock", function ()
  -- vim.fn.chansend(job_id, { "docker ps\r\n" })
  vim.fn.chansend(job_id, { "docker ps --format '{{.Names}}'\r\n"})
end, { desc = "call docker ps in the terminal that was brought up by the command above!!"})

vim.keymap.set("t", "<Esc><Esc>", "<C-\\><C-n>", { desc = "Escape insert mode in terminal!!" })
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv", { desc = "Move visual selection down!!" })
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv", { desc = "Move visual selection up!!" })
vim.keymap.set("n", "<leader>c", ":nohl<CR>", { desc = "Clear the highlighting!!" })

P = function(v)
  -- GTK! this can only print a single table!
  -- you can also use it w/o the call solely on a line, IT RETURNS!!
  print(vim.inspect(v))
  return v
end

-- P(vim.opt.hlsearch:get())
-- this is fucked when using in `init` because it is returning something?
-- I think it's because it returns a table, the call above ↑ doesn't throw the
-- same error if I hit <esc> when the printed table occupies the screen
--P(vim.opt.hlsearch)
