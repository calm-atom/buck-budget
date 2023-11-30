package main

import (
	"fmt"
	"net/http"

	"github.com/go-chi/chi/v5"
)

func handlerFunc(w http.ResponseWriter, r *http.Request) {
	fmt.Fprint(w, "<h1>Welcome to Buck Budget</h1>")
}

func main() {
	r := chi.NewRouter()
	r.Get("/", handlerFunc)
	r.NotFound(func(w http.ResponseWriter, r *http.Request) {
		http.Error(w, "Page not found", http.StatusNotFound)
	})
	fmt.Println("Starting server on :3000")
	http.ListenAndServe(":3000", r)
}
