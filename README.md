# DotFiles

## Install
### Starting a new collection
```bash
git init --bare $HOME/.cfg
alias config='/usr/bin/git --git-dir=$HOME/.cfg/ --work-tree=$HOME'
config config --local status.showUntrackedFiles no
echo "alias config='/usr/bin/git --git-dir=$HOME/.cfg/ --work-tree=$HOME'" >> $HOME/.bashrc
echo "alias config='/usr/bin/git --git-dir=$HOME/.cfg/ --work-tree=$HOME'" >> $HOME/.zshrc
```

### New machine
**Run**
1. Install zsh
    ```bash
    sudo apt update
    sudo apt upgrade
    sudo apt install zsh
    ```
2. Install [oh-my-zsh](https://github.com/ohmyzsh/ohmyzsh)
    ```bash
    sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
    ```
3. Install oh-my-zsh themes [powerlevel10k](https://github.com/romkatv/powerlevel10k)
    ```bash
    git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k
    ```
4. Install Ubuntu Mono Nerd Font from [nerd-fonts](https://github.com/ryanoasis/nerd-fonts)
    - **Linux**  
        ```bash
        curl -fLo "Downloads/ubuntuMono.zip" \
        https://github.com/ryanoasis/nerd-fonts/releases/download/v2.1.0/UbuntuMono.zip && \
        unzip Downloads/ubuntuMono.zip ~/.local/share/fonts && \
        fc-cache -fv
        ```
    - **Windows with WSL2 and hyper**
        ```powershell
        git clone https://github.com/powerline/fonts.git --depth=1
        cd fonts
        Set-ExecutionPolicy Bypass
        ./install.ps1
        cd ..
        Remove-Item fonts -Recurse -Force
        ```
6. Clone and add dotfiles
    ```bash
    curl -Lks http://bit.do/cfg-install | /bin/bash
    ```
    or

    ```bash
    git clone --bare git@bitbucket.org:durdn/cfg.git $HOME/.cfg
    function config {
       /usr/bin/git --git-dir=$HOME/.cfg/ --work-tree=$HOME $@
    }
    mkdir -p .config-backup
    config checkout
    if [ $? = 0 ]; then
      echo "Checked out config.";
      else
        echo "Backing up pre-existing dot files.";
        config checkout 2>&1 | egrep "\s+\." | awk {'print $1'} | xargs -I{} mv {} .config-backup/{}
    fi;
    config checkout
    config config status.showUntrackedFiles no
    ```
## Issues
- [ ] Managing oh-my-zsh and it themes
- [x] Updated vim files not to have legacy links
- [x] Add Git config files

## Links
[Atlassian dotfiles](https://www.atlassian.com/git/tutorials/dotfiles)

[VIM plugin, git submodlues](https://gist.github.com/manasthakur/d4dc9a610884c60d944a4dd97f0b3560)
