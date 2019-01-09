# EnjoyBooking
University project written in python 3.6 using Django 2.0.5. A booking site in AirBnb style. 


# Installation instructions:

Corretto settaggio per accedere correttamente al DB da Django:  
#accedere a mysql con utente con permessi elevati.
```sh
mysql -u root -p 
  
```
```mysql
CREATE DATABASE enjoyBooking;  
```
3_CREATE USER 'enjoy'@'localhost' IDENTIFIED BY 'enjoyBooking'; #che sono i dati che vengono usati nel progetto.  
4_GRANT ALL PRIVILEGES ON enjoyBooking.* TO 'enjoy'@'localhost';  
5_FLUSH PRIVILEGES;  
6_SHOW GRANTS FOR 'enjoy'@'localhost'; #per verificare i permessi  
7_exit  
8_pip3 install --user mysqlclient #se non è gia stato installato  
8_1_se il comando di prima provoca questo errore:'Command "python setup.py egg_info" failed with error code 1 in /tmp/pip-build-eh_ti6ag/mysqlclient/' allora usare il seguente comando: 'pip3 install --user --upgrade setuptools' e ridare il comando precedente.  
9_pip3 install --user django-mysql  
10_pip3 install --user geopy  
11_git clone https://github.com/The-BFG/EnjoyBooking.git  
11_1_se si vuole avere un progetto pulito senza dati allora eliminare tutti i file *.py presenti in migrations tranne "__init__.py" e tutti i file *.pyc in migrations/__pycache__/*pyc dopodichè dare i comandi:  
python manage.py makemigrations [app]  
python manage.py migrate  
11_2_se si vuole invece popolare il sito con dati di test dare il seguente comando:  
mysql -u enjoy -p enjoyBooking < enjoyBooking.sql .  
12_infine fare partire il server in locale sulla porta 8000 con il seguente comando:  
python manage.py runserver  
  
  
Alla fine del test del progetto usare i seguenti comandi per eliminare tutto:  
0_mysql -u root -p  
1_drop database enjoyBooking;  
2_REVOKE ALL PRIVILEGES, GRANT OPTION FROM 'enjoy'@'localhost';  
3_DROP USER 'enjoy'@'localhost';  
  
  
Credenziali admin django:  
user: enjoy@enjoybooking.com  
password: enjoyBooking2019  
  
Per creare un nuovo utente admin dare il comando e inserire i dati richiesti:  
python manage.py createsuperuser  
