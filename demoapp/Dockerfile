FROM golang:1.19 as builder
WORKDIR /source
COPY go.mod go.sum ./
RUN go mod download
COPY . .
WORKDIR /source/cmd/app/
RUN go build -v -o server
WORKDIR /source/cmd/load/
RUN go build -v -o load

FROM golang:1.19 as app
WORKDIR /app
COPY --from=builder /source/cmd/app/server /app/server
EXPOSE 8080
CMD ["/app/server"]

FROM golang:1.19 as load
WORKDIR /app
COPY --from=builder /source/cmd/load/load /app/load
EXPOSE 8080
CMD ["/app/load"]
