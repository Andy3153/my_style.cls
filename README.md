<!-- vim: set fenc=utf-8 ts=2 sw=0 sts=0 sr et si tw=0 fdm=marker fmr={{{,}}}:  -->
# my_style.cls
This is my personal LaTeX document class. It's made to fit my document writing workflow.

<!-- {{{ Features -->
## Features
- Based on the `memoir` document class.
- Sane defaults.
- Custom macros to make life easier.
- Custom title styles
- Thoroughly configurable through document class options.
  - The `docstyle` option unifies custom `article`- and `book`-like styles under the same codebase, switchable in an instant, while the individual `docstyle*` options allow fine-tuning each aspect independently to create a hybrid that fits the document at hand.
- Reproducible builds.
<!-- }}} -->

<!-- {{{ Requirements -->
## Requirements
- A recent TeX Live/MiKTeX/etc. instalation that includes LaTeX 3 features and packages, like `expl3`.
- LuaLaTeX (never tested any other TeX engine).
<!-- }}} -->

<!-- {{{ Document class options -->
## Document class options
I have this many specific options because I always wanted a way to quickly control everything that the options implement.

<!-- {{{ table -->
| option                       | default   | description |
| :-:                          | :-:       | :-:         |
| `fontsize`                   | `12`      | font size |
| `papersize`                  | `a4`      | paper size |
| `language`                   | `english` | document language(s) (last language in the list is the main language) |
| `imagesupport`               | `false`   | load packages, custom macros and customizations for images |
| `mathsupport`                | `false`   | load packages, custom macros and customizations for math |
| `tablesupport`               | `false`   | load packages, custom macros and customizations for tables |
| `urlsupport`                 | `false`   | load packages, custom macros and customizations for URLs |
| `docstyle`                   | `article` | general document style `[ article \| book ]` |
| `docstyleChapterClearpage`   | `false`   | whether to put chapter on a new page |
| `docstyleChapterStyle`       | `article` | chapter heading style [see [memman.pdf](https://mirrors.nxthost.com/ctan/macros/latex/contrib/memoir/memman.pdf) sec. B.1] |
| `docstylePageLayout`         | `oneside` | page layout `[ oneside \| twoside ]` |
| `docstyleSectioningOpen`     | `any`     | on which side should document divisions open `[ any \| left \| right ]` |
| `docstyleTitleStyle`         | `default` | style of \maketitle `[ default \| eseuribacromana \| scientificpaper \| uniproject ]` |
| `docstyleToCClearpageBefore` | `false`   | whether to put ToC on a new page |
| `docstyleToCClearpageAfter`  | `false`   | whether to put content after the ToC on a new page |
<!-- }}} -->
<!-- }}} -->

<!-- {{{ Custom macros -->
## Custom macros
As previously mentioned, the document class provides some quality-of-life custom macros:

<!-- {{{ Insert an image -->
### Insert an image
```tex
\insertimg{file}[includegraphics options]<caption>
```

Inserts a centered image into the document inside a `figure` environment, placed near the point where the command is invoked in the text.

#### Requirements
- documentclass option `imagesupport = true`, or `graphicx` package loaded manually.

#### Usage
- `file` (mandatory) -- path to an image file, gets passed to `\includegraphics`.
- `includegraphics options` (optional) -- options to change the geometry of the image (ex.: `width=.8\textwidth`, `height=6cm`, `angle=90`), gets passed to `\includegraphics`'s optional argument.
- `caption` (optional) -- caption of the image, gets passed to `\caption`.

#### Example
```tex
\insertimg{image}[width=.8\textwidth]<An image>
```
<!-- }}} -->

<!-- {{{ Insert a table -->
### Insert a table
```tex
\inserttbl{columnspec}<caption>{table body}
```

Inserts a centered table into the document, placed near the point where the command is invoked in the text.

#### Requirements
- documentclass option `tablesupport = true`.

#### Usage
- `columnspec` (mandatory) -- tabular column spec (ex.: `lll`, `l|l|l`, `|l|S|S|`), gets passed to the first argument of the `tabular` environment.
- `caption` (optional) -- caption of the image, gets passed to `\caption`.
- `table body` (mandatory) -- the rows and columns of the table, gets put inside a `tabular` environment.

#### Example
```tex
\inserttbl{|S|S|S|}<A table>
{
 \hline
 \textbf{column 1} & \textbf{column 2} & \textbf{column 3} \\\hline
 \hline
 53307             &  24284            & -30021            \\\hline
 34428             &  70108            &  23217            \\\hline
 50563             & -69993            &  43382            \\\hline
}
```
<!-- }}} -->

<!-- {{{ Insert an URL -->
### Insert an URL
```tex
\inserturl{full-url}
```

Inserts a shortened, readable URL (it strips `scheme://`, leading `www.` and trailing slash). The link is clickable in the PDF.

#### Requirements
- documentclass option `urlsupport = true`.

#### Usage
- `full-url` (mandatory) -- a full URL, gets passed to `\href`.

#### Example
```tex
\inserturl{https://www.github.com/Andy3153/my_style.cls/} %will show up in the document as `github.com/Andy3153/my_style.cls`
```
<!-- }}} -->
<!-- }}} -->

<!-- {{{ Title styles -->
## Title styles
I implemented custom title styles through the document class option `docstyleTitleStyle`. These completely replace the `\maketitle` command with different titles.

<!-- {{{ table -->
| title style       | parameters                                      | description |
| :-:               | :-:                                             | :-:         |
| `default`         | `\title`, `\author`, `\date`                    | the default title style from the `memoir` document class |
| `eseuribacromana` | `\title`, `\author`, `\projecturl`              | the title style I made for ["Eseuri pentru bacalaureatul la Limba și Literatura Română"](https://github.com/Andy3153/eseuri_bac_romana/blob/master/book/book.pdf), adapted a little |
| `scientificpaper` | `\title`, `\author`, `\moreinfo`, `\projecturl` | the title style I made for ["Phone Controlled Car"](https://github.com/Andy3153/phone-controlled-car/blob/master/doc/doc.pdf) |
| `uniproject`      | `\title`, `\moreinfo`                           | the title style I made for use in university project documents |
<!-- }}} -->
<!-- }}} -->

<!-- {{{ Template -->
## Template
I created a template that is included in the repository. It documents all the options provided by the document class and contains the basic structure I use for all my documents.
<!-- }}} -->

<!-- {{{ Documents written with this document class -->
## Documents written with this document class
Here's a list of documents I have written and published that use this document class:

<!-- {{{ "Eseuri pentru bacalaureatul la Limba și Literatura Română" -->
### "Eseuri pentru bacalaureatul la Limba și Literatura Română"
| [repo](https://github.com/Andy3153/eseuri_bac_romana) | [view](https://github.com/Andy3153/eseuri_bac_romana/blob/master/book/book.pdf) | [download](https://github.com/Andy3153/eseuri_bac_romana/raw/master/book/book.pdf) |
| :-: | :-: | :-: |

This document is the reason I went and made this repository, it's my first ever serious document I wrote with LaTeX. It uses a very early version of the code in this repo, prior to me turning it into a `memoir`-based document class, it was a package to use over the basic `article` and `book` document classes.
<!-- }}} -->

<!-- {{{ "Phone Controlled Car" -->
### "Phone Controlled Car"
| [repo](https://github.com/Andy3153/phone-controlled-car) | [view](https://github.com/Andy3153/phone-controlled-car/blob/master/doc/doc.pdf) | [download](https://github.com/Andy3153/phone-controlled-car/raw/master/doc/doc.pdf) |
| :-: | :-: | :-: |

This document is what pushed me to go do the work to rewrite everything from a package to a full-on document class. Also a good showcase of the `scientificpaper` titlestyle.
<!-- }}} -->
<!-- }}} -->

<!-- {{{ Weird design decisions -->
## Weird design decisions
As this is a personal project, it comes with things that might make zero sense to an outsider:
- Potential errors are being handled on a best-effort basis.
- All math is made to look like display math (`\everymath{\displaystyle}` and `\RenewDocumentCommand\frac{}{\displaystyle\stdfrac}`).
- The multiplication symbol `\times` is disabled (`\let\times\empty`).
- The epsilon symbol `\epsilon` is overridden by `\varepsilon` (`\let\epsilon\varepsilon`)
<!-- }}} -->

<!-- {{{ License -->
## License
This repository is licensed under the GNU General Public License v3.0 (GPL-3.0). See the [`LICENSE`](LICENSE) file for details.
<!-- }}} -->
