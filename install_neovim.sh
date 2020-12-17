
BASHRC=~/.bashrc
if ! command -v nvim &> /dev/null; then

    if ! -d '~/.local/bin'; then
        mkdir -p "~/.local/bin"

	if ! grep -Fxq "~/.bashrc" ~/.bashrc; then
		 echo "PATH=$PATH:~/.local/bin" >> ~/.bashrc
		 source ~/.bashrc
	fi

	if [ ! -f "~/.local/bin/nvim" ] ; then
		if [ ! -f "nvim.appimage" ]; then
			curl -LO https://github.com/neovim/neovim/releases/latest/download/nvim.appimage
		fi
        mkdir -p ~/.local/appdata
		mv nvim.appimage ~/.local/appdata
        ./.local/appdata/nvim.appimage --appimage-extract
        ln -s ~/.local/appdata/~/.local/bin/nvim
		chmod u+x nvim.appimage
	fi
fi

CONFIG_DIR=~/.config

if [ ! -f "$CONFIG_DIR" ]; then
	mkdir -p  $CONFIG_DIR
fi
CONFIG_PATH=$CONFIG_DIR/nvim
FROM_PATH=$(pwd)/neovim
echo $FROM_PATH
echo $CONFIG_PATH
if [ !  -L "${CONFIG_PATH}" ] ||  [ ! -e "${CONFIG_PATH}" ]; then
	ln  -s "$FROM_PATH" "$CONFIG_PATH"
fi
git config --global core.editor nvim
