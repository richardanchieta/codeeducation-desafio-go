FROM golang:1.16-alpine AS builder

WORKDIR /src/
COPY main.go go.mod /src/
RUN CGO_ENABLED=0 go build -o /bin/desafio1

FROM scratch
COPY --from=builder /bin/desafio1 /bin/desafio1
ENTRYPOINT ["/bin/desafio1"]