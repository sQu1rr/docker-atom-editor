FROM ubuntu:latest

ENV ATOM_VERSION v1.17.0

RUN apt-get update && \
    apt-get install -y --no-install-recommends \
      ca-certificates \
      curl \
      fakeroot \
      gconf2 \
      gconf-service \
      git \
      gvfs-bin \
      libasound2 \
      libcap2 \
      libgconf-2-4 \
      libgtk2.0-0 \
      libnotify4 \
      libnss3 \
      libxkbfile1 \
      libxss1 \
      libxtst6 \
      python \
      ssh \
      xdg-utils && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/* && \
    curl -L https://atom.io/download/deb > /tmp/atom-amd64.deb && \
    dpkg -i /tmp/atom-amd64.deb && \
    rm -f /tmp/atom-amd64.deb && \
    useradd -d /home/atom -m atom

USER atom

CMD ["/usr/bin/atom","-f"]
