prog = fio
version = 3.26
arch = x86_64

CHROOTS = \
	-r centos-stream-8-x86_64 \
	-r centos-stream-8-aarch64 \
	-r epel-8-x86_64 \
	-r epel-8-aarch64 \
	-r epel-7-x86_64


all: rpm-upstream

rpm-upstream: all-but-build build

all-but-build: check clean tar copy-patches

tar:
	fetch-source rename-tarball "http://brick.kernel.dk/snaps/${prog}-${version}.tar.gz" "${prog}-${version}.tar.gz"

copy-patches:
	-cp patches/* ${HOME}/rpmbuild/SOURCES

clean::
	rm -rf ${prog}-${version}*

# for COPR building
seqno = 0.pbench
sha1 =

include ../../misc-scripts/mk/rpm.mk
