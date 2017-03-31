FROM alpine:3.5

ARG USERNAME
ARG USERID
ARG GROUPNAME
ARG GROUPID

RUN apk add --no-cache --update rsync && rm -f /etc/rsyncd.conf

# RUN getent group $GROUPID || addgroup -g $GROUPID $GROUPNAME \
#   && adduser -u $USERID -g $GROUPID -g "" -D -H $USERNAME

EXPOSE 873
VOLUME /usr/src
ADD entrypoint /usr/local/bin/entrypoint

ENTRYPOINT ["/usr/local/bin/entrypoint"]
