FROM alpine:3.6

RUN apk --no-cache add python py-setuptools py-pip gcc libffi py-cffi python-dev libffi-dev py-openssl musl-dev linux-headers openssl-dev && \
    pip install elasticsearch-curator==5.4.0 && \
    pip install requests-aws4auth==0.9 && \
    pip install cryptography==2.1.3 && \
    apk del py-pip gcc python-dev libffi-dev musl-dev linux-headers openssl-dev && \
    sed -i '/import sys/a urllib3.contrib.pyopenssl.inject_into_urllib3()' /usr/bin/curator && \
    sed -i '/import sys/a import urllib3.contrib.pyopenssl' /usr/bin/curator && \
    sed -i '/import sys/a import urllib3' /usr/bin/curator

USER nobody:nobody

ENTRYPOINT ["/usr/bin/curator"]
