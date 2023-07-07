#!/bin/bash

sudo systemctl disable rlsudo

sudo systemctl stop rlsudo


sudo rm /etc/systemd/system/rlsudo.service

sudo systemctl daemon-reload


