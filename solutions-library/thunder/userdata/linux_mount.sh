#!/bin/bash

# Copyright (c) 2017, 2019, Oracle and/or its affiliates. All rights reserved.
yum update -y
DEVICE_DISK_MAPPINGS="${device_disk_mappings}"

sleep 120
for device_mapping in $${DEVICE_DISK_MAPPINGS}; do
  part="$(echo $${device_mapping}|cut -f 2 -d :)"
  mp="$(echo $${device_mapping}|cut -f 1 -d :)"
  mkdir -p $${mp}
  parted $${part} --script -- mklabel gpt
  parted $${part} --script -- mkpart primary 0% 100%
  sleep 20
  mkfs.ext4 $${part}1
  sleep 20
  echo "$${part}1 $${mp} ext4         defaults,_netdev,nofail       0       0" >> /etc/fstab
done
sleep 60
mount -a
