
current_dir = $(shell pwd)

all: build-ssh build-git build-bash build-emacs build-terminator build-autostart

clean: clean-ssh clean-git clean-bash clean-emacs clean-terminator
	-rm .*~



install-dependencies:
	./add-ppa.sh kelleyk/emacs
	./add-ppa.sh git-core/ppa
	./add-ppa.sh gnome-terminator
	apt-get update
	apt-get install -y emacs25 git terminator autoconf texlive-full mercurial php php-pear
	./install-phptools.sh
	./install-nodejs.sh



build-autostart:
	-ln -s $(current_dir)/autostart/emacsserver ~/.config/autostart/emacsserver.desktop

clean-autostart:
	-rm ~/.config/autostart/emacsserver.desktop

build-emacs:
	-ln -s $(current_dir)/emacs ~/.emacs
	mkdir ~/.emacs.d/
	-ln -s $(current_dir)/emacs.d/settings ~/.emacs.d/settings

clean-emacs:
	-rm ~/.emacs
	-rm -r ~/.emacs.d



build-terminator:
	-ln -s $(current_dir)/terminator ~/.config/terminator

clean-terminator:
	-rm -rf ~/.config/terminator



build-ssh:
	-ln -s $(current_dir)/ssh-config ~/.ssh/config

clean-ssh:
	-rm ~/.ssh/config



build-git:
	-ln -s $(current_dir)/gitconfig ~/.gitconfig

clean-git:
	-rm ~/.gitconfig



build-bash:
	-ln -s $(current_dir)/bash_aliases ~/.bash_aliases
	-ln -s $(current_dir)/bashrc ~/.bashrc

clean-bash:
	-rm ~/.bash_aliases
	-rm ~/.bashrc
