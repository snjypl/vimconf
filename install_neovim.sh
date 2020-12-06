
BASHRC=~/.bashrc
if ! command -v nvim &> /dev/null; then
	
	if ! grep -Fxq "~/.bashrc" ~/.bashrc; then 
		 echo "PATH=$PATH:~/.local/bin" >> ~/.bashrc
		 source ~/.bashrc
	fi 

	if [ ! -f "~/.local/bin/nvim" ] ; then
		if [ ! -f "nvim.appimage" ]; then
			curl -LO https://github.com/neovim/neovim/releases/latest/download/nvim.appimage
		fi 
		chmod u+x nvim.appimage
		mv nvim.appimage ~/.local/bin/nvim 
	fi
fi

CONFIG_DIR=~/.conf

if [ ! -f "$CONFIG_DIR" ]; then
	mkdir -p  $CONFIG_DIR	
fi
CONFIG_PATH=$CONFIG_DIR/neovim
FROM_PATH=$(pwd)/neovim
echo $FROM_PATH
echo $CONFIG_PATH
if [ !  -L "${CONFIG_PATH}" ] ||  [ ! -e "${CONFIG_PATH}" ]; then
	ln  -s "$FROM_PATH" "$CONFIG_PATH"
fi
git config --global core.editor nvim
