i3-desktop: i3/desktop
	cp i3/desktop ~/.config/i3/config

dark-shiv-i3: i3/dark-shiv
	cp i3/dark-shiv ~/.config/i3/config

polybar-desktop:
	mkdir -p ~/.config/polybar
	cp polybar/desktop ~/.config/polybar/config
	cp polybar/launch.sh ~/.config/polybar/launch.sh

dark-shiv-polybar: polybar/dark-shiv polybar/dark-shiv.sh
	mkdir -p ~/.config/polybar
	cp polybar/dark-shiv ~/.config/polybar/config
	cp polybar/dark-shiv.sh ~/.config/polybar/launch.sh


nvim: init.vim
	cp init.vim ~/.config/nvim/init.vim

zshrc: .zshrc
	cp .zshrc ~/.zshrc

desktop: nvim polybar-desktop i3-desktop zshrc

dark-shiv: nvim dark-shiv-polybar dark-shiv-i3 zshrc
