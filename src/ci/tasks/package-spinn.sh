#!/bin/bash

set -xe

export JAVA_HOME=/usr/lib/jvm/java-8-openjdk-amd64
export PATH=$JAVA_HOME/bin:$PATH

export M2_HOME=/usr/local/apache-maven/apache-maven-3.3.9
export M2=$M2_HOME/bin
export MAVEN_OPTS="-Xms256m -Xmx512m"
export PATH=$M2:$PATH

cd git-assets/
mvn -DskipTests=true package

echo "saving file: $CF_APP.jar"
cp target/*.jar ../releases/$CF_APP.jar
