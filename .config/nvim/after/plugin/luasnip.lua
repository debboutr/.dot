local ls = require "luasnip"
local types = require "luasnip.util.types"

ls.config.set_config {
  history = true,
  updateevents = "TextChanged,TextChangedI",
  enable_autosnippets = false,
  ext_opts = nil,
}

ls.add_snippets(nil, {
  -- basic, don't need to know anything else
  --    arg 1: string
  --    arg 2: a node
  ls.s("simple", ls.text_node("wow, you were right!")),
	ls.parser.parse_snippet(
		"lspsyn",
		"Wow! This ${1:Stuff} really ${2:works. ${3:Well, a bit.}}"
	),
  -- ls.s("expand", "--this is what was expanded"),
})


-- ls.snippets = {
--   all = {
--   },
--   lua = {
--   },
-- }
--
--[[
keymaps for luasnip ]]

vim.keymap.set({"i", "s"}, "<c-k>", function()
  if ls.expand_or_jumpable() then
    ls.expand_or_jump()
  end
end, { silent = true })

vim.keymap.set({"i", "s"}, "<c-j>", function()
  if ls.jumpable(-1) then
    ls.jump(-1)
  end
end, { silent = true })

vim.keymap.set("i", "<c-l>", function()
  if ls.choice_active() then
    ls.change_choice(1)
  end
end)

vim.keymap.set("n", "<leader><leader>s", "<cmd>source ~/.config/nvim/after/plugin/luasnip.lua<CR>")

