package main

import (
	"fmt"
	"log"
	"net/http"
)

func main() {
	log.Fatalln(http.ListenAndServe("0.0.0.0:80", http.HandlerFunc(func(rw http.ResponseWriter, req *http.Request) {
		fmt.Fprintln(rw, "hello world")
	})))
}
