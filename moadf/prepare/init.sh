#!/bin/bash

echo -e '\033[0;34m
 _______  _______  _______  ______   _______ 
(       )(  ___  )(  ___  )(  __  \ (  ____ \
| () () || (   ) || (   ) || (  \  )| (    \/
| || || || |   | || (___) || |   ) || (__    
| |(_)| || |   | ||  ___  || |   | ||  __)   
| |   | || |   | || (   ) || |   ) || (      
| )   ( || (___) || )   ( || (__/  )| )      
|/     \|(_______)|/     \|(______/ |/       
'
echo -e '\033[0;31m' Mother Of All Docker Files - for '\033[0;32m'Laravel '\033[0;31m':D                                             
echo -e '\033[0;33m' "   Qasim Nouh - https://qasimnouh.com" '\033[0m'
echo -e '\033[0;32m' "   Teams handle <gasim@applab.qa>\n" '\033[0m'
echo -e '\033[0;31m' "   Active Directory:" '\033[0;32m' "/var/app" '\033[0m'
echo -e '\033[0;31m' "   Available Shortcuts:" '\033[0m'
echo -e '\033[0;32m' "      Use 'artisan' not 'php artisan'" '\033[0m'
echo -e '\033[0;32m' "      ex. 'artisan optimize:clear'\n" '\033[0m'

if [ "$ENABLE_CRON" = true ]; then
echo -e '\033[0;31m' "   Cron/Queue Status:"'\033[0;32m' "Enabled" '\033[0m'
else
echo -e '\033[0;31m' "   Cron/Queue Status:"'\033[0;33m' "Disabled" '\033[0m'
fi
if [ "$INSTALL_NODE" = true ]; then
echo -e '\033[0;31m' "   Node Installed:"'\033[0;32m' "TRUE" '\033[0m'
else
echo -e '\033[0;31m' "   Node Installed:"'\033[0;33m' "FALSE" '\033[0m'
fi
echo -e "\n"
echo -e '\033[0;34m'"Make sure you Docker BUILD_KIT is enabled for the best pipeline build pereformance\n"'\033[0m'
