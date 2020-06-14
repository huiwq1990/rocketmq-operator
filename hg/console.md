





mkdir -p /tmp/rocketmq-console
cd /tmp/rocketmq-console
#git clone --branch master --depth=1 https://github.com/apache/rocketmq-externals.git


git init
git remote add origin https://github.com/apache/rocketmq-externals.git
git config core.sparsecheckout true
echo "rocketmq-console" >> .git/info/sparse-checkout
git pull --depth 1 origin master


cd rocketmq-console/

#mvn clean package -Dmaven.test.skip=true docker:build
#docker tag styletang/rocketmq-console-ng huiwq1990/rocketmq-console-ng 

mvn clean package -Dmaven.test.skip=true

cat<<EOF > Dockerfile
FROM openjdk:8-jdk
VOLUME /tmp
ADD target/rocketmq-console-ng-1.0.1.jar rocketmq-console-ng.jar
RUN sh -c 'touch /rocketmq-console-ng.jar'
ENV JAVA_OPTS=""
ENTRYPOINT [ "sh", "-c", "java $JAVA_OPTS -jar /rocketmq-console-ng.jar" ]
EOF

docker build -t huiwq1990/rocketmq-console-ng .

docker push huiwq1990/rocketmq-console-ng





docker pull styletang/rocketmq-console-ng



docker run -v /tmp/rocketmq-console:/tmp styletang/rocketmq-console-ng cp /rocketmq-console-ng.jar /tmp




https://github.com/apache/rocketmq-externals/tree/master/rocketmq-console






 docker run -m 1GB  openjdk:8-jdk java -XX:+UnlockExperimentalVMOptions -XX:+UseCGroupMemoryLimitForHeap -XX:MaxRAMFraction=2 -XshowSettings:vm -version