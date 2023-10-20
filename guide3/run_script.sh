#! /bin/bash

php artisan migrate

if [ $SEED == "true" ]; then
  php artisan db:seed
fi

php artisan serve --host=0.0.0.0