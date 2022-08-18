FROM alpine:3.16

RUN apk --no-cache add bash curl

RUN adduser -D nonroot

# Always use latest CLI
RUN curl -LO https://wiki.findora.org/bin/linux/fn && chmod +x fn
RUN mv fn /usr/local/bin/

USER nonroot
WORKDIR /home/nonroot

CMD ["fn", "help"]