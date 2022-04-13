.PHONY: all
all:
	@echo "Default target does nothing, use 'make rpm' to build all SRPMs"

SUBDIRS = dbench fio iozone iperf linpack netperf smallfile stress sysbench uperf

.PHONY: rpm
rpm\
clean\
veryclean\
copr\
copr-test:
	for i in ${SUBDIRS} ; do ${MAKE} -C $$i $@ ; done
