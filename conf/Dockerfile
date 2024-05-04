FROM postgres:13.4

#   debugging tools so we can inspect running containers
RUN apt update
RUN apt install neovim sudo tree build-essential neofetch -y

COPY scripts /scripts
RUN chmod +x scripts/*.sh
