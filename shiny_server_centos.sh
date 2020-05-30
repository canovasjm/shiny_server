#!/bin/bash

# script for setting up a Shiny Server in a virtual machine 
# running CentOS 7.7

# trace all commands that are executed
set -x

# update CentOS
yum update -y

# install wget
yum install -y wget

# 1) install R and shiny server
# add Extra Packages for Enterprise Linux (EPEL)
yum install https://dl.fedoraproject.org/pub/epel/epel-release-latest-7.noarch.rpm

# install R
yum install -y R

# install some R packages
su - \
-c "R -e \"install.packages(c('shiny', 'rmarkdown'), repos='https://cran.rstudio.com/')\""

# download shiny server
wget https://download3.rstudio.org/centos6.3/x86_64/shiny-server-1.5.13.944-x86_64.rpm

# install shiny server
yum install -y --nogpgcheck shiny-server-1.5.13.944-x86_64.rpm

# restart shiny server
systemctl restart shiny-server





