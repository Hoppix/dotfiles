# setting up a new system

## terminal / shell

* install zsh
* set zsh as default (only on linux):
  * ``echo $(which zsh) >> /etc/shells``
  * ``chsh -s $(which zsh)``
* install [brew.sh](https://brew.sh/)
* install [oh-my-zsh](https://ohmyz.sh/)
* install [Agave Nerd Font](https://www.nerdfonts.com/)
* clone [dotfiles](https://github.com/Hoppix/dotfiles)
* copy into ``~/.config`` ``alacritty`` ``tmux`` ``hoppix``
* add ``source ~/.config/hoppix/.hoppix_zshrc`` at the end of ``.zshrc``

### tmux

* install tmux
* configure the zshell location in ``~/.config/tmux/tmux.conf``
* Install tmux package manager: [tpm](https://github.com/tmux-plugins/tpm)
* Run tmux
* Inside tmux install packages with <C-b>I
* Install [p10k](https://github.com/romkatv/powerlevel10k?tab=readme-ov-file#installation)
* run ``zsh`` if there is no promt run ``p10k configure``

### neovim

* install [nvchad](https://nvchad.com/)
* on prompt for example config select 'N'
* copy the neovim config to ``.config``, run: ``cp -r nvim/lua/custom ~/.config/nvim/lua/``
* open neovim and run ``:LazyInstallAll`` and ``:MasonInstallAll``
* (some LSP may not work yet because they need to be installed)
* NOTE: treesitter should automatically install all language parsers

### packages

* Install the following packages:
  * python
    * NOTE: there might be clashing paths with preinstalled python interpreters, resolve them accordingly
  * poetry
  * go
  * node
  * btop
  * ripgrep
  * jq

## vscode

* Install vscode per package manager
* copy config files:
  * linux ``cp -r vscode ~/.config/``
  * macos ``cp -r vscode/keybindings.json '~/Application Support/code/User'`` and ``cp -r vscode/settings.json '~/Application Support/code/User/'``

## window manager

### macos

* install [rectangle](https://rectangleapp.com/)
* configure gaps if you like

### linux

#### rofi

* install [rofi](https://github.com/davatorium/rofi)
* ``cp -r rofi ~/.config``

#### i3

* install I3WM: <https://i3wm.org/downloads/>
* ``cp -r i3 ~/.config``

#### polybar

#### GTK theme

#### setup wallpaper

#### setup multiple screens
