let g:deoplete#enable_at_startup = 1

imap <expr><tab> pumvisible() ? "\<C-n>" : "\<tab>"

inoremap <silent> <expr> <CR> "<C-r>=deoplete#close_popup()<CR><CR>"


call deoplete#custom#option({
      \ 'smart_case' : v:true,
      \ 'max_list' : 100,
      \ 'refresh_always' : v:false,
      \})


" limit only to deoplete-zsh when in deol buffer
call deoplete#custom#option('sources', {  'zsh': ['zsh'], })

