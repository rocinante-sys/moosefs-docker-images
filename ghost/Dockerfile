FROM ghost:latest

# Install libraries
RUN apt-get update && apt-get install -y wget fuse3 libfuse3-3 gnupg2 python3

# Add key
RUN wget -O - http://ppa.moosefs.com/moosefs.key 2>/dev/null | apt-key add - 2>/dev/null
RUN echo "deb http://ppa.moosefs.com/3.0.115/apt/debian/buster buster main" > /etc/apt/sources.list.d/moosefs.list

# Install MooseFS client and cli
RUN apt-get update && apt-get install -y moosefs-client moosefs-cli

COPY start.sh /usr/bin/
RUN chmod +x /usr/bin/start.sh

CMD ["start.sh"]
