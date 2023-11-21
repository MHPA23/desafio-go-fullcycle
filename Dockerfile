FROM golang:alpine AS builder

WORKDIR /src

COPY . .

RUN go build hello.go

FROM scratch

WORKDIR /
COPY --from=builder /src / 
CMD ["./hello"]