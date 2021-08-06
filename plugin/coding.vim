" configuration for competitive coding.


" for java version < 11
" autocmd filetype java nnoremap <F5> :w <bar> !javac % && java -enableassertions %:r <CR>

" for other java version
autocmd filetype java nnoremap <F5> :w <bar> !java % < in<cr>
autocmd filetype python nnoremap <F5> :w <bar> !python % <CR>
autocmd filetype perl nnoremap <F5> :w <bar> !perl % <CR>
autocmd filetype go nnoremap <F5> :w <bar> !go build % && ./%:r <CR>
autocmd filetype cpp nnoremap <F5> :w <bar> !g++-4.8 -ulimit -Wall -Wno-unused-result -std=c++11   -O2   % -o %:r && ./%:r <CR>
