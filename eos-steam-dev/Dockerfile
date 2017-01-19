FROM eos-dev
ENV get="apt-get -y --force-yes --allow-unauthenticated"
ENV DEBIAN_FRONTEND="noninteractive"

RUN dpkg --add-architecture i386
RUN $get update
RUN $get install wget
RUN wget https://steamcdn-a.akamaihd.net/client/installer/steam.deb
RUN $get install python curl python-apt xterm zenity
RUN $get -o Dpkg::Options::="--force-overwrite" install libgl1-mesa-dri:i386 libgl1-mesa-glx:i386 libc6:i386
RUN dpkg -i steam.deb
RUN adduser steam
RUN $get install libcurl3
RUN $get install pulseaudio


