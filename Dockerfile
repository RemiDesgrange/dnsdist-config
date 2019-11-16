FROM debian:jessie

RUN apt update && apt install -y curl gnupg2

RUN curl https://repo.powerdns.com/FD380FBB-pub.asc | apt-key add -
RUN echo 'deb [arch=amd64] http://repo.powerdns.com/debian jessie-dnsdist-14 main' >> /etc/apt/sources.list
RUN apt update && apt install -y dnsdist

EXPOSE 8053
COPY dnsdist.conf /etc/dnsdist/

CMD ["/usr/bin/dnsdist"]



