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
		echo "Please specify the LANGUAGE_CODE option used in the build.";   \
	elif [ -d $(API_TRANSLATIONS)/en ]; then                                 \
		if [ -d api ] && [ ! -d $(API_TRANSLATIONS)/$(LANGUAGE_CODE) ]; then \
			echo "Reverting API translation to default.";                    \
			mv api $(API_TRANSLATIONS)/$(LANGUAGE_CODE);                     \
			mv $(API_TRANSLATIONS)/en api;                                   \
		else                                                                 \
			echo "The original API folder is backed up; however,";           \
			if [ ! -d api ]; then                                            \
				echo "'api' folder with translation not found.";             \
			fi;                                                              \
			if [ -d $(API_TRANSLATIONS)/$(LANGUAGE_CODE) ]; then             \
				echo "$(LANGUAGE_CODE) translated folder found.";            \
			fi;                                                              \
			echo "Please fix manually.";                                     \
		fi;                                                                  \
	fi
	@if [ ! -z "$(ERROR)" ]; then                                  \
		echo "Revert API translation called with ERROR=$(ERROR)."; \
		echo "Returning Error $(ERROR) back to caller.";           \
		exit $(ERROR);                                             \
	fi
