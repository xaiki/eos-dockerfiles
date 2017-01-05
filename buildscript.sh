#!/bin/sh
((dpkg -i /result/*.deb || true) \
     && (DEBIAN_FRONTEND=noninteractive apt-get install -fy || true) \
     && mk-build-deps -i /data/debian/control \
     && rsync -a /data /build \
     && cd /build/data \
     && (make clean; ./waf clean; git clean -dfx; git submodule foreach git clean -dfx || true) \
     && source=`dpkg-parsechangelog -S Source` \
     && version=`dpkg-parsechangelog -S Version | cut -d'-' -f1` \
     && git archive --format=tar.gz master >| ../${source}_${version}.orig.tar.gz \
     && dpkg-buildpackage ||  bash \
     && lintian -iI --pedantic || true \
     && rm -rf /build/data \
     && cp -a /build/* /result \
    ) || (cd /build/data/ && bash)
