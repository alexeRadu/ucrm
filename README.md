# ucrm
Small, fast CRM

# Instalation on Windows
- Install Python 3, latest version (tested on python 3.10) from https://www.python.org/downloads/
- Install git from https://git-scm.com/download/win
- Follow instruction for installing Flask inside a virtual environment: https://flask.palletsprojects.com/en/2.0.x/installation/

# Initialize Database
This step is needed either at first start or everytime the database schema changes. To do that run:
```
$ cd <path>/ucrm
$ py -3 -m venv venv
$ venv\Script\activate
$ set FLASH_APP=ucrm
$ flask init-db
```

# Run on windows
```
$ cd <path>/ucrm
$ py -3 -m venv venv
$ venv\Scripts\activate
$ set FLASK_APP=ucrm
$ flask run
```
