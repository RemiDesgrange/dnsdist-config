FROM debian:buster

RUN apt update && apt install -y curl gnupg2

RUN curl https://repo.powerdns.com/FD380FBB-pub.asc | apt-key add -
RUN echo 'deb [arch=amd64] http://repo.powerdns.com/debian buster-dnsdist-14 main' >> /etc/apt/sources.list
RUN apt update && apt install -y dnsdist

EXPOSE 8053
COPY dnsdist.conf /etc/dnsdist/
COPY entrypoint.sh /
COPY docker-entrypoint.d /


ENTRYPOINT ["/entrypoint.sh"]
CMD ["/usr/bin/dnsdist"]



