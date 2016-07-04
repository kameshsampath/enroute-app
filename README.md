# enRoute App Docker Builder 

The enroute examples Docker [source-to-image](https://github.com/openshift/source-to-image) builder image. 

This base builder image could be used to build the [enRoute](http://enroute.osgi.org/) example [applications](http://enroute.osgi.org/book/180-examples.html) as [Docker](https://www.docker.com/) images

# Pre-Requsites

* Docker installed 
* [Source to Image tools](https://github.com/openshift/source-to-image/releases) installed

# Anatomy 
* [Dockerfile](./Dockerfile) - the base docker image which is built from [kameshsampath/jpm4j](https://hub.docker.com/r/kameshsampath/jpm4j/), this will result in a builder image called `kameshsampath/enroute-app` which will be later used to build the actual enroute example application image
* [assemble](./s2i/assemble) - the script used to assemble the application using enRoute gradle build
* [run](./s2i/run) - the script to run the application via docker
* [save-artifacts](./s2i/save-artifacts) - to save the artifacts for future builds
* [usage](./s2i/usage) - the help and usage script that will be fired when executing the command `s2i -h`

# Environment Variables

* __ENROUTE_APP__ - if you have many *.application within the sources, this variable will be used to determine which Application to deploy and build the container image for

* __ENROUTE_APP_BND_RUN__ - the bndrun file name `without bndrun extension`, which will be used to expor the executable jar

* __JPM_COMMAND__ - the command name to use to launch the application, this command name will be used to run the docker container, typically this corresponds to the header value of `JPM-Command` in `ENROUTE_APP_BND_RUN` file

# Usage 
Lets take an example of making the [enRoute Web Application Example](https://github.com/osgi/osgi.enroute.examples/tree/master/osgi.enroute.examples.webserver.application) as docker image.  To build the Docker image we need to execute the following `s2i` command 
`s2i build -e "ENROUTE_APP=osgi.enroute.examples.webserver.application" -e "ENROUTE_APP_BND_RUN=osgi.enroute.examples.webserver" -e "JPM_COMMAND=websrvr" https://github.com/osgi/osgi.enroute.examples kameshsampath/enroute-app enroute-webserver-app`

The above command will pull the sources from the enRoute Git Repo https://github.com/osgi/osgi.enroute.examples and build he code inside the builder image __kameshsampath/enroute-app__ and produces a enRoute webserver example application by name __enroute-webserver-app__

Instead of using Git Repo, the local file system directoy of the application could also be specified, the command corresponding to local file repo looks like 

`s2i build -e "ENROUTE_APP=osgi.enroute.examples.webserver.application" -e "ENROUTE_APP_BND_RUN=osgi.enroute.examples.webserver" -e "JPM_COMMAND=websrvr" /home/acme/osgi.enroute.examples kameshsampath/enroute-app enroute-webserver-app`

# References
* [jpm4j](https://jpm4j.org)
* [s2i](http://docs.projectatomic.io/registry/latest/creating_images/s2i.html)
