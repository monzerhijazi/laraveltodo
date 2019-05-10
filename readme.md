# Task Manager - Project Submission

## Technologies Used
Mac, MySQL, PHP 7.3+

To run app:
## create .env file and ensure settings are setup correctly to point at DB
## composer install (I've committed the mac vendor directory, you may have to remove and run composer install if you're using windows or a different version of PHP)
## Generate encryption key for laravel php artisan key:generate
## create DB using dbdump/Dump20190510.sql (you can also use ```php artisan migrate``` if you want to start fresh) 
## npm install (optional as I've committed built JS/CSS)
## Point apache to /public directory of code repository