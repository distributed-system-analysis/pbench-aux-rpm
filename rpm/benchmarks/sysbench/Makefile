prog = sysbench
version = 0.4.12
arch = x86_64

all: rpm-upstream

rpm-upstream: all-but-build build

all-but-build: check clean tar spec-copy

tar:
	fetch-source rename-tarball "http://ftp.de.debian.org/debian/pool/main/s/${prog}/${prog}_${version}.orig.tar.gz" "${prog}-${version}.tar.gz"

clean::
	rm -rf ${prog}-${version}*

# for COPR building
seqno = 1
sha1 =

include ../../misc-scripts/mk/rpm.mk
