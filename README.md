'Cooler Angel' Controller
=======
relayrWRT Firmware
===================================
Features
------
1. Flexible wifi configuration(internet access) via Luci
2. I2C driverintegration
3. SPI deriver integration
4. Linux 3.18.7 Kernel
5. mosquitto bridge integration in lua
6. Lua-uart, disabled console output
7. Lua-I2C

Flash the firmware
------


1.After flashing the firmware, there will be a Wifi network "relayrWRTxxxx", xxxx are the last 4 digits of the board's MAC addr.

2. There is no password for the Wifi, you can set a new password for wifi via log in 192.168.7.1

3. The default IP of relayr Firmware is set to 192.168.7.1

First time connect
------
If you connect first time to this firmware or you didn't set password for root user of OpenWrt, use telnet to connect:

telnet 192.168.7.1


Set the password for root:

root@OpenWrt:~# passwd

The WRTnode will set up a default connection to relayr wifi

Get access to internet
------

1. log in Luci : 192.168.7.1
2. go to Network--Wifi
3. Click "Scan"
4. Find correct network, type in the correct password and click "Submit"


##mosquitto deamon is auto enabled

default port is 1888 (no SSL needed, we are in the local network).

Function tests:
--------

Make sure that the WRTnode is connected to internet.

##mosquitto bridge test
The /etc/mosquitto/relayr.conf set up a bridge connection to Relayr cloud(SSL connection from relayr to WRTnode, no SSL from WRTnode to its wifi device)
```
mosquitto_sub -h 192.168.7.1 -t /temp/#

```


#I/O Mapping for the cooler angel prototype:


Available I/Os on the WRTNode:

This is the current configuration for the I/Os in the machine.
------
Note: a LOW value (0) turns ON an Output, a HIGH (1) turn it OFF.

        To see which kernel module is registering which I/O:
        cat sys/kernel/debug/gpio
------

#Compile the firmware

```
make image PROFILE=Default PACKAGES="libattr libiwinfo libiwinfo-lua liblua libmosquitto libnl libopenssl libubus-lua librt libcares libffi iwinfo kmod-i2c-core kmod-i2c-ralink kmod-spi-dev libuci-lua libuuid libwebsockets-openssl lua luci luci-app-firewall luci-base luci-lib-ip luci-lib-nixio luci-mod-admin-full luci-proto-ppp luci-theme-bootstrap json4lua lua-mosquitto lua-rs232 luai2c mosquitto mosquitto-client  rpcd spidev-test uhttpd uhttpd-mod-ubus" FILES=files/
```
