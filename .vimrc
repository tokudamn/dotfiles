"-------------------------------------------------------------------------------
" 内部エンコーディング設定
"-------------------------------------------------------------------------------
set encoding=utf-8                      " 内部エンコーディング



scriptencoding utf-8                    " このファイルのエンコード
set nocompatible                        " vi互換しない



"-------------------------------------------------------------------------------
" ファイルタイプ設定(off)
"-------------------------------------------------------------------------------
filetype off                            " ファイルタイプの自動検出off
filetype plugin off                     " ファイルタイプ別プラグインのロードoff
filetype indent off                     " ファイルタイプ別インデントのロードoff







"-------------------------------------------------------------------------------
" エンコーディング、ファイルフォーマット設定
"-------------------------------------------------------------------------------
set fileencoding=utf-8                                     " 基本文字コード
set fileencodings=utf-8,iso-2022-jp,cp932,sjis,euc-jp      " 文字コード自動判別(優先順)
set fileformat=unix                     " 基本ファイルフォーマット
set fileformats=unix,dos,mac            " ファイルフォーマット自動判別(優先順)



"-------------------------------------------------------------------------------
" システム設定
"-------------------------------------------------------------------------------
set nobackup                            " backupファイルを作らない
"set writebackup                         " ファイルの上書きの前にbackupファイルを作る
"                                        " nobackupの場合は、上書きに成功したら削除される
"set backupdir=~/vimfiles/backup         " backupファイルディレクトリ
set noswapfile                          " swapファイルを作らない
"set directory=~/vimfiles/swap           " swapファイルディレクトリ
set viminfo=                            " viminfoファイルを作らない

set confirm                             " 保存されていないファイルがあるとき、終了前に保存確認
set hidden                              " 保存されていないファイルがあるときでも、保存しないで他のファイルを表示
set autoread                            " 外部でファイルに変更がされた場合は読みなおす
set browsedir=buffer                    " ファイル保存時の場所を、開いているファイルが有る場所に設定

set noerrorbells                        " エラー音抑止(gvimはgvimrcで指定)
set novisualbell                        " ビジュアルベル抑止(gvimはgvimrcで指定)
set visualbell t_vb=                    " ビープ音抑止(gvimはgvimrcで指定)

set history=100                         " コマンド、検索履歴数
set infercase                           " 補完の際の大文字小文字の区別しない
set wildmenu                            " ファイル名補完有効
set wildmode=list:longest,full          " 補完モード
  "補完モード
  " ""              最初のマッチのみを補完する。
  " "full"          次のマッチを完全に補完する。最後のマッチの次には元の文字列が使われ、その次は再ｄ焦初のマッチが補完される
  " "longest"       共通する最長の文字列までが補完される。それ以上長い文字列を補完できないときは、次の候補に移る
  " "longest:full"  "longest" と似ていｎﾗ、'wildmenu' が有効ならばそれを開始する
  " "list"          複数のマッチがあるときは、全てのマッチを羅列する。
  " "list:full"     複数のマッチがあるときは、全てのマッチを羅列し、最初のマッチを補完する
  " "list:longest"  複数のマッチがあるときは、全てのマッチを羅列し、共通する最長の文字列までが補完される

"set shellslash                          " Windowsで"/"を有効
set virtualedit+=block                  " 矩形選択時に文字のないところでも選択可能



"-------------------------------------------------------------------------------
" 表示設定
"-------------------------------------------------------------------------------
set number                              " 行番号の表示
set ruler                               " 右下に行・列の番号を表示
set title                               " タイトル表示
set list                                " 不可視文字を表示
set listchars=eol:¬,tab:▸\ ,trail:-,extends:>,precedes:<,nbsp:%

set display=uhex                        " 表示できない文字を16進数で表示

set matchpairs& matchpairs+=<:>         " 対応括弧に<と>のペアを追加
set showmatch                           " 括弧の対応表示
set matchtime=1                         " 括弧の対応表示時間[1/10秒]

set laststatus=2                        " 常にステータスラインを表示
  "ステータスライン表示モード
  " "0"  一番下のウィンドウはステータスラインを表示しない
  " "1"  ウィンドウが1つの時はステータスラインを表示しない 2つ以上ある場合は、ステータスラインを表示する
  " "2"  常にステータスラインを表示する
set cmdheight=2                         " コマンドラインの高さ (gvimはgvimrcで指定)
set showcmd                             " 入力中のコマンドをステータスラインに表示

set cursorline                          " カーソル行をハイライト
set cursorcolumn                        " カーソル位置のカラムのハイライト
set colorcolumn=80                      " 80行目に色を付ける
"colorscheme desert                      " カラースキーマ(gvimはgvimrcで指定)

set scrolloff=5                         " 上下5行の視界を確保
set sidescrolloff=16                    " 左右スクロール時の視界を確保
set sidescroll=1                        " 左右スクロールは一文字・ﾂ行う
set backspace=indent,eol,start          " バックスペースでインデントや改行を削除可能
set whichwrap=b,s,h,l,<,>,[,]           " 左右移動で行跨ぎ可能

set nowrap                              " 折り返さない
set textwidth=0                         " テキストの最霜Zを無効にする

set ambiwidth=double                    " 全角記号（○、□等）の位置ズレ対応

set foldmethod=syntax
set foldlevel=1
set foldnestmax=2
augroup foldmethod-syntax
  autocmd!
  autocmd InsertEnter * if &l:foldmethod ==# 'syntax'
  \                   |   setlocal foldmethod=manual
  \                   | endif
  autocmd InsertLeave * if &l:foldmethod ==# 'manual'
  \                   |   setlocal foldmethod=syntax
  \                   | endif
augroup END



"-------------------------------------------------------------------------------
" 検索/置換設定
"-------------------------------------------------------------------------------
set ignorecase                          " 大/小文字無視
set smartcase                           " ただし大文字を含む検索の場合は大/小文字有効
set incsearch                           " インクリメンタルサーチ有効
set hlsearch                            " 検索結果ハイライト表示
set wrapscan                            " 検索をファイルの先頭へループする
set gdefault                            " 置換の時 g オプションをデフォルトで有効



"-------------------------------------------------------------------------------
" 編集
"-------------------------------------------------------------------------------
set clipboard=unnamed,autoselect        " OSクリップボード使用、選択時自動コピー

set tabstop=2                           " タブ幅
set softtabstop=2                       " タブ幅（編集時）
set shiftwidth=2                        " インデント幅

set smarttab                            " 行頭の<Tab>は"shiftwidth"、それ以外は"tabstop"
set shiftround                          " インデントをshiftwidthの倍数に丸める
set expandtab                           " タブの代わりにスペース
set autoindent                          " 前行に合わせてインデント
set smartindent                         " 前行の末尾に合わせてインデントを増減


"-------------------------------------------------------------------------------
" ランタイムパス設定
"-------------------------------------------------------------------------------
if !1 | finish | endif

if has('vim_starting')
    set nocompatible                    " Be iMproved

    " Required:
    set runtimepath+=~/vimfiles/bundle/neobundle.vim/
endif



"-------------------------------------------------------------------------------
" neobundle
"-------------------------------------------------------------------------------
call neobundle#begin(expand('~/vimfiles/bundle/'))

NeoBundle 'Shougo/neobundle.vim'
"NeoBundle 'Shougo/vimproc'
"NeoBundle 'Shougo/vimproc', {
"      \ 'build' : {
"      \     'windows' : 'make -f make_mingw32.mak',
"      \     'cygwin' : 'make -f make_cygwin.mak',
"      \     'mac' : 'make -f make_mac.mak',
"      \     'unix' : 'make -f make_unix.mak',
"      \    },
"      \ }
NeoBundle 'Shougo/unite.vim'
NeoBundle 'Shougo/vimfiler'
NeoBundle 'Shougo/vimshell'

" vim メモ
NeoBundle 'glidenote/memolist.vim'
NeoBundle 'fuenor/qfixgrep.git'

" ステータスラインのハイライト
NeoBundle 'itchyny/lightline.vim'

" markdown用
"NeoBundle 'kannokanno/previm'
"NeoBundle 'tyru/open-browser.vim'
NeoBundle "godlygeek/tabular"
NeoBundle "rcmdnk/vim-markdown-quote-syntax"
NeoBundle "rcmdnk/vim-markdown"

" colorscheme
NeoBundle 'nanotech/jellybeans.vim'
"NeoBundle 'altercation/vim-colors-solarized'
"NeoBundle 'therubymug/vim-pyte'
"NeoBundle 'w0ng/vim-hybrid'
"NeoBundle 'vim-scripts/twilight'
"NeoBundle 'jonathanfilip/vim-lucius'
"NeoBundle 'jpo/vim-railscasts-theme'
NeoBundle 'vim-scripts/Wombat'
"NeoBundle 'tomasr/molokai'
"NeoBundle 'vim-scripts/rdark'

"NeoBundle 'ujihisa/unite-colorscheme'

"NeoBundleLazy "thinca/vim-quickrun", {
"      \ "autoload": {
"      \   "mappings": [['nxo', '<Plug>(quickrun)']]
"      \ }}
"nmap <Leader>r <Plug>(quickrun)
"let s:hooks = neobundle#get_hooks("vim-quickrun")
"function! s:hooks.on_source(bundle)
"  let g:quickrun_config = {
"      \ "*": {"runner": "remote/vimproc"},
"      \ }
"endfunction

call neobundle#end()

"-------------------------------------------------------------------------------
" ファイルタイプ設定(on)
"-------------------------------------------------------------------------------
filetype on                             " ファイルタイプの自動検出on
filetype plugin on                      " ファイルタイプ別プラグインのロードon
filetype indent on                      " ファイルタイプ別インデントのロードon

NeoBundleCheck

syntax on


"-------------------------------------------------------------------------------
" unite
"-------------------------------------------------------------------------------
"インサートモードで開始しない
"let g:unite_enable_start_insert = 0
"file_mruの表示フォーマットを指定。空にすると表示スピードが高速化される
"let g:unite_source_file_mru_filename_format = ''


"-------------------------------------------------------------------------------
" vimfiler
"-------------------------------------------------------------------------------
"vimデフォルトのエクスプローラをvimfilerで置き換える
"let g:vimfiler_as_default_explorer = 1
"セーフモードを無効にした状態で起動する
"let g:vimfiler_safe_mode_by_default = 0


"let g:previm_open_cmd = 'open -a "C:\Program Files (x86)\Google\Chrome\Application\chrome.exe"'


nnoremap <F2> :VimFiler -buffer-name=explorer -split -winwidth=45 -toggle -no-quit<Cr>
autocmd! FileType vimfiler call s:my_vimfiler_settings()
function! s:my_vimfiler_settings()
  nmap     <buffer><expr><Cr> vimfiler#smart_cursor_map("\<Plug>(vimfiler_expand_tree)", "\<Plug>(vimfiler_edit_file)")
  nnoremap <buffer>s          :call vimfiler#mappings#do_action('my_split')<Cr>
  nnoremap <buffer>v          :call vimfiler#mappings#do_action('my_vsplit')<Cr>
endfunction

let s:my_action = { 'is_selectable' : 1 }
function! s:my_action.func(candidates)
  wincmd p
  exec 'split '. a:candidates[0].action__path
endfunction
call unite#custom_action('file', 'my_split', s:my_action)

let s:my_action = { 'is_selectable' : 1 }                     
function! s:my_action.func(candidates)
  wincmd p
  exec 'vsplit '. a:candidates[0].action__path
endfunction
call unite#custom_action('file', 'my_vsplit', s:my_action)


"-------------------------------------------------------------------------------
" markdonw
"-------------------------------------------------------------------------------
let g:vim_markdown_liquid=1
let g:vim_markdown_frontmatter=1
let g:vim_markdown_math=1
au BufRead,BufNewFile *.{txt,text} set filetype=markdown



"-------------------------------------------------------------------------------
" Mapping
"-------------------------------------------------------------------------------
"    map:キーシーケンスを展開したあと、さらに別のマップを適用
"noremap:一度だけ展開
"-------------------------------------------------------------------------------
" コマンド         ノーマル    インサート   コマンドライン      ビジュアル
" map/noremap         @            -              -                  @
" map!/noremap!       -            @              @                  -
" nmap/nnoremap       @            -              -                  -
" imap/inoremap       -            @              -                  -
" cmap/cnoremap       -            -              @                  -
" vmap/vnoremap       -            -              -                  @
"-------------------------------------------------------------------------------



"---------------------------------------
" Prefix
nnoremap [space]  <Nop>
nmap     <Space>  [space]
xmap     <Space>  [space]

"---------------------------------------
" vimrc編集/反映
nnoremap [space]v :<C-u>tabedit $MYVIMRC<CR>
nnoremap [space]g :<C-u>tabedit $MYGVIMRC<CR>
nnoremap [space]s :<C-u>source $MYVIMRC<CR>
                     \ :source $MYGVIMRC<CR>


"---------------------------------------
" インサートから抜けたら、IME解除
inoremap <silent> <ESC> <ESC>:set iminsert=0<CR>

"---------------------------------------
" 全角スペース表示
function! ZenkakuSpace()
  highlight ZenkakuSpace cterm=reverse ctermfg=darkgreen gui=reverse guifg=darkgreen
endfunction
if has('syntax')
  augroup ZenkakuSpace
    autocmd!
    autocmd ColorScheme                * call ZenkakuSpace()
    autocmd VimEnter,WinEnter,BufRead  * let w:m1=matchadd('ZenkakuSpace', '　')
  augroup END
  call ZenkakuSpace()
endif