#!/bin/sh
cd ../
terraform fmt | terraform apply -auto-approve