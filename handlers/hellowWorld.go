// mywebserver/handlers/hello.go
package handlers

import (
	"fmt"
	"net/http"
)

// HelloWorld handles HTTP requests and responds with "Hello, World!"
func HelloWorld(w http.ResponseWriter, r *http.Request) {
	fmt.Fprintln(w, "Hello, World!.how are you?")
}
