FROM golang:1.20 AS builder
WORKDIR /app
COPY go.mod ./
RUN go mod download
COPY main.go .
RUN CGO_ENABLED=0 GOOS=linux go build -o server .
FROM alpine:3.19.8
EXPOSE 8080
RUN adduser -D moheb
USER moheb
WORKDIR /prodapp
COPY --from=builder /app/server .
HEALTHCHECK --interval=30s --timeout=30s --start-period=5s --retries=3\ 
  CMD wget --quiet --tries=3 --spider http://localhost:8080/ || exit 1
CMD [ "./server" ]

