FROM alpine:edge

RUN apk add --no-cache python-dev py-pip \
    && pip install --no-cache-dir wheel \
    && apk add --no-cache --virtual .build-deps gcc musl-dev krb5-dev \
    # need gcc for gssapi
    # gcc -Wno-unused-result -Wsign-compare -DNDEBUG -g -fwrapv -O3 -Wall -fomit-frame-pointer -g -fno-semantic-interposition -fomit-frame-pointer -g -fno-semantic-interposition -fomit-frame-pointer -g -fno-semantic-interposition -DTHREAD_STACK_SIZE=0x100000 -fPIC -I/usr/include/python3.8 -c gssapi/raw/misc.c -o build/temp.linux-x86_64-3.8/gssapi/raw/misc.o -DHAS_GSSAPI_EXT_H
    && pip install --no-cache-dir gssapi \
    && apk del --no-cache .build-deps
    # makes no difference whether krb5 itself is installed or not

