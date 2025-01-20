return {
  {
    "ThePrimeagen/harpoon",
    lazy = false,
    enabled = true,
    branch = "harpoon2",
    dependencies = { "nvim-lua/plenary.nvim" },
    settings = {
      save_on_toggle = false,
      sync_on_ui_close = false,
    },
    config = function()
      local harpoon = require("harpoon")
      harpoon:setup()
      -- basic telescope configuration
      local conf = require("telescope.config").values
      local function toggle_telescope(harpoon_files)
	local file_paths = {}
	for _, item in ipairs(harpoon_files.items) do
	  table.insert(file_paths, item.value)
	end

	require("telescope.pickers").new({}, {
	  -- theme = "ivy",
	  -- prompt_title = "Harpoon",
	  prompt_prefix = "⇋ ",
	  sorting_strategy = "ascending",
	  border = false,
	  layout_config = {
	    height = 0.31,
	    width = 0.31,
	  },
	  finder = require("telescope.finders").new_table({
	    results = file_paths,
	  }),
	  -- previewer = conf.file_previewer({}),
	  sorter = conf.generic_sorter({}),
	}):find()
      end

      vim.keymap.set("n", "<leader>fj", function() toggle_telescope(harpoon:list()) end,
      { desc = "Telescope harpoon window" })

      vim.keymap.set("n", "<space>hh", function()
	harpoon:list():add()
      end, { desc = "Harpoon It!!"})
      vim.keymap.set("n", "<space>hw", function()
	harpoon.ui:toggle_quick_menu(harpoon:list(), { title = '---¡harpoon!--->' })
      end, { desc = "Harpoon List!!"})

      local s = "asdfg"
      for i = 1, #s do
	local c = s:sub(i,i)
	-- print(c)
	vim.keymap.set("n", string.format("<space><space>%s", c), function()
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
