prog = smallfile
version = 1.0.1

all: rpm-upstream

rpm-upstream: all-but-build build

all-but-build: check clean tar copy-patches

tar:
	fetch-source rename-tarball "https://github.com/distributed-system-analysis/smallfile/archive/v${version}.tar.gz" "${prog}-${version}.tar.gz"

copy-patches:
	cp patches/* ${HOME}/rpmbuild/SOURCES

clean::
	rm -rf ${prog}
	rm -f ${prog}-${version}*

# for COPR building
seqno = 1
sha1 =

include ../../misc-scripts/mk/rpm.mk
