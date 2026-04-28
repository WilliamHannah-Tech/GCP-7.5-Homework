#!/bin/bash
    sudo apt update -y
    sudo apt install -y git
    sudo apt install -y git nginx

    sudo systemctl enable nginx
    sudo systemctl start nginx


    cd /tmp
    sudo git clone https://github.com/BalericaAI/SEIR-1.git

    sudo chmod +x /tmp/SEIR-1/weekly_lessons/weeka/userscripts/supera.sh
    sudo bash /tmp/SEIR-1/weekly_lessons/weeka/userscripts/supera.sh


    