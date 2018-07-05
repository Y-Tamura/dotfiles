set encoding=utf-8
set fileencodings=utf-8,cp932,euc-jp,sjis
set fileformats=unix,dos,mac
scriptencoding utf-8

" ↑↑↑
" scriptencoding...vimrc内でマルチバイトを使う場合に必須
" 但し、scriptencodingよりも上にencodingの設定がいるらしい...
"
" encoding...保存時の文字コード
" fileencodings...読み込み時の文字コード
" fileformats...改行コード


" □や○による表示崩れ対策
" iTerm2を使っている場合は
" Preferences > Profiles > Text
" 「Treat ambiguous-width characters as double width」にチェック
if exists('&ambiwidth')
    set ambiwidth=double
endif


" ===============================================
" ============== Vim Plugin Vundle ==============
" ===============================================
" https://github.com/VundleVim/Vundle.Vim#quick-start

" お約束
set nocompatible
filetype off

" 初期化
set rtp+=~/.vim/bundle/Vundle.vim

" プラグインの設定 開始
call vundle#begin()

" vundleを使うなら必須
Plugin 'VundleVim/Vundle.vim'

" GitHub 管理
" Plugin 'tpope/vim-fugitive'

" VimScript 管理
" http://vim-scripts.org/vim/scripts.html
" Plugin 'L9'

" GitHub 以外での管理
" Plugin 'git://git.wincent.com/command-t.git'

" ローカル 管理
" Plugin 'file:///home/gmarik/path/to/plugin'

" よく分からん
" Plugin 'rstacruz/sparkup', {'rtp': 'vim/'}

" Install L9 and avoid a Naming conflict if you've already installed a
" different version somewhere else.
" Plugin 'ascenator/L9', {'name': 'newL9'}

" プラグインの設定 終了
call vundle#end()

" プラグインのインデント
filetype plugin indent on
" 変更を無視
" filetype plugin on

" 最後にインストール
" :PluginInstall

" ===============================================
" ===============================================
" ===============================================



syntax on

" 行番号
set number

" タブ入力で半角スペースを入力
" スペースは4つ分
set expandtab
set tabstop=4

" 改行時に前のインデントを継続
" その際に構文をチェックしてインデント量を増減
" 自動で挿入されるインデントはスペース4つ分
set autoindent
set smartindent
set shiftwidth=4

" 検索結果にハイライト
set hlsearch
" 検索時に大文字小文字を区別しない
" set ignorecase
" ↑の逆で区別する
" set smartcase

" カーソルラインをハイライト
set cursorline

" バックスペースキーの有効可
" set backspace=indent,eol,start

" コマンドモードの補完
" コマンド履歴は100件
set wildmenu
set history=100

" マウス有効可
if has('mouse')
    set mouse=a
    if has('mouse_sgr')
        set ttymouse=sgr
    elseif v:version > 703 || v:version is 703 && has('patch632')
        set ttymouse=sgr
    else
        set ttymouse=xterm2
    endif
endif

" クリップボードからペースとする時はインデントをそのままに
" orz...orz...orz...上手く動かない
if &term =~ "xterm"
    let &t_SI .= "\e[?2004h"
    let &t_EI .= "\e[?2004l"
    let &pastetoggle = "\e[201~"

    function XTermPasteBegin(ret)
        set paste
        return a:ret
    endfunction

    inoremap <special> <expr> <Esc>[200~ XTermPasteBegin("")
endif

" ステータスラインを2行
" ステータスラインにファイル名や文字コードを表示
set laststatus=2
set statusline=%<%f\ %m%r%h%w%y%{'['.(&fenc!=''?&fenc:&enc).']['.&ff.']'}%=%4v\ %l/%L

" 改行時に改行元のコメントアウトをひきつれてこないようにする
autocmd FileType * setlocal formatoptions-=ro



" ここまで
" https://qiita.com/ahiruman5/items/4f3c845500c172a02935


