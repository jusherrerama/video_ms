FROM ruby:2.3
RUN mkdir /videos_ms
WORKDIR /videos_ms
ADD Gemfile /videos_ms/Gemfile
ADD Gemfile.lock /videos_ms/Gemfile.lock
RUN bundle install
ADD . /videos_ms


FROM        ubuntu:16.04 AS base

RUN     apt-get -yqq update && \
        apt-get install -yq --no-install-recommends ca-certificates && \
        apt-get autoremove -y && \
        apt-get clean -y

FROM base as build

ARG        PKG_CONFIG_PATH=/opt/ffmpeg/lib/pkgconfig
ARG        LD_LIBRARY_PATH=/opt/ffmpeg/lib
ARG        PREFIX=/opt/ffmpeg
ARG        MAKEFLAGS="-j"

ENV         %%ENV%%

RUN      buildDeps="autoconf \
                    automake \
                    cmake \
                    curl \
                    bzip2 \
                    libexpat1-dev \
                    g++ \
                    gcc \
                    git \
                    gperf \
                    libtool \
                    make \
                    nasm \
                    perl \
                    pkg-config \
                    python \
                    libssl-dev \
                    yasm \
                    zlib1g-dev" && \
        apt-get -yqq update && \
        apt-get install -yq --no-install-recommends ${buildDeps}
%%RUN%%
## cleanup
RUN \
        ldd ${PREFIX}/bin/ffmpeg | grep opt/ffmpeg | cut -d ' ' -f 3 | xargs -i cp {} /usr/local/lib/ && \
        cp ${PREFIX}/bin/* /usr/local/bin/ && \
        cp -r ${PREFIX}/share/ffmpeg /usr/local/share/ && \
        LD_LIBRARY_PATH=/usr/local/lib ffmpeg -buildconf


FROM        base AS release
MAINTAINER  Julien Rottenberg <julien@rottenberg.info>

CMD         ["--help"]
ENTRYPOINT  ["ffmpeg"]
ENV         LD_LIBRARY_PATH=/usr/local/lib

COPY --from=build /usr/local /usr/local/
