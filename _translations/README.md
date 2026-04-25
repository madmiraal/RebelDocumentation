# Rebel Documentation Translations

This folder contains the Rebel Documentation translation files that are synched with Weblate.

If you want to contribute to the Rebel Toolbox translations, please use our [Weblate](https://hosted.weblate.org/engage/rebel-toolbox/) project:
https://hosted.weblate.org/projects/rebel-toolbox/

## Rebel Documentation Source Text Strings

The Rebel Documentation is written in English using RST files.
The Sphinx `gettext` build tool is used to extract the text strings into `pot` (Portable Object Template) files.

These `pot` files, except for the `api.pot` file, are merged into the `docs.pot` file
using [`msgcat`](https://www.gnu.org/software/gettext/manual/html_node/msgcat-Invocation.html).
The `api.pot` file is excluded, because the Rebel Engine API is translated separately.
See [Rebel Engine API Translations](https://github.com/RebelToolbox/RebelEngine/blob/main/translations/README.md) for more information.

The `docs.pot` file contains all the Rebel Documentation text strings.

## Rebel Documentation Portable Object files

Each language has its own translation file; its `.po` (Portable Object) file.
Updates to the `docs.pot` file are merged into each `.po` file
using [`msgmerge`](https://www.gnu.org/software/gettext/manual/html_node/msgmerge-Invocation.html).

The `docs.pot` file and all the `.po` files in this folder are synched with the Weblate project.
The Rebel Documentation Weblate component is:
https://hosted.weblate.org/projects/rebel-toolbox/rebel-documentation/
All updates to the translations are done on Weblate by the Weblate community.
Commits on Weblate are then synched with the `.po` files here.

If your language is not yet available, you can add a new language to the Weblate component.
New languages are added on Weblate:
https://hosted.weblate.org/new-lang/rebel-toolbox/rebel-engine-api/

For more information on Weblate and contributing to translations visit [Weblate](https://hosted.weblate.org/engage/rebel-toolbox/).

## Rebel Documentation Locales

Rebel Documentation translations that are more than 60% complete are published on https://docs.rebeltoolbox.com.
