#!/bin/bash

while [ l=l ]
do
   #eject cdrom
   eject /dev/cdrom1
   #pull cdrom track back in
   eject -t /dev/cdrom1
done