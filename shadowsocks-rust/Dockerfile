# Adapted from https://github.com/shadowsocks/shadowsocks-rust/blob/92536e6bcea327e4c82e6f495097afca99800de4/Dockerfile
FROM ubuntu:rolling

USER nobody

COPY shadowsocks/shadowsocks-rust/target/$TARGET/release/ss* /usr/local/bin
COPY shadowsocks/shadowsocks-rust/examples/config.json /etc/shadowsocks-rust

ENTRYPOINT [ "ssserver", "--log-without-time", "-c", "/etc/shadowsocks-rust/config.json" ]
