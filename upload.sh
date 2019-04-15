#/bin/bash
latest_csv_file=$(ls -dt /home/pi/co2monitor/*.csv | head -1)
curl -T $latest_csv_file -u $FTP_USER:$FTP_PASSWORD $FTP_HOST/co2.csv
curl -T $latest_csv_file -u $FTP_USER:$FTP_PASSWORD $FTP_HOST/

