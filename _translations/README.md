# Rebel Documentation Translations

This folder contains the Rebel Documentation translation files.

If you want to contribute to the Rebel Toolbox translations, please use our [Weblate](https://hosted.weblate.org/engage/rebel-toolbox/) project:
https://hosted.weblate.org/projects/rebel-toolbox/

The Rebel Documentation translations are divided into two sections:
- **Rebel Engine API documentation:** Found in the `api/` folder.
- **Rebel Documentation:** Found in the `docs/` folder.

The Rebel Toolbox Documentation is updated automatically using Make files.
The Make files are run automatically using GitHub workflows, which create Pull Requests.

## Rebel Engine API documentation translations

The Rebel Engine API and its translations are maintained in the [Rebel Engine](https://github.com/RebelToolbox/RebelEngine/) repository.
As with the Rebel Engine API documentation,
the Rebel Engine API translations are automatically generated from Rebel Engine's [XML docs](https://github.com/RebelToolbox/RebelEngine/tree/main/docs).
The `api/` folder contains a separate folder for each supported Rebel Engine API translation.

To add a new Rebel Engine API translation add a folder with the desired `LANGUAGE_CODE`.
The next time the Make files' `update-translations` recipe is run,
the new translation will be created.

The Make file depends on Rebel Editor, and
it expects to find `RebelEngine/bin/rebel.linux.tools.64` in the Rebel Documentation root folder.
The best way to achieve this is to clone the [Rebel Engine](https://github.com/RebelToolbox/RebelEngine/) repository into the root of Rebel Documentation.
The `.gitignore` file has been updated to ignore this `RebelEngine/` folder.
Ensure the branch has an updated copy of the desired translation, and build Rebel Editor.

The Make file will run Rebel Editor with the `--generate-docs -l <LANGUAGE_CODE>` options.
This converts the XML files to translated XML files.
The Make file will then use our `tools/scripts/rst_from_xml.py` script to convert the translated XML files to translated reST files.
The translated reST files are saved in the language's folder.

## Rebel Documentation translations

The Rebel Documentation translations are managed in three stages:
- Rebel Documentation template updates
- Rebel Documentation string updates
- Rebel Documentation locale updates

### Rebel Documentation translation template

The Rebel Documentation is written in English using RST files.
The Sphinx `gettext` build tool is used to extract the text strings into `pot` (Portable Object Template) files.
These `pot` files, except for the `api.pot` file, are merged into the `docs/docs.pot` file
using [`msgcat`](https://www.gnu.org/software/gettext/manual/html_node/msgcat-Invocation.html).
The `api.pot` file is excluded, because the Rebel Engine API is translated separately.
See the Rebel Engine API documentation translations section above.
The `docs/docs.pot` file contains all the Rebel Documentation text strings.

### Rebel Documentation strings and Portable Object files

Each language has its own translation file; its `.po` (Portable Object) file.
Updates to the `docs.pot` file strings are merged into each `.po` file
using [`msgmerge`](https://www.gnu.org/software/gettext/manual/html_node/msgmerge-Invocation.html).

The `docs.pot` file and all the `.po` files in the `docs/` folder are synched with the Weblate project.
The Rebel Documentation Weblate component is:
https://hosted.weblate.org/projects/rebel-toolbox/rebel-documentation/
All updates to the translations are done on Weblate by the Weblate community.
Commits on Weblate are then synched with the `.po` files here.

If your language is not yet available, you can add a new language to the Weblate component.
New languages are added on Weblate:
https://hosted.weblate.org/new-lang/rebel-toolbox/rebel-engine-api/

For more information on Weblate and contributing to translations visit [Weblate](https://hosted.weblate.org/engage/rebel-toolbox/).

## Rebel Documentation locales

Rebel Documentation translations that are more than 60% complete are published on https://docs.rebeltoolbox.com.
