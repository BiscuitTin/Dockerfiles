# Adapted from https://github.com/shadowsocks/shadowsocks-rust/blob/92536e6bcea327e4c82e6f495097afca99800de4/Dockerfile
FROM buildpack-deps:jammy AS build

RUN curl https://sh.rustup.rs -sSf | sh -s -- -y --default-toolchain nightly \
  && . $HOME/.cargo/env \
  && curl -fsSLO --compressed "https://github.com/shadowsocks/shadowsocks-rust/archive/refs/tags/v$SHADOWSOCKS_RUST_VERSION.tar.gz" \
  && tar -xf "v$SHADOWSOCKS_RUST_VERSION.tar.gz" \
  && RUSTFLAGS="-C target-cpu=$CPU" cargo build --features stream-cipher --release --manifest-path shadowsocks-rust-$SHADOWSOCKS_RUST_VERSION/Cargo.toml

FROM ubuntu:rolling

USER nobody

COPY --from=build shadowsocks-rust-$SHADOWSOCKS_RUST_VERSION/target/release/ss* /usr/local/bin
COPY --from=build shadowsocks-rust-$SHADOWSOCKS_RUST_VERSION/examples/config.json /etc/shadowsocks-rust

ENTRYPOINT [ "ssserver", "--log-without-time", "-c", "/etc/shadowsocks-rust/config.json" ]
