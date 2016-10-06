FROM eos-dev
ENV get="apt-get -y --force-yes --allow-unauthenticated"
ENV DEBIAN_FRONTEND="noninteractive"

RUN $get update
RUN $get install git wget
RUN $get install cdbs debhelper gnome-pkg-tools intltool pkg-config rarian-compat yelp-tools python
# remove git for no retention
RUN git clone --depth=1 git://git.gnome.org/jhbuild && (cd jhbuild && ./autogen.sh --simple-install --prefix=/usr && make && make install) && rm -rf jhbuild
RUN wget https://raw.githubusercontent.com/endlessm/eos-knowledge-lib/master/eos-knowledge-lib.modules
COPY jhbuildrc ~/.jhbuildrc
RUN jhbuild sysdeps --install
RUN jhbuild build
