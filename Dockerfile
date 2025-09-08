# Imagen base oficial de Go
FROM golang:latest

WORKDIR /app

# Copia los archivos necesarios
COPY go.mod .
COPY main.go .

# Descarga dependencias y compila la app
RUN go mod tidy && go build -o go-hello-api main.go

# Expone el puerto 8080
EXPOSE 8080

# Comando de inicio
CMD ["./go-hello-api"]