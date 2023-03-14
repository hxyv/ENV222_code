::: {#quarto-content .page-columns .page-rows-contents .page-layout-article .toc-left}
::: {#quarto-sidebar-toc-left .sidebar .toc-left}
## Table of contents {#toc-title}

-   [[1]{.toc-section-number} Learning
    objectives](#learning-objectives){#toc-learning-objectives .nav-link
    .active scroll-target="#learning-objectives"}
-   [[2]{.toc-section-number} Forms of Academic
    communication](#forms-of-academic-communication){#toc-forms-of-academic-communication
    .nav-link scroll-target="#forms-of-academic-communication"}
    -   [[2.1]{.toc-section-number} Report](#report){#toc-report
        .nav-link scroll-target="#report"}
        -   [[2.1.1]{.toc-section-number} The default
            settings](#the-default-settings){#toc-the-default-settings
            .nav-link scroll-target="#the-default-settings"}
        -   [[2.1.2]{.toc-section-number} The `prettydoc`
            package](#the-prettydoc-package){#toc-the-prettydoc-package
            .nav-link scroll-target="#the-prettydoc-package"}
    -   [[2.2]{.toc-section-number} Journal
        paper](#journal-paper){#toc-journal-paper .nav-link
        scroll-target="#journal-paper"}
        -   [[2.2.1]{.toc-section-number} The **rticles**
            package](#the-rticles-package){#toc-the-rticles-package
            .nav-link scroll-target="#the-rticles-package"}
    -   [[2.3]{.toc-section-number} Thesis](#thesis){#toc-thesis
        .nav-link scroll-target="#thesis"}
        -   [[2.3.1]{.toc-section-number} The **bookdown**
            package](#the-bookdown-package){#toc-the-bookdown-package
            .nav-link scroll-target="#the-bookdown-package"}
    -   [[2.4]{.toc-section-number} Slides](#slides){#toc-slides
        .nav-link scroll-target="#slides"}
        -   [[2.4.1]{.toc-section-number} The default
            settings](#the-default-settings-1){#toc-the-default-settings-1
            .nav-link scroll-target="#the-default-settings-1"}
        -   [[2.4.2]{.toc-section-number} The **xaringan**
            package](#the-xaringan-package){#toc-the-xaringan-package
            .nav-link scroll-target="#the-xaringan-package"}
    -   [[2.5]{.toc-section-number} More](#more){#toc-more .nav-link
        scroll-target="#more"}
-   [[3]{.toc-section-number} R Markdown
    header](#r-markdown-header){#toc-r-markdown-header .nav-link
    scroll-target="#r-markdown-header"}
-   [[4]{.toc-section-number} Presenting statistical
    results](#presenting-statistical-results){#toc-presenting-statistical-results
    .nav-link scroll-target="#presenting-statistical-results"}
-   [[5]{.toc-section-number} Citations &
    references](#citations-references){#toc-citations-references
    .nav-link scroll-target="#citations-references"}
-   [[6]{.toc-section-number} Further
    readings](#further-readings){#toc-further-readings .nav-link
    scroll-target="#further-readings"}
-   [[7]{.toc-section-number} Exercises](#exercises){#toc-exercises
    .nav-link scroll-target="#exercises"}
:::

::: {#quarto-margin-sidebar .sidebar .margin-sidebar}
:::

::: {#quarto-document-content .content role="main"}
::: {#title-block-header .quarto-title-block .default}
::: quarto-title
# R Markdown advanced {#r-markdown-advanced .title}

A powerful and amazing tool for academic communication
:::

::: quarto-title-meta
:::
:::

[Dr. Peng Zhao](https://connect.xjtlu.edu.cn/user/pengzhao) (✉
peng.zhao@xjtlu.edu.cn)

Department of Health and Environmental Sciences\
Xi'an Jiaotong-Liverpool University

::: {#learning-objectives .section .level1 number="1"}
# [1]{.header-section-number} Learning objectives {#learning-objectives number="1"}

-   Generate academic manuscripts, theses, and slides with R Markdown.
-   Present statistics results in statements, tables, and graphs.
-   Use cross references in scientific writing.
:::

::: {#forms-of-academic-communication .section .level1 number="2"}
# [2]{.header-section-number} Forms of Academic communication {#forms-of-academic-communication number="2"}

  ------------------------------------------------------------------------
  Forms          Description         Advantages      Limitation
  -------------- ------------------- --------------- ---------------------
  Talks          Presenting data     Vivid with      Time limit.
                 orally, usually     animations and  Electronic devices
                 with slides.        universal in    based. Dependence on
                                     various         the presenter's
                                     occasions.      improvisation.

  Journal papers Presenting data     Professional,   Requirement changes
                 with a completed    detailed,       over publishers. Less
                 study and published strict, and     interaction with
                 it in a academic    structured.     readers.
                 journal.                            

  Posters        Presenting data     Convenient,     Space limit.
                 with a designed     instant with    Dependence on the
                 poster and discuss  interaction.    presenter's
                 it with other                       explanation.
                 people.                             
  ------------------------------------------------------------------------

R Markdown family:

-   [Home-made R Markdown Gallery](https://rmd.pzhao.org)
-   [Official R Markdown
    Gallery](https://rmarkdown.rstudio.com/gallery.html)

::: {#report .section .level2 number="2.1"}
## [2.1]{.header-section-number} Report {#report .anchored number="2.1" anchor-id="report"}

::: {#the-default-settings .section .level3 number="2.1.1"}
### [2.1.1]{.header-section-number} The default settings {#the-default-settings .anchored number="2.1.1" anchor-id="the-default-settings"}
:::

::: {#the-prettydoc-package .section .level3 number="2.1.2"}
### [2.1.2]{.header-section-number} The `prettydoc` package {#the-prettydoc-package .anchored number="2.1.2" anchor-id="the-prettydoc-package"}

-   Installation

::: {.cell layout-align="center"}
::: {#cb1 .sourceCode .cell-code}
``` {.sourceCode .r .code-with-copy}
install.packages('prettydoc')
```
:::
:::

-   Create: RStudio - File - New File - R Markdown - From Template -
    Lightweight and Pretty Document (HTML) (prettydoc)

-   Knit into .html
:::
:::

::: {#journal-paper .section .level2 number="2.2"}
## [2.2]{.header-section-number} Journal paper {#journal-paper .anchored number="2.2" anchor-id="journal-paper"}

::: {#the-rticles-package .section .level3 number="2.2.1"}
### [2.2.1]{.header-section-number} The **rticles** package {#the-rticles-package .anchored number="2.2.1" anchor-id="the-rticles-package"}

-   Create: RStudio - File - New File - R Markdown - From Template -
    Elsevier Journal Article (rticles)
-   Knit into .pdf
:::
:::

::: {#thesis .section .level2 number="2.3"}
## [2.3]{.header-section-number} Thesis {#thesis .anchored number="2.3" anchor-id="thesis"}

::: {#the-bookdown-package .section .level3 number="2.3.1"}
### [2.3.1]{.header-section-number} The **bookdown** package {#the-bookdown-package .anchored number="2.3.1" anchor-id="the-bookdown-package"}

-   Create a bookdown project: RStudio - File - New Project - New
    Directory - Book project using bookdown
-   Build the book
:::
:::

::: {#slides .section .level2 number="2.4"}
## [2.4]{.header-section-number} Slides {#slides .anchored number="2.4" anchor-id="slides"}

::: {#the-default-settings-1 .section .level3 number="2.4.1"}
### [2.4.1]{.header-section-number} The default settings {#the-default-settings-1 .anchored number="2.4.1" anchor-id="the-default-settings-1"}

-   Create: RStudio - New File - R Markdown - Presentation
-   Knit it into .html, .pdf, .pptx
:::

::: {#the-xaringan-package .section .level3 number="2.4.2"}
### [2.4.2]{.header-section-number} The **xaringan** package {#the-xaringan-package .anchored number="2.4.2" anchor-id="the-xaringan-package"}

-   Create: RStudio - File - New File - R Markdown - From Template -
    Ninja Presentation (xaringan)
-   Knit into .pdf
:::
:::

::: {#more .section .level2 number="2.5"}
## [2.5]{.header-section-number} More {#more .anchored number="2.5" anchor-id="more"}

-   Journal paper: RStudio ---\> File ---\> New File ---\> R Markdown
    ---\> From Template
-   Dissertation/book: RStudio: File ➞ New Project ➞ New Directory ➞
    Book Project using bookdown
-   slides: RStudio: File ➞ New File ➞ R Markdown ➞ From Template ➞
    Ninja Presentation
-   Poster: RStudio: File ➞ New File ➞ R Markdown ➞ From Template ➞
    drposter Poster
-   Website: RStudio: File ➞ New Project ➞ New Directory ➞ Website using
    blogdown
-   CV
-   Letter
-   Music
-   Chess
-   Mindmap
-   ...
:::
:::

::: {#r-markdown-header .section .level1 number="3"}
# [3]{.header-section-number} R Markdown header {#r-markdown-header number="3"}

Output:

::: {.cell layout-align="center"}
::: {#cb2 .sourceCode .cell-code}
``` {.sourceCode .yaml .code-with-copy}
output: 
  bookdown::pdf_book: default
  bookdown::html_document2: default
  bookdown::word_document2: default
```
:::
:::

Titles:

::: {.cell layout-align="center"}
::: {#cb3 .sourceCode .cell-code}
``` {.sourceCode .yaml .code-with-copy}
title: Presenting statistical results
subtitle: A demonstration for R Markdown
author: Peng Zhao
```
:::
:::

Table of contents:

::: {.cell layout-align="center"}
::: {#cb4 .sourceCode .cell-code}
``` {.sourceCode .yaml .code-with-copy}
toc: false
lot: false
lof: false
```
:::
:::

Citations:

::: {.cell layout-align="center"}
::: {#cb5 .sourceCode .cell-code}
``` {.sourceCode .yaml .code-with-copy}
link-citations: true
colorlinks: yes  
bibliography: references.bib
```
:::
:::
:::

::: {#presenting-statistical-results .section .level1 number="4"}
# [4]{.header-section-number} Presenting statistical results {#presenting-statistical-results number="4"}

Demo.
:::

::: {#citations-references .section .level1 number="5"}
# [5]{.header-section-number} Citations & references {#citations-references number="5"}

-   Bibliography library: .bib

1.  Use Google/Baidu/Bing Scholar for searching a topic of your
    interest, and download the bib entry for an article.
2.  Download a bib entry from one journal of your interest.
3.  Merge these two files into one.
4.  Cite these two references in your draft.

-   Citation style
-   Citation: `[@entry]`.
:::

::: {#further-readings .section .level1 number="6"}
# [6]{.header-section-number} Further readings {#further-readings number="6"}

-   [R Markdown Tutorial](https://rmarkdown.rstudio.com/lesson-10.html)
    Lesson 10 -- 15
-   [R Markdown: The Definitive
    Guide](https://bookdown.org/yihui/rmarkdown/)
-   [R Markdown
    Cookbook](https://bookdown.org/yihui/rmarkdown-cookbook/)
-   [bookdown: Authoring Books and Technical Documents with R
    Markdown](https://bookdown.org/yihui/bookdown/)
:::

::: {#exercises .section .level1 number="7"}
# [7]{.header-section-number} Exercises {#exercises number="7"}

1.  Convert this document into a **prettydoc** document. What themes can
    you use for it?
2.  Improve the R Markdown slides with appropriate forms, including
    statements, tables, and graphs. If necessary, use **xaringan**.
3.  Group work: The ENV221 book.

-   Each group claims one week's teaching document.
-   Create a **bookdown** project. Convert each teaching document into a
    book chapter. Take care of the cross references for equations,
    tables, and graphs.
-   Merge all the chapters into one.
:::
:::
:::
