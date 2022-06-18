# Adapted from https://github.com/shadowsocks/shadowsocks-rust/blob/92536e6bcea327e4c82e6f495097afca99800de4/Dockerfile
FROM buildpack-deps:jammy AS build

ADD shadowsocks/shadowsocks-rust .

RUN curl https://sh.rustup.rs -sSf | sh -s -- -y --default-toolchain nightly \
  && source $HOME/.cargo/env \
  && RUSTFLAGS="-C target-cpu=$CPU" cargo build --features stream-cipher --release

FROM ubuntu:rolling

USER nobody

COPY --from=build target/release/ss* /usr/local/bin
COPY --from=build examples/config.json /etc/shadowsocks-rust

ENTRYPOINT [ "ssserver", "--log-without-time", "-c", "/etc/shadowsocks-rust/config.json" ]
