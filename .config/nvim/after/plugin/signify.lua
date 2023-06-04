
vim.keymap.set('n', '<leader>as', '<cmd>SignifyToggle<cr>', {})
vim.keymap.set('n', '<F3>', '<cmd>SignifyHunkDiff<cr>', {})
vim.keymap.set('n', '<F4>', '<cmd>SignifyHunkUndo<cr>', {})
vim.g['signify_disable_by_default'] = 1
vim.g['signify_sign_change'] = '~'
vim.g['signify_sign_delete'] = '-'
vim.g['signify_sign_show_count'] = 0
vim.g['signify_number_highlight'] = 0

-- vim.cmd("highlight SignColumn ctermbg=NONE cterm=NONE guibg=NONE gui=NONE")
-- vim.api.nvim_set_hl(0, "SignColumn", { fg = "NONE", guibg = "NONE" })

--nmap <leader>gj <plug>(signify-next-hunk)
--nmap <leader>gk <plug>(signify-prev-hunk)
--nnoremap <silent> <leader>su :SignifyHunkUndo<CR>
--nnoremap <silent> <leader>sd :SignifyHunkDiff<CR>
--let g:signify_sign_change                     ='~'
--let g:signify_sign_delete                     ='-'
--let g:signify_sign_show_count                 =0
