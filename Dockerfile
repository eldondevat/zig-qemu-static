FROM alpine:3.22.1

RUN apk update
RUN apk upgrade

# required by qemu
RUN apk add\
 make\
 samurai\
 perl\
 pcre2-dev python3\
 pcre2-static\
 gcc\
 libc-dev\
 pkgconf\
 linux-headers\
 glib-dev glib-static\
 zlib-dev zlib-static\
 flex\
 bison

# additional
RUN apk add bash xz git patch

WORKDIR /work

COPY command/base command/base
COPY command/fetch command/fetch
RUN /work/command/fetch

COPY command/extract command/extract
RUN /work/command/extract

COPY command/configure command/configure
RUN /work/command/configure

COPY command/make command/make
RUN /work/command/make

COPY command/install command/install
RUN /work/command/install

