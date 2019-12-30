
# wolfram-geany

A [Wolfram Language](https://en.wikipedia.org/wiki/Wolfram_Language) (WL) plugin for the text editor [Geany](https://www.geany.org/) based on UNIX-like systems (tested on Linux and MacOS)


### Features

1. Autocompletion of WL built-in symbols
2. Documentation shortcuts (via [zenity](https://en.wikipedia.org/wiki/Zenity) and Geany [_Context Action_](https://www.geany.org/manual/current/#context-actions))

Watch a demo [here](https://www.youtube.com/watch?v=-IqsqBloF6k)


### Prerequisites

1. [Geany](https://www.geany.org/Download/Releases)
2. [Wolfram Engine](https://www.wolfram.com/engine/)


#### For Linux 

[Geany Plugins](https://plugins.geany.org/)
  `sudo apt-get install geany-plugins`

mlocate:
  `sudo apt-get install mlocate`

[zenity](https://gitlab.gnome.org/GNOME/zenity)
  `sudo apt-get install zenity`

#### For MacOS

[brew](https://brew.sh/) 
  `/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"`

[findutils](http://macappstore.org/findutils/) 
  `brew install findutils`

[zenity](http://brewformulas.org/Zenity)
  `brew install zenity`


## Installation

`wolframscript -f wolfram-geany.wl`

If upgrading to a newer version of wolfram-geany or reinstalling it, clean the `~/.config/geany` folder.


### Post-Installation

- **Choose a colorscheme** like Kugel from [here](https://github.com/codebrainz/geany-themes)

- **Configure documentation pop-up**: go to _Edit->Preferences->Keybindings->Editor> Context Action_ and set a custom keybinding e.g. `Ctrl+h`. Once the keybinding is configured, press `Ctrl+h` to display the documentation of the built-in symbol under the cursor.

- **Configure terminal emulator**: The installation automatically configures Geany [_Execute_](https://www.geany.org/manual/current/#execute) to run a WL script by pressing F5. The script outputs can be displayed within the Geany [Virtual Terminal Emulator (VTE)](https://www.geany.org/manual/current/#virtual-terminal-emulator-widget-vte). Otherwise, install [urxvt](https://wiki.archlinux.org/index.php/rxvt-unicode), (optionally [rice it up](https://gist.github.com/ei-grad/3345657)) then go to _Edit->Preferences->Tools->Terminal_ and paste `urxvt -e /bin/sh %c`  

#### BUGS

On MacOS, evoking zenity from the _Context Action_ does not work, even though the very same command works if executed from the terminal. Please contribute! Thanks. 

#### To do
* A proper syntax highlighting
