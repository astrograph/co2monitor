#/bin/bash
curl -T /home/pi/co2monitor/`date +%Y-%m-%d`_co2.csv -u $FTP_USER:$FTP_PASSWORD $FTP_HOST
