#!/bin/bash

trap stop SIGINT SIGTERM

function stop() {
        kill $CHILD_PID
        wait $CHILD_PID
}

# chmod +x idle
# ./idle &

# echo -e "\033[1;44m Node-RED with Ethereum \033[0m"
# npx ganache --db /db -h 0.0.0.0 -p 7545 -m "visit carpet logic blame furnace confirm rebel deliver medal mean illness error" &

/usr/local/bin/node $NODE_OPTIONS node_modules/node-red/red.js --userDir /data $FLOWS "${@}" &

CHILD_PID="$!"

wait "${CHILD_PID}"