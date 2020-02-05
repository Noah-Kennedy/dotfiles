i3-desktop: i3/desktop
	cp i3/desktop ~/.config/i3/config

polybar-desktop: polybar/desktop polybar/desktop.sh
	mkdir -p ~/.config/polybar
	cp polybar/desktop ~/.config/polybar/config
	cp polybar/launch.sh ~/.config/polybar/launch.sh

nvim: init.vim
	cp init.vim ~/.config/nvim/init.vim

zshrc: .zshrc
	cp .zshrc ~/.zshrc

desktop: nvim polybar-desktop i3-desktop zshrc
