#!/bin/bash

SRC_DIR=$GOPATH/src

function install() {
	cp $SRC_DIR/goim/router/router-example.conf  $GOPATH/bin/router.conf
	cp $SRC_DIR/goim/router/router-log.xml  $GOPATH/bin/
    cd $SRC_DIR/goim/router/; go install;            #为什么此命令不成功

	cp $SRC_DIR/goim/logic/logic-example.conf $GOPATH/bin/logic.conf
	cp $SRC_DIR/goim/logic/logic-log.xml $GOPATH/bin/
    cd $SRC_DIR/goim/logic/; go install;

	cp $SRC_DIR/goim/comet/comet-example.conf $GOPATH/bin/comet.conf
	cp $SRC_DIR/goim/comet/comet-log.xml $GOPATH/bin/
    cd $SRC_DIR/goim/comet/; go install;

	cp $SRC_DIR/goim/logic/job/job-example.conf $GOPATH/bin/job.conf
	cp $SRC_DIR/goim/logic/job/job-log.xml $GOPATH/bin/
    cd $SRC_DIR/goim/logic/job/; go install;
}

function start() {
    [ ! -e "/tmp/log/goim" ] && mkdir -p /tmp/log/goim;
    case $1 in 
        "router" )
            start_router;;
        "logic" )
            start_logic;;
        "comet" )
            start_comet;;
        "job" )
            start_job;;
        * )
            start_router
            start_logic
            start_comet
            start_job
    esac
    echo -e "start done\n";
}

function start_router(){
    nohup $GOPATH/bin/router -c $GOPATH/bin/router.conf 2>&1 > /tmp/log/goim/panic-router.log &
    sleep 1;
}

function start_logic(){
    nohup $GOPATH/bin/logic -c $GOPATH/bin/logic.conf 2>&1 > /tmp/log/goim/panic-logic.log &
    sleep 1;
}

function start_comet(){
    nohup $GOPATH/bin/comet -c $GOPATH/bin/comet.conf 2>&1 > /tmp/log/goim/panic-comet.log &
    sleep 1;
}

function start_job(){
    nohup $GOPATH/bin/job -c $GOPATH/bin/job.conf 2>&1 > /tmp/log/goim/panic-job.log &
    sleep 1;
}



function stop() {
   ps aux |grep -F $GOPATH/bin |grep -v 'grep' |awk '{print $2}' |sort -r  |xargs -I {} kill -s TERM {}
}

function push(){
    curl -d "{\"test\":1}" http://127.0.0.1:7172/1/push?uid=0;             #单人信息推送
    curl -d "{\"u\":[1,2,3,4,5],\"m\":{\"test\":1}}" http://127.0.0.1:7172/1/pushs;    #多人 单信息推送
    curl -d "{\"test\": 1}" http://127.0.0.1:7172/1/push/room?rid=1;      #房间信息推送

}


case $1 in
    "install" )
        install;;
    "start" )
        start $2;;
    "stop" )
        stop;;
    "restart" )
        stop && start ;;
    * )
        echo "arguments error!!!";;
esac

