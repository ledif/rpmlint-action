FROM ghcr.io/ledif/rpmlint-action:latest

COPY rpmlint.sh /tmp/rpmlint.sh

ENTRYPOINT ["/tmp/rpmlint.sh"]
