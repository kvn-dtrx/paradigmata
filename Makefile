# ---
# title: Makefile for paradigmata
# ---

# ---

# Make targets follow paradigmata conventions (install / uninstall).

# ---

WIRE := $(CURDIR)/bin/make-wire.bash

.PHONY: help install uninstall

help: ## Displays available targets with description
	@bin/make-help.sh

install: ## Publishes Paradigmata skills into Cursor and Codex (wire)
	@bash "$(WIRE)" "$(CURDIR)"

uninstall: ## Removes this repo's Cursor and Codex skill symlinks
	@bin/make-uninstall.sh
