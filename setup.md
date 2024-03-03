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

#### GTK theme

* download the tokyo night gtk theme: <https://www.gnome-look.org/p/1681315>
* download the cursor: <https://www.gnome-look.org/p/1681315>
* download the icon theme: <https://www.gnome-look.org/p/1651517>
* and put it into ``~/.themes``
* copy the config file into ``.config``
* ``cp -r gtk-3.0 ~/.config``
* others:
  * oreo_grey_cursors
  * Tokyonight-Storm-B
  * Graphite-tel-dark-nord-rimless (shell)
#### setup wallpaper

* copy the wallpapers into the config dir
* ``cp -r wallpaper ~/.config``
* i3 should pick it up and set the bg from the config

#### setup multiple screens

* <https://wiki.ubuntuusers.de/RandR/>

## troubleshooting arch
* for displaying japanese fonts: <https://unix.stackexchange.com/questions/356084/how-can-i-get-japanese-characters-to-show-properly-in-firefox-on-arch>
