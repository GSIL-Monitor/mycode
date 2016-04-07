#!/bin/bash

if [[ $1 = "start" ]]
then
    bin/zookeeper-server-start.sh config/zookeeper.properties  &> /tmp/log/zookeeper_server.log  &
    bin/kafka-server-start.sh config/server.properties &> /tmp/log/kafka-server.log  &

elif [[ $1 = "stop" ]]
then
    bin/kafka-server-stop.sh   &> /dev/null
    bin/zookeeper-server-stop.sh  &> /dev/null
elif [[ $1 = "test" ]]
then
    bin/kafka-topics.sh --create --zookeeper localhost:2181 --replication-factor 1 --partitions 1 --topic test
    bin/kafka-topics.sh --list --zookeeper localhost:2181
fi


#bin/kafka-console-producer.sh --broker-list localhost:9092 --topic test
#bin/kafka-console-consumer.sh --zookeeper localhost:2181 --topic test --from-beginning
