
# Documentação do Arquivo .zshrc

Este arquivo `.zshrc` é usado para configurar o shell Zsh, que é uma alternativa ao Bash, com mais funcionalidades e personalizações.

## Seções do Arquivo .zshrc

### Configuração do Caminho do Oh My Zsh
- `export ZSH="$HOME/.oh-my-zsh"`: Define o caminho para a instalação do Oh My Zsh, que é um framework para gerenciar a configuração do Zsh.

### Tema do Zsh
- `ZSH_THEME="robbyrussell"`: Define o tema do Zsh. O tema "robbyrussell" é o padrão, mas pode ser alterado para qualquer outro disponível.

### Plugins
- `plugins=(git)`: Lista de plugins a serem carregados. Neste caso, apenas o plugin `git` está ativado. Plugins adicionam funcionalidades extras ao shell.

### Fonte do Oh My Zsh
- `source $ZSH/oh-my-zsh.sh`: Carrega o script principal do Oh My Zsh, que aplica todas as configurações definidas.

### Aliases Personalizados
- `alias clonar="git clone"`: Cria um atalho para o comando `git clone`.
- `alias recarregar="echo '\n\nRecarregando...\n\n' && source ~/.zshrc && echo '\n\nShell recarregado!\n\n'"`: Atalho para recarregar o arquivo `.zshrc`.
- `alias DESLIGUE="echo "<SUA-SENHA>" | sudo -S poweroff"`: Atalho para desligar o computador, usando `sudo` com senha.
- `alias REINICIE="echo "<SUA-SENHA>" | sudo -S reboot"`: Atalho para reiniciar o computador.
- `alias ver="vim ~/.zshrc"`: Atalho para abrir o arquivo `.zshrc` no editor `vim`.
- `alias artigo="cd ~/artigo/almostJul16"`: Atalho para mudar para um diretório específico.
- `alias cnvim="nvim ~/.config/nvim/init.lua"`: Atalho para abrir o arquivo de configuração do Neovim.
- `alias python="python3"`: Define `python` para chamar `python3`.
- `alias hora="watch -n 1 -t \"date '+%d de %B de %Y às %H:%M:%S' | sed 's/January/janeiro/;s/February/fevereiro/;s/March/março/;s/April/abril/;s/May/maio/;s/June/junho/;s/July/julho/;s/August/agosto/;s/September/setembro/;s/October/outubro/;s/November/novembro/;s/December/dezembro/'\""`: Mostra a data e hora atual em português, atualizando a cada segundo.
- `alias abrirnochrome="google-chrome --new-window ."`: Abre o Google Chrome em uma nova janela.
- `alias reset_hist='echo "{}" > ~/hist.json'`: Reseta o histórico armazenado em `hist.json`.
- `alias listarPastas='ls -d */'`: Lista apenas diretórios no diretório atual.
- `alias listarRepos="gh repo list SaganGromov"`: Lista repositórios do GitHub do usuário `SaganGromov`.
- `alias apagaTudoAqui='find . -mindepth 1 ! -name ".*" -exec rm -rf {} +'`: Apaga todos os arquivos e diretórios no diretório atual, exceto arquivos ocultos.
- `alias site='ssh -i ~/Downloads/LightsailDefaultKey-us-east-1.pem ubuntu@3.221.109.213'`: Conecta a um servidor remoto via SSH.

### Funções Personalizadas
- `vai()`: Função para adicionar, commitar e enviar alterações para um repositório Git.
- `clonrepo()`: Clona um repositório do GitHub do usuário `SaganGromov`.
- `encontrar()`: Função para buscar arquivos ou diretórios com base em opções.
- `encontrar_fuzzy()`: Busca arquivos ou diretórios usando `fzf` para filtragem.
- `ssudo()`: Executa comandos com `sudo`, adicionando automaticamente a opção `-y` para `apt`.
- `fixar()` e `desfixar()`: Funções para fixar ou esconder automaticamente o dock no GNOME.
- `criarRepo()`: Cria um novo repositório no GitHub, público ou privado, a partir de um diretório local.
- `criarRepoAqui()`: Cria um repositório no GitHub com o nome do diretório atual.
- `senha()`: Gera um hash de 11 caracteres e copia para a área de transferência.
- `check_and_run_script()`: Verifica se o diretório atual é o especificado e executa um script se for o caso.
- `copie()`: Copia arquivos ou diretórios para um diretório de destino usando `rsync`.

### Variáveis de Ambiente
- `export PYTHONSTARTUP=~/startup.py`: Define um script Python para ser executado ao iniciar o interpretador Python.
- `export LAST_DIR=$(pwd)`: Armazena o último diretório acessado.

### Hooks do Zsh
- `autoload -Uz add-zsh-hook`: Carrega a função `add-zsh-hook`.
- `add-zsh-hook precmd check_and_run_script`: Adiciona um hook para executar `check_and_run_script` antes de cada prompt.

Este arquivo `.zshrc` é altamente personalizado, com várias funções e aliases para facilitar o uso diário do terminal, especialmente para tarefas relacionadas ao Git e ao desenvolvimento.
    