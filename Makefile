# ---
# title: Makefile for paradigmata
# ---

# ---

# Make targets follow paradigmata conventions (install-user / uninstall).

# ---

WIRE := $(CURDIR)/bin/make-wire.py

.PHONY: help install install-user uninstall

help: ## Displays available targets with description
	@bin/make-help.sh

install: install-user ## Alias for install-user

install-user: ## Publishes Paradigmata skills into Cursor and Codex (wire)
	@python3 "$(WIRE)" "$(CURDIR)"

uninstall: ## Removes this repo's Cursor and Codex skill symlinks
	@bin/make-uninstall.sh
