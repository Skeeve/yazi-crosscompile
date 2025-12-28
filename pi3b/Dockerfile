FROM rust:slim AS builder

RUN apt-get update && apt-get install -y \
    build-essential \
    gcc-arm-linux-gnueabihf \
    pkg-config

RUN rustup target add armv7-unknown-linux-gnueabihf

WORKDIR /yazi
COPY . .

ENV CC=arm-linux-gnueabihf-gcc
ENV CARGO_TARGET_ARMV7_UNKNOWN_LINUX_GNUEABIHF_LINKER=arm-linux-gnueabihf-gcc

ENV RUSTFLAGS="-C target-feature=+crt-static"

RUN cargo build --release --target armv7-unknown-linux-gnueabihf

FROM scratch
COPY --from=builder \
    /yazi/target/armv7-unknown-linux-gnueabihf/release/yazi \
    /yazi/target/armv7-unknown-linux-gnueabihf/release/ya \
    /
