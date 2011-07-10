#!/bin/bash
cd "$(dirname "$0")"
. settings.sh

for d in $DIRS; do
  "$ADB" pull "$SYS"/$d $d
done
