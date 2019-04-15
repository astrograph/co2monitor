#/bin/bash
latest_csv_file=$(ls -dt *.csv | head -1)
echo $latest_csv_file
curl -T /home/pi/co2monitor/$latest_csv_file -u $FTP_USER:$FTP_PASSWORD $FTP_HOST/co2.csv
curl -T /home/pi/co2monitor/$latest_csv_file -u $FTP_USER:$FTP_PASSWORD $FTP_HOST/

