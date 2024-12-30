#!/bin/env

export REDIRECT_URL=`gp url 3000`
export FUSIONAUTH_URL=`gp url 9011`
export FUSIONAUTH_9012_URL=`gp url 9012`
export FUSIONAUTH_8080=`gp url 8080`

perl -pi -e 's#http://localhost:9011#$ENV{FUSIONAUTH_URL}#g' kickstart/kickstart.json app/src/index.ts app/.env
perl -pi -e 's#http://localhost:9012#$ENV{FUSIONAUTH_9012_URL}#g' kickstart/kickstart.json app/src/index.ts app/.env
perl -pi -e 's#http://localhost:3000#$ENV{REDIRECT_URL}#g' kickstart/kickstart.json app/src/index.ts app/.env
perl -pi -e 's#http://localhost:8080#$ENV{FUSIONAUTH_8080}#g' kickstart/kickstart.json app/src/index.ts app/.env
perl -pi -e 's#http://localhost:\{port\}#$ENV{FUSIONAUTH_8080}#g' kickstart/kickstart.json app/src/index.ts app/.env
