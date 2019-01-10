# homebrewでpyenvを入れたら
export PYENV_ROOT="$HOME/.pyenv"
export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init -)"





















# .zshrc is sourced in interactive shells.
# It should contain commands to set up aliases,
# functions, options, key bindings, etc.
#

bindkey -e

autoload -U compinit
compinit

#allow tab completion in the middle of a word
setopt COMPLETE_IN_WORD

## keep background processes at full speed
#setopt NOBGNICE
## restart running processes on exit
#setopt HUP

## history
#setopt APPEND_HISTORY
## for sharing history between zsh processes
#setopt INC_APPEND_HISTORY
#setopt SHARE_HISTORY

## never ever beep ever
#setopt NO_BEEP

## automatically decide when to page a list of completions
#LISTMAX=0

## disable mail checking
#MAILCHECK=0

# autoload -U colors
#colors

#色ランダムリンゴマーク
#PROMPT=$'%{\e[$[32+$RANDOM % 5]m%}%{$fg_bold[green]%}%p %{$fg[cyan]%}%c %{$fg_bold[blue]%}$(git_prompt_info)%{$fg_bold[blue]%} % %{$reset_color%}'

export EDITOR=vim
export LANG=ja_JP.UTF-8

# alias snow=ruby -e 'C=`stty size`.scan(/\d+/)[1].to_i;S=["2743".to_i(16)].pack("U*");a={};puts "\033[2J";loop{a[rand(C)]=0;a.each{|x,o|;a[x]+=1;print "\033[#{o};#{x}H \033[#{a[x]};#{x}H#{S} \033[0;0H"};$stdout.flush;sleep 0.1}'
alias ll="ls -lah"
alias rm="rm -i"


# メモリ解放
alias cleanmac="du -sx /"

# git
alias gitdiff="git difftool --tool=vimdiff --no-prompt"

# vim
alias vim '/usr/bin/vim-7.3/bin/vim'

# xcode crash log analyze
# alias symbolicatecrash="/Applications/Xcode8.2.app/Contents/SharedFrameworks/DTDeviceKitBase.framework/Versions/A/Resources/symbolicatecrash"
alias symbolicatecrash="/Applications/Xcode9.4.1.app/Contents/SharedFrameworks/DTDeviceKitBase.framework/Versions/A/Resources/symbolicatecrash"
# export DEVELOPER_DIR="/Applications/Xcode8.2.app/Contents/Developer/"
export DEVELOPER_DIR="/Applications/Xcode9.4.1.app/Contents/Developer/"


# アプリ開発
# export NDK_ROOT="/Applications/android-ndk-r8d"
# フィッシュガーデンたち
export NDK_ROOT="/Users/tamura/cocos2d-x/android-ndk-r10e"
# export NDK_ROOT="/Applications/android-ndk-r9b"
export PATH=$PATH:${NDK_ROOT}



export COCOS2DX_ROOT="/Applications/cocos2d-x-2.2.6"


# Android NDK PATH
# ANDROID_NDK=/Applications/android-ndk-r8d
# ANDROID_NDK=/Users/tamura/cocos2d-x/android-ndk-r10e
# export PATH=$PATH:${ANDROID_NDK}

# Android SDK PATH
ANDROID_SDK=/Applications/android-sdk-macosx
export PATH=$PATH:${ANDROID_SDK}

export PATH="$PATH:$HOME/bin:/usr/local/bin:/opt/local/bin:/opt/local/sbin"
# eval "$(rbenv init -)"

# apkファイル インストール
alias adb="/Applications/android-sdk-macosx/platform-tools/adb"



export MANPATH=/opt/local/share/man:/opt/local/man:$MANPATH


# ios-sim
export PATH=$PATH:/Applications/ios-sim-master/bin


# cocos2d-x
# export NDK_PROJECT_PATH="/Applications/cocos2d-x-2.1.5/TesPro1"


# alias zf=/www/ZendFramework/bin/zf.sh
# export ZF_CONFIG_FILE=/home/tamura/gasp/.zf.tamura.ini
# export ZEND_TOOL_INCLUDE_PATH=/home/tamura/gasp/library
# unalias zf


function zf() {
#    export ZF_CONFIG_FILE=/home/tamura/gasp/.zf.tamura.ini
#    export ZEND_TOOL_INCLUDE_PATH=/home/tamura/gasp/library
#    /www/ZendFramework/bin/zf.sh $*
}

function zf2() {
#    export ZF_CONFIG_FILE=/home/tamura/gasp/.zf.dev.ini
#    export ZEND_TOOL_INCLUDE_PATH=/home/tamura/gasp/library
#    /www/ZendFramework/bin/zf.sh $*
}

function ffind() {
        find . -regex ".*\.\(php\|phtml\|inc\|html\|js\|css\)" | xargs grep -Hn $1 > find.txt
}


unsetopt promptcr

# ターミナルにタイトル送信
case "${TERM}" in
kterm*|xterm*)
    precmd() { # コマンドを実行した直後に実行
		echo -en "\033]0;${USER}@${HOSTNAME}: ${PWD}\007"
    }
    preexec() { # コマンドが実行される直前に実行
        echo -en "\033]0;${USER}@${HOSTNAME}: $1 \a"
    }
    ;;
esac

PROMPT="%{${fg[green]}%}[%n(%m)]$ %{${reset_color}%}"
PROMPT2="%{${fg[green]}%}}->: %{${reset_color}%}"
SPROMPT="%{${fg[green]}%}correct:%R -> %r [n y a e]? %{${reset_color}%}"
RPROMPT="%{${fg[white]}%}[%~] %*%{${reset_color}%}"


# for rbenv

# if which rbenv > /dev/null; then
#    eval "$(rbenv init -)";
# fi

# gem
# export PATH="$HOME/.rbenv/shims:$PATH"


# rbenv
if which rbenv > /dev/null; then eval "$(rbenv init - zsh)"; fi



#cocos2d-x 3系の設定は、一旦けしてます


# Add environment variable COCOS_CONSOLE_ROOT for cocos2d-x
# export COCOS_CONSOLE_ROOT=/Users/tamura/cocos2d-x/cocos2d-x-3.10/tools/cocos2d-console/bin
# export PATH=$COCOS_CONSOLE_ROOT:$PATH
# 
# # Add environment variable COCOS_X_ROOT for cocos2d-x
# export COCOS_X_ROOT=/Users/tamura/cocos2d-x
# export PATH=$COCOS_X_ROOT:$PATH
# 
# # Add environment variable COCOS_TEMPLATES_ROOT for cocos2d-x
# export COCOS_TEMPLATES_ROOT=/Users/tamura/cocos2d-x/cocos2d-x-3.10/templates
# export PATH=$COCOS_TEMPLATES_ROOT:$PATH
# 
# # Add environment variable ANDROID_SDK_ROOT for cocos2d-x
export ANDROID_SDK_ROOT=/Applications/android-sdk-macosx
export PATH=$ANDROID_SDK_ROOT:$PATH
export PATH=$ANDROID_SDK_ROOT/tools:$ANDROID_SDK_ROOT/platform-tools:$PATH
# 
# # Add environment variable ANT_ROOT for cocos2d-x
export ANT_ROOT=/Users/tamura/cocos2d-x/apache-ant-1.9.6/bin
export PATH=$ANT_ROOT:$PATH

# Add environment variable COCOS_CONSOLE_ROOT for cocos2d-x
# export COCOS_CONSOLE_ROOT=/Users/tamura/cocos2d-x/cocos2d-x-3.15.1/tools/cocos2d-console/bin
# export PATH=$COCOS_CONSOLE_ROOT:$PATH

# Add environment variable COCOS_X_ROOT for cocos2d-x
# export COCOS_X_ROOT=/Users/tamura/cocos2d-x
# export PATH=$COCOS_X_ROOT:$PATH

# Add environment variable COCOS_TEMPLATES_ROOT for cocos2d-x
# export COCOS_TEMPLATES_ROOT=/Users/tamura/cocos2d-x/cocos2d-x-3.15.1/templates
# export PATH=$COCOS_TEMPLATES_ROOT:$PATH

# Add environment variable COCOS_CONSOLE_ROOT for cocos2d-x
export COCOS_CONSOLE_ROOT=/Users/tamura/cocos2d-x/cocos2d-x-3.15.1/tools/cocos2d-console/bin
export PATH=$COCOS_CONSOLE_ROOT:$PATH

# Add environment variable COCOS_X_ROOT for cocos2d-x
export COCOS_X_ROOT=/Users/tamura/cocos2d-x
export PATH=$COCOS_X_ROOT:$PATH

# Add environment variable COCOS_TEMPLATES_ROOT for cocos2d-x
export COCOS_TEMPLATES_ROOT=/Users/tamura/cocos2d-x/cocos2d-x-3.15.1/templates
export PATH=$COCOS_TEMPLATES_ROOT:$PATH

# Add environment variable COCOS_CONSOLE_ROOT for cocos2d-x
export COCOS_CONSOLE_ROOT="/Users/tamura/cocos2d-x/cocos2d-x-3.17/tools/cocos2d-console/bin"
export PATH=$COCOS_CONSOLE_ROOT:$PATH

# Add environment variable COCOS_TEMPLATES_ROOT for cocos2d-x
export COCOS_TEMPLATES_ROOT="/Users/tamura/cocos2d-x/cocos2d-x-3.17/templates"
export PATH=$COCOS_TEMPLATES_ROOT:$PATH

