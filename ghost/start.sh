#!/usr/bin/env bash

MOUNT_PATH=/var/lib/ghost/content

# Change mount path if present
if [ ! -z ${GHOST_MOUNT_PATH+X} ];
    then
        MOUNT_PATH="$GHOST_MOUNT_PATH"
fi

# mfsmount cli parameters
# https://linux.die.net/man/8/mfsmount
MOUNT="mfsmount $MOUNT_PATH $MOUNT_PARAMETERS"

# Add host if set
if [ ! -z ${MFS_MASTER_HOST+X} ];
    then
        MOUNT="$MOUNT -H $MFS_MASTER_HOST"
fi

# Add host if set
if [ ! -z ${MFS_MASTER_PORT+X} ];
    then
        MOUNT="$MOUNT -P $MFS_MASTER_PORT"
fi

mkdir -p $MOUNT_PATH && chown root:root $MOUNT_PATH && chmod 777 $MOUNT_PATH
$MOUNT

node current/index.js
