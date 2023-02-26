help:
	cat Makefile

setup-mac:
	sh shell/setup-zsh.sh $(PWD)
	sh apps/install-in-mac.sh $(PWD)
	sh git/setup.sh $(PWD)
	sh vim/setup.sh $(PWD)
	sh tmux/setup.sh $(PWD)
	#vscode

setup-windows:
	sh shell/setup-bash.sh $(PWD)
	sh apps/install-in-windows.sh $(PWD)
	sh git/setup.sh $(PWD)
	sh vim/setup.sh $(PWD)
	sh tmux/setup.sh $(PWD)
	#vscode

setup-linux:
	sh shell/setup-bash.sh $(PWD)
	sh git/setup.sh $(PWD)
	sh vim/setup.sh $(PWD)
