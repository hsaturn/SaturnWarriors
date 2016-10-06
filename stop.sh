id=$(docker ps | grep "0.0.0.0:80-" | awk '{print $1}')
if [ "$id" == "" ]; then
	echo "Nothing to stop"
else
	echo "Stopping $id"
	docker stop $id
fi
