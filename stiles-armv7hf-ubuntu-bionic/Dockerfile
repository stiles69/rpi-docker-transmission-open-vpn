FROM resin/armv7hf-ubuntu:bionic
MAINTAINER admin@roguedesigns.us

# Update packages and install software
RUN apt-get update \
	&& curl -L -o /tmp/unrar_5.3.2-1+deb9u1_armhf.deb https://storage.googleapis.com/stiles-images/unrar_5.3.2-1%2Bdeb9u1_armhf.deb \
	&& dpkg -i /tmp/unrar_5.3.2-1+deb9u1_armhf.deb

