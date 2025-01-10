#!/bin/env
echo "Waiting for the FusionAuth server to start up on http://localhost:9011."
echo "When the server has started up you will get a terminal prompt and see the administrative login in the left hand pane of the browser window."
until curl --output /dev/null --silent --head --fail http://localhost:9011/api/health; do
    printf "."
    sleep 5
done
sleep 5
