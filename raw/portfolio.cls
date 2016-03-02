\NeedsTeXFormat{LaTeX2e}
\usepackage{ifthen}
\usepackage[OT1]{fontenc}
\usepackage{pbsi}
\ProvidesClass{portfolio}[2016/02/24 1.0 (c) Lindsay Bradford]

%-----------------------------------------------------------------------------%
% Revision History:                                                           %
%   1.0          - Initial Version                                            %
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
\RequirePackage{fancybox}
\RequirePackage[colorlinks=true,pdfpagemode=UseThumbs,pdfstartview=FitV,pdfpagelayout=SinglePage,linkcolor=blue,citecolor=blue,urlcolor=blue]{hyperref}

\usepackage[OT1]{fontenc}
\usepackage{pacioli}
\newcommand*\headerfont{\cpcfamily}

\usepackage[T1]{fontenc}
\usepackage{gfsdidot}
\renewcommand{\contentsname}{Selected Software Projects:}
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
% Page Number formatting; eg - Portfolio of        Lindsay Bradford      Page x of y %
%------------------------------------------------------------------------------------%

\newcommand{\DH@PortfolioAuthor}{}            
\newcommand{\DH@PortfolioTitle}{}

\newcommand{\ps@resume}{
  \renewcommand*{\@oddhead}{}
  \renewcommand*{\@evenhead}{}
  \renewcommand*{\@oddfoot}{%
    {\em {\DH@PortfolioTitle} \hspace*{\fill} {\DH@PortfolioAuthor} \hspace*{\fill} Page \arabic{page} of \pageref{LastPage}}%
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
% Supply \PortfolioOwner[<DocumentTitle>]{<PersonName>} command.              %
%   Leaving the optional parameter <DocumentTitle> out will                   %
%   generate the title "Portfolio of"                                         %
%-----------------------------------------------------------------------------%

\newcommand{\PortfolioTitle}[2][Portfolio of]{
  \renewcommand{\DH@PortfolioTitle}{#1}       % set \DH@PortfolioTitle  to variable 1
  \renewcommand{\DH@PortfolioAuthor}{#2}      % set \DH@PortfolioAuthor to variable 2
    \begin{bfseries}
        \begin{huge}
          \begin{center}
          {\bsifamily #1}
          \end{center}
        \end{huge}
        \begin{Huge}
          \begin{center}
          {\bsifamily #2}
          \end{center}
        \end{Huge}
    \end{bfseries}
}

%-----------------------------------------------------------------------------%
% The environment ContactDtails and command \ContactDetial                    %
%   are to be used together                                                   %
%-----------------------------------------------------------------------------%

\newenvironment{ContactDetails}
  {\begin{center}
     \begin{large}
       \begin{tabular}{lcl}
  }
  {
       \end{tabular}
     \end{large}
   \end{center}
  }

\newcommand{\ContactDetail}[2]{
  \vspace*{2.5mm}
  {\em #1:} & & {\em #2} \\
}

\newenvironment{Projects}{}{}

\newenvironment{Project}[1]
  { \pagebreakForcedFill 
    \setlength{\parskip}{1em}
    \setlength{\parindent}{0em}
    \ProjectTitle{#1} }
  { \vfillForced }

\newenvironment{ProjectOverview}
{\begin{flushleft}{\bf Overview:}}
{\end{flushleft}}

%-----------------------------------------------------------------------------%
% Supply \PortfolioTitle{<Title Text>} command.                               %
%-----------------------------------------------------------------------------%

\newcommand{\ProjectTitle}[1]{
  \center{\section*{#1}}
  \addcontentsline{toc}{section}{#1}
}

\newcommand{\ProjectTools}[1]{
  {\bf #1 } 

}

\newcommand{\ProjectTimeline}[1]{
  {\bf Timeline:} #1

}

\newcommand{\ProjectContribution}[1]{
  {\bf Contribution:} #1 

}

\newcommand{\ProjectFurtherInfo}[1]{
  {\bf Further Information:} #1
 
}

\newcommand{\ProjectImage}[2]{
  \begin{center}
    \includegraphics[{#1}]{#2}
  \end{center}

}

\newcommand{\tool}[1]{\shadowbox{\strut #1}}
