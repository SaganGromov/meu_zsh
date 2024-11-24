# If you come from bash you might have to change your $PATH.
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
plugins=(git)

source $ZSH/oh-my-zsh.sh

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='nvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch $(uname -m)"

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

# Keep a full history across all terminal sessions
HISTFILE=~/.zsh_history     # The file where the history is saved
HISTSIZE=100000             # Number of lines kept in memory during a session
SAVEHIST=100000             # Number of lines to save in the history file
setopt APPEND_HISTORY       # Append history to the history file, rather than overwriting it
setopt SHARE_HISTORY        # Share history across multiple terminals
setopt HIST_IGNORE_DUPS     # Ignore duplicated commands in the history
setopt HIST_IGNORE_ALL_DUPS # Remove all previous duplicates of a command
setopt HIST_REDUCE_BLANKS   # Remove superfluous blanks from commands
setopt HIST_VERIFY          # Prompt for confirmation before running a history substitution command

alias ver="vim ~/.zshrc"
alias clonar="git clone"
alias recarregar="source ~/.zshrc"

function vai() {
    local message="${1:-"atualizacao em $(date -u -d '-3 hours' '+%d/%m/%Y %H:%M:%S')"}"
    git add .
    git commit -m "$message"
    git push
}



alias DESLIGUE="echo "<SUA_SENHA>" | sudo -S poweroff"
alias REINICIE="echo "<SUA_SENHA>" | sudo -S reboot"

clonrepo() {
  git clone git@github.com:SaganGromov/$1.git
}

copiar() {
    if [[ "$1" == "-a" ]]; then
        shift
        cp "$@"
    elif [[ "$1" == "-p" ]]; then
        shift
        cp -r "$@"
    else
        echo "Opção desconhecida!"
    fi
}

mover() {
    if [[ "$1" == "-a" ]]; then
        shift
        mv "$@"
    elif [[ "$1" == "-p" ]]; then
        shift
        mv "$@"
    else
        echo "Opção desconhecida!"
    fi
}


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

alias ajuda_venv='~/scripts/ajuda_venv.sh'
alias verHistorico='vim ~/.zsh_history'
alias verVim='vim ~/.vimrc'

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

alias fixar="/usr/bin/gsettings set org.gnome.shell.extensions.dash-to-dock dock-fixed true"
alias desfixar="/usr/bin/gsettings set org.gnome.shell.extensions.dash-to-dock dock-fixed false"
export STEAM_COMPAT_DATA_PATH=~/.steam/steam/steamapps/compatdata/


function ajudaVenv() {
    echo "Instruções para criar e usar um ambiente virtual no Python:"
    echo "1. Para criar um ambiente virtual, use o comando:"
    echo "   python3 -m venv nome_do_ambiente"
    echo "   Onde 'nome_do_ambiente' é o nome que você deseja dar ao ambiente."
    echo ""
    echo "2. Para ativar o ambiente virtual, execute o comando:"
    echo "   source nome_do_ambiente/bin/activate"
    echo "   No Windows, use 'nome_do_ambiente\\Scripts\\activate'."
    echo ""
    echo "3. Com o ambiente ativado, você pode instalar pacotes que ficarão isolados nele."
    echo "   Exemplo: pip install nome_do_pacote"
    echo ""
    echo "4. Para desativar o ambiente, basta usar o comando:"
    echo "   deactivate"
    echo ""
    echo "Lembre-se de ativar o ambiente sempre que for trabalhar no projeto e desativá-lo ao final."
}

ajudaTmux() {
  cat << 'EOF'
TMUX CHEATSHEET
--------------
# Session Management
tmux new -s session_name         # Create a new session named "session_name"
tmux attach -t session_name      # Attach to an existing session
tmux ls                          # List all tmux sessions
tmux kill-session -t session_name # Kill a specific session
tmux kill-server                 # Kill all sessions

# Windows & Panes
Ctrl+b c                          # Create new window
Ctrl+b ,                          # Rename current window
Ctrl+b w                          # List windows
Ctrl+b n                          # Move to next window
Ctrl+b p                          # Move to previous window
Ctrl+b &                          # Close current window
Ctrl+b %                          # Split vertically
Ctrl+b "                          # Split horizontally
Ctrl+b o                          # Switch to next pane
Ctrl+b x                          # Close current pane

# Copy & Paste
Ctrl+b [                          # Enter copy mode
Ctrl+b ]                          # Paste last copied text

# Misc
Ctrl+b d                          # Detach from session
Ctrl+b ?                          # Show help in tmux

EOF
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


function pararAlarme() {
	curl -X POST http://100.83.170.86:8000/api/speak \
 	 -H "Authorization: Basic $(echo -n 'user:pass' | base64)" \
 	 -H "Content-Type: application/json" \
  	-d '{"parar": true}'
}


alias apagaTudoAqui='find . -mindepth 1 -not -path "./.*" -exec rm -rf {} +'
alias site='ssh -i ~/Downloads/LightsailDefaultKey-us-east-1.pem ubuntu@3.221.109.213'


export PATH=$PATH:/usr/local/go/bin

rmd() {
    local current_dir=$(pwd)  # Get the current directory
    cd .. || return           # Move to the parent directory
    rm -rf "$current_dir"     # Delete the original directory
}


copie() {
    if [[ $# -lt 2 ]]; then
        echo "Usage: copie <source1> [source2 ...] <destination_folder>"
        return 1
    fi

    # All arguments except the last are sources
    local destination_folder="${@: -1}"
    local sources=("${@:1:$#-1}")

    # Ensure the destination is a directory
    if [[ ! -d "$destination_folder" ]]; then
        echo "Error: Destination must be a directory."
        return 1
    fi

    # Perform the copy using rsync
    rsync -aAXHv --progress --info=progress2 --partial --no-compress --whole-file --preallocate \
        "${sources[@]}" "${destination_folder%/}/"
}


# Set up fzf key bindings and fuzzy completion

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"


export FZF_DEFAULT_COMMAND="fd --hidden --strip-cwd-prefix --exclude .git"
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
export FZF_ALT_C_COMMAND="fd --type=d --hidden --strip-cwd-prefix --exclude .git"

_fzf_compgen_path() {
  fd --hidden --exclude .git . "$1"
}

# Use fd to generate the list for directory completion
_fzf_compgen_dir() {
  fd --type=d --hidden --exclude .git . "$1"
}

export FZF_CTRL_T_OPTS="--preview 'bat -n --color=always --line-range :500 {}'"
export FZF_ALT_C_OPTS="--preview 'eza --tree --color=always {} | head -200'"

# Advanced customization of fzf options via _fzf_comprun function
# - The first argument to the function is the name of the command.
# - You should make sure to pass the rest of the arguments to fzf.
_fzf_comprun() {
  local command=$1
  shift

  case "$command" in
    cd)           fzf --preview 'eza --tree --color=always {} | head -200' "$@" ;;
    export|unset) fzf --preview "eval 'echo $'{}"         "$@" ;;
    ssh)          fzf --preview 'dig {}'                   "$@" ;;
    *)            fzf --preview "bat -n --color=always --line-range :500 {}" "$@" ;;
  esac
}

bindkey -s "^G" ""
source ~/fzf-git.sh/fzf-git.sh

alias ls="eza --color=always --long --git --no-filesize --icons=always --no-time --no-user --no-permissions"

# thefuck alias
eval $(thefuck --alias)

# ---- Zoxide (better cd) ----
eval "$(zoxide init zsh)"


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
source /home/linuxbrew/.linuxbrew/share/zsh-autosuggestions/zsh-autosuggestions.zsh
source /home/linuxbrew/.linuxbrew/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh


deletarRepoAtual() {
    # Get the name of the current folder
    local repo_name=$(basename "$PWD")
    
    # Confirm the deletion
    echo "Are you sure you want to delete the GitHub repository '$repo_name'? (yes/no)"
    read confirmation
    
    # Proceed only if the user confirms
    if [[ "$confirmation" == "yes" ]]; then
        # Delete the GitHub repository using the GitHub CLI
        gh repo delete "$repo_name" --confirm
        echo "Repository '$repo_name' has been deleted."
    else
        echo "Operation canceled. Repository '$repo_name' was not deleted."
    fi
}



BaixarVideo() {
  # Check if the URL is provided
  if [ -z "$1" ]; then
    echo "Erro: Você precisa fornecer a URL do vídeo."
    return 1
  fi

  # Initialize variables
  URL="$1"
  REMOVE_SPONSORS=false

  # Check for the --sem-patrocinadores flag
  if [ "$2" == "--sem-patrocinadores" ]; then
    REMOVE_SPONSORS=true
  fi

  # Get video title
  TITLE=$(yt-dlp --get-title "$URL" 2>/dev/null)

  if [ -z "$TITLE" ]; then
    echo "Erro: Não foi possível obter o título do vídeo. Verifique a URL."
    return 1
  fi

  # Construct the yt-dlp command
  CMD="yt-dlp -f bestvideo[height=1080]+bestaudio"

  # Add SponsorBlock option if flag is set
  if [ "$REMOVE_SPONSORS" = true ]; then
    CMD+=" --sponsorblock-remove all"
    echo "Baixando vídeo \"$TITLE\" em 1080p sem patrocinadores..."
  else
    echo "Baixando vídeo \"$TITLE\" em 1080p com patrocinadores..."
  fi

  # Execute the command
  $CMD "$URL"
}

deleteRepo() {
  if [ -z "$1" ]; then
    echo "Erro: Você precisa fornecer o nome do repositório."
    echo "Uso: deleteRepo <nome_do_repositorio>"
    return 1
  fi

  local REPO_NAME="$1"

  # Ask for confirmation
  echo "Tem certeza de que deseja deletar o repositório '$REPO_NAME'? Isso não pode ser desfeito."
  echo -n "Digite 'SIM' para confirmar: "
  read CONFIRMATION

  if [ "$CONFIRMATION" != "SIM" ]; then
    echo "Ação cancelada."
    return 0
  fi

  # Delete the repository using gh
  gh repo delete "$REPO_NAME" --confirm

  if [ $? -eq 0 ]; then
    echo "Repositório '$REPO_NAME' deletado com sucesso."
  else
    echo "Falha ao deletar o repositório '$REPO_NAME'. Verifique se ele existe e se você tem permissões adequadas."
  fi
}


acessar_repo() {
  # Get the current directory name
  local repo_name
  repo_name=$(basename "$PWD")

  # GitHub URL
  local url="https://github.com/SaganGromov/$repo_name"

  # Check if Google Chrome is installed
  if ! command -v google-chrome &> /dev/null; then
    echo "Erro: Google Chrome não está instalado ou não está no PATH."
    return 1
  fi

  # Check for --nova-janela option
  if [[ "$1" == "--nova-janela" ]]; then
    google-chrome --new-window "$url"
  else
    google-chrome "$url"
  fi
}



