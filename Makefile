PREFIX ?= $(HOME)/.local
BINDIR ?= $(PREFIX)/bin

SCRIPTS := tmux-side-bar kill-orphaned-panes helix-opener

.PHONY: install uninstall

install:
	mkdir -p $(DESTDIR)$(BINDIR)
	for s in $(SCRIPTS); do \
		install -m 0755 src/$$s $(DESTDIR)$(BINDIR)/$$s; \
	done
	@echo "Installed $(SCRIPTS) to $(DESTDIR)$(BINDIR)"

uninstall:
	for s in $(SCRIPTS); do \
		rm -f $(DESTDIR)$(BINDIR)/$$s; \
	done
	@echo "Removed $(SCRIPTS) from $(DESTDIR)$(BINDIR)"
