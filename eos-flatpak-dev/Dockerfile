FROM eos-dev
ENV DEB_BUILD_PROFILE="xdg-app"
RUN mkdir -p /build/source

ENV get="apt-get -y --force-yes --allow-unauthenticated"
ENV DEBIAN_FRONTEND="noninteractive"
RUN $get update
RUN $get dist-upgrade
RUN $get install git dh-exec debhelper python3 python3-xdg python3-apt python3-setuptools python3-gi python3-polib
RUN $get install flatpak ostree

RUN $get install wget
RUN wget http://ftp.us.debian.org/debian/pool/main/o/ostree/gir1.2-ostree-1.0_2016.9-1_amd64.deb http://ftp.us.debian.org/debian/pool/main/liba/libarchive/libarchive13_3.2.1-2_amd64.deb http://ftp.us.debian.org/debian/pool/main/o/ostree/libostree-1-1_2016.9-1_amd64.deb http://ftp.us.debian.org/debian/pool/main/f/flatpak/libflatpak0_0.6.9-1_amd64.deb http://ftp.us.debian.org/debian/pool/main/l/lz4/liblz4-1_0.0~r131-2_amd64.deb http://ftp.us.debian.org/debian/pool/main/f/flatpak/flatpak_0.6.9-1_amd64.deb http://ftp.us.debian.org/debian/pool/main/o/ostree/ostree_2016.9-1_amd64.deb && dpkg -i *.deb; $get -f install && dpkg -i *.deb
#


