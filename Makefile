
current_dir = $(shell pwd)

all: build-ssh build-git build-bash build-emacs

clean: clean-ssh clean-git clean-bash clean-emacs
	-rm .*~

build-emacs:
	-ln -s $(current_dir)/emacs ~/.emacs
	cp -r $(current_dir)/emacs.d ~/.emacs.d

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
