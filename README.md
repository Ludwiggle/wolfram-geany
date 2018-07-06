# wolfram-geany

This is a [Wolfram Language](https://en.wikipedia.org/wiki/Wolfram_Language) (WL) "plugin" for the [Geany](https://www.geany.org/) text editor editor based on UNIX-like systems (tested on Linux and MacOS)


### Features

1. Autocompletion of WL built-in symbols
2. Documentation shortcuts (via [zenity](https://en.wikipedia.org/wiki/Zenity) and Geany [_Context Action_](https://www.geany.org/manual/current/#context-actions))

### Dependencies
(All Platforms)

Download/Install:

1. [Geany](https://www.geany.org/Download/Releases)
2. [WolframCDFPlayer](https://www.wolfram.com/cdf-player)
3. [Wolframscript](https://www.wolfram.com/wolframscript)

#### Linux 
Be sure to have mlocate installed 
  `sudo apt-get install mlocate`

[zenity](https://gitlab.gnome.org/GNOME/zenity)
  `sudo apt-get install zenity`

#### MacOS

[brew](https://brew.sh/) 
  `/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"`

[findutils](http://macappstore.org/findutils/) 
  `brew install findutils`

[zenity](http://brewformulas.org/Zenity)
  `brew install zenity`


## Installation

`wolframscript -f wolfram-geany.wl`


### Post-Installation

You can display the documentation relative to the WL symbol at the cursor position from the menu entry in the popup menu of the editor and also a keyboard shortcut _Edit->Preferences->Keybindings->Editor:_ Context Action

A colorscheme that fits pretty nicely with the WL syntax is Kugel from the [Geany colorschemes](https://github.com/codebrainz/geany-themes)

The installation automatically configures Geany [_Execute_](https://www.geany.org/manual/current/#execute) to run a WL script by pressing F5.
In order to display the desired outputs, we suggest to install [urxvt](https://wiki.archlinux.org/index.php/rxvt-unicode), [rice it up](https://gist.github.com/ei-grad/3345657) a little and adjust Geany configuration to prompt out the script outputs _Edit->Preferences->Tools->Terminal: `urxvt -e /bin/sh %c`  

#### BUGS

On MacOS, evoking zenity from the _Context Action_ does not work, even thougth the very same command works if executed from the terminal. Please contribute! Thanks. 





