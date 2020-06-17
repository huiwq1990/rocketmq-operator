
cd broker
ROCKETMQ_VERSION=4.5.0
docker build -t huiwq1990/rocketmq-broker:${ROCKETMQ_VERSION}-samecluster-v2 --build-arg version=${ROCKETMQ_VERSION}  --build-arg user=root  --build-arg group=root  --build-arg uid=0  --build-arg gid=0 .
docker push huiwq1990/rocketmq-broker:${ROCKETMQ_VERSION}-samecluster-v2
cd ..

cd namesrv

ROCKETMQ_VERSION=4.5.0
docker build -t huiwq1990/rocketmq-namesrv:${ROCKETMQ_VERSION}-samecluster-v2 --build-arg version=${ROCKETMQ_VERSION}  --build-arg user=root  --build-arg group=root  --build-arg uid=0  --build-arg gid=0 .
docker push huiwq1990/rocketmq-namesrv:${ROCKETMQ_VERSION}-samecluster-v2
