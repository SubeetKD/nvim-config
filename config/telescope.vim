lua << EOF
require('telescope').setup{
  defaults = {
    shorten_path = true
  }
}
EOF
nnoremap <C-p> <cmd> lua require'telescope.builtin'.find_files{ cwd = "." , find_command = { "rg" , "-i" , "--hidden" , "--files" , "-g" , "!.git" } }<cr>
nnoremap <C-b> <cmd> lua require'telescope.builtin'.buffers{}<cr>
nnoremap <C-g> <cmd> lua require'telescope.builtin'.live_grep{}<cr>
nnoremap <leader>qf <cmd> lua require'telescope.builtin'.quick_fix{}<cr>
