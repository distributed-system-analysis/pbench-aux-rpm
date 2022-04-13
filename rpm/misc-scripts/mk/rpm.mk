# -*- mode: makefile -*-
.PHONY: check
check:
	if [ "${version}" == "" ] ;then echo "version undefined" > /dev/stderr; exit 1 ;fi
	if [ "${prog}" == "" ] ;then echo "prog undefined" > /dev/stderr ; exit 2 ;fi

.PHONY: rpm-dirs
rpm-dirs:
	for i in BUILD BUILDROOT SPECS SOURCES SRPMS RPMS; do mkdir -p ${HOME}/rpmbuild/$$i ; done

.PHONY: rpm-clean
rpm-clean: rpm-dirs
	for i in BUILD BUILDROOT SPECS SOURCES SRPMS RPMS; do rm -rf ${HOME}/rpmbuild/$$i/* ; done

dot-clean:
	rm -f .rpm-copy .spec-copy .build

.PHONY: spec-copy
spec-copy: .spec-copy
.spec-copy:
	set-version-release ${version} $(prog).spec ${USE_GIT_SHA1} > ${HOME}/rpmbuild/SPECS/${prog}.spec && touch .spec-copy

.PHONY: build
build: .build
.build: .spec-copy
	rm -f ${HOME}/rpmbuild/SRPMS/$(prog)-*.src.rpm
	rpmbuild -bs ${HOME}/rpmbuild/SPECS/$(prog).spec

# for sanity checking
build-local:
	rpmbuild -bb ${HOME}/rpmbuild/SPECS/$(prog).spec

###########################################################################
rpmdirs  = $(shell getconf.py -l rpmdirs ${CONFIGURATION_ENVIRONMENT} rpm)
arches  = $(shell getconf.py -l arches ${CONFIGURATION_ENVIRONMENT} rpm)

# these are used in the Makefiles that include this file
RPMSRC = ${HOME}/rpmbuild/SOURCES
RPMSRPM = ${HOME}/rpmbuild/SRPMS
RPMSPEC = ${HOME}/rpmbuild/SPECS

# old versions are *NOT* deleted, so periodic hand-pruning will be necessary.
.PHONY: push push-test
push\
push-test: all
	copy-to-repos ${debug} $@ ${CONFIGURATION_ENVIRONMENT} ${PACKAGE}-${VERSION}-*.rpm


.PHONY: list-rpms list-test-rpms
list-rpms\
list-test-rpms:
	list-repos $@ ${CONFIGURATION_ENVIRONMENT}

.PHONY: update-pbench-repo
update\
update-test:
	copy-to-repos ${debug} $@ ${CONFIGURATION_ENVIRONMENT}

###########################################################################

# building on COPR.
# version and sha1 have to be provided by the including Makefile.
# The including Makefile also has to provide the rpm-upstream target.

.SECONDEXPANSION:

$(RPMSRPM)/$(prog)-$(version)-$(seqno)$(sha1).src.rpm: rpm-upstream

ifdef COPR_USER
_copr_user = ${COPR_USER}
else
_copr_user = ${USER}
endif

# Multiple COPR repos (e.g. Fedora COPR repo and internal devel CORP repo)
# require different config files. These are assumed to live in ~/.config.
# COPR_CONFIG can be overridden from the Makefile with a simple assignment
# e.g. COPR_CONFIG = copr.devel. The default is "copr".
COPR_CONFIG ?= copr
COPR_CLI = copr-cli --config ${HOME}/.config/${COPR_CONFIG}

copr\
copr-test \
copr-perl-test\
copr-interim \
copr-index \
copr-inotify \
copr-dashboard:	rpm-upstream
	${COPR_CLI} build $(CHROOTS) $(_copr_user)/$(subst copr,pbench,$@) $(RPMSRPM)/$(prog)-$(version)-$(seqno)$(sha1).src.rpm

# The default clean target
clean:: dot-clean

veryclean:: clean rpm-clean
