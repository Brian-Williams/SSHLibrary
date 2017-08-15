#!/usr/bin/env bash

set -e

useradd test -m -s /bin/bash
echo "test:test"|chpasswd
echo "export PS1='\u@\h \W \$ '" >> ~test/.bashrc
useradd -m testkey -s /bin/bash
echo "export PS1='\u@\h \W \$ '" >> ~testkey/.bashrc
mkdir -p ~testkey/.ssh
ssh-keygen -t rsa -f ~testkey/.ssh/id_rsa -q -N ""
cp ~testkey/.ssh/id_rsa.pub ~testkey/.ssh/authorized_keys
cp ~testkey/.ssh/id_rsa /home/SSHLibrary/atest/testdata/keyfiles/
chmod 600 /home/SSHLibrary/atest/testdata/keyfiles/
service ssh restart
service ssh start
echo "ready for atests"
