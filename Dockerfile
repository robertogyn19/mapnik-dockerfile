FROM ubuntu:14.04
MAINTAINER Roberto Rodrigues Junior "robertogyn19@gmail.com"
ENV REFRESHED_AT 2015-09-15

RUN apt-get update && apt-get install -y           \
                      libboost-filesystem-dev      \
                      libboost-program-options-dev \
                      libboost-python-dev          \
                      libboost-regex-dev           \
                      libboost-system-dev          \
                      libboost-thread-dev

RUN apt-get install -y                             \
                      clang                        \
                      libcairo2                    \
                      libcairo2-dev                \
                      libcairomm-1.0-1             \
                      libcairomm-1.0-dev           \
                      libfreetype6                 \
                      libfreetype6-dev             \
                      libgdal1-dev                 \
                      libicu-dev                   \
                      libjpeg-dev                  \
                      libltdl7                     \
                      libltdl-dev                  \
                      libpng-dev                   \
                      libproj-dev                  \
                      libsqlite3-dev               \
                      libtiff-dev                  \
                      libxml2                      \
                      libxml2-dev                  \
                      postgresql-server-dev-9.3    \
                      python-cairo                 \
                      python-cairo-dev             \
                      python-dev                   \
                      python-gdal                  \
                      python-nose                  \
                      ttf-dejavu                   \
                      ttf-dejavu-core              \
                      ttf-dejavu-extra             \
                      ttf-unifont

RUN apt-get install -y                             \
                      git                          \
                      libharfbuzz-dev              \
                      zlibc

WORKDIR /opt
RUN git clone https://github.com/mapnik/mapnik.git mapnik

WORKDIR /opt/mapnik
RUN git checkout v3.0.0
RUN git submodule update --init

RUN ./configure

RUN apt-get install -y automake build-essential
RUN JOBS=1 make

CMD [/bin/bash]
