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
CREATE USER 'enjoy'@'localhost' IDENTIFIED BY 'enjoyBooking';  
GRANT ALL PRIVILEGES ON enjoyBooking.* TO 'enjoy'@'localhost';  
exit 
```
Installare i seguenti applicativi se non sono gia installati:
```sh
pip3 install --user mysqlclient 
```
Se il comando di prima provoca questo errore:'Command "python setup.py egg_info" failed with error code 1 in /tmp/pip-build-eh_ti6ag/mysqlclient/' allora usare il seguente comando: 
```sh
pip3 install --user --upgrade setuptools
```
e ridare il comando precedente.  
```sh
pip3 install --user django-mysql  
pip3 install --user geopy  
git clone https://github.com/The-BFG/EnjoyBooking.git  
```
11_1_se si vuole avere un progetto pulito senza dati allora eliminare tutti i file *.py presenti in migrations tranne "__init__.py" e tutti i file *.pyc in migrations/__pycache__/*pyc dopodichè dare i comandi:  
```sh
python manage.py makemigrations [app]  
python manage.py migrate  
```
Se si vuole invece popolare il sito con dati di test dare il seguente comando:  
```sh
mysql -u enjoy -p enjoyBooking < enjoyBooking.sql .  
```
Per creare un nuovo utente admin dare il comando e inserire i dati richiesti:  
```sh
python manage.py createsuperuser 
```
Per fare partire il server in locale sulla porta 8000 con il seguente comando:  
```sh
python manage.py runserver  
```  
  
Alla fine del test del progetto usare i seguenti comandi per eliminare tutto:  
```sh
mysql -u root -p  
```
```mysql
1_drop database enjoyBooking;  
2_REVOKE ALL PRIVILEGES, GRANT OPTION FROM 'enjoy'@'localhost';  
3_DROP USER 'enjoy'@'localhost';  
4_exit
```  
  
Credenziali admin django:  
user: enjoy@enjoybooking.com  
password: enjoyBooking2019
