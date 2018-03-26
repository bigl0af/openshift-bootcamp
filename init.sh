#!/bin/bash
OSWD=$HOME/openshift-ansible-clone

curl -k -s https://c1-gitlab.corp.netapp.com/ansible/ansible-pull/raw/master/bootstrap.sh | ssh-agent /bin/bash

yum install git ansible python-paramiko sshpass python-crypto python2-crypto ansible -y
git clone https://github.com/openshift/openshift-ansible.git $OSWD && cd $OSWD
git checkout release-3.6
ssh-keygen -b 2048 -t rsa -f $HOME/.ssh/id_rsa -q -N ""
cat $HOME/.ssh/id_rsa.pub >> $HOME/.ssh/authorized_keys
