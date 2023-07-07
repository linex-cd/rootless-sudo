

sudo systemctl disable rlsudo

sudo systemctl stop rlsudo

sudo rm /opt/rlsudo
sudo rm /opt/start_rlsudo.sh

sudo rm /etc/systemd/system/rlsudo.service

sudo systemctl daemon-reload


