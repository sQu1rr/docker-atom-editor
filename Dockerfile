FROM ubuntu:latest

ENV ATOM_VERSION v1.20.0

RUN apt-get update && \
    apt-get install -y --no-install-recommends \
      build-essential \
      ca-certificates \
      curl \
      fakeroot \
      gconf2 \
      gconf-service \
      git \
      gvfs-bin \
      libasound2 \
      libcap2 \
      libgconf2-dev \
      libgtk2.0-dev \
      libnotify-dev \
      libnss3 \
      libxkbfile1 \
      libxss1 \
      libxtst6 \
      libdbus-1-dev \
      libgnome-keyring-dev \
      python \
      ssh \
      xdg-utils \
      libx11-xcb-dev

RUN cd /lib/x86_64-linux-gnu/ && ln -sf libudev.so.1 libudev.so.0

RUN apt-get install -y nodejs

RUN curl -L https://atom.io/download/deb > /tmp/atom-amd64.deb && \
    dpkg -i /tmp/atom-amd64.deb && \
    rm -f /tmp/atom-amd64.deb && \
    useradd -d /home/atom -m atom

RUN apt-get clean && \
    rm -rf /var/lib/apt/lists/*

USER atom

CMD ["/usr/bin/atom","-f"]
