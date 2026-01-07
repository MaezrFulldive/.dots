#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'
alias grep='grep --color=auto'
alias hx='helix'

kaw() {
    local quotes=(
        "(˵>ᗜ <˵)"
        "(˶˘ ³˘)♡"
        "(˶˃ᵕ˂˶)"
        "◝(ᵔᗜ ᵔ)◜"
        "(˶ᵔᵕᵔ˶)‹𝟹"
        "₍^..^₎Ⳋ"
        "₍ᐢ..ᐢ₎"
        "/•᷅•᷄\੭"
        "٩(ˊᗜ ˋ*)♡"
        "ᓚ ₍⑅^..^₎♡"
        ">ᴗ<"
        "(╥‸╥)"
        "(˶>₃<˶)"
        '(¬`‸´¬)'
        "≽^•⩊ •^≼"
        "(..◜ᴗ◝..)"
        "(•̀⤙•́)"
        "જ⁀➴ ♡"
        "⋆꙳•❅‧*₊⋆☃︎‧*❆₊⋆"
        "𖡼.𖤣𖥧𖡼.𖤣𖥧"
        "°‧𓆝 𓆟 𓆞 ·｡"
        "ᕙ(•̀ᗜ •́)ᕗ "
        "(≖_≖ )"
        '૮₍´ ꒳`₎ა'
        ";(◞‸◟)"
        "(ᵕ•ᴗ•)"
        "ᓚᘏ ᗢ ✟ ":
    )

    # local random_index=$((RANDOM % ${#quotes[@]}))
    # echo -e "\n${quotes[$random_index]}\n"
    printf '%s' "${quotes[RANDOM % ${#quotes[@]}]}"
}

PROMPT_COMMAND='
    status=$?
    quote=$(kaw)

    # green on success, red on failure
    (( status == 0 )) && color=95 || color=91

    len=${#quote}
    row=$LINES
    col=$(( COLUMNS - len + 1 ))
    (( col < 1 )) && col=1

    printf "\e[s\e[%d;%dH\e[%dm%s\e[0m\e[u" \
        "$row" "$col" "$color" "$quote"
'

# PS1='[\u@\h \W]\$ '

PS1='\[\e[36m\]⌠\[\e[95m\]${USER^^}\[\e[36m\]|\[\e[97m\]\W\[\e[36m\]⌡\[\e[$(( $? == 0 ? 95 : 31 ))m\] †\[\e[36m\] \[\e[0m\]'


# .dotfiles bare git alias
dots() {
    if [[ "$1" == "-l" ]]; then
        lazygit -g "$HOME/.dotfiles" -w="$HOME"
    else
        git --git-dir="$HOME/.dotfiles" --work-tree="$HOME" "$@"
    fi
}

# Enable full git flag completion for the dotfiles command
# First, ensure you have git-completion.bash sourced in your shell
# (downloadable from Git’s repo or via package manager).
# __git_complete dotfiles _dotfiles

# dotfiles_completion() {
    # compadd -lazy
# }

# compdef _dotfiles_completion dotfiles
