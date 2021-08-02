#!/bin/bash

%{ for x in soft ~}
sudo yum -y install ${x}
%{ endfor ~}


sudo systemctl httpd start
chkconfig httpd on
