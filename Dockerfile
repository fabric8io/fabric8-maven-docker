FROM maven:3.3.1-jdk-7

MAINTAINER fabric8.io <fabric8@googlegroups.com>

ADD run.sh /

CMD ["/run.sh"]
