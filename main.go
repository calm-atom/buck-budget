package main

import (
	"fmt"
	"html/template"
	"log"
	"net/http"
	"path/filepath"

	"github.com/go-chi/chi/v5"
)

func handlerFunc(w http.ResponseWriter, r *http.Request) {
	w.Header().Set("Content-Type", "text/html; charset=utf-8")
	tmplPath := filepath.Join("templates", "home.html")
	tmpl, err := template.ParseFiles(tmplPath)
	if err != nil {
		log.Printf("Parsing template %v", err)
		http.Error(w, "Failed to parse template", http.StatusInternalServerError)
		return
	}

	err = tmpl.Execute(w, nil)
	if err != nil {
		log.Printf("Executing template %v", err)
		http.Error(w, "Failed to execute template", http.StatusInternalServerError)
		return

	}
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
