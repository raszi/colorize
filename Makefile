BIN          ?= colorize
PREFIX       ?= /usr
BINPREFIX    ?= $(DESTDIR)$(PREFIX)/bin
MANPREFIX    ?= $(DESTDIR)$(PREFIX)/share/man
CONFIGPREFIX ?= $(DESTDIR)/etc

all:

install:
	-mkdir -p $(BINPREFIX)
	-mkdir -p $(CONFIGPREFIX)
	-mkdir -p $(MANPREFIX)/man1
	install -m 0755 -p $(BIN) $(BINPREFIX)/$(BIN)
	install -m 0644 -p $(BIN).1* $(MANPREFIX)/man1/
	install -m 0644 -p $(BIN)rc $(CONFIGPREFIX)

uninstall:
	rm -f $(BINPREFIX)/$(BIN)
	rm -f $(MANPREFIX)/man1/$(BIN).1*
	rm -f $(CONFIGPREFIX)/$(BIN)rc
