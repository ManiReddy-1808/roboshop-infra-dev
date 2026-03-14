#!/bin/bash

# This script is used to bootstrap the MongoDB server after provisioning. It will be executed by Terraform using the terraform_data resource.

# Update the package index and install MongoDB
dnf install ansible -y
