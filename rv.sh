#!/bin/bash
json_out=`pwd`/errors.json
./configure CC=kcc CFLAGS="-D__packed='__attribute__((packed))' -frecover-all-errors -fissue-report=$json_out" LD=kcc
make -j`nproc`
