#!/bin/bash
echo "------ Starting APP ------"
if [ $CF_INSTANCE_INDEX = "0" ]; then
    echo "----- Initalize Database -----"
    python manage.py db init
    echo "----- Migrate Database -----"
    python manage.py db migrate
    echo "----- Apply Migrations -----"
    python manage.py db upgrade
    echo "----- Load Database -----"
    python manage.py update_database
fi
gunicorn quotas:app --log-file -