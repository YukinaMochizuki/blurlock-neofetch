Blurlock neofetch
======
A simple script that blurs lock and displays neofetch. (use i3lock)

[![](https://github.com/YukinaMochizuki/blurlock-neofetch/raw/master/outputHD.gif)](https://github.com/YukinaMochizuki/blurlock-neofetch/blob/master/outputHD.gif)

## Environment
- Distro: arch linux (other distro may work but not tested)
- Window manager: i3-gaps (i3wm may work but not tested)

## Dependencies
- `bash` - [wiki](https://wiki.archlinux.org/index.php/Bash)
- `i3lock` - [package](https://www.archlinux.org/packages/community/x86_64/i3lock/)
- `rxvt-unicode` - [wiki](https://wiki.archlinux.org/index.php/Rxvt-unicode)
- `scrot` - [wiki](https://wiki.archlinux.org/index.php/Screen_capture)
- `convert` - [wiki](https://wiki.archlinux.org/index.php/ImageMagick)
- `neofetch` - [repo](https://github.com/dylanaraps/neofetch)

## Installation

### From GitHub Repo

````
git clone https://github.com/YukinaMochizuki/blurlock-neofetch.git
cd blurlock-neofetch
./blurlock
````

#### Example: neofetch with a image ([neofetch: Images in the terminal](https://github.com/dylanaraps/neofetch/wiki/Images-in-the-terminal))
````
./blurlock -c 'neofetch --w3m ~/lock-icon.jpg'
````

#### Optional: add hotkey to your i3wm
````
bindsym $mod+o exec "path/blurlock-neofetch/blurlock -c 'neofetch --w3m ~/lock-icon.jpg'"
````

## Configuration
````
Usage: blurlock [OPTION]

  -h, --help                  Display this help and exit
  -b, --backgroud HEXCOLOR    Terminal's backgroud (default "#141c21")
  -t, --transparency TYPE     Turn off rxvt transparency option (default: none)
                              TYPE is one of real, fake, none
  -c, --command CMD           Take terminal screenshot after this command (default: neofetch)
````

## Credit
This script is a fork of [goosewood/blurlock-neofetch](https://github.com/goosewood/blurlock-neofetch). Although I have made a lot of changes, and the code of this repository has no longer worked (the main reason is that neofetch does not support the scrot option after this [issue #1001](https://github.com/dylanaraps/neofetch/issues/1001)), but I'm still very grateful for him/her ideas and code for giving me inspiration. Without your help, I couldn't have done it.
