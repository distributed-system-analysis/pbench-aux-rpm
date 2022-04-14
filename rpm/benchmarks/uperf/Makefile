prog = uperf
version = 1.0.7
arch = x86_64
arch = aarch64

CHROOTS = \
	-r centos-stream-9-x86_64 \
	-r centos-stream-9-aarch64 \
	-r epel-9-x86_64 \
	-r epel-9-aarch64

ifdef COPR_USER
_copr_user = ${COPR_USER}
else
_copr_user = ${USER}
endif

all: rpm-upstream

rpm-upstream: all-but-build build

all-but-build: check clean tar copy-patches spec-copy

copy-patches:
	cp patches/* ~/rpmbuild/SOURCES

tar:
	fetch-source rename-tarball "https://github.com/uperf/uperf/archive/${version}.tar.gz" "${version}.tar.gz"

clean::
	rm -rf ${prog}-${version}*

# for COPR builds.
seqno = 1
sha1 =

include ../../misc-scripts/mk/rpm.mk
