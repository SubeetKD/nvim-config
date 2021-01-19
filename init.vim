call plug#begin('~/.config/nvim/plugged')

" lsp and autocomplete 
Plug 'neovim/nvim-lspconfig'
Plug 'nvim-lua/completion-nvim'
Plug 'anott03/nvim-lspinstall'

" REPL
Plug 'metakirby5/codi.vim'

" snippets and commenter
Plug 'norcalli/snippets.nvim'
Plug 'preservim/nerdcommenter'

" Telescope.nvim
Plug 'nvim-lua/popup.nvim'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'

" Git config
Plug 'f-person/git-blame.nvim'
Plug 'lewis6991/gitsigns.nvim'

" note and language based tool
Plug 'alvan/vim-closetag'
Plug 'vimwiki/vimwiki'

" Visual improvements
Plug 'Yggdroot/indentLine'
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'} 
Plug 'norcalli/nvim-colorizer.lua'

" Distraction free writing.
Plug 'junegunn/goyo.vim'

" Statusline
Plug 'hoob3rt/lualine.nvim'
Plug 'kyazdani42/nvim-web-devicons'
Plug 'ryanoasis/vim-devicons'

" Colorscheme
Plug 'sickill/vim-monokai'
Plug 'tomasr/molokai'
Plug 'joshdick/onedark.vim'
Plug 'gruvbox-community/gruvbox'
Plug 'tjdevries/colorbuddy.vim'
Plug 'tjdevries/gruvbuddy.nvim'
Plug 'ayu-theme/ayu-vim'
Plug 'mhartington/oceanic-next'
Plug 'chriskempson/base16-vim'

call plug#end()

set inccommand=nosplit
set noswapfile
set nobackup
set termguicolors
set nowrap
set tabstop=4
set shiftwidth=4
set expandtab
set clipboard+=unnamedplus
set pumblend=15
set winblend=10
set scrolloff=5
set mouse=a
set updatetime=10

let g:mapleader = ' '

" Heaven's feel
inoremap <A-BS> <C-w>
vmap < <gv
vmap > >gv
vnoremap J :m '>+1<CR>gv=gv
vnoremap K :m '<-2<CR>gv=gv
vnoremap X "_d
nnoremap x "_x
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

autocmd filetype cpp set tabstop=4 shiftwidth=4

autocmd filetype cpp nnoremap <F5> :!g++ -std=c++17 -Wshadow -Wall -g -o program -O2 -Wno-unused-result -DLOCAL "%:r.cpp" <CR>
autocmd filetype java nnoremap <F5> :w <bar> !javac % <CR>
" autocmd filetype python nnoremap <F5> :w <bar> !python % <CR>
autocmd filetype cpp nnoremap <F6> <cmd>!./program < in<cr>


" F9/F10 compile/run default file.
" F11/F12 compile/run alternate file.
autocmd filetype java map <F9> :set makeprg=javac\ %<CR>:make<CR>
autocmd filetype java map <F10> :!echo %\|awk -F. '{print $1}'\|xargs java<CR>
autocmd filetype java map <F11> :set makeprg=javac\ #<CR>:make<CR>
autocmd filetype java map <F12> :!echo #\|awk -F. '{print $1}'\|xargs java<CR>
autocmd filetype python map <F9> :set makeprg=python\ %<cr>:make<cr>

" Run xrdb whenever Xdefaults or Xresources are updated.
autocmd BufWritePost *Xresources,*Xdefaults !xrdb %

" Update binds when sxhkdrc is updated.
autocmd BufWritePost *sxhkdrc !pkill -USR1 sxhkd

aug i3config_ft_detection
  au!
  au BufNewFile,BufRead ~/.local/src/dot_file/config/i3/config set filetype=i3config
  au BufNewFile,BufRead ~/.config/i3/config set filetype=i3config
aug end

" Colorscheme

let g:molokai_original = 1
let g:rehash256 = 1
let g:onedark_termcolors = 256
let g:onedark_terminal_italics = 1
let g:ayucolor = "dark"
let g:gruvbox_contrast_dark = "hard"
let g:gruvbox_invert_selection='0'
let g:oceanic_next_terminal_bold = 1
let g:oceanic_next_terminal_italic = 1
let base16colorspace=256

set background=dark

colorscheme OceanicNext
" lua require('colorbuddy').colorscheme('gruvbuddy')
set t_Co=256
if exists('+termguicolors')
    let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
    let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
endif

highlight ColorColumn ctermbg=0 guibg=grey
" highlight Normal guibg=none
" highlight LineNr guifg=#ff8542
" highlight LineNr guifg=#aed75f
highlight LineNr guifg=#5eacd3
highlight netrwDir guifg=#5eacd3
highlight qfFileName guifg=#aed75f
highlight StatusLine guibg=none
highlight StatusLineNC guibg=none

lua require('subeet.colorizer')

let g:indentLine_char = '|'

lua require('subeet.treesitter')

lua require('subeet.snippets.snips')

lua require('subeet.lsp.index')

" Completion.nvim config
set shortmess+=c
set completeopt=menuone,noinsert,noselect
inoremap <expr> <Tab>   pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"
let g:completion_enable_snippet = 'snippets.nvim'
let g:completion_enable_auto_hover = 1
let g:completion_enable_auto_paren = 0
let g:completion_matching_smart_case = 1
let g:completion_matching_strategy_list = ['exact', 'substring', 'fuzzy']
let g:completion_trigger_keyword_length = 2
let g:completion_trigger_on_delete = 1
let g:completion_timer_cycle = 200
let g:completion_chain_complete_list = {
    \ 'default' : {
    \   'default': [
    \       {'complete_items': ['lsp', 'snippet']},
    \       {'mode': '<c-p>'},
    \       {'mode': '<c-n>'}],
    \   'comment': [
    \       {'complete_items': ['path']}],
    \   'string': [
    \       {'complete_items': ['path']}]
    \   }
    \}
autocmd BufEnter * lua require'completion'.on_attach()
nnoremap <leader>lll <cmd>e ~/.local/share/nvim/lsp.log <cr>
" Don't know if needed ~/home
let g:completion_confirm_key = ""
imap <expr> <cr>  pumvisible() ? complete_info()["selected"] != "-1" ?
                 \ "\<Plug>(completion_confirm_completion)"  : "\<c-e>\<CR>" :  "\<CR>"

let g:NERDCreateDefaultMappings = 1
let g:NERDSpaceDelims = 1
let g:NERDCompactSexyComs = 1
let g:NERDDefaultAlign = 'left'
let g:NERDAltDelims_java = 1
let g:NERDCustomDelimiters = { 'c': { 'left': '/**','right': '*/' } }
let g:NERDCommentEmptyLines = 1
let g:NERDTrimTrailingWhitespace = 1
let g:NERDToggleCheckAllLines = 1

let g:closetag_filenames = '*.html,*.xhtml,*.phtml'
let g:closetag_xhtml_filenames = '*.xhtml,*.jsx'
let g:closetag_filetypes = 'html,xhtml,phtml'
let g:closetag_xhtml_filetypes = 'xhtml,jsx'
let g:closetag_emptyTags_caseSensitive = 1
let g:closetag_regions = {
    \ 'typescript.tsx': 'jsxRegion,tsxRegion',
    \ 'javascript.jsx': 'jsxRegion',
    \ }
let g:closetag_shortcut = '>'

" Vimwiki
let g:vimwiki_list = [{'path':'~/vimwiki','syntax':'markdown','ext':'.md',
            \'auto_diary_index':1}]
let g:vimwiki_ext2syntax = {'.md':'markdown','.markdown':'markdown','.mdown':'markdown'}

lua require('subeet.statusline')

" GOYO Fun
function! s:goyo_enter()
  if executable('tmux') && strlen($TMUX)
    silent !tmux set status off
    silent !tmux list-panes -F '\#F' | grep -q Z || tmux resize-pane -Z
  endif
  set noshowmode
  set noshowcmd
  set scrolloff=999
"  Limelight
  " ...
endfunction

function! s:goyo_leave()
  if executable('tmux') && strlen($TMUX)
    silent !tmux set status on
    silent !tmux list-panes -F '\#F' | grep -q Z && tmux resize-pane -Z
  endif
  set showmode
  set showcmd
  set scrolloff=5
  " Limelight!
  " ...
endfunction

autocmd! User GoyoEnter nested call <SID>goyo_enter()
autocmd! User GoyoLeave nested call <SID>goyo_leave()

" Telescope.nvim Using lua functions
" TODO(SUBEET) --> make custom functions
nnoremap <leader>ff <cmd>lua require('telescope.builtin').find_files()<cr>
nnoremap <leader>fg <cmd>lua require('telescope.builtin').live_grep()<cr>
nnoremap <leader>fb <cmd>lua require('telescope.builtin').buffers()<cr>
nnoremap <leader>fh <cmd>lua require('telescope.builtin').help_tags()<cr>

" Git config
let g:gitblame_message_template = '      <summary> • <date> • <author>'

lua require('subeet.gitsigns')

" using default config 
" TODO(SUBEET) --> make custom config per file type
" lua require('nvim-autopairs').setup()


" Codi.vim
highlight CodiVirtualText guifg=cyan
let g:codi#virtual_text_prefix = "❯ "
