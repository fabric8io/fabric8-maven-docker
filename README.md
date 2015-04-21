fabric8/maven
-------------

This docker container will clone a git repository from **$SOURCE_URI** then run an arbitrary maven build from the **$MAVEN_COMMAND** returning the status code to indicate if the build worked of failed.

### Environment variables

-	SOURCE_URI - a URI to clone the git repository from
-	SOURCE_REF - a reference to pass to Git for which commit to use (optional)
-	CONTEXT_DIR - a subdirectory of the retrieved source to run the build fro
-	MAVEN_COMMAND - the maven command line to run

### Example

```
docker run -it -e SOURCE_URI=https://github.com/fabric8io/example-camel-cdi.git -e MAVEN_COMMAND="mvn install" fabric8-maven
```
