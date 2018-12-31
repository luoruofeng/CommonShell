rm -rf /django-code158-log
mkdir /django-code158-log
rm -rf /uwsgi.log 

echo "remove log"

mysql -uroot -pc1o5d8e0 -e "drop database code158;"
mysql -uroot -pc1o5d8e0 -e "create database code158 default charset utf8 collate utf8_general_ci;"
cd /home/code158
python manage.py makemigrations && python manage.py migrate && cat /create_tables.txt  && python manage.py shell

port=8033
pid=$(netstat -nlp | grep :$port | awk '{print $7}' | awk -F"/" '{ print $1 }');

if [  -n  "$pid"  ];  then
    kill  -9  $pid;
fi
echo "kill uwsgi"

port=80
pid=$(netstat -nlp | grep :$port | awk '{print $7}' | awk -F"/" '{ print $1 }');

if [  -n  "$pid"  ];  then
    kill  -9  $pid;
fi

echo "kill nginx"
