#! /bin/bash

if [ $SEED == "false" ]; then
    php artisan migrate
else
	php artisan migrate --seed
fi

php artisan serve --host=0.0.0.0