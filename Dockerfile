FROM resin/rpi-raspbian:stretch

VOLUME /data
VOLUME /config
VOLUME /scripts

# Update packages and install software
RUN apt-get update \
    && apt-get -y install transmission-cli transmission-common transmission-daemon \
    && apt-get install -y dumb-init unzip openvpn curl ufw git tinyproxy jq unrar \
    && curl -L -o /tmp/release.zip https://github.com/Secretmapper/combustion/archive/release.zip \
    && unzip /tmp/release.zip -d /opt/transmission-ui/ \
    && rm /tmp/release.zip \
    && git clone git://github.com/endor/kettu.git /opt/transmission-ui/kettu \
    && mkdir /opt/transmission-ui/transmission-web-control \
    && curl -L https://github.com/ronggang/twc-release/raw/master/src.tar.gz \
     | tar -C /opt/transmission-ui/transmission-web-control/ -xzv \
    && apt-get purge git unzip \
    && apt-get autoremove --purge\
    && apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/* \
    && curl -L https://github.com/jwilder/dockerize/releases/download/v0.6.0/dockerize-linux-armhf-v0.6.0.tar.gz \
     | tar -C /usr/local/bin -xzv \
    && groupmod -g 1000 users \
    && useradd -u 911 -U -d /config -s /bin/bash abc \
    && usermod -G users abc

# Add configuration and scripts
ADD openvpn/ /etc/openvpn/
ADD transmission/ /etc/transmission/
ADD tinyproxy /opt/tinyproxy/
ADD bin/ /scripts/

ENV OPENVPN_USERNAME=**None** \
    OPENVPN_PASSWORD=**None** \
    OPENVPN_PROVIDER=**None** \
    GLOBAL_APPLY_PERMISSIONS=true \
    TRANSMISSION_ALT_SPEED_DOWN=50 \
    TRANSMISSION_ALT_SPEED_ENABLED=false \
    TRANSMISSION_ALT_SPEED_TIME_BEGIN=540 \
    TRANSMISSION_ALT_SPEED_TIME_DAY=127 \
    TRANSMISSION_ALT_SPEED_TIME_ENABLED=false \
    TRANSMISSION_ALT_SPEED_TIME_END=1020 \
    TRANSMISSION_ALT_SPEED_UP=50 \
    TRANSMISSION_BIND_ADDRESS_IPV4=0.0.0.0 \
    TRANSMISSION_BIND_ADDRESS_IPV6=:: \
    TRANSMISSION_BLOCKLIST_ENABLED=false \
    TRANSMISSION_BLOCKLIST_URL=http://www.example.com/blocklist \
    TRANSMISSION_CACHE_SIZE_MB=4 \
    TRANSMISSION_DHT_ENABLED=false \
    TRANSMISSION_DOWNLOAD_DIR=/data \
    TRANSMISSION_DOWNLOAD_LIMIT=3000 \
    TRANSMISSION_DOWNLOAD_LIMIT_ENABLED=true \
    TRANSMISSION_DOWNLOAD_QUEUE_ENABLED=true \
    TRANSMISSION_DOWNLOAD_QUEUE_SIZE=2 \
    TRANSMISSION_ENCRYPTION=1 \
    TRANSMISSION_IDLE_SEEDING_LIMIT=30 \
    TRANSMISSION_IDLE_SEEDING_LIMIT_ENABLED=false \
    TRANSMISSION_INCOMPLETE_DIR=/data/incomplete \
    TRANSMISSION_INCOMPLETE_DIR_ENABLED=true \
    TRANSMISSION_LPD_ENABLED=false \
    TRANSMISSION_MAX_PEERS_GLOBAL=200 \
    TRANSMISSION_MESSAGE_LEVEL=2 \
    TRANSMISSION_PEER_CONGESTION_ALGORITHM= \
    TRANSMISSION_PEER_ID_TTL_HOURS=6 \
    TRANSMISSION_PEER_LIMIT_GLOBAL=200 \
    TRANSMISSION_PEER_LIMIT_PER_TORRENT=50 \
    TRANSMISSION_PEER_PORT=55555 \
    TRANSMISSION_PEER_PORT_RANDOM_HIGH=55555 \
    TRANSMISSION_PEER_PORT_RANDOM_LOW=55555 \
    TRANSMISSION_PEER_PORT_RANDOM_ON_START=false \
    TRANSMISSION_PEER_SOCKET_TOS=default \
    TRANSMISSION_PEX_ENABLED=false \
    TRANSMISSION_PORT_FORWARDING_ENABLED=true \
    TRANSMISSION_PREALLOCATION=1 \
    TRANSMISSION_PREFETCH_ENABLED=1 \
    TRANSMISSION_QUEUE_STALLED_ENABLED=true \
    TRANSMISSION_QUEUE_STALLED_MINUTES=30 \
    TRANSMISSION_RATIO_LIMIT=2 \
    TRANSMISSION_RATIO_LIMIT_ENABLED=false \
    TRANSMISSION_RENAME_PARTIAL_FILES=true \
    TRANSMISSION_RPC_AUTHENTICATION_REQUIRED=true \
    TRANSMISSION_RPC_BIND_ADDRESS=0.0.0.0 \
    TRANSMISSION_RPC_ENABLED=true \
    TRANSMISSION_RPC_HOST_WHITELIST=10.0.0.* \
    TRANSMISSION_RPC_HOST_WHITELIST_ENABLED=true \
    TRANSMISSION_RPC_PASSWORD=Vizio#2013 \
    TRANSMISSION_RPC_PORT=9091 \
    TRANSMISSION_RPC_URL=/transmission/ \
    TRANSMISSION_RPC_USERNAME=transmission \
    TRANSMISSION_RPC_WHITELIST=127.0.0.1 \
    TRANSMISSION_RPC_WHITELIST_ENABLED=false \
    TRANSMISSION_SCRAPE_PAUSED_TORRENTS_ENABLED=false \
    TRANSMISSION_SCRIPT_TORRENT_DONE_ENABLED=true \
    TRANSMISSION_SCRIPT_TORRENT_DONE_FILENAME=/scripts/transmission-extract-docker.sh \
    TRANSMISSION_SEED_QUEUE_ENABLED=false \
    TRANSMISSION_SEED_QUEUE_SIZE=10 \
    TRANSMISSION_SPEED_LIMIT_DOWN=3000 \
    TRANSMISSION_SPEED_LIMIT_DOWN_ENABLED=true \
    TRANSMISSION_SPEED_LIMIT_UP=500 \
    TRANSMISSION_SPEED_LIMIT_UP_ENABLED=true \
    TRANSMISSION_START_ADDED_TORRENTS=true \
    TRANSMISSION_TRASH_ORIGINAL_TORRENT_FILES=true \
    TRANSMISSION_UMASK=002 \
    TRANSMISSION_UPLOAD_LIMIT=500 \
    TRANSMISSION_UPLOAD_LIMIT_ENABLED=true \
    TRANSMISSION_UPLOAD_SLOTS_PER_TORRENT=14 \
    TRANSMISSION_UTP_ENABLED=true \
    TRANSMISSION_WATCH_DIR=/data/watch \
    TRANSMISSION_WATCH_DIR_ENABLED=true \
    TRANSMISSION_HOME=/data/transmission-home \
    TRANSMISSION_WATCH_DIR_FORCE_GENERIC=false \
    ENABLE_UFW=false \
    UFW_ALLOW_GW_NET=false \
    UFW_EXTRA_PORTS= \
    UFW_DISABLE_IPTABLES_REJECT=false \
    TRANSMISSION_WEB_UI=combustion \
    PUID=1001 \
    PGID=996 \
    TRANSMISSION_WEB_HOME= \
    DROP_DEFAULT_ROUTE= \
    WEBPROXY_ENABLED=false \
    WEBPROXY_PORT=8888

# Expose port and run
EXPOSE 9091
CMD ["dumb-init", "/etc/openvpn/start.sh"]
