FROM mongo:8.0.3
LABEL org.opencontainers.image.authors="Ilya Stepanov <dev@ilyastepanov.com>"

RUN apt-get update && \
    apt-get install -y cron python3 python3-pip pipx && \
    rm -rf /var/lib/apt/lists/*

RUN pipx install awscli

ADD backup.sh /backup.sh
ADD entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh && chmod +x /backup.sh

VOLUME /backup

ENTRYPOINT ["/entrypoint.sh"]
CMD [""]
