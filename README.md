# DOTFILES

##### Neovim 0.10+ on Ubuntu
First install depdendencies:
```bash
apt install lua5.3
```
(determine which version works for neovim)

```bash
apt install gettext
```
And then build nvim from source:

```bash
git clone https://github.com/neovim/neovim
```
```bash
cd neovim && make CMAKE_BUILD_TYPE=RelWithDebInfo
make install
```

##### Vimrc

Vundle:
```bash
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
```

First go:
```bash
sudo apt install -y npm cmake python3-pip build-essential libssl-dev libffi-dev python3-dev
```

YouCompleteMe javascript development:

```bash
cd ~/.vim/bundle/YouCompleteMe
./install.py --ts-completer --tern-completer
```

##### EXA

https://github.com/ogham/exa

Most distros has exa in their repos, but here is how to install manually:

```bash
wget https://github.com/ogham/exa/releases/download/v0.10.1/exa-linux-x86_64-v0.10.1.zip
```

unpack and make executable


