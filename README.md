# Curriculum Vitae & Résumé

This repository contains the LaTeX source code for my curriculum vitae and
résumé.

### Requirements

A full TeX distribution is assumed. [Various
distributions](http://tex.stackexchange.com/q/55437) for different operating
systems (Windows, Mac, \*nix) are available but TeX Live is recommended. The
build also requires `latexmk`, Biber, Source Sans 3, and Roboto.

### Usage

There are two main `.tex` files. Build both with `make`; the Makefile uses
`latexmk` to run LuaLaTeX and Biber as many times as needed.

```bash
make
```

This creates `cv.pdf` and `resume.pdf`. You can also build or clean individual
targets:

```bash
make cv
make resume
make clean
```

## Credits

[**Awesome CV**](https://github.com/posquit0/Awesome-CV) is a LaTeX template
for a **CV(Curriculum Vitae)**, **Résumé** or **Cover Letter** inspired by
[Fancy CV](https://www.sharelatex.com/templates/cv-or-resume/fancy-cv). It is
easy to customize your own template, especially since it is really written by a
clean, semantic markup.

[**LaTeX**](http://www.latex-project.org) is a fantastic typesetting program
that a lot of people use these days, especially the math and computer science
people in academia.

[**FontAwesome7 LaTeX Package**](https://github.com/braniii/fontawesome) is a
LaTeX package that provides access to the [Font Awesome
7](https://fontawesome.com/v7/icons) icon set.

[**Roboto**](https://github.com/google/roboto) is the default font on Android
and ChromeOS, and the recommended font for Google’s visual language, Material
Design.

[**Source Sans 3**](https://github.com/adobe-fonts/source-sans) is a set
of OpenType fonts that have been designed to work well in user interface (UI)
environments.
