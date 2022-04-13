prog = pbench-linpack
version = 11.1.3
release = 1pbench
arch = x86_64
# this turns the RPATH complaints from errors to warnings.
# QA_RPATHS = 0x0002
# To build a binary RPM, the command is:
#    QA_RPATHS=0x0002 rpmbuild -bb linpack.spec
# Lots of warnings, but it builds

CHROOTS = --chroot epel-7-x86_64\
	  --chroot epel-8-x86_64\
	  --chroot epel-9-x86_64\
	  --chroot rhel-7-x86_64\
	  --chroot rhel-8-x86_64\
	  --chroot rhel-9.dev-x86_64\
	  --chroot fedora-34-x86_64 \
	  --chroot fedora-35-x86_64

# ONLY BUILD THIS IN THE INTERNAL COPR REPO
COPR_CONFIG = copr.devel

all: rpm-upstream

rpm-upstream: all-but-build build

all-but-build: check clean tar ${prog}.spec

tar:
	fetch-source tarball "http://localhost/pbench/linpack/linpack_${version}.tgz" "${prog}-${version}" "linpack_${version}"

%.spec: %.spec.j2
	jinja2 -D version=${version} -D release=${release} $< > $@

clean::
	rm -rf ${prog}-${version}*

# for COPR building
seqno = 1
sha1 =

include ../../misc-scripts/mk/rpm.mk
