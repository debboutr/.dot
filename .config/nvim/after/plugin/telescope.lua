local action_state = require('telescope.actions.state')
local builtin = require('telescope.builtin')

vim.keymap.set('n', '<leader>m', builtin.keymaps, { desc = "telescope keymaps search"})
vim.keymap.set('n', '<leader>b', builtin.buffers, { desc = "telescope buffers search"})
vim.keymap.set('n', '<C-p>', builtin.git_files, { desc = "telescope git files search"})
vim.keymap.set('n', '<C-f>', builtin.oldfiles, { desc = "telescope oldfiles search"})
vim.keymap.set('n', '<leader>ps', function()
	builtin.grep_string({ search = vim.fn.input("Grep > ") })
end)
-- hidden
require('telescope').setup{
    defaults = {
        layout_strategy = 'horizontal',
        --layout_config = { preview_cutoff = 120 },
        --prompt_prefix = 'what ',
        mappings = {
            i = {
                ["<c-f>"] = function() print(vim.inspect(action_state.get_selected_entry())) end
            }
        }
    }
}
vim.keymap.set('n', '<leader>pf', builtin.find_files, {})

local themes = require('telescope.themes').get_dropdown({height=10})

--local tm = themes.get_dropdown(height=10)
--
--vim.keymap.set("n", "<F4>", ":lua require('bashbunni').")
local mappings = {}

mappings.cur_buf = function()
    local opt = require('telescope.themes').get_dropdown({layout_config ={preview_cutoff=12}})
    builtin.help_tags(opt)
end

vim.keymap.set("n", "<leader>9", mappings.cur_buf, {})

--return mappings
