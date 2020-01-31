# Copyright (c) 2017, 2019, Oracle and/or its affiliates. All rights reserved.
#ps1_sysnative
Start-Transcript
Sleep 250
$device_disk_mappings='${device_disk_mappings}'
$device_disk_mappings=$device_disk_mappings.split(' ')
foreach($device in $device_disk_mappings) {
    $mount_point=$device.split(':')[0]
    $disk_size=$device.split(':')[1]
    $number=(Get-Disk | Where-Object { $_.Size -eq $disk_size } | select number).number
    Initialize-Disk -Number $number -PartitionStyle GPT
    New-Partition -DiskNumber $number -UseMaximumSize -DriveLetter $mount_point
    Format-Volume -DriveLetter $mount_point -FileSystem NTFS -confirm:0
}

#get-PhysicalDisk
#get-VirtualDisk