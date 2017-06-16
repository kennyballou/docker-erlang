# DOCKER-VERSION 1.9.1
FROM centos:7
MAINTAINER kballou@devnulllabs.io

ENV LANG="en_US.UTF-8"
ENV OTP_VERSION="18.3.4.4"
ENV REBAR_VERSION="2.6.4"
ENV REBAR3_VERSION="3.4.1"

RUN set -xe \
    && yum -y groups install "Development Tools" \
    && yum -y install ncurses \
        ncurses-devel \
        unixODBC \
        unixODBC-devel \
        openssl-devel \
    && curl -fSL "https://github.com/erlang/otp/archive/OTP-18.3.4.4.tar.gz" -o otp-src.tar.gz \
    && echo "3956f5c4fcd05848c7fe048d5c4ef7eaf002a8312cba0674150c5a10ab0e9f04  otp-src.tar.gz" | sha256sum -c - \
    && mkdir -p /usr/src/otp-src \
    && tar -zxf otp-src.tar.gz -C /usr/src/otp-src --strip-components=1 \
    && rm otp-src.tar.gz \
    && cd /usr/src/otp-src \
    && ./otp_build autoconf \
    && ./configure \
    && make -j 4 \
    && make install \
    && find /usr/local -name examples | xargs rm -rf \
    && cd /usr/src \
    && rm -rf /usr/src/otp-src \
    && mkdir -p /usr/src/rebar-src \
    && curl -fSL "https://github.com/rebar/rebar/archive/${REBAR_VERSION##*@}.tar.gz" -o rebar-src.tar.gz \
    && echo "577246bafa2eb2b2c3f1d0c157408650446884555bf87901508ce71d5cc0bd07  rebar-src.tar.gz" | sha256sum -c - \
    && tar -zxf rebar-src.tar.gz -C /usr/src/rebar-src --strip-components=1 \
    && rm rebar-src.tar.gz \
    && cd /usr/src/rebar-src \
    && ./bootstrap \
    && install -v ./rebar /usr/local/bin \
    && cd /usr/src \
    && rm -rf /usr/src/rebar-src \
    && mkdir -p /usr/src/rebar3-src \
    && curl -fSL "https://github.com/erlang/rebar3/archive/${REBAR3_VERSION##*@}.tar.gz" -o rebar3-src.tar.gz \
    && echo "fa8b056c37ed3781728baf0fc5b1d87a31edbc5f8dd9b50a5d1ad92b0230e5dd  rebar3-src.tar.gz" | sha256sum -c - \
    && tar -zxf rebar3-src.tar.gz -C /usr/src/rebar3-src --strip-components=1 \
    && rm rebar3-src.tar.gz \
    && cd /usr/src/rebar3-src \
    && HOME=/home/kb/workspace/docker-erlang ./bootstrap \
    && install -v ./rebar3 /usr/local/bin \
    && rm -rf /usr/src/rebar3-src \
    && yum -y groups erase "Development Tools"

CMD ["erl"]
