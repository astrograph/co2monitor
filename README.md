# CO<sub>2</sub> monitor for Raspberry Pi and Tostmann CO<sub>2</sub> monitor

Monitoring CO<sub>2</sub> level and temperature using a Raspberry Pi and a Tostmann CFA CO<sub>2</sub> Monitor.

A realtime clock is used to provide proper timestamps for the data in the csv file.

The script writes the data in CSV form to a daily file in the `/home/pi/co2monitor` folder.

An upload script is run by a cronjob to upload the data to a webserver. The hostname, username and password are stored in `/etc/environment`

## Hardware
* Raspberry Pi Zero W https://www.raspberrypi.org/products/raspberry-pi-zero-w/
* Tostmann CO<sub>2</sub> Sensor https://www.tfa-dostmann.de/produkt/co2-monitor-airco2ntrol-mini-31-5006/
* Realtime Clock for Raspberry Pi https://thepihut.com/products/mini-rtc-module-for-raspberry-pi
* USB OTG cable to connect the sensor to the Raspberry Pi

## Setup
Follow https://thepihut.com/blogs/raspberry-pi-tutorials/17209332-adding-a-real-time-clock-to-your-raspberry-pi to setup the realtime clock.

A [root cronjob](root_crontab) has to be installed to make sure the USB device socket can be read by the pi user.

The script is run by systemd therefore [co2monitor.service](co2monitor.service) has to be copied to `/etc/systemd/system/`

When the co2monitor.service file is installed or changed it has to be reloaded:

    sudo systemctl daemon-reload

The CO<sub>2</sub> monitoring service can then be controlled via systemctl:

    sudo systemctl enable co2monitor
    sudo systemctl start co2monitor
    sudo systemctl status co2monitor
    sudo systemctl stop co2monitor
    sudo systemctl restart co2monitor
    ...

## Visualization
An [index.html](index.html) is provided for visualizing the CO<sub>2</sub> data on the webserver
