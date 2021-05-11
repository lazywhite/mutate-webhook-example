#FROM golang:1.12-alpine AS build 
FROM golang:1.14 as build
ENV GO111MODULE on
ENV CGO_ENABLED 0

WORKDIR /app
ADD pkg/ pkg/
ADD main.go main.go
ADD go.mod go.mod
ADD go.sum go.sum
ADD vendor vendor
RUN go build -o mutateme main.go

FROM alpine:latest
WORKDIR /app
ADD ssl/ ssl/
COPY --from=build /app/mutateme .
CMD ["/app/mutateme"]
