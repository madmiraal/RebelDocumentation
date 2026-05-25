SPHINXOPTS        ?=
ROOT_DIR          = ..
TRANSLATIONS_DIR  = locales
TRANSLATIONS_ROOT = $(ROOT_DIR)/$(TRANSLATIONS_DIR)

.PHONY: update update-docs update-api test

update: update-docs update-api

update-docs:
	@echo "Updating Rebel Documentation translations."
	@cd docs && make --no-print-directory update

update-api:
	@echo "Updating Rebel Engine API translations."
	@cd api && make --no-print-directory update

test:
	@echo "Testing translations."
	@if [ ! -d $(TRANSLATIONS_ROOT) ] ||                       \
		[ -z "$$(ls -A $(TRANSLATIONS_ROOT))" ]; then          \
		echo "No languages found.";                            \
		if [ ! -d $(TRANSLATIONS_ROOT) ]; then                 \
			echo "$(TRANSLATIONS_ROOT) directory not found.";  \
		elif [ -z "$$(ls -A $(TRANSLATIONS_ROOT))" ]; then     \
			echo "$(TRANSLATIONS_ROOT) is empty.";             \
		fi                                                     \
	else                                                       \
		cd $(ROOT_DIR);                                        \
		for directory in $(TRANSLATIONS_DIR)/*; do             \
			if [ ! -d $$directory ]; then                      \
				continue;                                      \
			fi;                                                \
			language_code=$$(basename $$directory);            \
			echo "Testing language code \"$$language_code\"".; \
			make dummy                                         \
				LANGUAGE_CODE=$$language_code                  \
				 --no-print-directory;                         \
		done;                                                  \
	fi
