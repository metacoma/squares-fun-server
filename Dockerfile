FROM openresty/openresty:bionic
RUN apt-get update &&                             \
    apt-get install -y --no-install-recommends    \
    gocr                                          \
    tesseract-ocr                                 \
    skalibs-dev                                   \
    build-essential                               \
    tesseract-ocr-rus
#   git

RUN apt-get install -y git

WORKDIR /tmp
RUN git clone https://github.com/jprjr/sockexec.git       \
    && cd sockexec                                        \
    && ./configure --prefix=/usr --bindir=/usr/local/bin  \
    && make install
WORKDIR /tmp
RUN git clone https://github.com/jprjr/idgaf          \
    && cd idgaf                                       \
    && gcc -o /usr/local/bin/idgaf idgaf.c            \
    && rm -rf /tmp/idgaf /tmp/sockexec

RUN opm install openresty/lua-resty-upload
