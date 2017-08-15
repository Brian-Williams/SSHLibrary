FROM ubuntu:17.04
MAINTAINER Brian Williams

RUN apt-get update && \
    apt-get install -y \
    build-essential python3.6 python3.6-dev python3-pip python3.6-venv \
    openssh-client openssh-server

COPY / /home/SSHLibrary
WORKDIR /home/SSHLibrary
RUN pip3 install -e /home/SSHLibrary robotstatuschecker
RUN bash /home/SSHLibrary/.ci/setup_atest.sh && \
    update-rc.d ssh defaults
CMD service ssh start && python3 atest/run.py atest
