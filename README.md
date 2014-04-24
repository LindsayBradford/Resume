A simple LaTeX resume generation environemnt, based on Perl scripts.
--------------------------------------------------------------------

Author: [Lindsay Bradford](http://lindsaybradford.wordpress.com/)

Here's a [recent example](https://googledrive.com/host/0B7T5Ops6C7WQV1BMdXpXQ1ZMNHc/resume.pdf) of the kind of PDF it produces.

With /raw as the working directory, run the CookPDF.pl perl script 
to generate a PDF of the resume source LaTeX file in the same directory.

The resultant resume.pdf will be placed in the /cooked directory.
- - -

The LaTeX environment this has been tested with is the TexLive distribution
supplied with Ubuntu 11.10. An unknown subset of the following packages are 
needed to get the LaTeX to generate a PDF without incident:

+ TexLive: Essential programs and files
+ TexLive: LaTeX Basic Packages
+ TexLive: LaTeX Recommended Packages
+ TexLive: LaTeX Supplementary Packages
+ TexLive: LaTeX Auxiliary Packages
+ TexLive: MetaPost (and MetaFont) Drawing Packages
+ TexLive: Extra Fonts
