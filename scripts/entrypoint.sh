#!/bin/sh
set -e

# Accept the EULA if enabled
if [ "${EULA}" = "true" ]; then
  echo "eula=true" > eula.txt
else
  echo "eula=false" > eula.txt
fi

# First boot: let the server generate server.properties, then stop it
if [ ! -f server.properties ]; then
  java -Xmx"${MEMORY}" -Xms"${MEMORY}" -jar server.jar nogui &
  SERVER_PID=$!
  while [ ! -f server.properties ]; do sleep 1; done
  kill "$SERVER_PID"
  wait "$SERVER_PID" 2>/dev/null || true
fi

# Apply values from the environment
sed -i "s/^white-list=.*/white-list=${WHITELIST}/" server.properties
sed -i "s/^view-distance=.*/view-distance=${VIEW_DISTANCE}/" server.properties
sed -i "s/^max-players=.*/max-players=${MAX_PLAYERS}/" server.properties
sed -i "s/^motd=.*/motd=${MOTD}/" server.properties

exec java -Xmx"${MEMORY}" -Xms"${MEMORY}" -jar server.jar nogui
