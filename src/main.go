package main

import (
	"fmt"
	"net/http"
)

func main() {
    http.HandleFunc("/", HelloServer)
    fmt.Println("Listening on port 9080")
    http.ListenAndServe(":9080", nil)
}

func HelloServer(w http.ResponseWriter, r *http.Request) {
    fmt.Fprint(w, "Hello world!")
}
