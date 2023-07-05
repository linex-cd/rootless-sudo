
sudo chmod +x mysudo

sudo cp mysudo /opt/mysudo
sudo cp start_mysudo.sh /opt/start_mysudo.sh

sudo cp mysudo.service /etc/systemd/system/mysudo.service

sudo systemctl daemon-reload

sudo systemctl start mysudo

sudo systemctl enable mysudo