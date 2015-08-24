#!/bin/bash
#
#url 编码和解析
#
urlencode() {
    # urlencode <string>
 
    local length="${#1}"
    for (( i = 0; i < length; i++ )); do
        local c="${1:i:1}"
        case $c in
            [a-zA-Z0-9.~_-]) printf "$c" ;;
            *) printf "$c" | xxd -p -c1 | while read x;do printf "%%%s" "$x";done
        esac
    done
}
 
urldecode() {
    # urldecode <string>
 
    local url_encoded="${1//+/ }"
    printf '%b' "${url_encoded//%/\x}"
}


case $1 in
    -d) urldecode $2;;
     *) urlencode $2;;
esac
echo "";
