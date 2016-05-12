package main
 
import (
    "fmt"
    "time"
);
 

func fibonacci(n int, c chan int) {
    c<- n * n
}

func main() {
    c := make(chan int, 10)

    for i:=0; i < cap(c); i++ {
        go fibonacci(i, c)
    } 
    time.Sleep(1e9)
    close(c)
    for i := range c {
        fmt.Println(i)
    }
}
