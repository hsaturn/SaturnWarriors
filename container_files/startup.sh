echo "Starting apache..."
/usr/sbin/service apache2 start
tail -f /var/log/apache2/access.log
