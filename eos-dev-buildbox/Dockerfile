FROM    eos-dev
MAINTAINER xaiki@endlessm.com

ENV get="apt-get -y --force-yes --allow-unauthenticated"
ENV DEBIAN_FRONTEND="noninteractive"

RUN $get update
RUN $get install     build-essential \
    curl \
    devscripts \
    equivs \
    git-buildpackage \
    git \
    lsb-release \
    make \
    pristine-tar \
    rsync \
    wget

