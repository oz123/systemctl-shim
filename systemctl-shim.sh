#!/bin/sh
CMD=rc-service

SERVICE=${2%".service"}

case "$1" in
    start)
        "${CMD}" "$SERVICE" start
        ;;

    stop)
        "${CMD}" "$SERVICE" stop
        ;;

    status)
        "${CMD}" "$SERVICE" status
        ;;

    restart)
        "${CMD}" "$SERVICE" restart
        ;;

    enable)
        rc-update add "$SERVICE" default
        ;;

    disable)
        rc-update del "$SERVICE" default
        ;;

    is-enabled)
        ENABLED=`rc-update show | grep " $SERVICE " | wc -l`
        if [ $ENABLED == "1" ]
        then
            echo enabled
        else
            echo disabled
        fi
        ;;

    is-active)
        ACTIVE=`rc-status | grep " $SERVICE .* started " | wc -l`
        if [ $ACTIVE == "1" ]
        then
            echo active
        else
            echo inactive
        fi
        ;;

    daemon-reload)
        ;;

    *)
        echo $"Usage: $0 {start|stop|status|restart|enable|disable|is-enabled|is-active}"
        exit 1

esac

# vi: expandtab sts=4 ts=4 sw=4 ai
