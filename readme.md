# profile settings for vim and zsh

These are global settings to be used on any computer (mac, linux, or WSL2)
Any local-specific settings are to be saved in the .zshrc file

## Instructions

* install zsh
* install neovim
* download this repository:

```sh
git clone https://github.com/jaredmtterminus/nvimconfig ~/.config/nvim
```

* add to .zshrc: ` source ~/.config/nvim/.zshrc_source `
* run ` zsh ` and follow any instructions given

### Extra steps required for linux

* after installing fd with ```sudo apt install fd-find``` :

```sh
ln -s $(which fdfind) ~/.local/bin/fd
```

* after installing bat with ```sudo apt install bat``` :

```sh
mkdir -p ~/.local/bin
ln -s /usr/bin/batcat ~/.local/bin/bat
```

note: you may need to also add ```~/.local/bin``` to path
to fix dpkg error: ```sudo -i``` and ```sudo dpkg -i --force-overwrite <deb file>```
Finally: ```sudo apt install -f bat```

* after installing fzf with ```sudo apt install fzf```
add to .zshrc:

```sh
export FZF_KEY_BINDINGS_FILE='/usr/share/doc/fzf/examples/key-bindings.zsh'
```

* to update node to latest version (required for neovim):

```sh
sudo npm cache clean -f
sudo npm install -g n
sudo n stable
```
