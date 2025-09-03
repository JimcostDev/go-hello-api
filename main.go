package main

import (
	"fmt"
	"net/http"
)

func main() {
	http.HandleFunc("/", func(w http.ResponseWriter, r *http.Request) {
		fmt.Fprintln(w, "¡Hola Mundo desde mi API en Go! 🚀")
	})

	fmt.Println("Servidor escuchando en http://localhost:8080")
	if err := http.ListenAndServe(":8080", nil); err != nil {
		fmt.Println("error al iniciar el servidor:", err)
	}
}
