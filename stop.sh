if [ ${npm_config_dev} ]
  then
    kill `cat pid`
    rm pid;
    rm devlog.txt
else
   kill `cat /var/run/<SERVICE>`
fi
