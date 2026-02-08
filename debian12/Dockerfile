FROM rust:1-bookworm AS builder

WORKDIR /yazi
COPY . .

RUN apt-get update && apt-get install -y wget xz-utils \
 && wget https://ziglang.org/download/0.11.0/zig-linux-$(uname -m)-0.11.0.tar.xz \
 && tar -xf zig-linux-$(uname -m)-0.11.0.tar.xz \
 && mv zig-linux-$(uname -m)-0.11.0 /usr/local/zig \
 && ln -s /usr/local/zig/zig /usr/local/bin/zig \
 && rm zig-linux-$(uname -m)-0.11.0.tar.xz \
 && cargo install cargo-zigbuild \
 && rustup target add i686-unknown-linux-musl \
 && cargo zigbuild --release --target i686-unknown-linux-musl \
;

# Finales Image
FROM scratch
COPY --from=builder \
    /yazi/target/i686-unknown-linux-musl/release/yazi \
    /yazi/target/i686-unknown-linux-musl/release/ya \
    /
