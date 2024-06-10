
# MOADF - Laravel <3

Mother Of All Dockerfiles for Laravel PHP framework made by Qasim Nouh

## Installation

Download and run

```bash
  # Follow the interactive shell instruction and you will be all good
  # wget
  bash <(wget -O - https://github.com/HydroMoon/MOADF-Laravel/releases/download/1.1.0-dev/start.sh)
  # cURL
  bash <(curl -s -L https://github.com/HydroMoon/MOADF-Laravel/releases/download/1.1.0-dev/start.sh)
```

## How to use

If you have any other configuration needed you can add to the dockerfile or prepare.sh if you want to install other packages needed by laravel packages etc...


## Cron jobs

Add them to moadf/cron/{new cron job}
please do not forget to specifiy the user who will be running the job

```bash
  # define user who will run th command
  * * * * * www-data /usr/local/bin/php /var/app/artisan schedule:run --verbose --no-interaction >> /dev/null 2>&1
```
    
## Startup scripts

All startup scripts are run in lexicographical order [Read here about lexicographical order](https://stackoverflow.com/questions/45950646/what-is-lexicographical-order)

If you want to define startup scrips add them to moadf/startup/{script name.sh}
