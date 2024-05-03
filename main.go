package main

import (
	"fmt"
	"time"
)

func main() {
	x := 0

	fn := func() int {
		x++
		fmt.Printf("the value of x is %d\n", x)
		return x
	}

	t2 := time.NewTicker(time.Second)

	for next := range t2.C {
		fmt.Println(next)
		y := fn()
		if y > 10 {
			t2.Stop()
		}
	}

}
