
current_dir = $(shell pwd)

all: build-ssh build-git build-bash build-terminator

clean: clean-ssh clean-git clean-bash clean-terminator
	-rm .*~



install-dependencies:
	./add-ppa.sh git-core/ppa
	apt-get update
	apt-get install -y git terminator autoconf



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
