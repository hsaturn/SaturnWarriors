id=$(docker build . | grep "Successfully built" | awk '{print $3}')
if [ "$id" == "" ]; then
	docker build .
else
	echo "Build id = $id"
	if [ "$1" == "" ]; then
		echo "Running..."
		docker run -p 80:80 $id
	else
		echo "Running shell..."
		docker run -t -i $id /bin/bash
	fi
fi
