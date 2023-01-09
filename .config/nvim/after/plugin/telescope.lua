local action_state = require('telescope.actions.state')
local builtin = require('telescope.builtin')

vim.keymap.set('n', '<leader>pf', builtin.find_files, {})
vim.keymap.set('n', '<C-p>', builtin.git_files, {})
vim.keymap.set('n', '<C-f>', builtin.oldfiles, {})
vim.keymap.set('n', '<leader>ps', function()
	builtin.grep_string({ search = vim.fn.input("Grep > ") })
end)
-- hidden
require('telescope').setup{
    defaults = {
        --layout_strategy = 'vertical',
        prompt_prefix = 'what ',
        mappings = {
            i = {
                ["<c-f>"] = function() print(vim.inspect(action_state.get_selected_entry())) end
            }
        }
    }
}

local themes = require('telescope.themes').get_dropdown({height=10})

--local tm = themes.get_dropdown(height=10)
--
--vim.keymap.set("n", "<F4>", ":lua require('bashbunni').")
local mappings = {}

mappings.cur_buf = function()
    local opt = require('telescope.themes').get_dropdown({winblend=0})
    builtin.help_tags(opt)
end

vim.keymap.set("n", "<leader>9", mappings.cur_buf, {})

--return mappings
