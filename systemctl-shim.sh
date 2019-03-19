CMD=rc-service

case "$1" in
	start)
		"${CMD}" "$2" start
        ;;

    stop)
		"${CMD}" "$2" stop
        ;;

    status)
		"${CMD}" "$2" status
        ;;

    restart)
		"${CMD}" "$2" restart
        ;;

    enable)
        rc-update add "$2" default
        ;;

    disable)
        rc-update del "$2" default
        ;;
    *)
        echo $"Usage: $0 {start|stop|status|restart}"
        exit 1

esac

# vi: expandtab sts=4 ts=4 sw=4 ai
