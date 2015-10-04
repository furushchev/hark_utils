#!/bin/bash

CWD=`pwd`
OUTDIR=$CWD/output

if [ -d $OUTDIR ]; then
    rm -ri $OUTDIR
fi
mkdir $OUTDIR
read -p "each angle? [deg]: " deg

ts=$(expr 360 / $deg - 1)
echo $ts $deg
for i in $(seq 0 $ts); do
    read -p "press enter" enter
    d=$(expr $i \* $deg)
    echo $d deg...
    wav_name=$(printf "r100_d%03d.wav" $d)
    out_path=$OUTDIR/$wav_name
    wios -s -x 0 -i $CWD/tsp16.wav -c 7 -o $out_path
    echo recorded $out_path
done
