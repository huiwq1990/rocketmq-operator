

docker tag huiwq1990/rocketmq-namesrv:4.5.0-alpine jdcloud/rocketmq-namesrv:4.5.0-alpine
docker tag huiwq1990/rocketmq-broker:4.5.0-alpine  jdcloud/rocketmq-broker:4.5.0-alpine


wget https://tpaas-inuse.s3.cn-south-1.jdcloud-oss.com/rocketmqCmd
chmod +x rocketmqCmd


export NAMESRV_ADDR=10.0.32.9:9876


./rocketmqCmd producer-batchMsg BenchmarkTest 1000


./mqadmin topiclist -n ${NAMESRV_ADDR}