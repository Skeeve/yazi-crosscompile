FROM rust:slim AS builder

RUN apt-get update && apt-get install -y \
    build-essential \
    gcc-aarch64-linux-gnu \
    pkg-config \
    libssl-dev \
    git

RUN rustup target add aarch64-unknown-linux-gnu

WORKDIR /yazi

COPY . .

ENV CC_aarch64_unknown_linux_gnu=aarch64-linux-gnu-gcc
ENV CARGO_TARGET_AARCH64_UNKNOWN_LINUX_GNU_LINKER=aarch64-linux-gnu-gcc

ENV RUSTFLAGS="-C target-feature=+crt-static"

RUN cargo build --release --target aarch64-unknown-linux-gnu

FROM scratch
COPY --from=builder \
    /yazi/target/aarch64-unknown-linux-gnu/release/yazi \
    /yazi/target/aarch64-unknown-linux-gnu/release/ya \
    /
