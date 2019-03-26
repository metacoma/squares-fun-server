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


WORKDIR /tmp
#ADD http://www-e.uni-magdeburg.de/jschulen/ocr/gocr-0.50.tar.gz /tmp/
#RUN tar zxvf gocr-0.50.tar.gz
#WORKDIR /tmp/gocr-0.50
RUN git clone https://github.com/SureChEMBL/gocr      \
    && cd gocr                                        \
    && ./configure                                    \
    && make                                           \
    && make install

RUN opm install                                       \
      bungle/lua-resty-template                       \
      jprjr/lua-resty-exec                            \
      agentzh/lua-resty-http                          \
      thibaultcha/lua-resty-jit-uuid                  \
      openresty/lua-resty-upload

RUN luarocks install inspect

ENV ENTRYPOINT_PATH /usr/local/bin/entrypoint.sh
COPY entrypoint.sh $ENTRYPOINT_PATH
COPY nginx/boxes /usr/local/openresty/site/lualib/boxes
COPY bin /opt/objects/bin
ENTRYPOINT [ "/usr/local/bin/entrypoint.sh" ]
