#!/bin/bash
set -x
make clean
json_out=`pwd`/errors.json
report_out=`pwd`/report
rm -rf $json_out
rm -rf $report_out
export CC=kcc
export CFLAGS="-D__packed='__attribute__((packed))' -frecover-all-errors -fissue-report=$json_out"
export CPPFLAGS="-fissue-report=$json_out"
export LD=kcc
./configure
make -j`nproc`
rm $json_out
make tests
touch $json_out && rv-html-report $json_out -o $report_out
rv-upload-report $report_out
