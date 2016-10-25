FROM ubuntu:16.04

RUN apt-get update
RUN apt-get install -y curl
RUN apt-get install -y nodejs npm
RUN apt-get install nodejs-legacy
RUN npm install -g grunt-cli
RUN apt-get install -y git
RUN npm install -g bower
RUN git clone https://github.com/ProjectMirador/mirador.git
RUN cd mirador && npm install
RUN cd mirador && bower --allow-root install
RUN cd mirador && grunt

CMD cd mirador && grunt server