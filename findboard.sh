#!/bin/bash

RFILE=/tmp/.$$.results

rm -f $RFILE || exit 1

function lookat ()
{
		ping -q -W 2 -c 1 10.151.0.$1 1> /dev/null 2>&1 && printf '%d\n' "$1" >> $RFILE
}

for i in $(seq 1 255); do
	lookat $i &
done

sleep 3

grep b8:27:eb /proc/net/arp | cut -d ' ' -f 1-1

#cat $RFILE
rm -f $RFILE
