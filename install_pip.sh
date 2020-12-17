
PYTHON="python"
if  command -v python3 &> /dev/null; then
	PYTHON="python3"
fi

if ! command -v pip &> /dev/null; then
	curl https://bootstrap.pypa.io/get-pip.py -o get-pip.py
	$PYTHON get-pip.py
	rm get-pip.py
	$PYTHON -m pip install --user --upgrade pynvim
fi

sudo apt-get install python3-venv
$PYTHON -m venv ~/.venv/nvim

. ~/.venv/nvim/bin/activate

pip install wheel
pip install black pylint pynvim

