FROM eos-dev
ENV get="apt-get -y --force-yes --allow-unauthenticated"
ENV DEBIAN_FRONTEND="noninteractive"

RUN $get update
RUN $get install git dh-exec debhelper 
RUN $get install python3 python3-xdg python3-apt python3-setuptools python3-gi
RUN $get install python3-polib
RUN $get install gir1.2-ostree-1.0
RUN $get install flatpak
RUN $get install python-setuptools python-pkg-resources
