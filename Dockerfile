FROM pskamruk/inotify:latest

RUN apk update && apk add bird

COPY ./bird-reloader.sh .

CMD ["/bird-reloader.sh"]
