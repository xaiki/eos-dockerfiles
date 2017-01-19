FROM deb-jhbuild-dev
ENV get="apt-get -y --force-yes --allow-unauthenticated"
ENV DEBIAN_FRONTEND="noninteractive"
RUN echo "deb http://cdn.debian.net/debian testing main" > /etc/apt/sources.list.d/testing.list
RUN echo "deb http://cdn.debian.net/debian stable main" > /etc/apt/sources.list.d/stable.list

RUN $get update
RUN apt-file update

RUN curl https://raw.githubusercontent.com/endlessm/eos-knowledge-lib/master/eos-knowledge-lib.modules > eos-knowledge-lib.modules
COPY jhbuildrc ~/.jhbuildrc

RUN $get install ninja-build libjpeg62-dev libcups2-dev libcupsimage2-dev libjpeg62 libtiff-dev libjpeg-dev libcupsfilters-dev

# the jhbuild patch didn't work ?
RUN echo 1 | jhbuild sysdeps --install
RUN jhbuild build
