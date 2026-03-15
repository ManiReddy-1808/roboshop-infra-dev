#!/bin/bash

# This script is used to bootstrap the MongoDB server after provisioning. It will be executed by Terraform using the terraform_data resource.

# Update the package index and install MongoDB
component=$1
environment=$2

dnf install ansible -y

cd /home/ec2-user
git clone https://github.com/ManiReddy-1808/ansible-roboshop-roles-tf.git
cd ansible-roboshop-roles-tf
git pull
ansible-playbook -e component=$component -e environment=$environment roboshop.yaml