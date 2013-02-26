OzonePlatform Super Project [![Build Status](https://travis-ci.org/ozoneplatform/ozoneplatform.png)](https://travis-ci.org/ozoneplatform/ozoneplatform)
======================

This is a super project for all ozoneplatform projects.  This project can be used to build all sub projects.
This project also contains the ultimate maven super pom.

Initial Setup
-------------

1. After cloning from git, execute
 * `git submodule init`
 * `git submodule update`

2. Install J2SE 6.0 SDK (or later), which can be downloaded from
   http://www.oracle.com/technetwork/java/javasebusiness/downloads/java-archive-downloads-javase6-419409.html
   Use version of "JDK 6.0 Update 29" (or later).

3. Make sure that your JAVA_HOME environment variable is set to the newly installed
   JDK location, and that your PATH includes %JAVA_HOME%\bin (windows) or 
   $JAVA_HOME$/bin (unix).

4. Install Maven 3.0.3 (or later), which can be downloaded from
   http://maven.apache.org/download.html. Make sure that your PATH includes 
   the MVN_HOME/bin directory. 

5. Be sure to give Maven enough memory and stack size `MAVEN_OPTS=-Xmx512m -XX:MaxPermSize=128m -Xss1024k`
   
6. Install NodeJS, which can be downloaded from http://nodejs.org/.

7. Install Ruby 1.9.2 or higher from http://www.ruby-lang.org/en/downloads/.

8. Install required dependencies:
       npm install -g phantomjs (NOTE: see step 9 below on Windows installation)
       npm install -g testacular@v0.5.8
       gem install sass (NOTE: verify the version is at least 3.2.5 or higher by executing sass -v)
       gem install compass (NOTE: verify the version is at least 0.12.2 or higher by executing compass -v)
       
   Note: As of 1/18/2013, the latest stable version of testacular is 0.4.  To properly test AMD style javascript modules
   using requirejs, the project is using version 0.5.8.  The next stable build, 0.6 is expected soon at which time the
   project will migrate to that.

9. On Windows machines, add the PHANTOMJS_BIN environment variable to point to where PhantomJS was installed.
		e.g.  PHANTOMJS_BIN=%APPDATA%\npm\node_modules\phantomjs\lib\phantom\phantomjs.exe (this is where npm will install it on Windows)
		Note that the path to PhantomJS cannot have spaces in it.  If you are on Windows XP, Npm will insist on installing it in a path
		with spaces, and you must manually download PhantomJS off the internet and install it yourself.

Building
--------
1. Run `mvn clean install` from the root folder
2. To skip client side tests, you can also run either `mvn clean install -DskipClientTests` or `mvn clean install -P !testacular`.
3. To run integration tests enable the ci, continuous integration, profile `mvn clean install -P ci`.  By default integration tests are not run
4. By default, tests are run against PhantomJS. If you like to run tests against other browsers, you can optionally pass them as maven properties.
       Example: `mvn clean install -Dbrowsers=Chrome,Safari`

Running
--------
1. Unpack the zip file kernel/deployment/target/deployment-XXX.zip
2. Run deployment-XXX/apache-tomcat-7.0.32/start.bat
3. You must wait until the kernel has loaded.
	The "Server startup in xxx ms" only indicates Tomcat has started.
	The kernel is loaded when all console output stops.
4. To view OWF, use URL http://localhost:8181/owf/index_debug.html
5. To view the web console that manages the OSGI modules running in the kernel, use http://localhost:8181/system/console
	and use login: "karaf", password: "karaf"
	
Note on Git and Submodules
--------------------------
Each ozoneplatform sub-project is kept as a Git sub-module.  To pull changes from git execute
 * `git pull`
 * `git submodule update`

 This mechanism for pulling submodules will pull the versions of the submodules associated with that version
 of the super-module, and the ozoneplatform super-module is only updated every alpha release.  If you want daily 
 updates to the sub-modules, you must explicitly break each sub-module from using the version associated with the 
 super-module.  You can do this using the commands
  * `git submodule foreach git checkout master`
  
 Once you have done that, you can get the very latest changes with
  * `git pull`
  * `git submodule foreach git pull`