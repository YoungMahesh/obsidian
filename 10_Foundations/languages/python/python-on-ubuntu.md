```bash
cd <project-path>

# If virtual environmet does not exist (check if .venv exists)
#   create virtual environment
#   python3 → Run the Python 3 interpreter.
#   -m → Run a Python module as a program.
#   venv → The standard library module that creates virtual environments.
#   .venv → The directory where the virtual environment will be created.
python3 -m venv .venv

# Activate the virtual environment
source .venv/bin/activate
# you can execute `which python` to confirm you are using python from activated environment 

# install packages
pip install <package-name>


# to execute packages, do not use python or python3 inside environment
# e.g. use
<package> setup # instead of using `python3 <package> setup`

# to leave environment
deactivate
```

```bash
# install virtual environment module
sudo apt install python3-venv
```