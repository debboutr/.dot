return {
  {
    "ThePrimeagen/harpoon",
    lazy = false,
    enabled = true,
    branch = "harpoon2",
    dependencies = { "nvim-lua/plenary.nvim" },
    settings = {
      save_on_toggle = true,
      sync_on_ui_close = false,
    },
    config = function()
      local harpoon = require("harpoon")
      harpoon:setup()

      vim.keymap.set("n", "<space>hh", function()
	harpoon:list():add()
      end)
      vim.keymap.set("n", "<space>hl", function()
	harpoon.ui:toggle_quick_menu(harpoon:list())
      end)

      local s = "asdfg"
      for i = 1, #s do
	local c = s:sub(i,i)
	-- print(c)
	vim.keymap.set("n", string.format("<space>h%s", c), function()
	  harpoon:list():select(i)
	end)
      end

      -- Toggle previous & next buffers stored within Harpoon list
      vim.keymap.set("n", "<space>hp", function() harpoon:list():prev() end)
      vim.keymap.set("n", "<space>hn", function() harpoon:list():next() end)
    end,

    -- TeejDV's solution: Set <space>1..<space>5 be my shortcuts to moving to the files
    -- for _, idx in ipairs { 1, 2, 3, 4, 5 } do
    --   vim.keymap.set("n", string.format("<space>%d", idx), function()
      --       harpoon:list():select(idx)
      --     end)
      --   end
      -- end,
    }
  }
