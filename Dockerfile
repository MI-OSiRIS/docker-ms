FROM python:3.7-stretch
LABEL version="1.1-0"

MAINTAINER Jeremy Musser <jemusser@iu.edu>

EXPOSE 8889/tcp

RUN apt-get update
RUN apt-get -y install sudo mongodb redis-server

RUN usermod -u 9999 mongodb
RUN chown mongodb:mongodb /var/lib/mongodb
RUN chown mongodb:mongodb /var/log/mongodb

RUN export uid=1000 gid=1000 && \
    mkdir -p /home/unis && \
    echo "unis:x:${uid}:${gid}:Periscope MS,,,:/home/unis:/bin/bash" >> /etc/passwd && \
    echo "unis:x:${uid}:" >> /etc/group && \
    echo "unis ALL=(ALL) NOPASSWD: ALL" > /etc/sudoers.d/unis && \
    chmod 0440 /etc/sudoers.d/unis && \
    chown ${uid}:${gid} -R /home/unis

USER unis
ENV HOME /home/unis
WORKDIR $HOME

RUN git clone -b develop https://github.com/periscope-ps/unis
RUN cd unis && sudo python3 setup.py build install && cd -

ADD ms.cfg /etc/periscope/ms.cfg
ADD run.sh .
CMD bash run.sh
