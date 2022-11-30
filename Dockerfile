FROM debian:latest
MAINTAINER baronhoot <baronhoot@gmail.com>

WORKDIR /tmp/

RUN apt-get update
RUN apt-get install -y git libtool libusb-1.0.0-dev librtlsdr-dev rtl-sdr cmake automake python3 python3-pip
RUN pip3 install paho-mqtt
RUN git clone https://github.com/baronhoot/rtl_433.git

COPY build.sh .

# Build rtl_433
RUN ./build.sh

ENTRYPOINT ["/usr/local/bin/rtl_433"]