let g:ale_sign_column_always=1
let g:ale_lint_on_save=1
let g:ale_lint_on_text_changed=1
let g:ale_lint_on_enter=0
let g:ale_open_list=0

nnoremap <leader>lf :ALEFix<CR>
nnoremap <leader>ll :ALELint<CR>
nnoremap <leader>li :ALEDetail<CR>
nnoremap ]a :ALENext<CR>
nnoremap [a :ALEPrevious<CR>

" python
let g:ale_fixers = {
            \'*': ['trim_whitespace','remove_trailing_lines'],
            \'python': ['autopep8', 'black', 'isort'],
            \}

let g:ale_linters={
      \ 'python' : ['flake8'],
      \}

let g:ale_python_flake8_executable= g:python3_host_prog
let g:ale_python_flake8_options = '-m flake8 --import-order-style pep8 --max-line-length 99 --ignore=E203,W503,W504'
let g:ale_python_autopep8_executable = g:python3_host_prog
let g:ale_python_autopep8_options = '-m autopep8'
let g:ale_python_isort_executable = g:python3_host_prog
let g:ale_python_isort_options = '-m isort -sl'
let g:ale_python_black_executable = g:python3_host_prog
let g:ale_python_black_options = '-m black'
