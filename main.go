package main

import (
	"fmt"
	"time"
)

func main() {
	// create a ticker to print "Hello, World!" every second
	ticker := time.NewTicker(1 * time.Second)
	for t := range ticker.C {
		fmt.Println("KeranYang - Hello, World!", t)
	}
}
