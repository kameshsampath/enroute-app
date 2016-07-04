#!/bin/bash -e
##############
# in cases where the image build takes time because of gradle distros download, we can inject the local distro 
# .gradle and push it to the builder image
############
s2i build -e "ENROUTE_APP=osgi.enroute.examples.rest.application" -e "ENROUTE_APP_BND_RUN=osgi.enroute.examples.rest" -e "JPM_COMMAND=rest" --inject ~/.gradle/wrapper/dists:/root/.gradle/wrapper/dists osgi.enroute.examples kameshsampath/enroute-app enroute-rest-app