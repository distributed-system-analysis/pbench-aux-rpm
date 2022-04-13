prog = netperf
version = 2.7.0
arch = x86_64

all: rpm-upstream

rpm-upstream: all-but-build build

all-but-build: check clean tar copy-patches

tar:
	fetch-source tarball "https://github.com/HewlettPackard/netperf/archive/${prog}-${version}.tar.gz" "${prog}-${version}" "${prog}-${prog}-${version}"

copy-patches:
	cp patches/* ~/rpmbuild/SOURCES

clean::
	rm -rf ${prog}-${version}

# for COPR building
seqno = 1
sha1 =

include ../../misc-scripts/mk/rpm.mk
