PWD=$(pwd)
if [  -x "$(command -v node)" ]; then
    curl --fail -LSs https://install-node.now.sh/latest -o install_node.sh
    bash install_node.sh   --prefix="${HOME}/.local"  --verbose -y 
    rm install_node.sh
fi

COC_START_PATH=~/.local/share/nvim/site/pack/coc/start
echo $COC_START_PATH
mkdir -p $COC_START_PATH 
curl --fail -L https://github.com/neoclide/coc.nvim/archive/release.tar.gz | tar -C $COC_START_PATH  -xzvf -

mkdir -p ~/.config/coc/extensions
COC_PKG_FILE=~/.config/coc/extensions/package.json
if [ ! -L $COC_PKG_FILE ]; then
	ln -s $PWD/nvim-coc/package.json $COC_PKG_FILE 
fi
cd ~/.config/coc/extensions
npm install coc-snippets --global-style --ignore-scripts --no-bin-links --no-package-lock --only=prod
cd $PWD
