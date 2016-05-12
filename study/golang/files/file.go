package main

import "fmt"
import "bufio"
import "os.exec"

func main() {

	cmd0 := exec.Command("echo", "-n", "My first command from golan.")
	if err := cmd0.Start(); err != nil {
		fmt.Printf("Error: The command No.0 can not be startup: %s\n", err)
		return
	}

	stdout0, err := cmd0.StdoutPipe()
	if err != nil {
		fmt.Printf("Error: Can not obtain the stdout pipe for command No.0: %s\n", err)
		return
	}

	fmt.Println("hello")
	outputBuf0 := bufio.NewReader(stdout0)
	fmt.Println(outputBuf0)

}
