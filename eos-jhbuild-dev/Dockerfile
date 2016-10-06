FROM eos-dev
ENV get="apt-get -y --force-yes --allow-unauthenticated"
ENV DEBIAN_FRONTEND="noninteractive"

RUN $get update
RUN $get install git apt-file sudo curl
RUN $get install cdbs debhelper gnome-pkg-tools intltool pkg-config rarian-compat yelp-tools python
RUN apt-file update
RUN git clone --depth=1 git://git.gnome.org/jhbuild

# remove no-root check
COPY jhbuild.patch jhbuild/jhbuild.patch
RUN cd jhbuild && cat jhbuild.patch | patch -p1

run cd jhbuild && ./autogen.sh --simple-install --prefix=/usr && make && make install
