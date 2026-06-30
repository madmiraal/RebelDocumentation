# Rebel Toolbox Translations

This folder contains the Rebel Toolbox documentation translation files.

If you want to contribute to any of the Rebel Toolbox translations,
please use our [Weblate](https://hosted.weblate.org/engage/rebel-toolbox/) project.

The Rebel Toolbox translation files are updated automatically and synced with Weblate.
The Rebel Toolbox translation file updates are made using Make files.
The translation file updates and Weblate syncs are run on a schedule using GitHub workflows.
The GitHub workflows create Pull Requests that trigger build tests.
Assuming the build tests pass, the changes are merged.

The Rebel Toolbox translation updates are divided into two parts:
- **Rebel Engine API translations:** Found in the `api/` folder.
- **Rebel Documentation translations:** Found in the `docs/` folder.

## Rebel Engine API translations

The Rebel Engine API translations are stored in the `api/` folder.
The `api/` folder contains a separate folder for each supported Rebel Engine API translation.
The folder name is the [language code used by Weblate](https://docs.weblate.org/en/latest/admin/languages.html#language-code).

The Rebel Engine API documentation and its translations are maintained in the [Rebel Engine](https://github.com/RebelToolbox/RebelEngine/) repository.
The documentation files are stored there in the `docs/` folder in XML files.
The translation files are stored there in the `translations/` folder.
The XML files are converted to [reStructuredText](https://docutils.sourceforge.io/rst.html) (reST) and stored in the `api/` folder here.
The XML files are converted to reST files using our [`rst_from_xml.py`](https://github.com/RebelToolbox/RebelEngine/blob/main/tools/scripts/rst_from_xml.py) script.

When a Rebel Engine API translation reaches a level of completion (currently 66%),
it is added to the supported Rebel Engine API translations.
To add a supported Rebel Engine API translation, we add a folder with the name of the language code.
The next time the [Make file](https://github.com/RebelToolbox/RebelDocumentation/blob/main/_translations/api/Makefile)'s `update-translations` recipe is run, the new translation will be created.

The Make file depends on a build of Rebel Editor, which contains the current Rebel Engine API translations.
The Make file expects to find the executable `RebelEngine/bin/rebel.linux.tools.64` in the Rebel Documentation root folder.
The best way to achieve this is to clone the [Rebel Engine](https://github.com/RebelToolbox/RebelEngine/) repository into the root of Rebel Documentation.
The `.gitignore` file has been updated to ignore this `RebelEngine/` folder.
Alternatively, the Make file `update-translations` recipe can be run with the `REBEL_ENGINE_ROOT` and `REBEL_EXECUTABLE` options set.
The `REBEL_ENGINE_ROOT` option specifies the location of the Rebel Engine root folder.
The `REBEL_EXECUTABLE` option specifies the Rebel Engine binary file with the location relative to the `REBEL_ENGINE_ROOT` folder.

As with the Rebel Engine API documentation,
the Rebel Engine API translations are automatically generated from Rebel Engine's [XML docs](https://github.com/RebelToolbox/RebelEngine/tree/main/docs).
For each language code folder found in the `api/` folder,
the Make file will run Rebel Editor with the `--generate-docs -l <LANGUAGE_CODE>` options.
This converts the XML files to translated XML files.
The Make file will then use our [`rst_from_xml.py`](https://github.com/RebelToolbox/RebelEngine/blob/main/tools/scripts/rst_from_xml.py) script to convert the translated XML files to translated reST files.
The translated reST files are saved in the `api/<LANGUAGE_CODE>` folder.
Finally, the changes made to the Rebel Engine XML files are reset back to the original English.

## Rebel Documentation translations

The Rebel Documentation translation updates are managed in three stages:
- Rebel Documentation template updates
- Rebel Documentation string updates
- Rebel Documentation locale updates

### Rebel Documentation translation templates

The Rebel Documentation is written in English using [reStructuredText](https://docutils.sourceforge.io/rst.html) (reST) files.
The [Sphinx](https://www.sphinx-doc.org/en/master/usage/advanced/intl.html#sphinx-internationalization-details) [`gettext`](https://www.gnu.org/software/gettext/manual/gettext.html) build tool is used to extract the text strings into `.pot` (Portable Object Template) files.
Each section (folder in the Rebel Documentation root directory) has its own `.pot` file.
These `.pot` files, except for the `api.pot` file, are merged into the `docs/docs.pot` file
using [`msgcat`](https://www.gnu.org/software/gettext/manual/html_node/msgcat-Invocation.html).
The `api.pot` file is excluded, because the Rebel Engine API is translated separately.
See the [Rebel Engine API translations](#rebel-engine-api-translations) section above.
The `docs/docs.pot` file contains all the Rebel Documentation text strings.

### Rebel Documentation strings and Portable Object files

Each language has its own translation file; its `.po` ([Portable Object](https://www.gnu.org/software/gettext/manual/html_node/PO-Files.html)) file.
The `.po` filename is the [language code used by Weblate](https://docs.weblate.org/en/latest/admin/languages.html#language-code).
These language translation `.po` files are stored in the `docs` folder.

The Rebel Documentation translations depend on the `docs\docs.pot` translation template file created [above](#rebel-documentation-translation-templates).
Updates to the `docs.pot` file's text strings are merged into each language's translation `.po` file
using [`msgmerge`](https://www.gnu.org/software/gettext/manual/html_node/msgmerge-Invocation.html).

The `docs.pot` file and all the `.po` files in the `docs/` folder are synced with our [Weblate project](https://hosted.weblate.org/projects/rebel-toolbox/rebel-documentation/).
All updates to the translations are done on Weblate by the Weblate community.
Commits on Weblate are then synced with the `.po` files here.

If your language is not yet available, you can add a new language to the [Weblate component](https://hosted.weblate.org/new-lang/rebel-toolbox/rebel-documentation/).
For more information on Weblate and contributing to translations visit our [Weblate project](https://hosted.weblate.org/engage/rebel-toolbox/).

### Rebel Documentation locales

The Rebel Documentation root folder contains the `locales/` folder.
The `locales/` folder contains a separate folder for each supported Rebel Documentation translation.
The folder name is the [language code used by Weblate](https://docs.weblate.org/en/latest/admin/languages.html#language-code).
Inside each `locales/<LANGUAGE_CODE>/` folder is a `LC_MESSAGES` folder.
Inside each `locales/<LANGUAGE_CODE>/LC_MESSAGES` folder are the language's `.po` ([Portable Object](https://www.gnu.org/software/gettext/manual/html_node/PO-Files.html)) files.
Each section (except the Rebel Engine API) has its own `.po` file.

When a Rebel Documentation translation reaches a level of completion (currently 66%),
it is added to the supported Rebel Documentation translations.
To add a supported Rebel Documentation translation, we add a folder with the name of the language code to the `locales/` folder.
The next time the [Make file](https://github.com/RebelToolbox/RebelDocumentation/blob/main/_translations/docs/Makefile)'s `update-translations` recipe is run, the new translation will be created.

The Make file depends on the Rebel Documentation section [templates](#rebel-documentation-translation-templates) and the language's [`.po` (Portable Object file)](#rebel-documentation-strings-and-portable-object-files) created above.
The language's `.po` file is merged with each section's `.pot` template file using [`msgmerge`](https://www.gnu.org/software/gettext/manual/html_node/msgmerge-Invocation.html).
Each section's `.po` file is saved in the language's `locales/<LANGUAGE_CODE>/LC_MESSAGES` folder.

## Building translated Rebel Toolbox Documentation

To build Rebel Toolbox Documentation for another language requires supported translations for both:
- [Rebel Engine API](#rebel-engine-api-translations) and
- [Rebel Documentation](#rebel-documentation-translations)

See the above sections for how we create supported versions for each part.

To build the html documentation for a supported language,
run `make html LANGUAGE_CODE=<LANGUAGE_CODE>`.
The make file will copy the supported Rebel Engine API translated language's reST files found in the `api/<LANGUAGE_CODE>` folder to the Rebel Documentation root directory `api/` folder.
The make file will use the supported Rebel Documentation translation `.po` files found in the `locales/<LANGUAGE_CODE>` folder in the Rebel Documentation root directory to translate the remaining reST files.
Once complete the make file will restore the original Rebel Documentation root `api/` directory.

## Publishing Rebel Toolbox Documentation translations

Rebel Toolbox Documentation is published at https://docs.rebeltoolbox.com and
hosted by [Read the Docs](https://readthedocs.org/).
When both a language's Rebel Engine API and Rebel Documentation translations reach a level of completion (currently 66%),
it is added to the supported Rebel Toolbox Documentation translations.
An entry is added to the `supported_languages` dictionary in the Rebel Documentation Sphinx' `conf.py` file's "Options for internationalization" section.
A project for the language is added to Read the Docs and added as a subproject to the default English version.
Read the Docs will build the html files for each language subproject and make the translated
documentation available to all.
