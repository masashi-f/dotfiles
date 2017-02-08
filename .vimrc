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
NeoBundle 'tyru/caw.vim.git'
NeoBundle 'Shougo/neocomplete.vim'

" Disable AutoComplPop.
let g:acp_enableAtStartup = 0
" Use neocomplete.
let g:neocomplete#enable_at_startup = 1
" Use smartcase.
let g:neocomplete#enable_smart_case = 1
" Set minimum syntax keyword length.
let g:neocomplete#sources#syntax#min_keyword_length = 3
let g:neocomplete#lock_buffer_name_pattern = '\*ku\*'

" Define dictionary.
let g:neocomplete#sources#dictionary#dictionaries = {
    \ 'default' : '',
    \ 'vimshell' : $HOME.'/.vimshell_hist',
    \ 'scheme' : $HOME.'/.gosh_completions'
        \ }

" Define keyword.
if !exists('g:neocomplete#keyword_patterns')
    let g:neocomplete#keyword_patterns = {}
endif
let g:neocomplete#keyword_patterns['default'] = '\h\w*'

" Plugin key-mappings.
inoremap <expr><C-g>     neocomplete#undo_completion()
inoremap <expr><C-l>     neocomplete#complete_common_string()

" Recommended key-mappings.
" <CR>: close popup and save indent.
inoremap <silent> <CR> <C-r>=<SID>my_cr_function()<CR>
function! s:my_cr_function()
    return (pumvisible() ? "\<C-y>" : "" ) . "\<CR>"
    " For no inserting <CR> key.
    "return pumvisible() ? "\<C-y>" : "\<CR>"
endfunction

" <TAB>: completion.
inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"
" <C-h>, <BS>: close popup and delete backword char.
inoremap <expr><C-h> neocomplete#smart_close_popup()."\<C-h>"
inoremap <expr><BS> neocomplete#smart_close_popup()."\<C-h>"
" Close popup by <Space>.
"inoremap <expr><Space> pumvisible() ? "\<C-y>" : "\<Space>"

" AutoComplPop like behavior.
"let g:neocomplete#enable_auto_select = 1

" Shell like behavior(not recommended).
"set completeopt+=longest
"let g:neocomplete#enable_auto_select = 1
"let g:neocomplete#disable_auto_complete = 1
"inoremap <expr><TAB>  pumvisible() ? "\<Down>" : "\<C-x>\<C-u>"
"
" Enable omni completion.
autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags

" Enable heavy omni completion.
if !exists('g:neocomplete#sources#omni#input_patterns')
    let g:neocomplete#sources#omni#input_patterns = {}
endif
"let g:neocomplete#sources#omni#input_patterns.php = '[^.\t]->\h\w*\|\h\w*::'
"let g:neocomplete#sources#omni#input_patterns.c = '[^.[:digit:]*\t]\%(\.\|->\)'
"let g:neocomplete#sources#omni#input_patterns.cpp = '[^.[:digit:]*\t]\%(\.\|->\)\|\h\w*::'

" For perlomni.vim setting.
" https://github.com/c9s/perlomni.vim
let g:neocomplete#sources#omni#input_patterns.perl ='\h\w*->\h\w*\|\h\w*::'

"NeoBundleLazy "davidhalter/jedi-vim", {
"    \ "autoload": { "filetypes":["python", "python3","djangohtml"] }}

"nmap <C-k> <Plug>(caw::i:toggle)
"vmap <C-K> <Plug>(caw::i:toggle)

"Jedi for python
"if ! empty(neobundle#get("jedi-vim"))
"    let g:jedi#auto_initialization = 1
"    let g:jedi#auto_vim_configuration = 1
"
"    nnoremap [jedi] <Nop>
"    xnoremap [jedi] <Nop>
"    nmap <Leader>j [jedi]
"    xmap <Leader>j [jedi]

"    let g:jedi#completions_command = "<C-Space>"
"    let g:jedi#goto_assignments_command = "<C-g>"
"    let g:jedi#goto_definitions_command = "<C-d>"
"    let g:jedi#documentation_command = "<C-k>"
"    let g:jedi#rename_command = "[jedi]r"
"    let g:jedi#usages_command = "[jedi]n"
"    let g:jedi#popup_select_first = 0
"    let g:jedi#popup_on_dot = 0

"    autocmd FileType python setlocal completeopt-=preview

    " for w/ neocomplete
"    if ! empty(neobundle#get("neocomplete.vim"))
"        autocmd FileType python setlocal omnifunc=jedi#completions
"        let g:jedi#completions_enabled = 0
"        let g:jedi#auto_vim_configuration = 0
"        let g:neocomplete#force_omni_input_patterns.python = \ '\%([^. \t]\.\|^\s*@\|^\s*from\s.\+import \|^\s*from \|^\s*import \)\w*'
"    endif
"endif

"let g:syntastic_mode_map = {
"    \ 'mode' : 'active',
"    \ 'active_filetypes' : [ 'sh', 'vim' ],
"    \ 'passive_filetypes' : [ 'python' ]
"    \ }

filetype plugin indent on

call neobundle#end()
NeoBundleCheck
"End NeoBundle Scripst-----------------------------------------------------

" カラースキーマを変更する
" 後始末もちゃんとする
let s:saved_t_Co=&t_Co
set t_Co=256

" Restore t_Co for less command after vim quit
augroup restore_t_Co
    autocmd!
    if s:saved_t_Co == 8
        autocmd VimLeave * let &t_Co = 256
    else
        autocmd VimLeave * let &t_Co = 8
    endif 
    autocmd VimLeave * let &t_Co = s:saved_t_Co
augroup END

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

