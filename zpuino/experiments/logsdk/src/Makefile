SUBDIRS = core ym2149
all:
	@for D in $(SUBDIRS); do ( cd $$D && make ; ) ; done
install:
	@for D in $(SUBDIRS); do ( cd $$D && make install ; ) ; done
