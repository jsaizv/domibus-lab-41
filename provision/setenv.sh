#!/bin/sh
#Please change CATALINA_HOME to the right folder
#export CATALINA_HOME=<YOUR_INSTALLATION_PATH>
#JAVA_OPTS="$JAVA_OPTS -Xms4096m -Xmx4096m -XX:MaxPermSize=4096m -Ddomibus.config.location=$CATALINA_HOME/conf/domibus"
export CATALINA_HOME=/servicio/domibus
export CATALINA_TMPDIR=/tmp
export JAVA_HOME=/usr/java/jre1.8.0_241-amd64
export JAVA_OPTS="$JAVA_OPTS -Xms128m -Xmx1024m"
export JAVA_OPTS="$JAVA_OPTS -Ddomibus.config.location=$CATALINA_HOME/conf/domibus"