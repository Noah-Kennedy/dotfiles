broadsword-i3: i3/broadsword
	cp i3/broadsword ~/.config/i3/config

shiv-i3: i3/shiv
	cp i3/shiv ~/.config/i3/config

broadsword-polybar:
	mkdir -p ~/.config/polybar
	cp polybar/broadsword ~/.config/polybar/config
	cp polybar/broadsword.sh ~/.config/polybar/launch.sh

shiv-polybar: polybar/shiv polybar/shiv.sh
	mkdir -p ~/.config/polybar
	cp polybar/shiv ~/.config/polybar/config
	cp polybar/shiv.sh ~/.config/polybar/launch.sh


nvim: init.vim
	cp init.vim ~/.config/nvim/init.vim

zshrc: .zshrc
	cp .zshrc ~/.zshrc

alacritty: alacritty.yml
	cp alacritty.yml ~/.config/alacritty/alacritty.yml

compton: compton.conf
	cp compton.conf ~/.config/compton.conf

xresources: .Xresources
	cp .Xresources ~/.Xresources

generic: nvim zshrc alacritty compton xresources 

broadsword: generic broadsword-polybar broadsword-i3

shiv: generic shiv-polybar shiv-i3
