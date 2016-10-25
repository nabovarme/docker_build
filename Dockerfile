from debian:jessie

run apt-get update && \
	apt-get install -y \
	libtool-bin \
	make \
	unrar-free \
	autoconf \
	automake \
	libtool \
	gcc g++ \ 
	gperf \
	flex \ 
	bison \ 
	texinfo \ 
	gawk \ 
	ncurses-dev \ 
	libexpat-dev \ 
	python-dev \ 
	python \ 
	python-serial \ 
	sed \ 
	git \ 
	unzip \ 
	bash \ 
	help2man \ 
	wget \ 
	bzip2

RUN adduser --disabled-password --gecos '' r
RUN adduser r sudo 
RUN echo '%sudo ALL=(ALL) NOPASSWD:ALL' >> /etc/sudoers
RUN git clone --recursive https://github.com/pfalcon/esp-open-sdk.git
RUN chown -R r /esp-open-sdk
WORKDIR "/esp-open-sdk"
RUN su -m r -c 'make STANDALONE=y'
