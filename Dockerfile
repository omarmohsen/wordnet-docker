FROM centos:7
ENV WORDNET_VERSION 3.0
RUN yum -y install wget gcc tk-devel make
RUN wget http://wordnetcode.princeton.edu/$WORDNET_VERSION/WordNet-$WORDNET_VERSION.tar.gz
RUN tar xvf WordNet-$WORDNET_VERSION.tar.gz
WORKDIR ./WordNet-$WORDNET_VERSION
RUN ./configure
RUN echo  "#define USE_INTERP_RESULT 1" >> src/stubs.c
RUN make
RUN make install
ENV PATH $PATH:/usr/local/WordNet-$WORDNET_VERSION/bin/
ENTRYPOINT ["wn"]
CMD []
