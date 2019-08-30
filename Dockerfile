FROM alpine

RUN apk	add openjdk11 \
	maven \
	curl \
	bash
	
VOLUME /home/hw_11

WORKDIR /home/hw_11

copy ./ /home/hw_11

ARG JAR_FILE=target/hw_11_simple_rest_service-0.0.1-SNAPSHOT.jar

ADD ${JAR_FILE} hw_11.jar

EXPOSE 8080

CMD java -jar hw_11.jar