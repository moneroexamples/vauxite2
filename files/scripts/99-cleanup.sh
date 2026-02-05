#!/bin/bash
set -ouex pipefail

find /tmp -mindepth 1 -maxdepth 1 -exec /usr/bin/rm -rf {} + 2>/dev/null || true
find /var/tmp -mindepth 1 -maxdepth 1 -exec /usr/bin/rm -rf {} + 2>/dev/null || true

/usr/bin/rm -rf /var/cache/dnf/* 2>/dev/null || true
/usr/bin/rm -rf /var/cache/dnf5/* 2>/dev/null || true
/usr/bin/rm -rf /var/lib/dnf/* 2>/dev/null || true

/usr/bin/rm -rf /run/* 2>/dev/null || true

# Clean up Ruby gem cache
/usr/bin/rm -rf /root/.gem 2>/dev/null || true
/usr/bin/rm -rf /tmp/gem* 2>/dev/null || true

# The Anaconda installer in derived images complains about stray files in / that
# shouldn't be there. I have no idea if these files are coming from this image but try
# to delete them anyway.
cd /
#/usr/bin/rm -f nvim.root 2>/dev/null || true
#/usr/bin/rm -f dnf 2>/dev/null || true

#/usr/bin/rm -f nvim.root
#/usr/bin/rm -f dnf

#rm -rf selinux-policy 2>/dev/null || true

#for file in .wget-hsts* .wget-hpkp* .wh.* .*_lck_*; do
#  rm -rf "$file" 2>/dev/null || true
#done
