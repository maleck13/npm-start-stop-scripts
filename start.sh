user=$(id -u);

export NODE_PATH=./lib:$NODE_PATH
echo NODE_PATH SET TO $NODE_PATH

if [ ${npm_config_dev} ]
  then
  	echo "starting dev server";
    if [ -f ./pid ]
      then echo "server already running with pid `cat pid`"
    else
     env NODE_PATH="./lib" /usr/local/bin/node ./server.js ./config/config.js >> ./devlog.txt 2>&1  &
    fi
else
	if [ $user != 0 ]
		then
			echo "Root must start this in production";
			exit 1;
	fi		
    env NODE_PATH="./lib" /usr/local/bin/node ./server.js ./config/config.js > ./devlog.txt 2>&1  &
    echo `pgrep -n node` > /var/run/<SERVICE>
    sleep 1
    cat /var/run/<SERVICE>;
    cat devlog.txt
fi
