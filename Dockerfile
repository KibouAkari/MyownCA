FROM debian:bullseye

RUN apt update && apt install -y openssl osslsigncode

WORKDIR /ca

# Default CA key & cert erstellen (für Demo – in Produktion sauberer machen!)
RUN openssl genrsa -out ca.key 4096 && \
    openssl req -x509 -new -nodes -key ca.key -sha256 -days 3650 \
        -out ca.crt -subj "/CN=My LAN Root CA"
