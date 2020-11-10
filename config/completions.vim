"----------------------- Nvim LSP configuration --------------
lua require('completion_config')

inoremap <c-k> <cmd>lua return require'snippets'.expand_or_advance(1)<CR>

inoremap <c-j> <cmd>lua return require'snippets'.advance_snippet(-1)<CR>

"-------------- diagnostic-nvim
let g:diagnostic_show_sign = 0
let g:diagnostic_enable_virtual_text = 1
let g:diagnostic_trimmed_virtual_text = '180'
let g:space_before_virtual_text = 10

" Mapings for easy navigations
nnoremap ]e :NextDiagnosticCycle<cr>
nnoremap [e :PrevDiagnosticCycle<cr>

"------------- completion-nvim

lua require('nvim-lspconfig')

" Set completeopt to have a better completion experience
set completeopt=menuone,noinsert,noselect

" Avoid showing message extra message when using completion
set shortmess+=c

let g:completion_sorting = "none"

" completion-nvim will loop through the list and assign priority from high to low.
" let g:completion_matching_strategy_list = [ 'fuzzy' , 'substring' ]
let g:completion_matching_strategy_list = ['exact', 'substring', 'fuzzy']

" possible value: 'UltiSnips', 'Neosnippet', 'vim-vsnip'
let g:completion_enable_snippet = 'snippets.nvim'

" enable auto pop-up
let g:completion_enable_auto_popup=1

" For path completions
let g:completion_chain_complete_list = {
            \ 'default' : {
            \   'default': [
            \       {'complete_items': ['lsp', 'snippet']},
            \       {'complete_items': ['path'], 'triggered_only': ['/']},
            \       {'mode': '<c-p>'},
            \       {'mode': '<c-n>'}],
            \   }
            \}

" Use <Tab> and <S-Tab> to navigate through popup menu
" inoremap <expr> <Tab>   pumvisible() ? "\<C-n>" : "\<Tab>"
" inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"

function! s:check_back_space() abort
    let col = col('.') - 1
    return !col || getline('.')[col - 1]  =~ '\s'
endfunction

inoremap <silent><expr> <TAB>
  \ pumvisible() ? "\<C-n>" :
  \ <SID>check_back_space() ? "\<TAB>" :
  \ completion#trigger_completion()


let g:completion_confirm_key = ""
imap <expr> <cr>  pumvisible() ? complete_info()["selected"] != "-1" ?
                 \ "\<Plug>(completion_confirm_completion)"  : "\<c-e>\<CR>" :  "\<CR>"

" Use completion-nvim in every buffer
autocmd BufEnter * lua require'completion'.on_attach()

"------------- Mapings for nvim-lsp
nnoremap <silent> <leader>gd    <cmd>lua vim.lsp.buf.declaration()<CR>
nnoremap <silent> K             <cmd>lua vim.lsp.buf.hover()<CR>
nnoremap <silent> <leader>1gD   <cmd>lua vim.lsp.buf.type_definition()<CR>
" nnoremap <silent> <leader>gr    <cmd>lua vim.lsp.buf.references()<CR>
nnoremap <silent> <leader>g0    <cmd>lua vim.lsp.buf.document_symbol()<CR>
nnoremap <silent> <leader>gW    <cmd>lua vim.lsp.buf.workspace_symbol()<CR>
nnoremap <leader>vd :lua vim.lsp.buf.definition()<CR>
nnoremap <leader>vi :lua vim.lsp.buf.implementation()<CR>
nnoremap <leader>vsh :lua vim.lsp.buf.signature_help()<CR>
nnoremap <leader>vrr :lua vim.lsp.buf.references()<CR>
" nnoremap <leader>vrn :lua vim.lsp.buf.rename()<CR>
nnoremap <leader>vh :lua vim.lsp.buf.hover()<CR>
nnoremap <leader>vca :lua vim.lsp.buf.code_action()<CR>

" --- nvim web devicons
lua require'nvim-web-devicons'.setup()
lua require('custom-format')

autocmd BufWritePost *.cpp silent! Format

nnoremap <leader> tff <cmd> lua require('my_finder').find_file()<cr>

"------------------------------ Telescope configs ---------------------------


" Automatic save sessions
let g:startify_session_persistence = 1

let g:startify_lists = [
      \ { 'type': 'sessions',  'header': ['   Sessions']       },
      \ { 'type': 'files',     'header': ['   MRU']            },
      \ { 'type': 'bookmarks', 'header': ['   Bookmarks']      },
      \ { 'type': 'commands',  'header': ['   Commands']       },
      \ ]

