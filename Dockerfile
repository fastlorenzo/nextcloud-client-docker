FROM alpine:latest
LABEL maintainer="juanignacioborda@gmail.com"
ARG VCS_REF
ARG BUILD_DATE
ARG buildno
#ARG USER=ncsync
#ARG USER_UID=1000
#ARG USER_GID=1000

ENV PGID=1000 \
  PUID=911 \
  NC_USER=username \
  NC_PASS=password \
  NC_INTERVAL=500 \
  NC_URL="" \
  NC_TRUST_CERT=false \
  NC_SOURCE_DIR="/media/nextcloud/" \
  NC_SILENT=false \
  NC_EXIT=false   \
  NC_HIDDEN=false


#RUN addgroup -g $USER_GID $USER && adduser -G $USER -D -u $USER_UID $USER

# update repositories and install nextcloud-client
RUN apk update && \
  apk add --no-cache nextcloud-client su-exec shadow && \
  rm -rf /etc/apk/cache

# Create ncsync user and group (from linuxserver.io setup)
RUN addgroup -g 911 ncsync && \
  adduser -G ncsync -D -u 911 ncsync

# add run script
ADD run.sh /usr/bin/run.sh

CMD /usr/bin/run.sh
