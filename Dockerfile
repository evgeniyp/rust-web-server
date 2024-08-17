# Use the official Rust image
FROM rust:latest

# Install tini
RUN apt-get update && apt-get install -y tini

# Set tini as the entry point
ENTRYPOINT ["/usr/bin/tini", "--"]

# Set the working directory
WORKDIR /app

# Install cargo-watch for hot reloading
RUN cargo install cargo-watch

# Copy the source code
COPY . .
