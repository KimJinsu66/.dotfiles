syntax on

" ==================================
" setting
" ==================================
set history=1000
set timeoutlen=100
set ttimeoutlen=50
set autoread
set autowrite
set mouse=a
set ruler
set hlsearch
set incsearch
set number
set background=dark
set encoding=utf8
set shiftwidth=2
set tabstop=2
set smartindent
set splitright

" =============================
" self settings
" ============================
let g:loaded_matchparen=1
set nolist
set lazyredraw
set ttyfast
set synmaxcol=150
set showcmd
set laststatus=2
set smartcase
set autoindent
set expandtab
set clipboard=unnamed
set colorcolumn=100
set backspace=indent,eol,start
set nocompatible
set nocursorline

" ==============================
" vim file
" ==============================
if filereadable(expand('~/.vimrc_macros'))
  source $HOME/.vimrc_macros
endif

if filereadable(expand('~/.vimrc.keymap'))
  source $HOME/.vimrc.keymap
endif

if filereadable(expand('~/vim-include/set_quickfix.vim'))
  source $HOME/vim-include/set_quickfix.vim
endif

if filereadable(expand('~/vim-include/ag_unite.vim'))
  source $HOME/vim-include/ag_unite.vim
endif

if filereadable(expand('~/vim-include/search_by_google.vim'))
  source $HOME/vim-include/search_by_google.vim
endif

" aliases設定ファイル
let $BASH_ENV = "~/.bash_aliases"

" ===============================
" Key map
" ===============================
noremap <Up> <Nop>
noremap <Down> <Nop>
noremap <Left> <Nop>
noremap <Right> <Nop>
nnoremap <C-j> 5j
nnoremap <C-k> 5k
" nnoremap <C-h> 5h
nnoremap <C-l> 5l
inoremap <silent> jj <ESC>
nnoremap yt viwy
nnoremap yr viw"1y
" nnoremap yt "2yy
nnoremap yr viw"1y
nnoremap y1 "1yy
nnoremap y2 "2yy
nnoremap <C-r>1 "1p
nnoremap <C-r>2 "2p
nnoremap <C-w>g <C-w>gt
nnoremap <C-w>2 <C-w>gT
nnoremap <C-w>t :tab term<CR>
nnoremap <C-w>e :term<CR>
nnoremap <C-w>gd :term ++close git diff<CR>
nnoremap <silent><S-TAB> <C-w>:<c-u>tabNext<cr>
nmap ,t :echo 'test'<CR>
" nnoremap yl :let @+ = substitute(expand('%'), 'spec/', "bin/rspec spec/", "g")<cr>
nnoremap yl :let @+ = 'bin/rspec' . ' ' . expand('%')<cr>
nnoremap y; :let @+ = expand('%')<cr>
nnoremap yk viwy: %s/

" ===============================
" サイズ変更
" ===============================
nnoremap <Tab>l 10<C-w>>
nnoremap <Tab>h 10<C-w><
nnoremap <Tab>k 10<C-w>+
nnoremap <Tab>j 10<C-w>-

" ===============================
" command
" ===============================
command! TT :tab term

" ===============================
" buffers
" ===============================
nnoremap bn :bnext<CR>
nnoremap bm :bprevious<CR>

" ===============================
" Change Tree Icon
" ===============================
nmap <C-n> :NERDTreeToggle<CR>
let g:NERDTreeDirArrowExpandable = '▸'
let g:NERDTreeDirArrowCollapsible = '▾'
let mapleader="\\"

map <Leader>nt <ESC>:NERDTree<CR>
let NERDTreeWinSize=40
let g:NERDTreeLimitedSyntax = 1

" ===============================
" vim-indent-guides
" ===============================
let g:indent_guides_enable_on_vim_startup = 1

" ===============================
" plugin追加(~/.vim/plugged foldにインストールされる)
" ===============================
call plug#begin('~/.vim/plugged')

Plug 'scrooloose/nerdtree'
Plug 'airblade/vim-gitgutter'
Plug 'nathanaelkane/vim-indent-guides'
Plug 'mattn/emmet-vim'
Plug 'tpope/vim-rails'
Plug 'tpope/vim-endwise'
Plug 'tpope/vim-surround'
Plug 'bronson/vim-trailing-whitespace'
Plug 'kamykn/spelunker.vim' " spell チェック
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'rking/ag.vim'
Plug 'w0rp/ale'
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'
Plug 'thoughtbot/vim-rspec'
Plug 'tpope/vim-dadbod'
Plug 'kristijanhusak/vim-dadbod-ui'
Plug 'tpope/vim-fugitive'
Plug 'vim-airline/vim-airline'
Plug 'szw/vim-tags'
" =========================
" 현재 사용하지 않음
" =========================
" Plug 'Shougo/vimproc.vim', {'do' : 'make'}
" ファイルオープンを便利に
" Plug 'Shougo/unite.vim'
" Plug 'Shougo/vimfiler'
" Plug 'Shougo/vimproc'
" Plug 'jistr/vim-nerdtree-tabs'
" Plug 'pechorin/any-jump.vim'
" Plug 'Shougo/neomru.vim'
" Unite.vimで最近使ったファイルを表示できるようにする
" Plug 'lambdalisue/fern.vim'
" Plug 'majutsushi/tagbar'
" Plug 'vim-airline/vim-airline-themes'
" Plug 'mileszs/ack.vim'
" Plug 'plasticboy/vim-markdown'
" Plug 'iamcco/markdown-preview.vim'
" Plug 'iamcco/mathjax-support-for-mkdp'
" Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'skanehira/preview-markdown.vim'
call plug#end()

" ================================
" clolr追加
" ================================
colorscheme jellybeans
" colorscheme molokai
" colorscheme solarized
" set background=dark

" ======================
" ctags
" ======================
set tags=./app/tags;/
" ctags -R --exclude=.git --exclude=javascript --exclude=assets


" ======================
" fzf
" ======================
let $FZF_DEFAULT_OPTS="--layout=reverse"

 command! -bang -nargs=* Rg
       \ call fzf#vim#grep(
       \   "rg -g '!design/' -g '!dist/' -g '!pnpm-lock.yaml' -g '!.git' -g '!node_modules' -g '!tags' -g '!.rubocop_todo.yml' -g '!vender' -g '!.gitignore' -g '!.circleci' -g '!jinsu_directory' --column --line-number --hidden --smart-case --no-heading --color=always ".shellescape(<q-args>), 1,
       \   <bang>0 ? fzf#vim#with_preview({'options': '--delimiter : --nth 4..'}, 'up:60%')
       \           : fzf#vim#with_preview({'options': '--delimiter : --nth 4.. -e'}, 'right:50%', '?'),
       \   <bang>0)
let g:fzf_layout = {'up':'~90%', 'window': { 'width': 0.8, 'height': 0.8,'yoffset':0.5,'xoffset': 0.5, 'border': 'sharp' } }
let g:fzf_preview_window = 'right:50%'

let mapleader = "\<Space>"
nnoremap <silent> <leader>f :Files<CR>
nnoremap <silent> <leader>g :GFiles<CR>
nnoremap <silent> <leader>G :GFiles?<CR>
nnoremap <silent> <leader>b :Buffers<CR>
nnoremap <silent> <leader>h :History<CR>
nnoremap <silent> <leader>r :Rg<CR>
nnoremap <silent> <leader>c viwy :Rg<CR>
nnoremap <silent> <leader>t :source ~/Desktop/products/verdandi/.script/jisnu_rspec.vim<CR>

" ===================
" vim-railse
" ===================

nnoremap 1r :Einitializer<CR>
nnoremap 1c :Econtroller<CR>
nnoremap 1e :Emodel<CR>
nnoremap 1s :Eschema<CR>

" ===================
" vimgrep
" ===================

" 前へ
nnoremap [q :cprevious<CR>
" 次へ
nnoremap ]q :cnext<CR>
" 最初へ
nnoremap [Q :<C-u>cfirst<CR>
" 最後へ
nnoremap ]Q :<C-u>clast<CR>

" ===================
" customize
" ===================

" yarkをした行で作業できるようにする
vnoremap y y`>

" ===================
" quick
" ===================
autocmd QuickFixCmdPost *grep* cwindow


filetype plugin on

" ===================
" ale
" ===================
let g:ale_linters = {
\ 'ruby': ['rubocop'],
\}

let g:ale_ruby_rubocop_executable = './rubocop'
let g:ale_ruby_rubocop_auto_correct_all = 1
" let g:ale_fix_on_save = 1
" let g:ale_linters_explicit = 1
" let g:airline#extensions#ale#enabled = 1

" let g:ale_filename_mappings = {
"   \ 'rubocop': [
"   \   ['~/dotfiles/scripts', '/opt']
"   \ ],
"   \}

" =============================
" vimrc
" =============================
" let $BASH_ENV = "~/.zshrc"
" set shell=zsh\ -l
set shell=zsh

function! ProfileCursorMove() abort
  let profile_file = expand('~/log/vim-profile.log')
  if filereadable(profile_file)
    call delete(profile_file)
  endif

  normal! gg
  normal! zR

  execute 'profile start ' . profile_file
  profile func *
  profile file *

  augroup ProfileCursorMove
    autocmd!
    autocmd CursorHold <buffer> profile pause | q
  augroup END

  for i in range(100)
    call feedkeys('j')
  endfor
endfunction

" =============================
" sp 速度改善コード
" Use vsplit mode
" =============================
if has("vim_starting") && !has('gui_running') && has('vertsplit')
  function! EnableVsplitMode()
    " enable origin mode and left/right margins
    let &t_CS = "y"
    let &t_ti = &t_ti . "\e[?6;69h"
    let &t_te = "\e[?6;69l\e[999H" . &t_te
    let &t_CV = "\e[%i%p1%d;%p2%ds"
    call writefile([ "\e[?6;69h" ], "/dev/tty", "a")
  endfunction

  " old vim does not ignore CPR
  map <special> <Esc>[3;9R <Nop>

  " new vim can't handle CPR with direct mapping
  " map <expr> ^[[3;3R EnableVsplitMode()
  set t_F9=^[[3;3R
  map <expr> <t_F9> EnableVsplitMode()
  let &t_RV .= "\e[?6;69h\e[1;3s\e[3;9H\e[6n\e[0;0s\e[?6;69l"
endif

let g:ag_qhandler="copen 15"

" =============================
" NerdTree Tab機能
" https://qiita.com/wadako111/items/755e753677dd72d8036d
" ============================

map  <C-l> :tabn<CR>
map  <C-h> :tabp<CR>

" Anywhere SID.
function! s:SID_PREFIX()
  return matchstr(expand('<sfile>'), '<SNR>\d\+_\zeSID_PREFIX$')
endfunction

" Set tabline.
function! s:my_tabline()  "{{{
  let s = ''
  for i in range(1, tabpagenr('$'))
    let bufnrs = tabpagebuflist(i)
    let bufnr = bufnrs[tabpagewinnr(i) - 1]  " first window, first appears
    let no = i  " display 0-origin tabpagenr.
    let mod = getbufvar(bufnr, '&modified') ? '!' : ' '
    let title = fnamemodify(bufname(bufnr), ':t')
    let title = '[' . title . ']'
    let s .= '%'.i.'T'
    let s .= '%#' . (i == tabpagenr() ? 'TabLineSel' : 'TabLine') . '#'
    let s .= no . ':' . title
    let s .= mod
    let s .= '%#TabLineFill# '
  endfor
  let s .= '%#TabLineFill#%T%=%#TabLine#'
  return s
endfunction "}}}
let &tabline = '%!'. s:SID_PREFIX() . 'my_tabline()'
set showtabline=2 " 常にタブラインを表示

" ================================
" vim Tab
" ================================

" The prefix key.
nnoremap [Tag]   <Nop>
nmap t [Tag]

" Tab jump
for n in range(1, 9)
  execute 'nnoremap <silent> [Tag]'.n  ':<C-u>tabnext'.n.'<CR>'
endfor
" t1 で1番左のタブ、t2 で1番左から2番目のタブにジャンプ

map <silent> [Tag]c :tablast <bar> tabnew<CR>
" tc 新しいタブを一番右に作る
map <silent> [Tag]x :tabclose<CR>
" tx タブを閉じる
map <silent> [Tag]n :tabnext<CR>
" tn 次のタブ
map <silent> [Tag]p :tabprevious<CR>
" tp 前のタブ


" ============================
" customize
" ===========================
map <silent> :ca :s/_\(.\)/\u\1/g
map <silent> :sn : %s/\v([a-z]\@=)([A-Z])/\1_\l\2/g


" ===========================
" UltiSnips
" ==========================
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<tab>"
let g:UltiSnipsJumpBackwardTrigger="<s-tab>"
let g:UltiSnipsEditSplit="vertical"
