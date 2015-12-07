SCRIPTNAME = wt
README = README.pod
PREFIX = /usr/local
BINDIR = $(PREFIX)/bin
MANDIR = $(PREFIX)/share/man/man1

.PHONY: man-doc all install uninstall clean

all: man-doc

man-doc: $(README)
	pod2man $(README) | gzip > $(SCRIPTNAME).1.gz

install: man-doc
	install $(SCRIPTNAME) $(BINDIR)
	cp -f $(SCRIPTNAME).1.gz $(MANDIR)

uninstall:
	rm -f $(BINDIR)/$(SCRIPTNAME) $(MANDIR)/$(SCRIPTNAME).1.gz

clean:
	rm -f ./$(SCRIPTNAME).1.gz
