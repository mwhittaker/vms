```bash
bash /vagrant/install_dotfiles.sh
bash /vagrant/install_conda.sh
bash /vagrant/install_mujoco.sh

conda create --name deeprl python=3.5.2
source activate deeprl
bash /vagrant/install_deeprl.sh
bash /vagrant/install_xfce4.sh
```
