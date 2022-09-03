<?php

// Checking if no arguments is passed
if ($argc === 1 && $argc !== 4) {
    echo 'No argument passed exiting...';
    return;
}

// Setting variables
$fileName = 'Dockerfile.laravel';
$phpVersion = $argv[1];
$webServer = $argv[2];
$composerVersion = $argv[3];

// Check file if exist
if (!file_exists(__DIR__."/$fileName")) {
    echo 'Dockerfile.laravel not found exiting...';
    return;
}

// Get file contents
$dockerfile = file_get_contents(__DIR__.'/Dockerfile.laravel');

// Replace respected variables and trim any empty line
$dockerfile = str_replace('${PHP_VERSION}', $phpVersion, $dockerfile);
$dockerfile = str_replace('${WEB_SERVER}', $webServer, $dockerfile);
$dockerfile = str_replace('${COMPOSER_VERSION}', $composerVersion, $dockerfile);
$dockerfile = preg_replace("/(^[\r\n]*|[\r\n]+)[\s\t]*[\r\n]+/", "\n", $dockerfile);

// Save the file again
file_put_contents(__DIR__."/$fileName", $dockerfile);