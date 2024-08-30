## 1. Configuração do Caminho
- **Caminho do ZSH**: Define o caminho para a instalação do Oh My Zsh.
  ```zsh
  export ZSH="$HOME/.oh-my-zsh"
  ```

## 2. Configuração do Tema
- **Tema do ZSH**: Define o tema usado pelo Zsh. O tema padrão é `robbyrussell`.
  ```zsh
  ZSH_THEME="robbyrussell"
  ```
- **Candidatos a Tema Aleatório**: Especifica uma lista de temas para escolher quando ZSH_THEME está definido como `random`.
  ```zsh
  # ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )
  ```

## 3. Configuração de Plugins
- **Plugins**: Especifica os plugins a serem carregados. Nesta configuração, apenas o plugin `git` é carregado.
  ```zsh
  plugins=(git)
  ```

## 4. Carregar o Oh My Zsh
- **Comando Source**: Carrega o framework Oh My Zsh.
  ```zsh
  source $ZSH/oh-my-zsh.sh
  ```

## 5. Aliases Personalizados
- **`clonar`**: Alias para `git clone`.
  ```zsh
  alias clonar="git clone"
  ```
- **`recarregar`**: Alias para recarregar a configuração do `.zshrc`.
  ```zsh
  alias recarregar="source ~/.zshrc"
  ```
- **`DESLIGUE`**: Alias para desligar o computador usando sudo com a senha fornecida.
  ```zsh
  alias DESLIGUE="echo "<minha-senha>" | sudo -S poweroff"
  ```
- **`REINICIE`**: Alias para reiniciar o computador usando sudo com a senha fornecida.
  ```zsh
  alias REINICIE="echo "<minha-senha>" | sudo -S reboot"
  ```

## 6. Funções Personalizadas
- **`vai`**: Esta função automatiza o processo de adicionar todas as alterações, fazer commit com uma mensagem (fornecida ou com o timestamp padrão) e enviar para o repositório.
  ```zsh
  function vai() {
      local message="${1:-"atualizacao em $(date -u -d '-3 hours' '+%d-%m-%Y %H:%M:%S')"}"
      git add .
      git commit -m "$message"
      git push
  }
  ```
- **`clonrepo`**: Esta função clona um repositório GitHub usando o formato SSH.
  ```zsh
  clonrepo() {
    git clone git@github.com:SaganGromov/$1.git
  }
  ```
- **`copiar`**: Esta função é um wrapper personalizado para o comando `cp` com as opções `-a` para copiar arquivos e `-p` para copiar diretórios recursivamente.
  ```zsh
  copiar() {
      if [[ "$1" == "-a" ]]; então
          shift
          cp "$@"
      elif [[ "$1" == "-p" ]]; então
          shift
          cp -r "$@"
      else
          echo "Opção desconhecida!"
      fi
  }
  ```
- **`mover`**: Esta função é um wrapper personalizado para o comando `mv` com as opções `-a` para mover arquivos e `-p` para mover diretórios.
  ```zsh
  mover() {
      if [[ "$1" == "-a" ]]; então
          shift
          mv "$@"
      elif [[ "$1" == "-p" ]]; então
          shift
          mv "$@"
      else
          echo "Opção desconhecida!"
      fi
  }
  ```
- **`encontrar`**: Esta função é um wrapper personalizado para o comando `find` com as opções `-a` para encontrar arquivos e `-p` para encontrar diretórios.
  ```zsh
  encontrar() {
      if [[ "$1" == "-a" ]]; então
          shift
          find . -iname "$@"
      elif [[ "$1" == "-p" ]]; então
          shift
          find . -type d -iname "$@"
      else
          echo "Opção desconhecida!"
      fi
  }
  ```
- **`encontrar_fuzzy`**: Esta função estende a função `encontrar` com a capacidade de busca fuzzy usando `fzf`.
  ```zsh
  encontrar_fuzzy() {
      if [[ "$1" == "-a" ]]; então
          shift
          find . -iname "*" | fzf --filter="$@"
      elif [[ "$1" == "-p" ]]; então
          shift
          find . -type d -iname "*" | fzf --filter="$@"
      else
          echo "Opção desconhecida: $1"
      fi
  }
  ```

## 7. Configuração Adicional
- **Opções de Configuração Comentadas**: O arquivo `.zshrc` inclui várias opções comentadas que podem ser descomentadas para funcionalidade adicional, como conclusão sensível a maiúsculas, conclusão insensível a hífen e correção automática de comandos.
- **Configurações de Idioma e Editor**: O arquivo `.zshrc` inclui seções comentadas para definir o ambiente de idioma e o editor preferido.
  ```zsh
  # export LANG=en_US.UTF-8
  # export EDITOR='vim'
  ```
