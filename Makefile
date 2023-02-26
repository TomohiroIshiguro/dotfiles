help:
	cat Makefile

setup-mac:
	sh shell/setup-zsh.sh
	sh apps/install-in-mac.sh
	sh git/setup.sh
	sh vim/setup.sh
	sh tmux/setup.sh
	#vscode

setup-windows:
	sh shell/setup-bash.sh
	sh apps/install-in-windows.sh
	sh git/setup.sh
	sh vim/setup.sh
	sh tmux/setup.sh
	#vscode

setup-linux:
	sh shell/setup-bash.sh
	sh git/setup.sh
	sh vim/setup.sh
