vim.cmd([[colorscheme desert]])
vim.g.mapleader = " "
vim.keymap.set("n", "<leader>pv", vim.cmd.Ex, { desc = "netrw console" })

vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv", { desc = "move line up" })
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv", { desc = "move line down" })

vim.keymap.set("n", "J", "mzJ`z", { desc = "move line up" })
vim.keymap.set("n", "<C-d>", "<C-d>zz", { desc = "move page down and center" })
vim.keymap.set("n", "<C-u>", "<C-u>zz", { desc = "move page up and center" })

-- center the found selection when using n/N
-- vim.keymap.set("n", "n", "nzzzv")
-- vim.keymap.set("n", "N", "Nzzzv")

-- greatest remap ever
vim.keymap.set("x", "<leader>p", [["_dP]], { desc = "move line up" })

-- next greatest remap ever : asbjornHaland
vim.keymap.set({ "n", "v" }, "<leader>y", [["+y]], { desc = "move line up" })
vim.keymap.set("n", "<leader>Y", [["+Y]], { desc = "move line up" })

vim.keymap.set({ "n", "v" }, "<leader>d", [["_d]], { desc = "move line up" })

-- This is going to get me cancelled
vim.keymap.set("i", "<C-c>", "<Esc>", { desc = "move line up" })

-- vim.keymap.set("i", "(", "()<Esc>i")
-- vim.keymap.set("i", "{", "{}<Esc>i")
-- vim.keymap.set("i", "[", "[]<Esc>i")
-- vim.keymap.set('i', '"', '""<Esc>i')
-- vim.keymap.set('i', '<', '<><Esc>i')

vim.keymap.set("n", "Q", "<nop>", { desc = "move line up" })
vim.keymap.set("n", "<C-f>", "<cmd>silent !tmux neww tmux-sessionizer<CR>", { desc = "move line up" })
vim.keymap.set("n", "<leader>f", vim.lsp.buf.format, { desc = "move line up" })

vim.keymap.set("n", "<C-k>", "<cmd>cnext<CR>zz", { desc = "move line up" })
vim.keymap.set("n", "<C-j>", "<cmd>cprev<CR>zz", { desc = "move line up" })
vim.keymap.set("n", "<leader>k", "<cmd>lnext<CR>zz", { desc = "move line up" })
vim.keymap.set("n", "<leader>j", "<cmd>lprev<CR>zz", { desc = "move line up" })

vim.keymap.set("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]],
  { desc = "search and replace" }
)
vim.keymap.set("n", "<leader>x", "<cmd>!chmod +x %<CR>", { silent = true })

vim.keymap.set("n", "<leader>q", "<cmd>bd<CR>", { desc = "move line up" })

local ls = require "luasnip"
vim.keymap.set({ "i", "s" }, "<c-k>", function()
  if ls.expand_or_jumpable() then
    ls.expand_or_jump()
  end
end, { silent = true })

vim.keymap.set({ "i", "s" }, "<c-j>", function()
  if ls.jumpable(-1) then
    ls.jump(-1)
  end
end, { silent = true })

vim.keymap.set("i", "<c-l>", function()
  if ls.choice_active() then
    ls.change_choice(1)
  end
end)

vim.keymap.set("n", "<leader><leader>s",
  "<cmd>source ~/.config/nvim/after/plugin/luasnip.lua<CR>",
  { desc = "source the luasnip file" }
)
