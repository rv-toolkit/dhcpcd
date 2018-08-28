#!/bin/bash
make clean
json_out=`pwd`/errors.json
report_out=`pwd`/report
rm $json_out
export CC=kcc
export CFLAGS="-D__packed='__attribute__((packed))' -frecover-all-errors -fissue-report=$json_out"
export CPPFLAGS="-fissue-report=$json_out"
export LD=kcc
./configure
make -j`nproc`
make tests
rv-html-report $json_out -o $report_out
rv-upload-report $report_out