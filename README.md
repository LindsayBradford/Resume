A simple LaTeX PDF resume generation script in Gradle.
--------------------------------------------------------------------

Author: [Lindsay Bradford](http://lindsaybradford.wordpress.com/)

Here's a [recent example](https://drive.google.com/file/d/1JL7qFyT_5Mm5BLID2HcaeMQLxxX0dbil/view?usp=drive_link) of the kind of PDF it produces.

From the root directory, simply run gradle.
The resultant resume.pdf will be placed in the /cooked directory.

Following tasks have been defined:
* cook      Generates the resume.pdf file.
* deliver   Delivers it to the cooked directory.
* flush     Deletes all the temporary files.
* full      (default) Generates, delivers, and flushes. 
- - -

The LaTeX environment this has been tested with is the TexLive distribution
supplied with Ubuntu 11.10+. An unknown subset of the following packages are 
needed to get the LaTeX to generate a PDF without incident:

+ TexLive: Essential programs and files
+ TexLive: LaTeX Basic Packages
+ TexLive: LaTeX Recommended Packages
+ TexLive: LaTeX Supplementary Packages
+ TexLive: LaTeX Auxiliary Packages
+ TexLive: MetaPost (and MetaFont) Drawing Packages
+ TexLive: Extra Fonts

Or... lately, I've just been using [Overleaf](https://www.overleaf.com/) to edit changes online and generated my PDFs from there.  
