# Container for developing Sass/Scss at Holberton School
FROM holbertonschool/ubuntu-1804-python37
MAINTAINER Guillaume Salva <guillaume@holbertonschool.com>

RUN apt-get update

# Install redis server and the redis client
RUN apt-get -y install redis-server
RUN pip3 install redis

RUN sed -i "s/bind .*/bind 127.0.0.1/g" /etc/redis/redis.conf

RUN sed -i 's/# set bell-style none/set bell-style none/g' /etc/inputrc

ADD run.sh /etc/sandbox_run.sh
RUN chmod u+x /etc/sandbox_run.sh

# start run!
CMD ["./etc/sandbox_run.sh"]
