# Use the official Golang image as a build stage
FROM golang:1.22.3 as builder

# Set the working directory inside the container
WORKDIR /app

# Copy go.mod and go.sum files
COPY go.mod go.sum ./

# Download dependencies
RUN go mod download

# Copy the rest of the application code
COPY . .

# Build the Go app
RUN go build -o gosimpleserver

# Verify binary build
RUN ls -la

# Use a minimal image for the final container
FROM alpine:latest

# Set the working directory inside the container
WORKDIR /root/

# Verify binary existence in the builder stage
RUN ls -la /app


# Copy the binary from the builder stage
COPY --from=builder /app/gosimpleserver .

# Expose the port on which the app runs
EXPOSE 8080

# Command to run the executable
CMD ["./gosimpleserver"]
