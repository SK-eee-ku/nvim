augroup Beautifytype
  "for javascript
  autocmd FileType javascript noremap <buffer> <leader>aj :call JsBeautify()<cr>
  " for json
  autocmd FileType json noremap <buffer> <leader>aj :call JsonBeautify()<cr>
  " for jsx
  autocmd FileType jsx noremap <buffer> <leader>aj :call JsxBeautify()<cr>
  " for html
  autocmd FileType html noremap <buffer> <leader>aj :call HtmlBeautify()<cr>
  " for css or scss
  autocmd FileType css noremap <buffer> <leader>aj :call CSSBeautify()<cr>
augroup END
