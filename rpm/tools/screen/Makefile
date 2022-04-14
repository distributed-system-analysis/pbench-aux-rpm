# make an SRPM for screen.
# screen.spec has been modified to get rid of libutempter-devel and texinfo deps.

SCREEN = screen-4.6.2
TARBALL = ${SCREEN}.tar.gz
SRPM = ${SCREEN}-5.copr.src.rpm
RPMBUILDDIR = ${HOME}/rpmbuild
SPECDIR = ${RPMBUILDDIR}/SPECS
SRPMDIR = ${RPMBUILDDIR}/SRPMS
SRCDIR = ${RPMBUILDDIR}/SOURCES
# we build it only for rhel8 and rhel9
CHROOTS = \
	-r centos-stream-8-x86_64 \
	-r centos-stream-8-aarch64 \
	-r centos-stream-9-x86_64 \
	-r centos-stream-9-aarch64 \
	-r epel-8-x86_64 \
	-r epel-8-aarch64 \
	-r epel-9-x86_64 \
	-r epel-9-aarch64

srpm:
	cp ${TARBALL} patches/*.patch screen.pam ${SRCDIR}
	cp screen.spec ${SPECDIR}
	rpmbuild -bs -D 'dist .copr' ${SPECDIR}/screen.spec

ifdef COPR_USER
_copr_user = ${COPR_USER}
else
_copr_user = ${USER}
endif

copr\
copr-test:   srpm
	copr-cli build ${CHROOTS} $(_copr_user)/$(subst copr,pbench,$@) ${SRPMDIR}/${SRPM}
