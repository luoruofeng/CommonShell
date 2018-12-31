rm -rf /django-code158-log
mkdir /django-code158-log
rm -rf /uwsgi.log

echo "remove log"

function kill_process(){
	port=$1
	pid=$(netstat -nlp | grep :$port | awk '{print $7}' | awk -F"/" '{ print $1 }');

	if [  -n  "$pid"  ];  then
    		kill  -9  $pid;
	fi
	echo "kill port $1"
}
kill_process 8033 && kill_process 80 && uwsgi --ini /home/code158/uwsgi.ini && nginx && netstat -nlp
