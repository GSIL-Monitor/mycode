#/bin/bash

###########################################
# 从线上数据库导出部分数据至测试数据库    #
###########################################

EXEC_DIR="/opt/crontab";
SECRET_KEY="/opt/crontab/id_rsa_10.103.13.102";
cd $EXEC_DIR;



day=${1};
if [ "x$day" == "x" ]
then
    echo "missing the arguments of time!!!";
    exit;
fi

start_day=$day;
num=$(date -d  "$start_day" +%s);
time_num=$(($num + 3600*24));
end_day=$(date -d "@$time_num"  "+%Y-%m-%d");
ssh -i $SECRET_KEY root@10.103.13.102  "mysqldump -h10.103.7.127 -uvod-select --password='***' --tz-utc=FALSE --default-character-set=utf8 --skip-opt --skip-comments --disable-keys --compress --compact --replace -t -q --databases DBname --tables TBname --where=\"_inserttime>='${start_day}' and _inserttime<'${end_day}'\" " |mysql -h 10.10.72.107  -u root --password="***"  --default-character-set=utf8 --database=DB_name;


