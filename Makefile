SCRIPTNAME = wt
README = README.pod
PREFIX = /usr/local
BINDIR = $(PREFIX)/bin
MANDIR = $(PREFIX)/share/man/man1
CONF_EXAMPLE = wt.conf.example
CONF_DIR = $(HOME)/.wt
CONF = wt.conf

.PHONY: man-doc all conf install uninstall clean

all: man-doc

man-doc: $(SCRIPTNAME)
	pod2man $(SCRIPTNAME) | gzip > $(SCRIPTNAME).1.gz

readme: $(SCRIPTNAME)
	podselect $(SCRIPTNAME) > $(README)

conf: $(CONF_EXAMPLE)
	mkdir -p $(CONF_DIR)
	if [ ! -e $(CONF_DIR)/$(CONF) ]; then \
		cp -f $(CONF_EXAMPLE) $(CONF_DIR)/$(CONF); \
	fi

install: man-doc
	install $(SCRIPTNAME) $(BINDIR)
	cp -f $(SCRIPTNAME).1.gz $(MANDIR)

uninstall:
	rm -f $(BINDIR)/$(SCRIPTNAME) $(MANDIR)/$(SCRIPTNAME).1.gz

clean:
	rm -f ./$(SCRIPTNAME).1.gz
