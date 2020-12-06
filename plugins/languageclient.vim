let g:LanguageClient_settingsPath = expand('~/.config/nvim/lc_settings.json')
let g:LanguageClient_selectionUI = "location-list"
let g:LanguageClient_diagnosticsList = "Location"
let g:LanguageClient_hasSnippetSupport=0

" let g:LanguageClient_loggingFile = expand('~/.config/nvim/LC.log')
" let g:LanguageClient_loggingLevel='DEBUG'


" 言語ごとに設定する
let g:LanguageClient_serverCommands={}

" c/cpp
if executable('clangd')
    let g:LanguageClient_serverCommands['c'] = ['clangd']
    let g:LanguageClient_serverCommands['cpp'] = ['clangd']
elseif executable('clangd-9')
    let g:LanguageClient_serverCommands['c'] = ['clangd-9']
    let g:LanguageClient_serverCommands['cpp'] = ['clangd-9']
endif

" python
if executable('pyls')
    let g:LanguageClient_serverCommands['python'] = ['pyls']
endif

" css/typescript
if executable('css-languageserver')
    let g:LanguageClient_serverCommands['css'] = ['css-languageserver', '--stdio']
    let g:LanguageClient_serverCommands['scss'] = ['css-languageserver', '--stdio']
    let g:LanguageClient_serverCommands['sass'] = ['css-languageserver', '--stdio']
endif

if executable("typescript-language-server")
  let g:LanguageClient_serverCommands['javascript']=['typescript-language-server', '--stdio']
  let g:LanguageClient_serverCommands['typescript']=['typescript-language-server', '--stdio']
endif

" golang
if executable(expand('~/go/bin/gopls'))
    let g:LanguageClient_serverCommands['go'] = ["gopls"]
endif
if executable(expand('~/go/bin/go-langserver'))
    let g:LanguageClient_serverCommands['go'] = [expand('~/go/bin/go-langserver'), '-gocodecompletion']
endif

" ruby
if executable("solargraph")
  let g:LanguageClient_serverCommands['ruby']=['solargraph', 'stdio']
endif

" julia
" let g:default_julia_version='1.3'
" let g:LanguageClient_serverCommands['julia'] =  ['julia', '--startup-file=no', '--history-file=no', '-e', ' using LanguageServer; using Pkg; import StaticLint; import SymbolServer; env_path = dirname(Pkg.Types.Context().env.project_file); debug = false; server = LanguageServer.LanguageServerInstance(stdin, stdout, debug, env_path, "", Dict()); server.runlinter = true; run(server);']

" other settings
let g:LanguageClient_useVirtualText = "CodeLens"

function! LC_maps()
    if has_key(g:LanguageClient_serverCommands, &filetype)
        nnoremap <buffer> <silent> K          :call LanguageClient#textDocument_hover()<CR>
        nnoremap <buffer> <silent> <Leader>lh :call LanguageClient_textDocument_hover()<CR>
        nnoremap <buffer> <silent> <Leader>ld :call LanguageClient_textDocument_definition()<CR>
        nnoremap <buffer> <silent> <Leader>li :call LanguageClient_textDocument_implementation()<CR>
        nnoremap <buffer> <silent> <Leader>lr :call LanguageClient_textDocument_rename()<CR>
        nnoremap <buffer> <silent> <Leader>lf :call LanguageClient_textDocument_formatting()<CR>
        nnoremap <buffer> <silent> gf         :call LanguageClient_textDocument_formatting()<CR>
        nnoremap <buffer> <silent> <Leader>lu :call LanguageClient_textDocument_references()<CR>
        nnoremap <buffer> <silent> <Leader>ls :call LanguageClient_textDocument_documentSymbol()<CR>
    endif
endfunction

autocmd FileType * call LC_maps()

" augroup lcHighlight
"     autocmd!
"     autocmd CursorHold,CursorHoldI *.c,*.cpp call LanguageClient#textDocument_documentHighlight()
" augroup END
