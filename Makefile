
current_dir = $(shell pwd)

all: build-ssh build-git build-bash build-emacs build-autostart

clean: clean-ssh clean-git clean-bash clean-emacs
	-rm .*~

install-dependencies:
	apt-add-repository -y ppa:adrozdoff/emacs
	add-apt-repository ppa:git-core/ppa
	apt-get update
	apt-get install emacs25 git terminator autoconf texlive-full mercurial php php-pear
	pear install --alldeps PHP_CodeSniffer


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
