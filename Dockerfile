FROM alpine:3.16

RUN apk --no-cache add bash curl

RUN adduser -D nonroot

# Always use latest CLI
RUN curl -LO https://wiki.findora.org/bin/linux/fn && chmod +x fn
RUN mv fn /usr/local/bin/

USER nonroot
WORKDIR /home/nonroot

RUN fn setup -S https://prod-mainnet.prod.findora.org

RUN mkdir keys
RUN fn setup -O keys/node.mnemonic
RUN fn setup -K keys/priv_validator_key.json

CMD ["fn", "help"]