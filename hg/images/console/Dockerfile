FROM openjdk:8-jdk
VOLUME /tmp
ADD rocketmq-console-ng-1.0.1.jar rocketmq-console-ng.jar
ENV JAVA_OPTS=""
RUN pwd
#CMD ["java","$JAVA_OPTS", "-jar", "/rocketmq-console-ng.jar"]
ENTRYPOINT [ "sh", "-c", "java $JAVA_OPTS -jar /rocketmq-console-ng.jar" ]
