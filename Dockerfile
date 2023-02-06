FROM nginx
COPY index.html /usr/share/nginx/html/
RUN     apt-get update \
    &&  apt-get install -y bash curl \
                iproute2 iputils-ping jq mtr iptables\
                net-tools nginx openssl netcat dnsutils nmap  \
                procps tcpdump tcptraceroute wget telnet \