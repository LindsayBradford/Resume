#!/usr/bin/perl

$texFile = "resume";
$cookScript = "../cookDocument.pl";

exec "perl $cookScript $texFile --PDF";
