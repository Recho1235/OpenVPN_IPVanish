FROM ubuntu:latest

RUN apt-get update && \
    apt-get install -y openvpn

COPY ipvanish.ovpn /etc/openvpn/client.conf

ENV VPN_USERNAME your_username
ENV VPN_PASSWORD your_password

RUN echo "$VPN_USERNAME\n$VPN_PASSWORD" > /etc/openvpn/auth.txt

CMD ["openvpn", "--config", "/etc/openvpn/client.conf", "--auth-user-pass", "/etc/openvpn/auth.txt"]
