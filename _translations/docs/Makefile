ROOT_DIR          = ../..
TEMPLATE          = docs.pot
GETTEXT_DIR       = $(ROOT_DIR)/_build/en/gettext
TRANSLATIONS_ROOT = $(ROOT_DIR)/locales

update: update-template update-strings update-translations

update-template:
	@echo "Updating translation template."
	@echo "Creating template files from rst files."
	@cd $(ROOT_DIR) && make gettext
	# We use a different method for translating the Rebel Engine API.
	@echo "Removing API template."
	rm $(GETTEXT_DIR)/api.pot
	@echo "Merging template files into $(TEMPLATE) file."
	msgcat --output-file=$(TEMPLATE) $(GETTEXT_DIR)/*.pot
	@echo "Creating SPDX header."
	@sed -i '1,4d' $(TEMPLATE)
	@sed -i '1i # SPDX-FileCopyrightText: 2023 Rebel Documentation contributors' $(TEMPLATE)
	@sed -i '2i #' $(TEMPLATE)
	@sed -i '3i # SPDX-License-Identifier: CC-BY-4.0' $(TEMPLATE)
	@sed -i '4i #' $(TEMPLATE)
	@sed -i '5i # LANGUAGE translation of the Rebel Documentation.' $(TEMPLATE)
	@sed -i 's|^\"Report-Msgid-Bugs-To: |\"Report-Msgid-Bugs-To: https://github.com/RebelToolbox/RebelDocumentation|' $(TEMPLATE)
	@sed -i '\|^#:|s|\.\./||g' $(TEMPLATE)

update-strings:
	@echo "Updating translation strings."
	@for po_file in *.po; do                                              \
		echo "Updating strings in $$po_file.";                            \
		msgmerge --update --backup=none --width=79 $$po_file $(TEMPLATE); \
		echo "Removing obsolete messages in $$po_file.";                  \
		msgattrib --no-obsolete --output-file=$$po_file $$po_file;        \
	done

update-translations:
	@echo "Updating translations."
	@if [ ! -d $(TRANSLATIONS_ROOT) ] ||                             \
		[ -z "$$(ls -A $(TRANSLATIONS_ROOT))" ]; then                \
		echo "No languages found.";                                  \
		if [ ! -d $(TRANSLATIONS_ROOT) ]; then                       \
			echo "$(TRANSLATIONS_ROOT) directory not found.";        \
		elif [ -z "$$(ls -A $(TRANSLATIONS_ROOT))" ]; then           \
			echo "$(TRANSLATIONS_ROOT) is empty.";                   \
		fi                                                           \
	else                                                             \
		for directory in $(TRANSLATIONS_ROOT)/*; do                  \
			if [ -d $$directory ]; then                              \
				make --no-print-directory update-translation         \
					LANGUAGE_CODE=$$(basename $$directory);          \
			fi;                                                      \
		done;                                                        \
	fi

update-translation:
	$(eval PO_FILE=$(LANGUAGE_CODE).po)
	$(eval DIRECTORY=$(TRANSLATIONS_ROOT)/$(LANGUAGE_CODE))
	$(eval LC_MESSAGES=$(DIRECTORY)/LC_MESSAGES)
	@if [ -z "$(LANGUAGE_CODE)" ]; then                       \
		echo "LANGUAGE_CODE variable not defined.";           \
		exit 1;                                               \
	elif [ -z "$(PO_FILE)" ] || [ ! -f $(PO_FILE) ]; then     \
		echo "$(PO_FILE) file not found.";                    \
		exit 1;                                               \
	elif [ -z "$(DIRECTORY)" ] || [ ! -d $(DIRECTORY) ]; then \
		echo "$(DIRECTORY) directory not found.";             \
		exit 1;                                               \
	fi
	@echo "Updating translation for: $(LANGUAGE_CODE)";
	@rm -r $(DIRECTORY)
	@mkdir -p $(LC_MESSAGES)
	@for pot_file in $(GETTEXT_DIR)/*.pot; do                \
		section=$$(basename $$pot_file .pot);                \
		output_file=$(LC_MESSAGES)/$$section.po;             \
		echo "Creating po file for section: $$section.";     \
		msgmerge                                             \
			--lang="$(LANGUAGE_CODE)"                        \
			--no-location                                    \
			--output=$$output_file                           \
			$(PO_FILE) $$pot_file;                           \
		echo "Removing obsolete messages in $$output_file."; \
		msgattrib                                            \
			--no-obsolete                                    \
			--output-file=$$output_file                      \
			$$output_file;                                   \
	done
