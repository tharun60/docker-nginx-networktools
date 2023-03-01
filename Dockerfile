FROM nginx
COPY index.html /usr/share/nginx/html/
RUN     apt-get update \
    &&  apt-get install -y bash curl \
                iproute2 iputils-ping jq mtr iptables\
                net-tools nginx openssl netcat dnsutils nmap  \
                procps tcpdump tcptraceroute wget telnet 
RUN apt-get update && \
    apt-get install -y -q --allow-unauthenticated \
    git  \
    sudo
RUN useradd -m -s /bin/zsh linuxbrew && \
    usermod -aG sudo linuxbrew &&  \
    mkdir -p /home/linuxbrew/.linuxbrew && \
    chown -R linuxbrew: /home/linuxbrew/.linuxbrew
USER linuxbrew
RUN /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)"

USER root
RUN chown -R $CONTAINER_USER: /home/linuxbrew/.linuxbrew 
RUN (echo; echo 'eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"') >> /root/.bashrc                
