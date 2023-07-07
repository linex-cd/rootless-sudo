
sudo chmod +x rlsudo

sudo cp rlsudo /opt/rlsudo
sudo cp start_rlsudo.sh /opt/start_rlsudo.sh

sudo cp rlsudo.service /etc/systemd/system/rlsudo.service

sudo systemctl daemon-reload

sudo systemctl start rlsudo

sudo systemctl enable rlsudo