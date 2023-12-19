FROM quay.io/fedora/fedora-minimal:39

COPY rpmlint.sh /tmp/rpmlint.sh

ENTRYPOINT ["/tmp/rpmlint.sh"]
