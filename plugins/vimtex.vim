let g:tex_fravor='latex'
let g:vimtex_syntax_conceal_default=''
" let g:vimtex_imaps_enabled=0
let g:vimtex_mappings_enabled=0

let g:vimtex_compiler_progname = 'nvr'
let g:vimtex_quickfix_latexlog={'references':0}

let g:vimtex_compiler_latexmk = {
    \ 'build_dir' : '',
    \ 'callback' : 1,
    \ 'continuous' : 1,
    \ 'executable' : 'latexmk',
    \}

call deoplete#custom#var('omni', 'input_patterns', {
    \ 'tex': g:vimtex#re#deoplete
    \})

nmap <localleader>ll  <Plug>(vimtex-compile)
nmap <localleader>lt  <Plug>(vimtex-toc-toggle)
nmap <localleader>ls  <Plug>(vimtex-status-all)
