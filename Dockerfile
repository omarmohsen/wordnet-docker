FROM centos:7
#Set WordNet bersion
ENV WORDNET_VERSION 3.0
#Install build dependencies
RUN yum -y install wget gcc tk-devel make
#Download WordNet tar
RUN wget http://wordnetcode.princeton.edu/$WORDNET_VERSION/WordNet-$WORDNET_VERSION.tar.gz
#Extract tar file
RUN tar xvf WordNet-$WORDNET_VERSION.tar.gz
WORKDIR ./WordNet-$WORDNET_VERSION
#Configure, compile, and install
RUN ./configure
RUN echo  "#define USE_INTERP_RESULT 1" >> src/stubs.c
RUN make
RUN make install
#Append to PATH environmental variable
ENV PATH $PATH:/usr/local/WordNet-$WORDNET_VERSION/bin/
ENTRYPOINT ["wn"]
CMD []
