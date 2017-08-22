#!/bin/bash -e

echo VIYA_SERVICES_NODE_IP=$VIYA_SERVICES_NODE_IP

# prepate inventory.ini header
echo deployTarget ansible_ssh_host=$VIYA_SERVICES_NODE_IP > /tmp/stackinv.ini

# untar playbook
tar xvf /tmp/SAS_Viya_playbook.tgz

pushd sas_viya_playbook

mv /tmp/update.inventory.yml .
ansible-playbook update.inventory.yml

mv /tmp/localusersandgroups*yml .
ansible-playbook localusersandgroups.yml

mv /tmp/pre-deployment.yml .
ansible-playbook pre-deployment.yml



popd

