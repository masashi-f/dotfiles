"NeoBundle Scripts----------------------------
if $compatible
    set nocompatible
endif

set runtimepath^=~/.vim/bundle/neobundle.vim/

call neobundle#begin(expand('~/.vim/bundle'))

NeoBundleFetch 'Shougo/neobundle.vim'

" Add or remove your Bundles here
NeoBundle 'Shougo/neocomplcache'
NeoBundle 'Shougo/neosnippet.vim'
NeoBundle 'Shougo/neosnippet-snippets'
NeoBundle 'ctrlpvim/ctrlp.vim'
NeoBundle 'flazz/vim-colorschemes'
NeoBundle 'Shougo/vimshell'
NeoBundle 'kevinw/pyflakes-vim'
NeoBundleLazy "davidhalter/jedi-vim", {
    \ "autoload": { "filetypes":["python", "python3","djangohtml"] }}

"Jedi for python
if ! empty(neobundle#get("jedi-vim"))
    let g:jedi#auto_initialization = 1
    let g:jedi#auto_vim_configuration = 1

    nnoremap [jedi] <Nop>
    xnoremap [jedi] <Nop>
    nmap <Leader>j [jedi]
    xmap <Leader>j [jedi]

    let g:jedi#completions_command = "<C-Space>"
    let g:jedi#goto_assignments_command = "<C-g>"
    let g:jedi#goto_definitions_command = "<C-d>"
    let g:jedi#documentation_command = "<C-k>"
    let g:jedi#rename_command = "[jedi]r"
    let g:jedi#usages_command = "[jedi]n"
    let g:jedi#popup_select_first = 0
    let g:jedi#popup_on_dot = 0

    autocmd FileType python setlocal completeopt-=preview

    " for w/ neocomplete
    if ! empty(neobundle#get("neocomplete.vim"))
        autocmd FileType python setlocal omnifunc=jedi#completions
        let g:jedi#completions_enabled = 0
        let g:jedi#auto_vim_configuration = 0
        let g:neocomplete#force_omni_input_patterns.python = \ '\%([^. \t]\.\|^\s*@\|^\s*from\s.\+import \|^\s*from \|^\s*import \)\w*'
    endif
endif

let g:syntastic_mode_map = {
    \ 'mode' : 'active',
    \ 'active_filetypes' : [ 'sh', 'vim' ],
    \ 'passive_filetypes' : [ 'python' ]
    \ }

filetype plugin indent on

call neobundle#end()
NeoBundleCheck
"End NeoBundle Scripst-----------------------------------------------------

"カラースキーマを変更する
set t_Co=256

if &t_Co > 2 || has("gui_running")
	"シンタックスハイライトを有効にする
	syntax on
	"検索結果文字列のハイライトを有効にする
	set hlsearch
endif
	

"カラースキーマ設定
colorscheme molokai

" ウィンドウ枠にタイトルを表示する
set title

"入力中のコマンドをステータスに表示する
set showcmd

"エディタウィンドウの末尾から２行目にステータスラインを常時表示させるための指定
set laststatus=2
set statusline=%F%m%r%h%w\ [FORMAT=%{&ff}]\ [TYPE=%Y]\ [ASCII=\%03.3b]\ [HEX=\%02.2B]\ [LEN=%L]%=
set statusline+=[%4l,%3c]\ [%3p%%]
set ambiwidth=double

"タブを4文字に設定する
set tabstop=4
"タブをスペースに変換する
set expandtab
set softtabstop=4
"ファイル読み込み時にタブをスペース4文字に変換する
set shiftwidth=4
"スマートインデントを有効にする
set smartindent
"C言語スタイルのインデント
set cindent


"エンコーディングの設定
set encoding=utf8
"ファイルを開いたときのエンコーディングを設定する
set fileencodings=utf-8,euc-jp,iso-2022-jp,cp932

"行番号を表示する
set number

"ルーラーを設定する
set ruler

"
set list

"
set listchars=tab:»-,trail:-,eol:↲,extends:»,precedes:«,nbsp:%

"
set nrformats-=octal

"
set whichwrap=b,s,[,],<,>

"
set backspace=indent,eol,start

"コマンドライン補完を拡張モードにする
set wildmenu

"括弧入力時の対応する括弧を表示する
set showmatch
"対応する括弧の表示時間を2秒に設定する
set matchtime=2

"クリップボードを使用する
set clipboard=unnamed





set ignorecase
set smartcase
set wrapscan







autocmd BufNewFile,BufRead *.rb nnoremap <C-e> :!ruby %
autocmd BufNewFile,BufRead *.py nnoremap <C-e> :!python %
autocmd BufNewFile,BufRead *.pl nnoremap <C-e> :!perl %

