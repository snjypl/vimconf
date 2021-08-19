set -e 
PWD=$(pwd)
if ! command -v node &> /dev/null; then

    echo "install node"
    curl --fail -LSs https://install-node.now.sh/latest -o install_node.sh
    bash install_node.sh   --prefix="${HOME}/.local"  --verbose -y
    rm install_node.sh

fi

COC_START_PATH=~/.local/share/nvim/site/pack/coc/start
echo $COC_START_PATH
mkdir -p $COC_START_PATH
curl --fail -L https://github.com/neoclide/coc.nvim/archive/release.tar.gz | tar -C $COC_START_PATH  -xzvf -

mkdir -p ~/.config/coc/extensions
echo "config"
COC_PKG_FILE=~/.config/coc/extensions/package.json
if [ ! -L $COC_PKG_FILE ]; then
	echo "creating cock pkg"
	ln -s $PWD/nvim-coc/package.json $COC_PKG_FILE
fi
cd ~/.config/coc/extensions
npm install coc-snippets --global-style --ignore-scripts --no-bin-links --no-package-lock --only=prod
cd $PWD
