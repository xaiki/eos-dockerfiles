FROM eos-jhbuild-dev
ENV get="apt-get -y --force-yes --allow-unauthenticated"
ENV DEBIAN_FRONTEND="noninteractive"

RUN $get update
RUN apt-file update

RUN curl https://raw.githubusercontent.com/endlessm/eos-knowledge-lib/master/eos-knowledge-lib.modules > eos-knowledge-lib.modules
COPY jhbuildrc ~/.jhbuildrc

RUN jhbuild sysdeps --install
RUN jhbuild build
