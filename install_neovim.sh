
BASHRC=${HOME}/.bashrc
PWD=$(pwd)
set -e
if ! command -v nvim &> /dev/null; then

    if [ ! -d "${HOME}/.local/bin" ] ; then
        mkdir -p "${HOME}/.local/bin"

    fi
	if ! grep -Fxq "${HOME}/.local/bin" ${HOME}/.bashrc; then
		 echo "PATH=$PATH:${HOME}/.local/bin" >> ${HOME}/.bashrc
		 source ${HOME}/.bashrc
	fi

	if [ ! -f "${HOME}/.local/bin/nvim" ] ; then
		if [ ! -f "nvim.appimage" ]; then
			curl -LO https://github.com/neovim/neovim/releases/latest/download/nvim.appimage
		fi
		APPDATA="${HOME}/.local/appdata"
		echo $APPDATA
		mkdir -p ${APPDATA}
		mv nvim.appimage ${APPDATA}
		APPIMAGE="${HOME}/.local/appdata/nvim.appimage"
		echo ${APPIMAGE}

		chmod 755 ${APPIMAGE}
		cd ${APPDATA}
		ls -lath ${APPIMAGE}
		 ${APPIMAGE} --appimage-extract

		VIMPATH="${APPDATA}/squashfs-root/usr/bin/nvim"
		chmod 755 ${VIMPATH}
        	ln -s "${VIMPATH}" "${HOME}/.local/bin/nvim"
		cd $PWD
	fi
fi
cd $PWD
CONFIG_DIR=${HOME}/.config

if [ ! -f "$CONFIG_DIR" ]; then
	mkdir -p  $CONFIG_DIR
fi
CONFIG_PATH=$CONFIG_DIR/nvim
FROM_PATH=$PWD/neovim
echo $FROM_PATH
echo $CONFIG_PATH
if [ !  -L "${CONFIG_PATH}" ] ||  [ ! -e "${CONFIG_PATH}" ]; then
	ln  -s "$FROM_PATH" "$CONFIG_PATH"
fi
git config --global core.editor nvim
