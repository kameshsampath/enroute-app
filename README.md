# enRoute Docker Builder 

The enroute examples Docker [source-to-image](https://github.com/openshift/source-to-image) builder image. 

This base builder image could be used to build the [enRoute](http://enroute.osgi.org/) example [applications](http://enroute.osgi.org/book/180-examples.html) as [Docker](https://www.docker.com/) images

# Anatomy
* Dockerfile - the base docker image which is built from [kameshsampath/jpm4j](https://hub.docker.com/r/kameshsampath/jpm4j/), this will result in a builder image called `kameshsampath/enroute-jpm4j-app` which will be later used to build the actual enroute example application image
* assemble - the script used to assemble the application using enRoute gradle build
* run - the script to run the application 
* save-artifacts - to save the artifacts for future builds
* usage - the help and usage script that will be fired when executing the command `s2i -h`

# Usage 
Example to  build the __osgi.enroute.examples.rest.application__, the following s2i command need to be executed 
`s2i build osgi.enroute.examples.rest.application kameshsampath/enroute-jpm4j-app enroute-rest-app`

# References
* [jpm4j](https://jpm4j.org)
* [s2i](http://docs.projectatomic.io/registry/latest/creating_images/s2i.html)
