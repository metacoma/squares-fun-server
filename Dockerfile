FROM openresty/openresty:alpine-fat
RUN apk update && apk add                       \
  musl-dev                                      \
  gcc                                           \
  make                                          \
  alpine-sdk                                    \
  openssl-dev                                   \
  skalibs                                       \
  jq                                            \
  tesseract-ocr-data-rus                        \
  imagemagick                                   \
  skalibs-dev
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


RUN opm install                                       \
      bungle/lua-resty-template                       \
      jprjr/lua-resty-exec                            \
      agentzh/lua-resty-http                          \
      thibaultcha/lua-resty-jit-uuid                  \
      openresty/lua-resty-upload

