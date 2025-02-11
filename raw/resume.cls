\NeedsTeXFormat{LaTeX2e}
\usepackage{ifthen}
\usepackage[OT1]{fontenc}
\usepackage{pbsi}
\ProvidesClass{resume}[2025/02/25 1.4 (c) Lindsay Bradford]

%-----------------------------------------------------------------------------%
% Revision History:                                                           %
%   1.0          - Initial Version                                            %
%   1.1          - Replaced page resizing commands with geometry package      %
%                - Added hyperlinking packages                                %
%                - Add new parameter to Career* commands for hyperlinking     %
%                - Fixed heading <-> date spacing in Career* commands         %
%   1.2          - alered resume to use its own pagestyle instead of          %
%                  overriding \thepage command.                               %
%   1.2.1        - Removed colons from skill summary section                  %
%   1.3          - Many changes to format to better suite UK contracting std  %
%   1.4          - Massive overhaul to produce ATS-ready resumes              %
%-----------------------------------------------------------------------------%
% Use Article Style as the default.                                           %
%-----------------------------------------------------------------------------%

\DeclareOption*{\PassOptionsToClass{\CurrentOption}{article}}
\ProcessOptions
\LoadClass[11pt,a4paper]{article}
\RequirePackage[left=1.5cm,right=1.5cm,top=1.0cm,bottom=2.0cm,nohead]{geometry}
\RequirePackage[pdftex]{graphicx}
\RequirePackage{url,supertabular,epsfig,rotating,pslatex}
\RequirePackage{lastpage}
\RequirePackage[colorlinks=true,pdfpagemode=UseThumbs,pdfstartview=FitV,pdfpagelayout=SinglePage,linkcolor=blue,citecolor=bl
ue,urlcolor=blue]{hyperref}
\RequirePackage{titlesec}
\RequirePackage{tabto}
\RequirePackage{xcolor}
\RequirePackage{framed}
\RequirePackage[skip=0.25em plus1pt, indent=0pt]{parskip}

\definecolor{shadecolor}{RGB}{200,200,200}

\usepackage[OT1]{fontenc}
\usepackage{pacioli}
\newcommand*\headerfont{\cpcfamily}

\usepackage[T1]{fontenc}
\usepackage{gfsdidot}

\hyphenpenalty=9999

\newcommand{\sectionSpace}{\vspace{0.5em}}

%-----------------------------------------------------------------------------%
% Make titlepage environment use current pagestyle.                           %
%-----------------------------------------------------------------------------%

\if@compatibility
\renewenvironment{titlepage}
    {%
      \if@twocolumn
        \@restonecoltrue\onecolumn
      \else
        \@restonecolfalse\newpage
      \fi
      \setcounter{page}\z@
    }%
    {\if@restonecol\twocolumn \else \newpage \fi
    }
\else
\renewenvironment{titlepage}
    {%
      \if@twocolumn
        \@restonecoltrue\onecolumn
      \else
        \@restonecolfalse\newpage
      \fi
      \setcounter{page}\@ne
    }%
    {\if@restonecol\twocolumn \else \newpage \fi
     \if@twoside\else
        \setcounter{page}\@ne
     \fi
    }
\fi

%------------------------------------------------------------------------------------%
% Page Number formatting; eg - Curriculum Vitae    Lindsay Bradford      Page x of y %
%------------------------------------------------------------------------------------%

\newcommand{\DH@ResumeAuthor}{}            
\newcommand{\DH@ResumeTitle}{}

\newcommand{\ps@resume}{
  \renewcommand*{\@oddhead}{}
  \renewcommand*{\@evenhead}{}
  \renewcommand*{\@oddfoot}{%
    {\em {\DH@ResumeTitle} \hspace*{\fill} {\DH@ResumeAuthor} \hspace*{\fill} Page \arabic{page} of \pageref{LastPage}}%
  }
  \renewcommand*{\@evenfoot}{\@oddfoot}
}
\pagestyle{resume}

%-----------------------------------------------------------------------------%
% Shorthands for forcing filler space             .                           %
%-----------------------------------------------------------------------------%

\newcommand{\vfillForced}{\vspace*{\fill}}
\newcommand{\hfillForced}{\hspace*{\fill}}
\newcommand{\pagebreakForcedFill}{\vfillForced\pagebreak\vfillForced}

%-----------------------------------------------------------------------------%
% Supply \ResumeSumary[<DocumentTitle>]{<PersonName>} command.                 %
%   Leaving the optional parameter <DocumentTitle> out will                   %
%   generate the title "Curriculum Vitae"                                     %
%-----------------------------------------------------------------------------%

\newcommand{\ResumeSummary}[2][Resume]{
  \renewcommand{\DH@ResumeTitle}{#1}       % set \DH@ResumeTitle  to variable 1
  \renewcommand{\DH@ResumeAuthor}{#2}      % set \DH@ResumeAuthor to variable 2
}

%-----------------------------------------------------------------------------%
% The environment ContactDtails and command \ContactDetial                    %
%   are to be used together                                                   %
%-----------------------------------------------------------------------------%

\newcommand{\fullRule}{\noindent\rule{\textwidth}{2.5pt}}

\newcommand{\ResumeHeader}[1]{\fullRule\vspace{0.66em}\break{\Large{\bf #1}}\hfill\break\fullRule\vspace{0.66em}}

\newenvironment{ContactDetails}
  {\begin{Large}
   \ContactDetail{Name}{\DH@ResumeAuthor}}
  {\end{Large}}

\newcommand{\ContactDetail}[2]{
  {\bf #1:} \tab {\em #2} \par
}

\newenvironment{Summary}[1]
  {\ResumeHeader{PROFESSIONAL SUMMARY}{#1}\begin{itemize}}
  {\end{itemize}\sectionSpace}

%-----------------------------------------------------------------------------%
% The environment Skills and command \Skill                                   %
%   are to be used together                                                   %
%-----------------------------------------------------------------------------%

\newenvironment{Skills}
  {\ResumeHeader{SKILLS}\begin{itemize}}
  {\end{itemize}\sectionSpace}

\newcommand{\SkillSection}[2]{
  \item {\bfseries #1:}{ #2}
}

\newcommand{\Achievement}[1]{\item #1}

\newenvironment{WorkHistory}
  {\ResumeHeader{WORK EXPERIENCE}}
  {\vspace{1em}}

\newcommand{\CareerDetailItem}[4] {
  {\bfseries #1} - {#2} \hfillForced {\em (#3)}\vspace*{0.25em}\hline\vspace*{0.25em}
   \begin{itemize}
      {#4}
    \end{itemize}
    \vspace*{0.5em}
    \filbreak
}

\newenvironment{EducationSummary}
 {\ResumeHeader{EDUCATION}\begin{scshape}\begin{itemize}}
 {\end{itemize}\end{scshape}\sectionSpace}

\newcommand{\EducationItem}[3] {
  \item {\bfseries #1} \hfillForced {#2} (#3)
}

\newenvironment{Links}
  {\ResumeHeader{LINKS}\begin{itemize}}
  {\end{itemize}\sectionSpace}

\newcommand{\Link}[1]
  {\item #1}

\newenvironment{RefereeSection}
  {\begin{tabular}{l}}
  {\end{tabular}}

\newcommand{\RefereeName}[1]
  {#1\\}

\newcommand{\RefereeTitle}[1]
  {#1\\}

\newcommand{\RefereeWorkplace}[1]
  {#1\\}

\newcommand{\RefereeSeparator}
  {\\}

\newcommand{\RefereePhone}[1]
  {{\bf Ph: }#1\\}

\newcommand{\RefereeMobile}[1]
  {{\bf Mobile: }#1\\}

\newcommand{\RefereeFax}[1]
  {{\bf Fax: }#1\\}

\newcommand{\RefereeEmail}[1]
  {{\bf Email: }\href{mailto:#1}{#1}\\}
}
