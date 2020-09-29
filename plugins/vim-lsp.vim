let g:lsp_log_verbose=1
let g:lsp_fog_file=expand('~/.config/nvim/vim-lsp.log')

let g:lsp_fold_enabled=0
" let g:lsp_signs_enabled=1
" let g:lsp_diagnostics_echo_sursor=1

if executable('clangd')
  au User lsp_setup call lsp#register_server({
        \ 'name': 'clangd', 
        \ 'cmd': {server_info->['clangd']}, 
        \ 'whitelist': ['c', 'cpp'], 
        \})
endif

function! s:on_lsp_buffer_enabled() abort
  setlocal signcolumn=yes

  " keymappings
  nnoremap <buffer> <Leader>lh <Plug>(lsp-hover)
  nnoremap <buffer> <Leader>ld <Plug>(lsp-definition)
  nnoremap <buffer> <Leader>lr <Plug>(lsp-rename)
  nnoremap <buffer> <Leader>lf <Plug>(lsp-document-format)
endfunction

augroup lsp_install
  au!
  autocmd User lsp_buffer_enabled call s:on_lsp_buffer_enabled()
augroup END


