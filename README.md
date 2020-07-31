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
Run
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