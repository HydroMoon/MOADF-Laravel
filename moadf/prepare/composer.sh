#!/bin/sh
# Run composer command with the right permession
export COMPOSER_HOME=/tmp
export COMPOSER_MEMORY_LIMIT=-1 
setuser www-data ncomposer $@