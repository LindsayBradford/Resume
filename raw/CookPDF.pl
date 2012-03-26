#!/usr/bin/perl

# CookPDF.pl
# Author: Lindsay Bradford, 2012
# 
# A wrapper script around the generic cookDocument.pl script
# for generating a PDF file of resume.tex

$texFile = "resume";
$cookScript = "../cookDocument.pl";

exec "perl $cookScript $texFile --PDF";
