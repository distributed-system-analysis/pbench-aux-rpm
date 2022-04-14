prog = pbench-sysstat
version = 12.0.3
arch = x86_64

# CHROOTS = -r centos-stream-9-x86_64 -r centos-stream-9-aarch64 -r epel-8-x86_64 -r epel-8-aarch64  -r epel-9-x86_64 -r epel-9-aarch64

ifdef COPR_USER
_copr_user = ${COPR_USER}
else
_copr_user = ${USER}
endif

srpm: rpm-upstream

rpm-upstream: all-but-build build

all-but-build: check clean spec-copy tar copy-patches

copy-patches:
	cp patches/* ~/rpmbuild/SOURCES

tar:
	fetch-source tarball "http://pagesperso-orange.fr/sebastien.godard/sysstat-${version}.tar.xz" "${prog}-${version}" "sysstat-${version}"

clean::
	rm -rf ${prog}-${version}*

# for COPR building
seqno = 1
sha1 =

include ${PBENCH_TOP}/rpm/misc-scripts/mk/rpm.mk
