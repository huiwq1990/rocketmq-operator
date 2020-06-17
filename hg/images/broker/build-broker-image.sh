#!/bin/bash

# Licensed to the Apache Software Foundation (ASF) under one or more
# contributor license agreements.  See the NOTICE file distributed with
# this work for additional information regarding copyright ownership.
# The ASF licenses this file to You under the Apache License, Version 2.0
# (the "License"); you may not use this file except in compliance with
# the License.  You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

checkVersion()
{
    echo "Version = $1"
	echo $1 |grep -E "^[0-9]+\.[0-9]+\.[0-9]+" > /dev/null
    if [ $? = 0 ]; then
        return 1
    fi

	echo "Version $1 illegal, it should be X.X.X format(e.g. 4.5.0), please check released versions in 'https://dist.apache.org/repos/dist/release/rocketmq/'"
    exit 2
}

if [ $# -lt 1 ]; then
    echo -e "Usage: sh $0 Version"
    exit 2
fi

ROCKETMQ_VERSION=$1
DOCKERHUB_REPO=rocketmqinc/rocketmq-broker

ROCKETMQ_VERSION=4.5.0
docker build -t huiwq1990/rocketmq-broker:${ROCKETMQ_VERSION}-samecluster --build-arg version=${ROCKETMQ_VERSION}  --build-arg user=root  --build-arg group=root  --build-arg uid=0  --build-arg gid=0 .
docker push huiwq1990/rocketmq-broker:${ROCKETMQ_VERSION}-samecluster
