#!/bin/bash
set -e

# Check the current user isnt root
if [ "$EUID" -ne 0 ]
then
    sudo /sbin/my_init
else
    /sbin/my_init
fi