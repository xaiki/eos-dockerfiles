FROM eos-dev
ENV get="apt-get -y --force-yes --allow-unauthenticated"
ENV DEBIAN_FRONTEND="noninteractive"

RUN $get update
RUN $get upgrade
RUN $get install nfd python-eos-data-distribution

RUN setcap all=e /usr/bin/nfd
COPY nfd.conf /etc/ndn/nfd.conf
CMD /usr/bin/nfd
