let g:syntastic_enable_signs=0
let g:syntastic_auto_loc_list=2
let g:syntastic_mode_map={'mode':'passive'}
let g:syntastic_check_on_open=1
let g:syntastic_check_on_wq=0

set statusline+=%#worningmsg#
set statusline+=%{SyntasticStatusLineFlag()}
set statusline+=%*

" augroup AutoSyntastic
"     autocmd!
"     autocmd InsertLeave, TextChenged * call s:syntastic()
" augroup END

" function! s:syntastic()
"     w
"     SyntasticCheck
" endfunction
