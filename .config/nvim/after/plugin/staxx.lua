
local push = function()
  require("stackmap").push("debug_mode", "n", {
    [" wt"] = ":echo 'WOW, this got mapped'<CR>",
  })
end

local pop = function()
  -- print(require("stackmap")._stack["debug_mode"]["n"])
  if require("stackmap")._stack["debug_mode"] and require("stackmap")._stack["debug_mode"]["n"] then
    require("stackmap").pop("debug_mode", "n")
  else
    print("you haven't loaded any stackmaps yet!")
  end
end

vim.keymap.set("n", "<Leader>8", push)
vim.keymap.set("n", "<Leader>7", pop)
