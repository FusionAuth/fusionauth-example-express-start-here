#!/bin/env

# This file is a simple regular expression engine that adjusts the URLs for fusionauth and the application.
# In a "normal" docker environment on localhost, the URLs are:
#   - http://localhost:9011 - FusionAuth Server
#   - http://localhost:9012 - FusionAuth Auth server
#   - http://localhost:3000 - Local application (express, react)
#   - http://localhost:8080 - Sometimes we use 8080 for the local application
#   - http://localhost:${port} - In some cases the string uses a variable for the port
#
# In github, there is a URL specific to the workspace that has been pulled.
# You can get that URL by calling `gp url PORT` and it will return the correct URL for the server at that port
# For example, a test workspace that I created is using https://synedra-fusionauthexamp-tpjajna9md7.ws-us117.gitpod.io as the server, so:
# - `gp url 3000` returns https://3000-synedra-fusionauthexamp-tpjajna9md7.ws-us117.gitpod.io
# - `gp url 9011` returns https://9011-synedra-fusionauthexamp-tpjajna9md7.ws-us117.gitpod.io
#    Note that adding `admin` to the path points directly to the admin UI: `gp url 9011`/admin gives https://9011-synedra-fusionauthexamp-tpjajna9md7.ws-us117.gitpod.io/admin

export REDIRECT_URL=`gp url 3000`
export FUSIONAUTH_URL=`gp url 9011`
export FUSIONAUTH_9012_URL=`gp url 9012`
export FUSIONAUTH_8080=`gp url 8080`

perl -pi -e 's#http://localhost:9011#$ENV{FUSIONAUTH_URL}#g' kickstart/kickstart.json app/src/index.ts app/.env
perl -pi -e 's#http://localhost:9012#$ENV{FUSIONAUTH_9012_URL}#g' kickstart/kickstart.json app/src/index.ts app/.env
perl -pi -e 's#http://localhost:3000#$ENV{REDIRECT_URL}#g' kickstart/kickstart.json app/src/index.ts app/.env
perl -pi -e 's#http://localhost:8080#$ENV{FUSIONAUTH_8080}#g' kickstart/kickstart.json app/src/index.ts app/.env
perl -pi -e 's#http://localhost:\{port\}#$ENV{FUSIONAUTH_8080}#g' kickstart/kickstart.json app/src/index.ts app/.env
