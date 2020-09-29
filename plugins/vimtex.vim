let g:tex_conceal = ''
" set conceallevel=0
let g:vimtex_fold_enabled = 1
let g:vimtex_fold_manual = 1
let g:vimtex_imaps_enabled=0
" set fillchars=fold:\ 


let g:vim_fravor='latex'

let g:vimtex_compiler_latexmk={
            \ 'background' : 1, 
            \ 'build_dir' : '', 
            \ 'continous' : 1, 
            \}

call deoplete#custom#var('omni', 'input_patterns', {
    \ 'tex': g:vimtex#re#deoplete
    \})

let g:vimtex_compiler_progname| = 'nvr'
let g:vimtex_quickfix_latexlog={'references':0}
