FROM ghcr.io/eyecantcu/rpmlint-action:latest

COPY rpmlint.sh /tmp/rpmlint.sh

ENTRYPOINT ["/tmp/rpmlint.sh"]
