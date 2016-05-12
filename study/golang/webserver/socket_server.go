/*
socket  编程

传统编程步骤如下
1.建立socket           socket()
2.绑定socket           bind()
3.监听                 listen() / connect()
4.接受连接             accept()
5.接收                 receive()

go socket  对其进行了封装， 只需要调用net.Dial()

*/

package main

import (
	//	"bytes"
	"fmt"
	//	"io"
	"net"
	"os"
)

func checkError(err error) {
	if e, ok := err.(error); ok {
		fmt.Fprintf(os.Stderr, "Fatal error: %s", e.Error())
		os.Exit(1)
	}
}

func checkSum(msg []byte) uint16 {
	sum := 0
	n := 0
	for n+1 < len(msg) {
		sum += (int(msg[n]) << 8) | int(msg[n+1])
		n++
	}
	if n < len(msg) {
		sum += (int(msg[n]) << 8)
	}
	sum = (sum >> 16) + (sum & 0xFFFF)
	sum += (sum >> 16)
	return uint16(sum)
}

func server() {
	args := os.Args
	if len(args) != 2 {
		fmt.Println("Usage: ", args[0], "host")
		os.Exit(1)
	}

	service := args[1]
	conn, err := net.Dial("ip4:icmp", service)
	checkError(err)

	var msg [50]byte
	msg[0] = 8
	msg[1] = 0
	msg[2] = 0
	msg[3] = 0
	msg[4] = 0
	msg[5] = 13
	msg[6] = 0
	msg[7] = 37
	len := 8

	check := checkSum(msg[0:len])
	fmt.Println(check)
	msg[2] = byte(check >> 8)
	msg[3] = byte(check & 255)
	_, err = conn.Write(msg[0:len])
	checkError(err)

	_, err = conn.Read(msg[0:])
	checkError(err)
	fmt.Println(msg)

}

func main() {

	server()
}
