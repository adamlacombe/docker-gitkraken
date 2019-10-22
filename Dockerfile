#FROM ubuntu:16.04
FROM ubuntu:latest

LABEL version "6.3.0"

WORKDIR /home

COPY 16-04-sources.list /etc/apt/16-04-sources.list

RUN cp /etc/apt/sources.list /etc/apt/latest-sources.list && apt-get update

RUN apt-get install -y locales net-tools \
        apt-transport-https \
        ca-certificates \
        dirmngr \
        gnupg2 \
        dbus-x11 \
        libxkbfile1 \
        wget \
        gconf2 \
        gconf-service \
        #libgtk2.0-0 \
        libnotify4 \
        libxtst6 \
        libnss3 \
        python \
        gvfs-bin \
        xdg-utils \
        firefox \
        curl \
        libxss1 \
        git \
        libasound2 \
        libcap2 \
        libgconf-2-4 \
        libgnome-keyring-dev \
        libx11-xcb-dev

# Setup locales
RUN sed -i 's/# en_US.UTF-8 UTF-8/en_US.UTF-8 UTF-8/g' /etc/locale.gen && \
    locale-gen &&\
    update-locale LANG="en_US.UTF-8"

#RUN apt-get install -y libgl1-mesa-dri \
#                        libgl1-mesa-glx
#                        libgl1-mesa-glx

#RUN apt-get install software-properties-common -y && add-apt-repository ppa:eosrei/fonts && apt-get update && apt-get install fonts-emojione-svginot

RUN wget --quiet "https://release.gitkraken.com/linux/gitkraken-amd64.deb" -O gitkraken-amd64.deb && \
  	dpkg -i gitkraken-amd64.deb; apt-get install -f -y  && \
	rm -rf /var/lib/apt/lists/* && \
  	rm gitkraken-amd64.deb

RUN groupadd -r developer -g 1000 && \
    useradd -u 1000 -r -g developer -d /developer -s /bin/bash -c "Software Developer" developer && \
    mkdir /developer && \
    mkdir /developer/.gitkraken && \
    mkdir /developer/.ssh && \
    mkdir /developer/repos && \
    chown -R developer:developer /developer

USER developer

VOLUME ["/developer/.gitkraken", "/developer/repos", "/developer/.ssh"]

CMD ["/usr/bin/gitkraken"]
