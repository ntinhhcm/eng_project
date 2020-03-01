@ECHO OFF
ECHO Docker is starting...
PowerShell -NoProfile -ExecutionPolicy Bypass -Command "& docker-compose start nest-app-web nest-app-db php"

:menu
ECHO Which server do you want to remote?
ECHO 1. PHP
ECHO 2. Nest
ECHO 3. Mysql
ECHO Source code
ECHO 4. Go to laravel source
ECHO 5. Go to Nest source
ECHO 6. Go to Vue-Connect source
ECHO 7. Go to Vue-Kareer source
ECHO Restart server
ECHO 8. Restart PHP server
ECHO 9. Restart Nest server
ECHO 10. Restart Mysql server
ECHO 0. Exit

SET /p input="Input here:"
IF %input%==1 (
ECHO Remote to PHP server...
PowerShell -NoProfile -ExecutionPolicy Bypass -Command "& docker-compose exec php /bin/bash"
) ELSE IF %input%==2 (
ECHO Remote to Nodejs server...
PowerShell -NoProfile -ExecutionPolicy Bypass -Command "& docker-compose exec nest-app-web /bin/bash"
) ELSE IF %input%==3 (
ECHO Remote to mysql server...
PowerShell -NoProfile -ExecutionPolicy Bypass -Command "& docker-compose exec nest-app-db /bin/bash"
) ELSE IF %input%==4 (
CD engagika_backend_laravel
start "" "%ProgramFiles%\Git\git-bash.exe"
CD ../
) ELSE IF %input%==5 (
CD engagika_backend_nestjs
start "" "%ProgramFiles%\Git\git-bash.exe"
CD ../
) ELSE IF %input%==6 (
CD engagika_vuejs
start "" "%ProgramFiles%\Git\git-bash.exe"
CD ../
) ELSE IF %input%==7 (
CD engagika_kareer_vuejs
start "" "%ProgramFiles%\Git\git-bash.exe"
CD ../
) ELSE IF %input%==8 (
ECHO PHP is restarting...
PowerShell -NoProfile -ExecutionPolicy Bypass -Command "& docker-compose stop php"
PowerShell -NoProfile -ExecutionPolicy Bypass -Command "& docker-compose start php"
) ELSE IF %input%==9 (
ECHO Nest is restarting...
PowerShell -NoProfile -ExecutionPolicy Bypass -Command "& docker-compose stop nest-app-web"
PowerShell -NoProfile -ExecutionPolicy Bypass -Command "& docker-compose start nest-app-web"
) ELSE IF %input%==10 (
ECHO Mysql is restarting...
PowerShell -NoProfile -ExecutionPolicy Bypass -Command "& docker-compose stop nest-app-db"
PowerShell -NoProfile -ExecutionPolicy Bypass -Command "& docker-compose start nest-app-db"
) ELSE (
ECHO Docker is closing...
PowerShell -NoProfile -ExecutionPolicy Bypass -Command "& docker-compose stop"
Exit
)
PAUSE
Goto menu