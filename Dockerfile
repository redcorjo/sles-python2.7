FROM opensuse
WORKDIR /install
MAINTAINER redcorjo
RUN zypper -n install wget unzip tar make gcc zlib zlib-devel ncurses-devel openssl-devel vim
RUN wget --no-check-certificate https://www.python.org/ftp/python/2.7.11/Python-2.7.11.tgz
RUN tar -xzf Python-2.7.11.tgz ; cd Python-2.7.11 ; echo "*static*" >> ./Modules/Setup.local ; ./configure --prefix /usr/local; make ; make install
ENV PATH=$PATH:/opt/python2.7/bin
RUN wget https://bootstrap.pypa.io/ez_setup.py -O -|python
RUN easy_install-2.7 --install-dir /usr/local/lib/python2.7/site-packages pip sphinx pyinstaller setuptools Cython cx_freeze
RUN zypper -n install git
ENV PATH=${PATH}:/usr/local/lib/python2.7/site-packages
RUN rm -R /install/*
