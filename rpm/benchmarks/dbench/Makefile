prog = dbench
version = 4.00
arch = x86_64

all: rpm-upstream

rpm-upstream: all-but-build build

all-but-build: check clean tar copy-patches spec-copy

tar:
	fetch-source git "git://git.samba.org/sahlberg/dbench.git" "${version}"

copy-patches:
	cp patches/* ~/rpmbuild/SOURCES

clean::
	rm -rf ${prog}
	rm -f ${prog}-${version}

# for COPR building
seqno = 1
sha1 =

include ../../misc-scripts/mk/rpm.mk
