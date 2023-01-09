--      _             _  __
--  ___(_) __ _ _ __ (_)/ _|_   _
-- / __| |/ _` | '_ \| | |_| | | |
-- \__ \ | (_| | | | | |  _| |_| |
-- |___/_|\__, |_| |_|_|_|  \__, |
--        |___/             |___/


--local sig = require('vim-signify')
local mappings = {}

mappings.cur_buf = function()
    print(vim.inspect(vim.g),'hello')
end


vim.keymap.set('n', '<F3>', '<cmd>SignifyHunkDiff<cr>', {})
vim.keymap.set('n', '<F4>', '<cmd>SignifyHunkUndo<cr>', {})
vim.keymap.set('n', '<F5>', mappings.cur_buf, {})
--vim.g.loaded_signify_sign_change                     ='~'

--nmap <leader>gj <plug>(signify-next-hunk)
--nmap <leader>gk <plug>(signify-prev-hunk)
--nnoremap <silent> <leader>su :SignifyHunkUndo<CR>
--nnoremap <silent> <leader>sd :SignifyHunkDiff<CR>
--let g:signify_sign_change                     ='~'
--let g:signify_sign_delete                     ='-'
--let g:signify_sign_show_count                 =0
