$documentBase = $ARGV[0];
$scope        = $ARGV[1];

&cookDocument();
&deliverDocument();

sub cookDocument() {
  &verifyCommandLineArguments();

  if ($scope eq "--all" || $scope eq "--DVI") {
    &cookDocumentToDVI();
  }
  if ($scope eq "--all" || $scope eq "--PDF") {
    &cookDocumentToPDF();
  }
}

sub verifyCommandLineArguments() {
  &verifyDocumentBase();
  &verifyScope();
}

sub verifyScope() {
  if ($scope eq "") {
    $scope = "--all";
  }
}

sub verifyDocumentBase() {
  if (!-f "$documentBase.tex") {
    printf "Error: File \"$documentBase.tex\" doesn't exist! Exiting.";
    exit 1;
  }
}

sub cookDocumentToDVI() {
  &latexDocument();
}

sub cookDocumentToPDF() {
  &pdfLatexDocument();
  &pdfLatexDocument();
}

sub pdfLatexDocument() {
  system "pdflatex $documentBase";
}

sub latexDocument() {
  system "latex $documentBase";
}

sub bibtexDocument() {
  system "bibtex $documentBase";
}

sub deliverDocument() {
  &deleteTempFiles();
  &moveParsedFiles();
}

sub deleteTempFiles() {
  unlink "$documentBase.out";
  unlink <*.aux>;
  unlink <*.log>;
  unlink "$documentBase.bbl";
  unlink "$documentBase.blg";
  unlink "$documentBase.toc";
}

sub moveParsedFiles() {
  rename "$documentBase.dvi", "../cooked/$documentBase.dvi";
  rename "$documentBase.pdf", "../cooked/$documentBase.pdf";
}
