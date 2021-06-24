FROM docker.io/library/alpine:latest AS build

# Source: https://ngrok.com/download
ENV NGROK_URL='https://bin.equinox.io/c/4VmDzA7iaHb/ngrok-stable-linux-amd64.zip'

WORKDIR /ngrok
RUN set -eux && \
    wget -O ngrok.zip "$NGROK_URL" && \
    unzip ngrok.zip

FROM docker.io/library/busybox:latest AS runtime

ENTRYPOINT ["/ngrok"]
COPY --from=build /ngrok/ngrok /ngrok
