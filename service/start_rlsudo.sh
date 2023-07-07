#!/bin/bash

echo "check who login every second"

while true; do
    user_count=$(who | wc -l)
    if [ $user_count -gt 0 ]; then
        echo "some user has logged in, run program after 5 seconds"
		sleep 5
        /opt/rlsudo/rlsudo
        break
    else

        sleep 1
    fi
done
