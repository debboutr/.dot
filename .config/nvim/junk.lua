
-- print(vim.fn.printf('Hello from %s', 'Lua'))
local reversed_list = vim.fn.reverse({ 'a', 'b', 'c' })
print(vim.inspect(reversed_list)) -- { "c", "b", "a" }
-- vim.keymap.set('n', '<Leader>ex1', '<cmd>echo "Example 1"<cr>')
-- vim.keymap.set('n', '<Leader>ex3', function ()
--   print("this is working...")
--   return vim.treesitter.start
-- end)
--
-- vim.keymap.set('n', 'e', '<Leader>ex1', { remap = true })
-- print(vim.fn.printf('Hello from %s', 'Lua'))
-- a = ""
-- b = {}
--
-- if( a == b )
-- then
--    print("Line 1 - a is equal to b" )
-- else
--   print(type(b))
--    print("Line 1 - a is not equal to b" )
-- end
local custom_init_path = vim.api.nvim_get_runtime_file("lua/custom/init.lua", false)
print(vim.inspect(custom_init_path))
print(type(custom_init_path))
local check = {
  ["<leader> freedom"] = 47
}
-- local check = {["freedom"]=47}
for key, _ in pairs(check) do
  print(key)
  print(type(key))
end
-- print(type(check))
-- print(vim.inspect(vim.opt.rtp))
print(vim.g.base46_cache .. "defaults")
print(vim.g.base46_cache)
