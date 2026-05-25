# Makefile for Sphinx documentation

# You can set these variables from the command line.
# The first two can also be set from the environment.
SPHINXOPTS    ?=
SPHINXBUILD   ?= sphinx-build
SOURCEDIR     = .
BUILDDIR      = _build

export LANGUAGE_CODE  ?= en
ERROR                 ?=
API_TRANSLATIONS      = _translations/api

# User-friendly check for sphinx-build.
ifneq ($(shell which $(SPHINXBUILD) >/dev/null 2>&1; echo $$?), 0)
$(info The $(SPHINXBUILD) command was not found.)
$(info Make sure Sphinx is installed see:)
$(info https://www.sphinx-doc.org/en/master/usage/installation.html)
$(error )
endif

# Placed first, so that "make" without an argument is like "make help".
help:
	@$(SPHINXBUILD) -M help "$(SOURCEDIR)" "$(BUILDDIR)" $(SPHINXOPTS) $(O)

.PHONY: help Makefile revert-api-translation update-translations

update-translations:
	@echo "Updating translations."
	@cd _translations && make --no-print-directory update

# Catch-all target:
# Route all unknown targets to Sphinx using "make mode" option.
# $(O) is shorthand for $(SPHINXOPTS).
%: Makefile
	@$(SPHINXBUILD) -M $@ "$(SOURCEDIR)" "$(BUILDDIR)/$(LANGUAGE_CODE)" $(SPHINXOPTS) $(O) \
	|| make --no-print-directory revert-api-translation ERROR=$$(echo $$?)
	@make --no-print-directory revert-api-translation

# Revert changes made by conf.py when language != "en".
revert-api-translation:
	@if [ "$(LANGUAGE_CODE)" = "en" ]; then                                  \
		echo "LANGUAGE_CODE=en or not specified.";                           \
		echo "No need to or cannot revert API translation.";                 \
	elif [ ! -d $(API_TRANSLATIONS)/en ]; then                               \
		echo "A backup of the original API folder was not found.";           \
		echo "Cannot revert API translation to default!";                    \
	elif [ ! -d api ]; then                                                  \
		echo "A backup of the original API folder was found; however";       \
		echo "'api' folder with a translation was not found.";               \
		echo "Cannot revert API translation to default!";                    \
		exit 1;                                                              \
	elif [ -d $(API_TRANSLATIONS)/$(LANGUAGE_CODE) ]; then                   \
		echo "$(LANGUAGE_CODE) translated folder found.";                    \
		echo "'api' folder may not contain $(LANGUAGE_CODE) translation.";   \
		echo "Won't revert API translation to default!";                     \
		exit 1;                                                              \
	else                                                                     \
		echo "Reverting API translation to default.";                        \
		mv api $(API_TRANSLATIONS)/$(LANGUAGE_CODE);                         \
		mv $(API_TRANSLATIONS)/en api;                                       \
	fi
	@if [ ! -z "$(ERROR)" ]; then                                  \
		echo "Revert API translation called with ERROR=$(ERROR)."; \
		echo "Returning Error $(ERROR) back to caller.";           \
		exit $(ERROR);                                             \
	fi
