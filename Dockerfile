FROM alpine:edge

RUN apk add --no-cache python3-dev py-pip git \
    && pip install --no-cache-dir wheel \
    && apk add --no-cache --virtual .compile-deps gcc musl-dev \
    && pip install --no-cache-dir cython \
    && apk add --no-cache --virtual .build-deps gcc musl-dev krb5-dev \
    && git clone https://github.com/pythongssapi/python-gssapi.git \
    && cd python-gssapi \
    && python3 setup.py build \
    && python3 setup.py install \
    && apk del --no-cache .compile-deps
    # && apk del --no-cache .build-deps
    # makes no difference whether krb5 itself is installed or not

