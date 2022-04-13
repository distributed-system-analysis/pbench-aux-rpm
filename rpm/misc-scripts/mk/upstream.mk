# clone the upstream
# remember the upstream SHA1 for later use

# agent, server, web-server or dashboard
component = $(subst pbench-,,$(prog))

# in /var/tmp so it can be shared with other Makefiles
clonefile = /var/tmp/clone.$(GH_OWNER).$(GH_BRANCH)

${RPMSPEC}/${prog}.spec: $(clonefile) ${prog}.spec
	set-version-release $$(cat ${upstmtree}/${prog}.VERSION) $(prog).spec $$(cat ${upstmtree}/${prog}.SHA1) > $@
	cp ${upstmtree}/$(prog)-$$(cat ${upstmtree}/${prog}.VERSION).tar.gz ${RPMSRC}/
	touch .spec-copy

$(clonefile): ${upstmtree}/${prog}.SHA1 ${upstmtree}/${prog}.VERSION
	touch $(clonefile)

# Generates ${upstmtree}/${prog}.SHA1, ${upstmtree}/${prog}.VERSION, and
# the source tar ball.
${upstmtree}/${prog}.SHA1 ${upstmtree}/${prog}.VERSION: ${upstmtree}
	upstream-tarball ${PBENCH_TOP} $(component) $(seqno) ${GH_OWNER} ${GH_BRANCH}

${upstmtree}:
	fetch-github ${PBENCH_TOP} $(component) ${GH_OWNER} ${GH_BRANCH}

# cleanup targets
.PHONY: localclean clean-spec clean-upstream
localclean: clean-spec clean-upstream

clean-spec:
	rm -f $(RPMSPEC)/$(prog).spec

clean-upstream:
	rm -rf ${upstmtree}

