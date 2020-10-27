#!/bin/bash

composer install
php bin/console doctrine:database:drop --force
php bin/console doctrine:database:create
php bin/console doctrine:migrations:migrate --no-interaction
php bin/console hautelook:fixtures:load -n --no-bundles
php bin/console cache:clear --no-warmup
php bin/console assets:install public --symlink --relative
