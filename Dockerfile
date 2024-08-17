# Use the official Rust image
FROM rust:latest

# Install tini
RUN apt-get update && apt-get install -y tini

# Set tini as the entry point
ENTRYPOINT ["/usr/bin/tini", "--"]

# Set the working directory
WORKDIR /usr/src/app

# Install cargo-watch for hot reloading
RUN cargo install cargo-watch

# Copy the Cargo.toml and Cargo.lock files
# COPY Cargo.toml Cargo.lock ./

# Copy the source code
COPY . .

# Build dependencies
# RUN cargo build --release

# Command to run the server with hot-reload support
CMD ["cargo", "watch", "-x", "run"]