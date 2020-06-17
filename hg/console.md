
## 编译项目

```
mkdir -p /tmp/rocketmq-console
cd /tmp/rocketmq-console

git init
git remote add origin https://github.com/apache/rocketmq-externals.git
git config core.sparsecheckout true
echo "rocketmq-console" >> .git/info/sparse-checkout
git pull --depth 1 origin master


cd rocketmq-console/
mvn clean package -Dmaven.test.skip=true
```

## 构建镜像

```
cd target

docker build -t huiwq1990/rocketmq-console-ng:0.0.1 .

docker push huiwq1990/rocketmq-console-ng:0.0.1
```


 https://github.com/apache/rocketmq-externals/tree/master/rocketmq-console
