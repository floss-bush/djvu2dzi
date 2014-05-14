<?php
require_once 'vendor/autoload.php';
//require_once 'vendor/bush/ParseCommand.php';

use Symfony\Component\Console\Application;
use bush\ParseCommand;


$application = new Application();
$application->add(new Parsecommand);
$application->run();

