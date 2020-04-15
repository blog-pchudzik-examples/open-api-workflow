FROM node:12-alpine3.10

RUN npm install -g swagger-ui-watcher

RUN echo $'#!/bin/sh\n\
swagger-ui-watcher -h 0.0.0.0 --no-open $@ \n\
\n ' > /watch.sh

RUN echo $'#!/bin/sh\n\
swagger-ui-watcher $1 --bundle $2 \n\
\n ' > /bundle.sh

RUN chmod +x /watch.sh
RUN chmod +x /bundle.sh

EXPOSE 8080
VOLUME /api

WORKDIR /api
CMD ["/watch-api.sh"]
