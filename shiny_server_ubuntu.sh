#!/bin/bash

# script for setting up a Shiny Server in a virtual machine 
# running Ubuntu 20.04 LTS 'Focal Fossa'

# trace all commands that are executed
set -x

# update Ubuntu
apt-get update -y

# install wget
apt-get install -y wget

# 1) install R and shiny server
# add the CRAN repository
deb https://cloud.r-project.org/bin/linux/ubuntu focal-cran40/

# install R
apt-get install -y r-base

# install some R packages
su - \
-c "R -e \"install.packages(c('shiny', 'rmarkdown'), repos='https://cran.rstudio.com/')\""

# install gdebi-core
sudo apt-get install gdebi-core

# download shiny server
wget https://download3.rstudio.org/ubuntu-14.04/x86_64/shiny-server-1.5.13.944-amd64.deb

# install shiny server
gdebi --n shiny-server-1.5.13.944-amd64.deb

# restart shiny server
systemctl restart shiny-server
