#lia If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:$HOME/.local/bin:/usr/local/bin:$PATH

# Path to your Oh My Zsh installation.
export ZSH="$HOME/.oh-my-zsh"

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time Oh My Zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
ZSH_THEME="robbyrussell"

# Set list of themes to pick from when loading at random
# Setting this variable when ZSH_THEME=random will cause zsh to load
# a theme from this variable instead of looking in $ZSH/themes/
# If set to an empty array, this variable will have no effect.
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment one of the following lines to change the auto-update behavior
# zstyle ':omz:update' mode disabled  # disable automatic updates
# zstyle ':omz:update' mode auto      # update automatically without asking
# zstyle ':omz:update' mode reminder  # just remind me to update when it's time

# Uncomment the following line to change how often to auto-update (in days).
# zstyle ':omz:update' frequency 13

# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS="true"

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# You can also set it to another string to have that shown instead of the default red dots.
# e.g. COMPLETION_WAITING_DOTS="%F{yellow}waiting...%f"
# Caution: this setting can cause issues with multiline prompts in zsh < 5.7.1 (see #5765)
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# You can set one of the optional three formats:
# "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# or set a custom format using the strftime function format specifications,
# see 'man strftime' for details.
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load?
# Standard plugins can be found in $ZSH/plugins/
# Custom plugins may be added to $ZSH_CUSTOM/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git vi-mode)

source $ZSH/oh-my-zsh.sh

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# Set personal aliases, overriding those provided by Oh My Zsh libs,
# plugins, and themes. Aliases can be placed here, though Oh My Zsh
# users are encouraged to define aliases within a top-level file in
# the $ZSH_CUSTOM folder, with .zsh extension. Examples:
# - $ZSH_CUSTOM/aliases.zsh
# - $ZSH_CUSTOM/macos.zsh
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"


alias clonar="git clone"
alias recarregar="echo '\n\nRecarregando...\n\n' && source ~/.zshrc && echo '\n\nShell recarregado!\n\n'"



function vai() {
    local message="${1:-"atualizacao em $(date -u -d '-3 hours' '+%d/%m/%Y %H:%M:%S')"}"
    git add .
    git commit -m "$message"
    git push
}



alias DESLIGUE="echo "<SUA_SENHA>" | sudo -S poweroff"
alias REINICIE="echo "<SUA_SENHA>" | sudo -S reboot"

clonrepo() {
  git clone https://github.com/SaganGromov/$1.git
}

alias ver="vim ~/.zshrc"
alias artigo="cd ~/artigo/"



alias cnvim="nvim ~/.config/nvim/init.lua"





encontrar() {
    if [[ "$1" == "-a" ]]; then
        shift
        find . -iname "$@"
    elif [[ "$1" == "-p" ]]; then
        shift
        find . -type d -iname "$@"
    else
        echo "Opção desconhecida!"
    fi
}


encontrar_fuzzy() {
    if [[ "$1" == "-a" ]]; then
        shift
        find . -iname "*" | fzf --filter="$@"
    elif [[ "$1" == "-p" ]]; then
        shift
        find . -type d -iname "*" | fzf --filter="$@"
    else
        echo "Opção desconhecida: $1"
    fi
}

alias python="python3"

ssudo() {
  # Check if the command is 'apt' and needs a '-y' option
  if [[ "$1" == "apt" ]]; then
    echo "allthatisorwasoreverwillbe" | sudo -S "$@" -y
  else
    echo "allthatisorwasoreverwillbe" | sudo -S "$@"
  fi
}

alias hora="watch -n 1 -t \"date '+%d de %B de %Y às %H:%M:%S' | sed 's/January/janeiro/;s/February/fevereiro/;s/March/março/;s/April/abril/;s/May/maio/;s/June/junho/;s/July/julho/;s/August/agosto/;s/September/setembro/;s/October/outubro/;s/November/novembro/;s/December/dezembro/'\""


alias abrirnochrome="google-chrome --new-window ."


alias reset_hist='echo "{}" > ~/hist.json'


export PYTHONSTARTUP=~/startup.py


# Function to toggle dock ON (dock is always shown)
#
#

# Function to fix (make dock always visible)
fixar() {
    dconf write /org/gnome/shell/extensions/dash-to-dock/dock-fixed true
    dconf write /org/gnome/shell/extensions/dash-to-dock/intellihide false
}

# Function to hide dock automatically when windows are overlapping
desfixar() {
    dconf write /org/gnome/shell/extensions/dash-to-dock/dock-fixed false
    dconf write /org/gnome/shell/extensions/dash-to-dock/intellihide true
}



criarRepo() {
    if [ "$#" -ne 3 ]; then
        echo "Usage: criarRepo <repository-name> publico|privado <path/to/directory>"
        return 1
    fi

    REPO_NAME=$1
    PRIVACY=$2
    REPO_PATH=$3

    # Navigate to the specified directory
    cd "$REPO_PATH" || { echo "Directory not found"; return 1; }

    # Initialize git repository
    git init

    # Determine if the repository should be public or private
    if [ "$PRIVACY" = "publico" ]; then
        gh repo create "$REPO_NAME" --public --source=. --remote=origin
    elif [ "$PRIVACY" = "privado" ]; then
        gh repo create "$REPO_NAME" --private --source=. --remote=origin
    else
        echo "Invalid privacy option. Use 'publico' or 'privado'."
        return 1
    fi

    # Add, commit, and push the initial commit
    git add .
    git commit -m "Initial commit"
    git push --set-upstream origin master
}

alias listarPastas='ls -d */'

alias listarRepos="gh repo list SaganGromov"


criarRepoAqui() {
    # Get the current directory name to use as the repository name
    local repo_name=${PWD##*/}

    # Verify that an argument has been provided
    if [[ "$1" != "--publico" && "$1" != "--privado" ]]; then
        echo "Usage: criarRepoAqui --publico|--privado"
        return 1
    fi

    # Set visibility based on the argument
    local visibility
    if [[ "$1" == "--publico" ]]; then
        visibility="--public"
    elif [[ "$1" == "--privado" ]]; then
        visibility="--private"
    fi

    # Initialize the local Git repository, add all files, and make an initial commit
    git init
    git add .
    git commit -m "commit inicial"

    # Create a GitHub repository with the same name as the current directory
    gh repo create "$repo_name" $visibility --source=. --remote=origin

    # Rename the branch to 'main' and push to the new GitHub repository
    git branch -M main
    git push -u origin main
}


senha() {
    # Generate an 11-character hash similar to a Git commit hash
    local hash=$(LC_ALL=C tr -dc 'a-f0-9' < /dev/urandom | head -c 11)

    # Copy the hash to the clipboard
    echo "$hash" | xclip -selection clipboard  # For Linux with xclip installed
    echo "$hash copied to clipboard."
}


# Store the last directory accessed
export LAST_DIR=$(pwd)

check_and_run_script() {
    # Define the target directory with $HOME for proper path expansion
    local target_dir="$HOME/artigo"

    # Get the current working directory
    local current_dir=$(pwd)

    # Check if you've just changed to the target directory
    if [[ "$current_dir" == "$target_dir" && "$LAST_DIR" != "$target_dir" ]]; then
        # Execute the script
        echo '\n\nNavegação ao diretório do artigo detectada!\n\n'
        # $HOME/auto_password.exp
    fi

    # Update LAST_DIR to the current directory
    LAST_DIR=$current_dir
}

# Use the precmd hook to run the check function before each prompt
autoload -Uz add-zsh-hook
add-zsh-hook precmd check_and_run_script



alias apagaTudoAqui='find . -mindepth 1 ! -name ".*" -exec rm -rf {} +'
alias site='ssh -i ~/Downloads/LightsailDefaultKey-us-east-1.pem ubuntu@3.221.109.213'


copie() {
    if [[ $# -ne 2 ]]; then
        echo "Usage: copie <source_folder> <destination_folder>"
        return 1
    fi

    local source_folder="$1"
    local destination_folder="$2"

    rsync -aAXHv --progress --info=progress2 --partial --inplace \
        --no-compress --whole-file --preallocate \
        "${source_folder%/}/" "${destination_folder%/}/"
}

eval 

# -- Use fd instead of fzf --

export FZF_DEFAULT_COMMAND="fd --hidden --strip-cwd-prefix --exclude .git"
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
export FZF_ALT_C_COMMAND="fd --type=d --hidden --strip-cwd-prefix --exclude .git"

# Use fd (https://github.com/sharkdp/fd) for listing path candidates.
# - The first argument to the function ($1) is the base path to start traversal
# - See the source code (completion.{bash,zsh}) for the details.
_fzf_compgen_path() {
  fd --hidden --exclude .git . "$1"
}

# Use fd to generate the list for directory completion
_fzf_compgen_dir() {
  fd --type=d --hidden --exclude .git . "$1"
}

# FZF preview customization
show_file_or_dir_preview="if [ -d {} ]; then eza --tree --color=always {} | head -200; else bat -n --color=always --line-range :500 {}; fi"

export FZF_CTRL_T_OPTS="--preview '$show_file_or_dir_preview'"
export FZF_ALT_C_OPTS="--preview 'eza --tree --color=always {} | head -200'"

# Advanced customization of fzf options via _fzf_comprun function
_fzf_comprun() {
  local command=$1
  shift

  case "$command" in
    cd)           fzf --preview 'eza --tree --color=always {} | head -200' "$@" ;;
    export|unset) fzf --preview "eval 'echo ${}'"         "$@" ;;
    ssh)          fzf --preview 'dig {}'                   "$@" ;;
    *)            fzf --preview "$show_file_or_dir_preview" "$@" ;;
  esac
}


# history setup
HISTFILE=$HOME/.zsh_history
SAVEHIST=1000
HISTSIZE=999
setopt share_history
setopt hist_expire_dups_first
setopt hist_ignore_dups
setopt hist_verify

# completion using arrow keys (based on history)
bindkey '^[[A' history-search-backward
bindkey '^[[B' history-search-forward

eval 
source ~/fzf-git.sh/fzf-git.sh
KEYTIMEOUT=50
eval 

# -- Use fd instead of fzf --

export FZF_DEFAULT_COMMAND="fd --hidden --strip-cwd-prefix --exclude .git"
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
export FZF_ALT_C_COMMAND="fd --type=d --hidden --strip-cwd-prefix --exclude .git"

# Use fd (https://github.com/sharkdp/fd) for listing path candidates.
# - The first argument to the function ($1) is the base path to start traversal
# - See the source code (completion.{bash,zsh}) for the details.
_fzf_compgen_path() {
  fd --hidden --exclude .git . "$1"
}

# Use fd to generate the list for directory completion
_fzf_compgen_dir() {
  fd --type=d --hidden --exclude .git . "$1"
}

# FZF preview customization
show_file_or_dir_preview="if [ -d {} ]; then eza --tree --color=always {} | head -200; else bat -n --color=always --line-range :500 {}; fi"

export FZF_CTRL_T_OPTS="--preview '$show_file_or_dir_preview'"
export FZF_ALT_C_OPTS="--preview 'eza --tree --color=always {} | head -200'"

# Advanced customization of fzf options via _fzf_comprun function
_fzf_comprun() {
  local command=$1
  shift

  case "$command" in
    cd)           fzf --preview 'eza --tree --color=always {} | head -200' "$@" ;;
    export|unset) fzf --preview "eval 'echo ${}'"         "$@" ;;
    ssh)          fzf --preview 'dig {}'                   "$@" ;;
    *)            fzf --preview "$show_file_or_dir_preview" "$@" ;;
  esac
}


# history setup
HISTFILE=$HOME/.zsh_history
SAVEHIST=1000
HISTSIZE=999
setopt share_history
setopt hist_expire_dups_first
setopt hist_ignore_dups
setopt hist_verify

# completion using arrow keys (based on history)
bindkey '^[[A' history-search-backward
bindkey '^[[B' history-search-forward

eval 
source ~/fzf-git.sh/fzf-git.sh
KEYTIMEOUT=50
eval 

# -- Use fd instead of fzf --

export FZF_DEFAULT_COMMAND="fd --hidden --strip-cwd-prefix --exclude .git"
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
export FZF_ALT_C_COMMAND="fd --type=d --hidden --strip-cwd-prefix --exclude .git"

# Use fd (https://github.com/sharkdp/fd) for listing path candidates.
# - The first argument to the function ($1) is the base path to start traversal
# - See the source code (completion.{bash,zsh}) for the details.
_fzf_compgen_path() {
  fd --hidden --exclude .git . "$1"
}

# Use fd to generate the list for directory completion
_fzf_compgen_dir() {
  fd --type=d --hidden --exclude .git . "$1"
}

# FZF preview customization
show_file_or_dir_preview="if [ -d {} ]; then eza --tree --color=always {} | head -200; else bat -n --color=always --line-range :500 {}; fi"

export FZF_CTRL_T_OPTS="--preview '$show_file_or_dir_preview'"
export FZF_ALT_C_OPTS="--preview 'eza --tree --color=always {} | head -200'"

# Advanced customization of fzf options via _fzf_comprun function
_fzf_comprun() {
  local command=$1
  shift

  case "$command" in
    cd)           fzf --preview 'eza --tree --color=always {} | head -200' "$@" ;;
    export|unset) fzf --preview "eval 'echo ${}'"         "$@" ;;
    ssh)          fzf --preview 'dig {}'                   "$@" ;;
    *)            fzf --preview "$show_file_or_dir_preview" "$@" ;;
  esac
}


# history setup
HISTFILE=$HOME/.zsh_history
SAVEHIST=1000
HISTSIZE=999
setopt share_history
setopt hist_expire_dups_first
setopt hist_ignore_dups
setopt hist_verify

# completion using arrow keys (based on history)
bindkey '^[[A' history-search-backward
bindkey '^[[B' history-search-forward

eval 
source ~/fzf-git.sh/fzf-git.sh
KEYTIMEOUT=50
eval 

# -- Use fd instead of fzf --

export FZF_DEFAULT_COMMAND="fd --hidden --strip-cwd-prefix --exclude .git"
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
export FZF_ALT_C_COMMAND="fd --type=d --hidden --strip-cwd-prefix --exclude .git"

# Use fd (https://github.com/sharkdp/fd) for listing path candidates.
# - The first argument to the function ($1) is the base path to start traversal
# - See the source code (completion.{bash,zsh}) for the details.
_fzf_compgen_path() {
  fd --hidden --exclude .git . "$1"
}

# Use fd to generate the list for directory completion
_fzf_compgen_dir() {
  fd --type=d --hidden --exclude .git . "$1"
}

# FZF preview customization
show_file_or_dir_preview="if [ -d {} ]; then eza --tree --color=always {} | head -200; else bat -n --color=always --line-range :500 {}; fi"

export FZF_CTRL_T_OPTS="--preview '$show_file_or_dir_preview'"
export FZF_ALT_C_OPTS="--preview 'eza --tree --color=always {} | head -200'"

# Advanced customization of fzf options via _fzf_comprun function
_fzf_comprun() {
  local command=$1
  shift

  case "$command" in
    cd)           fzf --preview 'eza --tree --color=always {} | head -200' "$@" ;;
    export|unset) fzf --preview "eval 'echo ${}'"         "$@" ;;
    ssh)          fzf --preview 'dig {}'                   "$@" ;;
    *)            fzf --preview "$show_file_or_dir_preview" "$@" ;;
  esac
}


# history setup
HISTFILE=$HOME/.zsh_history
SAVEHIST=1000
HISTSIZE=999
setopt share_history
setopt hist_expire_dups_first
setopt hist_ignore_dups
setopt hist_verify

# completion using arrow keys (based on history)
bindkey '^[[A' history-search-backward
bindkey '^[[B' history-search-forward

eval 
source ~/fzf-git.sh/fzf-git.sh
KEYTIMEOUT=50

# -- Use fd instead of fzf --

export FZF_DEFAULT_COMMAND="fd --hidden --strip-cwd-prefix --exclude .git"
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
export FZF_ALT_C_COMMAND="fd --type=d --hidden --strip-cwd-prefix --exclude .git"

# Use fd (https://github.com/sharkdp/fd) for listing path candidates.
# - The first argument to the function ($1) is the base path to start traversal
# - See the source code (completion.{bash,zsh}) for the details.
_fzf_compgen_path() {
  fd --hidden --exclude .git . "$1"
}

# Use fd to generate the list for directory completion
_fzf_compgen_dir() {
  fd --type=d --hidden --exclude .git . "$1"
}

# FZF preview customization
show_file_or_dir_preview="if [ -d {} ]; then eza --tree --color=always {} | head -200; else bat -n --color=always --line-range :500 {}; fi"

export FZF_CTRL_T_OPTS="--preview '$show_file_or_dir_preview'"
export FZF_ALT_C_OPTS="--preview 'eza --tree --color=always {} | head -200'"

# Advanced customization of fzf options via _fzf_comprun function
_fzf_comprun() {
  local command=$1
  shift

  case "$command" in
    cd)           fzf --preview 'eza --tree --color=always {} | head -200' "$@" ;;
    export|unset) fzf --preview "eval 'echo ${}'"         "$@" ;;
    ssh)          fzf --preview 'dig {}'                   "$@" ;;
    *)            fzf --preview "$show_file_or_dir_preview" "$@" ;;
  esac
}


# history setup
HISTFILE=$HOME/.zsh_history
SAVEHIST=1000
HISTSIZE=999
setopt share_history
setopt hist_expire_dups_first
setopt hist_ignore_dups
setopt hist_verify

# completion using arrow keys (based on history)
bindkey '^[[A' history-search-backward
bindkey '^[[B' history-search-forward

eval 
source ~/fzf-git.sh/fzf-git.sh
KEYTIMEOUT=50

eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"
source /home/linuxbrew/.linuxbrew/opt/zsh-autosuggestions/share/zsh-autosuggestions/zsh-autosuggestions.zsh
source /home/linuxbrew/.linuxbrew/opt/zsh-syntax-highlighting/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# -- Use fd instead of fzf --

export FZF_DEFAULT_COMMAND="fd --hidden --strip-cwd-prefix --exclude .git"
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
export FZF_ALT_C_COMMAND="fd --type=d --hidden --strip-cwd-prefix --exclude .git"

# Use fd (https://github.com/sharkdp/fd) for listing path candidates.
# - The first argument to the function ($1) is the base path to start traversal
# - See the source code (completion.{bash,zsh}) for the details.
_fzf_compgen_path() {
  fd --hidden --exclude .git . "$1"
}

# Use fd to generate the list for directory completion
_fzf_compgen_dir() {
  fd --type=d --hidden --exclude .git . "$1"
}

# FZF preview customization
show_file_or_dir_preview="if [ -d {} ]; then eza --tree --color=always {} | head -200; else bat -n --color=always --line-range :500 {}; fi"

export FZF_CTRL_T_OPTS="--preview '$show_file_or_dir_preview'"
export FZF_ALT_C_OPTS="--preview 'eza --tree --color=always {} | head -200'"

# Advanced customization of fzf options via _fzf_comprun function
_fzf_comprun() {
  local command=$1
  shift

  case "$command" in
    cd)           fzf --preview 'eza --tree --color=always {} | head -200' "$@" ;;
    export|unset) fzf --preview "eval 'echo ${}'"         "$@" ;;
    ssh)          fzf --preview 'dig {}'                   "$@" ;;
    *)            fzf --preview "$show_file_or_dir_preview" "$@" ;;
  esac
}


# history setup
HISTFILE=$HOME/.zsh_history
SAVEHIST=1000
HISTSIZE=999
setopt share_history
setopt hist_expire_dups_first
setopt hist_ignore_dups
setopt hist_verify

# completion using arrow keys (based on history)
bindkey '^[[A' history-search-backward
bindkey '^[[B' history-search-forward

eval 
            fuck () {
                TF_PYTHONIOENCODING=$PYTHONIOENCODING;
                export TF_SHELL=zsh;
                export TF_ALIAS=fuck;
                TF_SHELL_ALIASES=$(alias);
                export TF_SHELL_ALIASES;
                TF_HISTORY="$(fc -ln -10)";
                export TF_HISTORY;
                export PYTHONIOENCODING=utf-8;
                TF_CMD=$(
                    thefuck THEFUCK_ARGUMENT_PLACEHOLDER $@
                ) && eval $TF_CMD;
                unset TF_HISTORY;
                export PYTHONIOENCODING=$TF_PYTHONIOENCODING;
                test -n "$TF_CMD" && print -s $TF_CMD
            }
        
source ~/fzf-git.sh/fzf-git.sh
KEYTIMEOUT=50

source <(fzf --zsh)
alias ls="eza --color=always --long --git --no-filesize --icons=always --no-time --no-user --no-permissions"


# ---- Zoxide (better cd) ----
eval "$(zoxide init zsh)"

alias cd="z"

function clonar_todos {
    local username=$1
    if [ -z "$username" ]; then
        echo "Usage: clonar_todos <GitHub_Username>"
        return 1
    fi

    # Directory to clone repositories
    local clone_dir="$HOME/$username"
    mkdir -p "$clone_dir"

    # Ensure gh is authenticated
    if ! gh auth status > /dev/null 2>&1; then
        echo "You are not authenticated with gh. Run 'gh auth login' to authenticate."
        return 1
    fi

    # Fetch the list of all repositories (public and private)
    echo "Fetching repository list for user: $username"
    local repos=$(gh repo list "$username" --limit 1000 --json name,diskUsage,sshUrl)

    if [ -z "$repos" ]; then
        echo "No repositories found or an error occurred."
        return 1
    fi

    # Parse and sort repositories by size (ascending)
    echo "$repos" | jq -c '. | sort_by(.diskUsage)[]' | while read -r repo; do
        local repo_name=$(echo "$repo" | jq -r '.name')
        local repo_size=$(echo "$repo" | jq -r '.diskUsage')
        local repo_ssh_url=$(echo "$repo" | jq -r '.sshUrl')

        echo "Cloning $repo_name (Size: $repo_size KB)"
        git clone "$repo_ssh_url" "$clone_dir/$repo_name"
    done
}



function sincronizar {
    local username=$1
    if [ -z "$username" ]; then
        echo "Usage: sincronizar <GitHub_Username>"
        return 1
    fi

    local clone_dir="$HOME/$username"
    if [ ! -d "$clone_dir" ]; then
        echo "Directory $clone_dir does not exist. Run clonar_todos first."
        return 1
    fi

    cd "$clone_dir" || return 1

    # Iterate through each repository directory
    for repo_dir in "$clone_dir"/*; do
        if [ -d "$repo_dir/.git" ]; then
            echo "Synchronizing $(basename "$repo_dir")"
            cd "$repo_dir" || continue

            # Perform git pull and check for conflicts
            if ! git pull; then
                echo "Conflict detected in $(basename "$repo_dir"). Deleting and recloning."
                cd "$clone_dir" || continue
                rm -rf "$repo_dir"

                # Reclone the repository
                local repo_url="https://github.com/$username/$(basename "$repo_dir").git"
                git clone "$repo_url" "$repo_dir"
            fi

            cd "$clone_dir" || continue
        fi
    done
}

