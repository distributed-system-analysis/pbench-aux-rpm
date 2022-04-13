.PHONY: all
all:
	@echo "Default target does nothing, use 'make rpm' to build all SRPMs "

SUBDIRS = pbench-sysstat screen

.PHONY: rpm
rpm:
	for i in ${SUBDIRS} ; do ${MAKE} -C $$i rpm ; done

.PHONY: clean
clean:
	for i in ${SUBDIRS} ; do ${MAKE} -C $$i clean ; done

.PHONY: veryclean
veryclean:
	for i in ${SUBDIRS} ; do ${MAKE} -C $$i veryclean ; done
