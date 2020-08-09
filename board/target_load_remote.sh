#!/usr/bin/bash

PORT=$1
USER=$2
PASSWD=$3

cd ../../buildroot

# Update kernel.
rsync -aXvzh -e "sshpass -p $PASSWD ssh -p $PORT" output/images/zImage	$USER@f.opteh.ru:/boot/
rsync -aXvzh -e "sshpass -p $PASSWD ssh -p $PORT" output/images/boot.scr	$USER@f.opteh.ru:/boot/
# sshpass -p $PASSWD scp -P$PORT output/images/zImage		$USER@f.opteh.ru:/boot/zImage
# sshpass -p $PASSWD scp -P$PORT output/images/boot.scr	$USER@f.opteh.ru:/boot/boot.scr

# Update filesystem.
tar -C ../tmp/ -xf output/images/rootfs.tar
rsync -raXvzh --exclude=../tmp/usr/bin/ssh --exclude=../tmp/usr/bin/rsync -e "sshpass -p $PASSWD ssh -p $PORT" ../tmp/ $USER@f.opteh.ru:/
