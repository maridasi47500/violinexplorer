IP=$(hostname -I | awk '{print $1}' | { read a _ ; echo "$a"; })
echo $IP
echo $IP
echo $IP
rails s -b $IP
