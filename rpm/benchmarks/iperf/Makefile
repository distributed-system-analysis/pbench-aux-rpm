prog = iperf
version = 2.0.5

all: rpm-upstream

rpm-upstream: all-but-build build

all-but-build: check clean tar

tar:
	fetch-source rename-tarball "http://downloads.sourceforge.net/project/${prog}/${prog}-${version}.tar.gz" "${prog}-${version}.tar.gz"

clean::
	rm -rf ${prog}-${version}*

# for COPR building
seqno = 1
sha1 =

include ${PBENCH_TOP}/rpm/misc-scripts/mk/rpm.mk
