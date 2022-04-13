prog = iozone
version = 3.430
# iozone has a peculiar naming conventions for the tarball.
iozoneversion = 3_430
arch = x86_64

all: rpm-upstream

rpm-upstream: all-but-build build

all-but-build: check clean tar

.PHONY: tar
tar:
	fetch-source tarball "http://www.iozone.org/src/current/iozone${iozoneversion}.tar" "iozone-${version}"

clean::
	rm -rf ${prog}-${version}*

# for COPR building
seqno = 1
sha1 =

include ../../misc-scripts/mk/rpm.mk
