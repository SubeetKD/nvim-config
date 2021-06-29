" TODO do it in lua (when better mapper are available)
" Current issue is if telescope is not in the system, then also it calls the
" mapping, can be done better in lua.

nnoremap <leader>tf :Telescope find_files hidden=true<cr>

nnoremap <leader>tg :lua require"subeet.telescope.maps".git_files()<cr>

nnoremap <leader>bb :lua require"subeet.telescope.maps".buffers()<cr>

nnoremap <leader>tt :Telescope builtin<cr>

nnoremap <leader>ts :Telescope live_grep<cr>

nnoremap <leader>en :lua require"subeet.telescope.maps".edit_neovim()<cr>

nnoremap <leader>tw :lua require("telescope.builtin").grep_string({ search = vim.fn.input("Grep for > ")})<cr>

nnoremap <leader>tcw :lua require("telescope.builtin").grep_string({ search = vim.fn.expand("<cWORD>")})<cr>

" command! -nargs=* W w

" nnoremap <leader>tf :Files<cr>
" nnoremap <leader>bb :Buffers<cr>
" nnoremap <C-p>      :GFiles<cr>

" lua << EOF
" local wk = require("which-key")
"   wk.register({
"     ["<leader>t"] = {
"       name = "Telescope",
"       f = "Find Files",
"       t = "Builtins",
"       w = "Grep String",
"       c = {
"         name = "+Other Search",
"         w = "Current Word Search",
"       },
"     },
"   })
" EOF
