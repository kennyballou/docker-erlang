# DOCKER-VERSION 1.9.1
FROM centos:7
MAINTAINER kballou@devnulllabs.io

ENV LANG="en_US.UTF-8"
ENV OTP_VERSION="19.2.3"
ENV REBAR_VERSION="2.6.2"
ENV REBAR3_VERSION="3.2.0"

RUN set -xe \
    && yum -y groups install "Development Tools" \
    && yum -y install ncurses \
        ncurses-devel \
        unixODBC \
        unixODBC-devel \
        openssl-devel \
    && curl -fSL "https://github.com/erlang/otp/archive/OTP-19.2.3.tar.gz" -o otp-src.tar.gz \
    && echo "51dd3eda2b5e835588ed215328c3943b69bc353d892577411570641f37c51ad8  otp-src.tar.gz" | sha256sum -c - \
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
    && echo "ed2a49300f2f8ae7c95284e53e95dd85430952d2843ce224a17db2b312964400  rebar-src.tar.gz" | sha256sum -c - \
    && tar -zxf rebar-src.tar.gz -C /usr/src/rebar-src --strip-components=1 \
    && rm rebar-src.tar.gz \
    && cd /usr/src/rebar-src \
    && ./bootstrap \
    && install -v ./rebar /usr/local/bin \
    && cd /usr/src \
    && rm -rf /usr/src/rebar-src \
    && mkdir -p /usr/src/rebar3-src \
    && curl -fSL "https://github.com/erlang/rebar3/archive/${REBAR3_VERSION##*@}.tar.gz" -o rebar3-src.tar.gz \
    && echo "78ad27372eea6e215790e161ae46f451c107a58a019cc7fb4551487903516455  rebar3-src.tar.gz" | sha256sum -c - \
    && tar -zxf rebar3-src.tar.gz -C /usr/src/rebar3-src --strip-components=1 \
    && rm rebar3-src.tar.gz \
    && cd /usr/src/rebar3-src \
    && HOME=/home/kb/workspace/docker-erlang ./bootstrap \
    && install -v ./rebar3 /usr/local/bin \
    && rm -rf /usr/src/rebar3-src \
    && yum -y groups erase "Development Tools"

CMD ["erl"]
