ROOT_DIR          = ../..
REBEL_ENGINE_ROOT = $(ROOT_DIR)/RebelEngine
REBEL_EXECUTABLE  = bin/rebel.linux.tools.64

update: update-translations

update-translations:
	@if [ ! -f $(REBEL_ENGINE_ROOT)/$(REBEL_EXECUTABLE) ]; then     \
		echo "$(REBEL_ENGINE_ROOT)/$(REBEL_EXECUTABLE) not found."; \
		exit 1;                                                     \
	fi
	@if [ "$$(find . -maxdepth 1 -type d | wc -l)" -eq 1 ]; then \
		echo "No current translations found.";                   \
		echo "_translations/api/ directory is empty.";           \
	else                                                         \
		echo "Updating Rebel Engine API translations.";          \
		for directory in *; do                                   \
			if [ ! -d $$directory ]; then                        \
				continue;                                        \
			fi;                                                  \
			make --no-print-directory update-translation         \
				LANGUAGE_CODE=$$(basename $$directory);          \
		done;                                                    \
	fi

update-translation:
	@if [ ! -f $(REBEL_ENGINE_ROOT)/$(REBEL_EXECUTABLE) ]; then     \
		echo "$(REBEL_ENGINE_ROOT)/$(REBEL_EXECUTABLE) not found."; \
		exit 1;                                                     \
	elif [ -z "$(LANGUAGE_CODE)" ]; then                            \
		echo "LANGUAGE_CODE variable not defined.";                 \
		exit 1;                                                     \
	fi
	@echo "Creating Rebel Engine API XML translation for $(LANGUAGE_CODE)."
	@cd $(REBEL_ENGINE_ROOT) && $(REBEL_EXECUTABLE) \
		--generate-docs                             \
		-l $(LANGUAGE_CODE)
	@if [ -d $(LANGUAGE_CODE) ]; then \
		rm -r $(LANGUAGE_CODE);       \
	fi
	@echo "Creating Rebel Engine API RST translation for $(LANGUAGE_CODE)."
	@$(REBEL_ENGINE_ROOT)/tools/scripts/rst_from_xml.py \
		--output $(LANGUAGE_CODE)                       \
		$(REBEL_ENGINE_ROOT)/docs                       \
		$(REBEL_ENGINE_ROOT)/modules
	@cp $(ROOT_DIR)/api/index.rst $(LANGUAGE_CODE)/
	@echo "Reverting Rebel Engine API translation."
	cd $(REBEL_ENGINE_ROOT) && git reset HEAD --hard
