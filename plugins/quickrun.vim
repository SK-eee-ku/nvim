" nnoremap rp :QuickRun<Space>python<Space>-outputter/buffer/split<Space>":botright"<Space>-outputter/buffer/close_on_empty<Space>1<Space>-hook/time/enable<Space>1<CR>

let g:quickrun_no_default_key_mappings=1

let g:quickrun_config = {}
let g:quickrun_config['gnuplot'] = {
    \ 'type' : 'gnuplot', 
    \ 'command' : 'gnuplot', 
    \ 'cmdopt' : '--persist', 
    \ 'exec' : 'cd %s:h;%c %s %o', 
    \}

let g:quickrun_config['matlab'] = {
    \ 'type' : 'matlab', 
    \ 'command' : 'octave', 
    \ 'exec' : 'cd %s:h;%c %s', 
    \}

let g:quickrun_config["c"]={
      \ 'type':
      \ executable('gcc')            ? 'c/gcc' :
      \ executable('clang')          ? 'c/clang' :
      \ executable('clang-9')        ? 'c/clang-9' : '',
      \}

let g:quickrun_config["cpp"]={
      \ 'type':
      \ executable('clang++')        ? 'cpp/clang++'  :
      \ executable('clang++-9')      ? 'cpp/clang++-9'  :
      \ executable('g++')            ? 'cpp/g++' : '',
      \}

let g:quickrun_config['cpp/g++']={
      \ 'cmdopt' : '-std=c++17', 
      \}
let g:quickrun_config['c/gcc']={
      \ 'cmdopt' : '-std=c11', 
      \}

let g:quickrun_config['cpp/clang++-9']={
      \ 'command' : 'clang++-9', 
      \ 'cmdopt' : '-std=c++17', 
      \}
let g:quickrun_config['c/clang-9']={
      \ 'command' : 'clang-9', 
      \ 'cmdopt' : '-std=c11', 
      \}

let g:quickrun_config['tex']={
      \ 'type' : 'tex', 
      \ 'command' : 'latexmk', 
      \ 'exec' : '%c %s', 
      \}
