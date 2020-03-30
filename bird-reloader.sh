#!/bin/sh

while inotifywait -q -e close_write /opt/bird/*conf ; do
  echo configure check | birdc >/tmp/out
  cat /tmp/out
  ( grep OK /tmp/out && \
	  echo configure | birdc && echo config reloaded on: ; date) || \
	  (echo config reload failure on: ; date)
done
