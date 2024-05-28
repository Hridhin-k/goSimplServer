package main

import (
	"fmt"
	"goSimpleServer/handlers"
	"net/http"
)

func main() {
	http.HandleFunc("/", handlers.HelloWorld)
	fmt.Println("Starting server at port 8080")
	if err := http.ListenAndServe(":8080", nil); err != nil {
		fmt.Println("Error starting server:", err)
	}
}
