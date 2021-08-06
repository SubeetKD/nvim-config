" move this to the java.lua
" nnoremap <A-CR> <Cmd>lua require('jdtls').code_action()<CR>
" vnoremap <A-CR> <Esc><Cmd>lua require('jdtls').code_action(true)<CR>
" nnoremap <leader>r <Cmd>lua require('jdtls').code_action(false, 'refactor')<CR>

" nnoremap <A-o> <Cmd>lua require'jdtls'.organize_imports()<CR>
" nnoremap crv <Cmd>lua require('jdtls').extract_variable()<CR>
" vnoremap crv <Esc><Cmd>lua require('jdtls').extract_variable(true)<CR>
" nnoremap crc <Cmd>lua require('jdtls').extract_constant()<CR>
" vnoremap crc <Esc><Cmd>lua require('jdtls').extract_constant(true)<CR>
" vnoremap crm <Esc><Cmd>lua require('jdtls').extract_method(true)<CR>

" nnoremap <leader>df <Cmd>lua require'jdtls'.test_class()<CR>
" nnoremap <leader>dn <Cmd>lua require'jdtls'.test_nearest_method()<CR>

" command! -buffer JdtCompile lua require('jdtls').compile()
" command! -buffer JdtUpdateConfig lua require('jdtls').update_project_config()
" command! -buffer JdtJol lua require('jdtls').jol()
" command! -buffer JdtBytecode lua require('jdtls').javap()
" command! -buffer JdtJshell lua require('jdtls').jshell()

" lua require('subeet.lsp.java')
