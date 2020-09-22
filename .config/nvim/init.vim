"       _      _    ____       _     _                 _
"  _ __(_) ___| | _|  _ \  ___| |__ | |__   ___  _   _| |_
" | '__| |/ __| |/ / | | |/ _ \ '_ \| '_ \ / _ \| | | | __|
" | |  | | (__|   <| |_| |  __/ |_) | |_) | (_) | |_| | |_
" |_|  |_|\___|_|\_\____/ \___|_.__/|_.__/ \___/ \__,_|\__|
"              _       _ _         _
"             (_)_ __ (_) |___   _(_)_ __ ___
"             | | '_ \| | __\ \ / / | '_ ` _ \
"             | | | | | | |_ \ V /| | | | | | |
"             |_|_| |_|_|\__(_)_/ |_|_| |_| |_|

" autocmd FileType python nnoremap >vuffer> <cr> :silent w<bar>only<bar>vsp<bar>term ipython3 -i %<cr>
let mapleader=" "

call plug#begin('~/local/share/nvim/plugged')
Plug 'morhetz/gruvbox'                  " the best colorscheme in the universe!
Plug 'junegunn/fzf'
Plug 'junegunn/fzf.vim'
Plug 'tpope/vim-fugitive'
Plug 'leafgarland/typescript-vim'
Plug 'vim-utils/vim-man'
Plug 'Valloric/YouCompleteMe'
Plug 'itchyny/lightline.vim'
Plug 'itchyny/vim-gitbranch'
Plug 'mhinz/vim-signify'                                " adds git gutter marks
Plug 'posva/vim-vue'                       " syntax highlighting for .vue files
Plug 'LucHermitte/lh-vim-lib'
Plug 'LucHermitte/lh-brackets'
Plug 'vimwiki/vimwiki'
" Plug 'ludovicchabant/vim-gutentags'
call plug#end()

colorscheme gruvbox

set number
set rnu
set nowrap
set nobackup
set undofile
set incsearch
set expandtab
set smartcase
set noswapfile
set noshowmode
set noerrorbells
set colorcolumn=81
set background=dark
set clipboard=unnamedplus
set undodir=~/.config/nvim/undodir
set splitbelow splitright
exec "set listchars=tab:\uBB\uBB,trail:\uB7,nbsp:~"
set list
set foldmethod=manual
set foldmethod=indent
set updatetime=100
set autoread

" spacing -- default is 4 spaces
set tabstop=4 softtabstop=4 shiftwidth=4
autocmd FileType vue setlocal ts=2 sts=2 sw=2
autocmd FileType html,htmldjango setlocal ts=2 sts=2 sw=2
autocmd FileType javascript setlocal ts=2 sts=2 sw=2

" create ctags for ste-packages in env
" map <F6> :!ctags -R -f ./tags `python -c "from distutils.sysconfig import get_python_lib; print(get_python_lib())"`<CR>

" get back to being NORMAL
inoremap jk <ESC>

" move selected lines up and down
vnoremap J :m '>+1<CR>gv=gv
vnoremap K :m '<-2<CR>gv=gv
"syntax highlighting for git changed lines
nnoremap <Leader>8 :SignifyToggleHighlight<CR>
"remove syntax highlighting
nnoremap <Leader>9 :noh<CR>
" move to splits
nnoremap <Leader>h :wincmd h<CR>
nnoremap <Leader>j :wincmd j<CR>
nnoremap <Leader>k :wincmd k<CR>
nnoremap <Leader>l :wincmd l<CR>
" comment visual selection python
vnoremap <Leader>c :s/^/# <CR>
" this will open up the file tree
nnoremap <Leader>pv :wincmd v<bar> :Ex <bar> :vertical resize 30<CR>
" remove whitespace at the end of lines
nnoremap <Leader>w :call TrimWhitespace()<CR>

nnoremap <silent> <C-Left> :vertical resize +3<CR>
nnoremap <silent> <C-Right> :vertical resize -3<CR>
nnoremap <silent> <C-Up> :resize +3<CR>
nnoremap <silent> <C-Down> :resize -3<CR>
nnoremap <silent> <leader>gd :YcmCompleter GoTo<CR>
" split out all buffers into a tab
nnoremap <silent> <leader>t :tab sball<CR>
nnoremap <silent> <leader>gf :YcmCompleter FixIt<CR>
" reload all buffers at once!
nnoremap <F5> :bufdo! e<CR>
map <C-f> <Esc><Esc>:Files!<CR>
inoremap <C-f> <Esc><Esc>:BLines!<CR>
map <C-g> <Esc><Esc>:BCommits!<CR>
map <C-p> :GFiles<CR>
nmap <S-Enter> O<Esc>j
nmap <leader><C-]> :execute 'tab tag '.expand('<cword>')<CR>
" use signify for hunkdiff and hunkundo
nnoremap <silent> <leader>hu :SignifyHunkUndo<CR>
nnoremap <silent> <leader>hd :SignifyHunkDiff<CR>
" remap :bd, quicker
nnoremap <silent> <leader>q :bd<CR>

let g:python_host_prog = "/usr/bin/python"
let g:python3_host_prog = "/usr/bin/python3"
let g:ctrlp_user_command = ['.git/', 'git --git-dir=%s/.git ls-files -oc --exclude-standard']

let g:netrw_browse_split=0
let g:netrw_banner=0
let g:netrw_winsize=25

let g:ctrlp_use_caching          =0
" better tabbing
vnoremap < < gv
vnoremap > > gv

" vim fugitive git settings -- coconut oil ABOUND!
nmap <leader>gl :diffget //3<CR>
nmap <leader>gh :diffget //2<CR>
nmap <leader>gs :G<CR>

" Signify settings............................................................
nmap <leader>gj <plug>(signify-next-hunk)
nmap <leader>gk <plug>(signify-prev-hunk)
let g:signify_sign_change                     ='~'
let g:signify_sign_delete                     ='-'
let g:signify_sign_show_count                 =0
"..............................................................................
"Lightline statusline settings................................................
let g:lightline = {
      \ 'active': {
      \   'left': [ [ 'mode', 'paste' ],
      \             [ 'gitbranch', 'readonly', 'filename', 'modified' ] ]
      \ },
      \ 'component_function': {
      \   'filename': 'FilenameForLightline',
      \   'gitbranch': 'FugitiveHead'
      \ }
      \ }
"..............................................................................
" Show full path of filename
function! FilenameForLightline()
    return expand('%')
endfunction

fun! TrimWhitespace()
    let l:save = winsaveview()
    keeppatterns %s/\s\+$//e
    call winrestview(l:save)
endfun

" source this MOFO
au! BufWritePost $MYVIMRC source %
