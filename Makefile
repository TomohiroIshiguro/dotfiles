CURDIR="$(PWD)"

help:
	cat Makefile

setup-mac:
	sh ${CURDIR}/shell/setup-zsh.sh ${CURDIR}
	sh ${CURDIR}/apps/install-in-mac.sh ${CURDIR}
	sh ${CURDIR}/git/setup.sh ${CURDIR}
	sh ${CURDIR}/vim/setup.sh ${CURDIR}
	sh ${CURDIR}/tmux/setup.sh ${CURDIR}
	#vscode

setup-windows:
	sh ${CURDIR}/shell/setup-bash.sh ${CURDIR}
	sh ${CURDIR}/apps/install-in-windows.sh ${CURDIR}
	sh ${CURDIR}/git/setup.sh ${CURDIR}
	sh ${CURDIR}/vim/setup.sh ${CURDIR}
	sh ${CURDIR}/tmux/setup.sh ${CURDIR}
	#vscode

setup-linux:
	sh ${CURDIR}/shell/setup-bash.sh ${CURDIR}
	sh ${CURDIR}/git/setup.sh ${CURDIR}
	sh ${CURDIR}/vim/setup.sh ${CURDIR}
