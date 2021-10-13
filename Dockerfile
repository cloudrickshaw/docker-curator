FROM alpine:3.14

ARG CURATOR_VERSION=5.8.4

RUN apk --no-cache add python3 && \
    python3 -m ensurepip --upgrade && \
    pip3 install elasticsearch-curator==$CURATOR_VERSION

#USER nobody:nobody

ENTRYPOINT ["/usr/bin/curator"]
