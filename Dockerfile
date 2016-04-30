FROM ubuntu:14.04
RUN apt-get update && apt-get install -y curl && apt-get clean && \
    curl -o /usr/bin/btsync.tar.gz \
    https://download-cdn.getsync.com/stable/linux-x64/BitTorrent-Sync_x64.tar.gz && \
    cd /usr/bin && tar -xzvf btsync.tar.gz && rm btsync.tar.gz && \
    mkdir -p /btsync/.sync && \
    mkdir -p /var/run/btsync && \
    mkdir -p /data

ADD start-btsync /usr/bin/start-btsync
RUN chmod +x /usr/bin/start-btsync

VOLUME ["/data"]

EXPOSE 8888
EXPOSE 55555
ENTRYPOINT ["start-btsync"]
