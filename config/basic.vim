"------------------------------ Basic Configuration ----------------------
set smartcase
set termguicolors
set ignorecase
set clipboard+=unnamedplus
set tabstop=4 shiftwidth=4
" set tabstop=2 shiftwidth=2
set expandtab
set noswapfile
set mouse=a
" set nowrap
set splitright
set splitbelow
set winblend=0
set nu rnu

if exists('g:started_by_firenvim')
    " set lines=8
    " set columns=70
endif

set guifont=Hack\ Nerd\ Font:h17

let g:auto_save = 1

if has("persistent_undo")
    set undodir="/home/subeet/.config/nvim/undodir"
    set undofile
endif

"---------------------- Mapings -----------------

let mapleader=' '

vmap < <gv
vmap > >gv

" Map <CR> to :nohl, except in quickfix windows
nnoremap <silent> <expr> <CR> &buftype ==# 'quickfix' ? "\<CR>" : ":nohl\<CR>"

" Source init.vim
nnoremap sho <cmd> so $MYVIMRC<cr>


" -------------------- Making life easy
vnoremap J :m '>+1<CR>gv=gv
vnoremap K :m '<-2<CR>gv=gv
vnoremap X "_d
nnoremap x "_x


" ----------------- Terminal Emulation -------


" TODO: config the terminal emulator

tnoremap <A-h> <C-\><C-N><C-w>h
tnoremap <A-j> <C-\><C-N><C-w>j
tnoremap <A-k> <C-\><C-N><C-w>k
tnoremap <A-l> <C-\><C-N><C-w>l
inoremap <A-h> <C-\><C-N><C-w>h
inoremap <A-j> <C-\><C-N><C-w>j
inoremap <A-k> <C-\><C-N><C-w>k
inoremap <A-l> <C-\><C-N><C-w>l
nnoremap <A-h> <C-w>h
nnoremap <A-j> <C-w>j
nnoremap <A-k> <C-w>k
nnoremap <A-l> <C-w>l
ca tn tabnew

tnoremap <A-e> <C-\><C-n>
autocmd TermOpen * startinsert
au FileType fzf tnoremap <buffer> <Esc> <Esc>

autocmd TermEnter * setlocal nonu nornu
cnoreabbrev W! w!
cnoreabbrev Q! q!
cnoreabbrev Qall! qall!
cnoreabbrev Wq wq
cnoreabbrev Wa wa
cnoreabbrev wQ wq
cnoreabbrev WQ wq
cnoreabbrev W w
cnoreabbrev Q q
cnoreabbrev Qall qall


"------------------------ Competitive coding ------

autocmd filetype cpp nnoremap <F2> :FloatermNew cf test ; read <cr>
autocmd filetype cpp nnoremap <F3> :FloatermNew cf submit ; read <cr>


"------------------------ Autocmd ------------------

" Delete white trailing spaces
" autocmd BufWritePre * %s/\s\+$//e

" for compiling c++
autocmd filetype cpp nnoremap <F7> :!g++ -std=c++17 -Wshadow -Wall -g -o program -O2 -Wno-unused-result -DLOCAL "%:r.cpp" <CR>
autocmd filetype cpp nnoremap <F8> :FloatermNew --autoclose=0 ./program<CR>

" Run xrdb whenever Xdefaults or Xresources are updated.
autocmd BufWritePost *Xresources,*Xdefaults !xrdb %

" Update binds when sxhkdrc is updated.
autocmd BufWritePost *sxhkdrc !pkill -USR1 sxhkd

aug i3config_ft_detection
  au!
  au BufNewFile,BufRead ~/.local/src/dot_file/config/i3/config set filetype=i3config
  au BufNewFile,BufRead ~/.config/i3/config set filetype=i3config
aug end
