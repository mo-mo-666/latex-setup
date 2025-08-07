#!/usr/bin/env perl

# uplatex
$latex = 'ptex2pdf -u -l -ot -kanji=utf8 -interaction=nonstopmode -file-line-error';

# upbibtex
$bibtex = 'upbibtex';

# div -> pdf
$dvipdf = 'dvipdfmx %O -o %D %S';

# index
$makeindex = 'upmendex %O -o %D %S';

$max_repeat = 5;

# dvi -> pdf
$pdf_mode = 3;

# preview update
$pdf_update_method = 4;
