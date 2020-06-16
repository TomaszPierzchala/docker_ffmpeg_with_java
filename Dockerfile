FROM jrottenberg/ffmpeg:latest

RUN { \
		echo '#!/bin/sh'; \
		echo 'set -e'; \
		echo; \
		echo 'dirname "$(dirname "$(readlink -f "$(which java)")")"'; \
	} > /usr/local/bin/docker-java-home \
	&& chmod +x /usr/local/bin/docker-java-home

ENV JAVA_HOME /usr/lib/jvm/java-8-openjdk-amd64/jre
	
RUN set -x \
	&& apt update
	
RUN apt-get install -y openjdk-8-jre \
	&& [ "$JAVA_HOME" = "$(docker-java-home)" ]
