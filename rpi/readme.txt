startup:

# install virtual environment
py -m venv $pwd
./.venv/Scripts/activate # windows
source ./bin/activate    # linux

# For Raspi
sudo apt-get install python3-scipy
# Install relevant packages
py -m pip install matplotlib scipy numpy

# In the event that py -m complains about "No python" edit your pyenv.cfg file python path

