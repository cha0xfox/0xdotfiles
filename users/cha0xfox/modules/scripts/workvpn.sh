#!/bin/env bash
#
#
#
#

# Start the VPN
start() {
    echo "Starting VPN Connection"
    eval $(echo 'TestVpn&!' | sudo openconnect -q -b msk.vpn.stream.ru -u IvSkvortsov --passwd-on-stdin)
    success $"VPN Connection established"
}

# Stop the VPN
stop() {
    echo  "Stopping VPN connection:"
    sudo ps -aef | grep openconnect
    sudo kill -9 $(pidof openconnect)
}

### main logic ###
case "$1" in
  start)
        start
        ;;
  stop)
        stop
        ;;
  status)
        status openconnect
        ;;
  restart|reload|condrestart)
        stop
        start
        ;;
  *)
        echo $"Usage: $0 {start|stop|restart|reload|status}"
        exit 1
esac

exit 0