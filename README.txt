migraciones: 
    1.- python manage.py makemigrations main
    2.- python manage.py migrate

django admin =
    user: admin
    pass: admin

operario de prueba:
    user: operario1@prueba.com
    pass: prueba

Dependencias:
    requirements.txt
	pip install -r requirements.txt

En caso de no poder realizar las migraciones por autentificación ejecutar estos comandos en MySQL:
	create user dbadmin identified by ‘12345’;
	grant all on aero_chile.* to ‘dbadmin’@’%’;
	flush privileges;