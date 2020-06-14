




docker pull styletang/rocketmq-console-ng

mkdir -p /tmp/rocketmq-console
docker run -v /tmp/rocketmq-console:/tmp styletang/rocketmq-console-ng cp /rocketmq-console-ng.jar /tmp


cat<<EOF > Dockerfile
FROM openjdk:8-jdk
VOLUME /tmp
ADD rocketmq-console-ng-*.jar rocketmq-console-ng.jar
RUN sh -c 'touch /rocketmq-console-ng.jar'
ENV JAVA_OPTS=""
ENTRYPOINT [ "sh", "-c", "java $JAVA_OPTS -jar /rocketmq-console-ng.jar" ]
EOF

docker build -t huiwq1990/rocketmq-console-ng .


https://github.com/apache/rocketmq-externals/tree/master/rocketmq-console