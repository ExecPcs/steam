FROM centos:7

MAINTAINER ExecPcs

ENV TERM=xterm

# Add steam user
RUN useradd -ms /bin/bash steam

# Install dependencies
RUN \
    yum update -y &&\
    yum install vim glibc.i686 libstdc++.i686 -y

# Prepare directory
RUN mkdir -p /opt/steamcmd &&\
    chown steam:steam /opt/steamcmd

USER steam

# Extract steam
RUN cd /opt/steamcmd &&\
    curl -s http://media.steampowered.com/installer/steamcmd_linux.tar.gz | tar -vxz

WORKDIR /opt/steamcmd

# This container will be executable
ENTRYPOINT ["./steamcmd.sh"]
