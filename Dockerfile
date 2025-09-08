# Dockerfile para go-hello-api

# Imagen base oficial de Go
FROM golang:latest AS builder

WORKDIR /app

# Copia los archivos necesarios
COPY go.mod .
COPY main.go .

# Descarga dependencias y compila la app
RUN go mod tidy && go build -o go-hello-api main.go

# Imagen final minimalista
FROM alpine:latest
WORKDIR /app

# Copia el binario desde la etapa de build
COPY --from=builder /app/go-hello-api .

# Expone el puerto 8080
EXPOSE 8080

# Comando de inicio
CMD ["./go-hello-api"]
