#!/bin/bash

sudo chmod +x /opt/rlsudo/rlsudo
sudo chmod +x /opt/rlsudo/start_rlsudo.sh

sudo cp /opt/rlsudo/rlsudo.service /etc/systemd/system/rlsudo.service

sudo systemctl daemon-reload

sudo systemctl start rlsudo

sudo systemctl enable rlsudo