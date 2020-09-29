let g:jedi#auto_initialization=0
let g:jedi#auto_vim_configuration=0
let g:jedi#smart_auto_mappings=0
let g:jedi#completions_enabled=0
let g:force_py_version=3

" call deoplete#custom#source('jedi', 'is_debug_enabled', 1)

function! Jedi_map() abort
    if !has_key(g:LanguageClient_serverCommands, &filetype)
        nnoremap <buffer> <silent> <Leader>lk :call jedi#show_documentation()<CR>
        nnoremap <buffer> <silent> <Leader>ld :call jedi#goto()<CR>
        nnoremap <buffer> <silent> <Leader>li :call jedi#usages()<CR>
        nnoremap <buffer> <silent> <Leader>lr :call jedi#rename()<CR>
    endif
endfunction

autocmd FileType python call Jedi_map()
