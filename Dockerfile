FROM alpine:3.21

# install dependencies
RUN apk update && apk add --no-cache \
  rsyncd

# Copy configs and scripts
RUN mkdir /conf /app
ADD conf/* /conf
ADD app/* /app
RUN chmod +x /app/start.sh

CMD [ "/app/start.sh" ]
