#!/bin/bash
set -x

virt-sparsify output/windows-server-2012-r2.qcow2 output/win-sparsy.qcow2
qemu-img convert -O qcow2 output/win-sparsy.qcow2 /srv/images/win2012-sparsy.qcow2 -c
