.PHONY: all
all:
	@echo "Default target does nothing, use all-test to build all RPMs for testing"

SUBDIRS = benchmarks tools

.PHONY: all-test
all-test:
	for i in BUILD BUILDROOT SPECS SOURCES SRPMS RPMS; do rm -rf ${HOME}/rpmbuild/$$i/* ; done
	for i in ${SUBDIRS} ; do ${MAKE} -C $$i all-test ; done

.PHONY: clean
clean:
	for i in BUILD BUILDROOT SPECS SOURCES SRPMS RPMS; do rm -rf ${HOME}/rpmbuild/$$i/* ; done
	for i in ${SUBDIRS} ; do ${MAKE} -C $$i clean ; done
