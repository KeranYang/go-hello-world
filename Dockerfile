# Start from a lightweight Golang base image
FROM golang:alpine as builder

# Set the working directory inside the container
WORKDIR /app

# Copy go module files and download dependencies
COPY go.* ./
RUN go mod download

# Copy the source code into the container
COPY . .

# Build the Go app
RUN CGO_ENABLED=0 GOOS=linux go build -a -installsuffix cgo -o helloworld .

# Start a new stage from scratch for a smaller final image
FROM alpine:latest
WORKDIR /root/
COPY --from=builder /app/helloworld .

# Command to run the executable
CMD ["./helloworld"]

