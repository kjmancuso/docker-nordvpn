FROM ubuntu:latest

ARG DEBIAN_FRONTEND="noninteractive"

RUN curl -JO https://repo.nordvpn.com/deb/nordvpn/debian/pool/main/nordvpn-release_1.0.0_all.deb
RUN dpkg -i nordvpn-release_1.0.0_all.deb

RUN apt-get update && \
    apt-get install -y ca-certificates \
                       curl \
                       iptables \
                       jq \
                       nordvpn


RUN echo "net.ipv4.ip_forward = 1" >> /etc/sysctl.conf
VOLUME /config

