filetype plugin indent off
" map space to leader
let mapleader = "\<Space>"
" let localleader = "\\"

let OSTYPE=substitute(system("uname"), '\n', '', 'g')

"plugin settings
let s:cache_home = expand('~/.config/nvim')
let s:dein_dir = s:cache_home . '/dein'
let s:dein_repo_dir = s:dein_dir . '/repos/github.com/Shougo/dein.vim'
if !isdirectory(s:dein_repo_dir)
  call system('git clone https://github.com/Shougo/dein.vim ' . shellescape(s:dein_repo_dir))
endif
let &runtimepath = s:dein_repo_dir .",". &runtimepath
let g:python3_host_prog = substitute(system("which python3"), '\n', '', 'g')
" let g:python3_host_prog="/home/skondo/anaconda3/bin/python3"

let g:dein#types#git#clone_depth = 1
if dein#load_state(s:dein_dir)
  call dein#begin(s:dein_dir)
  " locate toml directory beforehand
  let g:rc_dir    = s:cache_home . '/toml'
  let s:toml      = g:rc_dir . '/dein.toml'
  let s:lazy_toml = g:rc_dir . '/dein_lazy.toml'

  " read toml file and cache them
  call dein#load_toml(s:toml,      {'lazy': 0})
  call dein#load_toml(s:lazy_toml, {'lazy': 1})

  call dein#end()
  call dein#save_state()
endif

if has('vim_starting') && dein#check_install()
  call dein#install()
endif

" tmux cursor shape setting
if exists('$TMUX')
  let &t_SI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=1\x7\<Esc>\\"
  let &t_EI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=0\x7\<Esc>\\"
else
  let &t_SI = "\<Esc>]50;CursorShape=1\x7"
  let &t_EI = "\<Esc>]50;CursorShape=0\x7"
endif

" if you can't type quickly, change this.
set timeoutlen=400

" update quickly
set updatetime=100

" show cursor line
set cursorline

" shada=viminfo
set shada=!,'100,<0,s10,h,%0

" do not include buffer info in session
set sessionoptions-=buffers

" file encoding
set encoding=utf-8 fileencodings=utf-8,ios-2022-jp,euc-jp,sjis,cp932

" use gui colors
if OSTYPE != "Darwin"
  set termguicolors
endif

" assign temporary file
set backupdir=~/.config/nvim/tmp//
set directory=~/.config/nvim/tmp//
set undodir=~/.config/nvim/tmp//
set viewdir=~/.config/nvim/tmp//

" don't use preview window; I prefer popup/floating window
set completeopt-=preview

set nf=alpha,octal,hex,bin

" search settings
set ignorecase smartcase incsearch nohlsearch nowrapscan

" line number settings
" set number
set relativenumber

" listchar settings
set list listchars=tab:»-,trail:~,extends:»,precedes:«,nbsp:%

" show double width characters properly
set ambiwidth=double

" always show finetabline,statusline
set showtabline=2 laststatus=2

" transparent popup window
set winblend=8 pumblend=12

" statusline settting
" set statusline=%<%f\ %m\ %r%h%w%{'['.(&fenc!=''?&fenc:&enc).']['.&ff.']['.&ft.']\ '}%{FugitiveStatusline()}%=\ col:%3v,\ line:%l/%L%8P\

" tab settings
" set tabstop=4 shiftwidth=4
set tabstop=2 shiftwidth=2
set smarttab smartindent expandtab

"日本語(マルチバイト文字)行の連結時には空白を入力しない
setlocal formatoptions+=mM

" show the result of command with split window
set inccommand=split

" don't fold by default
set foldlevel=99
" reserve two columns for fold
set foldcolumn=2

augroup fileType
  autocmd!
  autocmd filetype           python   setlocal foldmethod=syntax expandtab
  autocmd filetype           c,cpp    setlocal foldmethod=syntax expandtab
  autocmd filetype           go       setlocal tabstop=4 shiftwidth=4 noexpandtab | set formatoptions+=r
  autocmd filetype           tex      setlocal tabstop=4 shiftwidth=4 foldmethod=syntax noexpandtab nowrap conceallevel=0
  autocmd filetype           html     setlocal tabstop=4 shiftwidth=4 expandtab nowrap
  autocmd filetype           csv      setlocal tabstop=4 shiftwidth=4 nowrap noexpandtab
  autocmd filetype           text     setlocal tabstop=4 shiftwidth=4 noet noexpandtab
  autocmd filetype           help     setlocal listchars=tab:\ \  noet
  autocmd filetype           markdown setlocal tabstop=4 shiftwidth=4 noet noexpandtab wrap
  autocmd BufNewFile,BufRead *.grg    setlocal nowrap
  autocmd BufNewFile,BufRead *.jl     setf julia
augroup END

" vim-jsbeautifyの方に移動した
" augroup Beautifytype
"   "for javascript
"   autocmd FileType javascript noremap <buffer> <leader>aj :call JsBeautify()<cr>
"   " for json
"   autocmd FileType json noremap <buffer> <leader>aj :call JsonBeautify()<cr>
"   " for jsx
"   autocmd FileType jsx noremap <buffer> <leader>aj :call JsxBeautify()<cr>
"   " for html
"   autocmd FileType html noremap <buffer> <leader>aj :call HtmlBeautify()<cr>
"   " for css or scss
"   autocmd FileType css noremap <buffer> <leader>aj :call CSSBeautify()<cr>
" augroup END

augroup Binary
    au!
    au BufReadPre  *.bin let &bin=1

    au BufReadPost *.bin if &bin | %!xxd
    au BufReadPost *.bin set ft=xxd | endif

    au BufWritePre *.bin if &bin | %!xxd -r
    au BufWritePre *.bin endif

    au BufWritePost *.bin if &bin | %!xxd
    au BufWritePost *.bin set nomod | endif
augroup END


set backspace=eol,indent,start

set wildmenu
set wildmode=list:full
set wildignore=*.o,*.obj,*.pyc,*.so,*.dll

let g:python_highlight_all = 1

set clipboard+=unnamedplus



" use termdebug
packadd termdebug

set mouse=a

" add FileType
au BufNewFile,BufRead *.plt   setfiletype gnuplot
au BufNewFile,BufRead *.m     setfiletype matlab
au BufNewFile,BufRead *.csv   setfiletype csv
au BufNewFile,BufRead *.toml  setfiletype conf


"==========================================
"key mapping

tnoremap <silent> <C-c> <C-\><C-n>

"move to the end of a text after copying/pasting it
vnoremap <silent> y y`]
vnoremap <silent> p p`]
nnoremap <silent> p p`]

" Space+something to move to an end
noremap <leader>h ^
noremap <leader>l $
noremap <leader>k gg
noremap <leader>j G

" unmap s,space
nnoremap s <Nop>
nnoremap <Space> <Nop>
" window control
nnoremap ss :split<CR>
nnoremap sv :vsplit<CR>
" st is used by defx
nnoremap sc :tab sp<CR>
nnoremap sC :-tab sp<CR>
nnoremap sj <C-w>j
nnoremap sk <C-w>k
nnoremap sl <C-w>l
nnoremap sh <C-w>h
nnoremap sJ <C-w>J
nnoremap sK <C-w>K
nnoremap sL <C-w>L
nnoremap sH <C-w>H
nnoremap sZ :tabnew:terminal<CR>
nnoremap sn gt
nnoremap sp gT
nnoremap sr <C-w>r
nnoremap s= <C-w>=
nnoremap sO <C-w>=
nnoremap so <C-w>_<C-w>\|
nnoremap sq :<C-u>tabc<CR>

" move by display line
noremap j  gj
noremap k  gk
noremap gj j
noremap gk k

" add space
inoremap , ,<Space>

" do not copy when deleting by x
nnoremap x "_x

" swap t and /
" nnoremap t /
" nnoremap / t
" xnoremap t /
" xnoremap / t
" nnoremap T ?
" nnoremap ? T
" xnoremap T ?
" xnoremap ? T

" quit by q
tnoremap <silent> <leader>q  <C-\><C-n>:q<CR>
nnoremap <silent> <leader>q  :<C-u>q<CR>
nnoremap <silent> <leader>wq :qa<CR>
nnoremap <silent> <leader>Q  :qa<CR>

" center cursor when jumped
nnoremap m jzz
nnoremap M kzz
" This option is deprecated. Instead, cursor should be somewhat inside window
setlocal scrolloff=5

" increase and decrease by plus/minus
nnoremap +  <C-a>
nnoremap -  <C-x>
vmap     g+ g<C-a>
vmap     g- g<C-x>

" switch quote and backquote
" nnoremap ' `
" nnoremap ` '

" save with <C-g> in insert mode
inoremap <C-g> <ESC>:update<CR>a

"save by <leader>s
nnoremap <silent> <leader>s :<C-u>update<CR>
nnoremap <silent> <leader>ws :<C-u>wall<CR>

"reload init.vim
nnoremap <silent> <leader>r :<C-u>so ~/.config/nvim/init.vim<CR>

"open init.vim in new tab
nnoremap <silent> <leader>fed :tabnew<CR>:<C-u>e ~/.config/nvim/init.vim<CR>

" grep
nnoremap <leader>vv :vimgrep // %:p:h/*<Left><Left><Left><Left><Left><Left><Left><Left><Left>

" recursive search
let s:use_vim_grep = 0
if s:use_vim_grep
    nnoremap <leader>vr :vimgrep // %:p:h/**<Left><Left><Left><Left><Left><Left><Left><Left><Left><Left>
else
    set grepprg=rg\ --vimgrep\ --no-heading\ -uuu
    nnoremap <leader>vr :grep -e ""<Left>
endif

" quickfix jump
nnoremap [q :cprevious<CR>   " 前へ
nnoremap ]q :cnext<CR>       " 次へ
nnoremap [Q :<C-u>cfirst<CR> " 最初へ
nnoremap ]Q :<C-u>clast<CR>  " 最後へ

"window-local quickfix jump
nnoremap [w :lprevious<CR>   " 前へ
nnoremap ]w :lnext<CR>       " 次へ
nnoremap [W :<C-u>lfirst<CR> " 最初へ
nnoremap ]W :<C-u>llast<CR>  " 最後へ

" In quickfix window...
" augroup QuickfixWindow
"     autocmd!
"     autocmd filetype qf nnoremap <buffer>p <CR>zz<C-w>j
"     autocmd filetype qf unmap j
"     autocmd filetype qf unmap k
" augroup END

" one push to add/remove tabs
nnoremap > >>
nnoremap < <<
" select again after tab action
vnoremap > >gv
vnoremap < <gv

" tagsジャンプの時に複数ある時は一覧表示
nnoremap <C-]> g<C-]>
""
" insert mode keymappings for japanese input convenience
" 単語移動：ctrl-f/bのとき補完ウィンドウを閉じる
inoremap <silent> <expr> <C-b> pumvisible() ? "<C-r>=deoplete#close_popup()<CR><C-r>=ExecExCommand('normal b')<CR>" : "<C-r>=ExecExCommand('normal b')<CR>"
inoremap <silent> <expr> <C-f> pumvisible() ? "<C-r>=deoplete#close_popup()<CR><C-r>=ExecExCommand('normal w')<CR>" : "<C-r>=ExecExCommand('normal w')<CR>"
" 行移動
inoremap <silent> <expr> <C-p> "<C-r>=ExecExCommand('normal k')<CR>"
inoremap <silent> <expr> <C-n> "<C-r>=ExecExCommand('normal j')<CR>"

function! ExecExCommand(cmd)
  silent exec a:cmd
  return ''
endfunction

"コマンドラインでのキーバインドをEmacs風に
" 行頭へ移動
" cnoremap <C-A> <Home>
" inoremap <C-A> <Home>
" 行末へ移動
" cnoremap <C-E> <End>
" inoremap <C-E> <End>

set signcolumn=yes

set matchpairs+=「:」,（:）

" 最後に設定
filetype plugin indent on
syntax enable

" key mapping
nnoremap<silent> gss :SaveSession<CR>
nnoremap<silent> gsl :LoadSession<CR>
nnoremap<silent> gsc :CleanUpSession<CR>
let g:gitsession_tmp_dir = expand("~/.config/nvim/tmp/gitsession")

" ==================================
" 追加設定
set conceallevel=0

" colorscheme
set t_Co=256

" 分割の位置
set splitbelow
set splitright

" ==================================
" 追加キーマップ
nnoremap <Leader>x :QuickRun<CR>
inoremap <silent>jj <ESC>
nnoremap O ko<ESC>

augroup keymaps
  autocmd!
  autocmd FileType csv imap , ,
  autocmd FileType tex imap @ \
augroup END



