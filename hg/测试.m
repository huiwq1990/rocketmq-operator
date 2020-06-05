

docker tag huiwq1990/rocketmq-namesrv:4.5.0-alpine jdcloud/rocketmq-namesrv:4.5.0-alpine
docker tag huiwq1990/rocketmq-broker:4.5.0-alpine  jdcloud/rocketmq-broker:4.5.0-alpine


wget https://tpaas-inuse.s3.cn-south-1.jdcloud-oss.com/rocketmqCmd
chmod +x rocketmqCmd


export NAMESRV_ADDR=10.0.32.9:9876


./rocketmqCmd producer-batchMsg BenchmarkTest 1000


./mqadmin topiclist -n ${NAMESRV_ADDR}



./mqadmin sendMessage -t test -n localhost:9876 -p abc

 ./mqadmin consumeMessage -t test -n localhost:9876

cat<<EOF | kubectl apply -n rocketmq -f -
apiVersion: v1
kind: Service
metadata:
  name: name-service2
  labels:
    app: name-service2
spec:
  type: LoadBalancer
  ports:
  - port: 9876
    name: mq
  selector:
    app: name_service
EOF

nslookup name-service-0.name-service.default.svc.cluster.local

name-service-0.rocketmq

wget https://tpaas-inuse.s3.cn-south-1.jdcloud-oss.com/rocketmqCmd

export  NAMESRV_ADDR=localhost:9876

./rocketmqCmd  producer-asyncMsg test 10


rocketmq

https://grafana.com/grafana/dashboards/10477

https://github.com/apache/rocketmq-exporter


https://github.com/lstn/misc-grafana-dashboards

docker
https://grafana.com/grafana/dashboards/9621

