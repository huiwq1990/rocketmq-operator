



kubectl delete deployment rocketmq-exporter -n rocketmq

cat<<EOF | kubectl apply -n rocketmq -f -
apiVersion: apps/v1
kind: Deployment
metadata:
  name: rocketmq-exporter
spec:
  selector:
    matchLabels:
      app: rocketmq-exporter
  replicas: 1
  template:
    metadata:
      labels:
        app: rocketmq-exporter
    spec:
      containers:
      - name: rocketmq-exporter
        image: huiwq1990/rocketmq-exporter
        env:
        - name: NAME_SERVICE
          value: "name-service-0.name-service.rocketmq.svc.cluster.local:9876"
        ports:
        - containerPort: 5557

---

apiVersion: v1
kind: Service
metadata:
  name: rocketmq-exporter
  annotations:
    prometheus.io/scrape: "true"
    prometheus.io/scheme: "http"
    prometheus.io/path: "/metrics"
    prometheus.io/port: "5557"
  labels:
    app: rocketmq-exporter
spec:
  ports:
  - port: 5557
    targetPort: 5557
    protocol: TCP
  selector:
    app: rocketmq-exporter

EOF

