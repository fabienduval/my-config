current_dir = $(shell pwd)

all:
	-ln -s $(current_dir)/bash_aliases ~/.bash_aliases
	-ln -s $(current_dir)/gitconfig ~/.gitconfig
	-ln -s $(current_dir)/ssh-config ~/.ssh/config


clean:
	-rm ~/.bash_aliases
	-rm ~/.gitconfig
	-rm ~/.ssh/config

