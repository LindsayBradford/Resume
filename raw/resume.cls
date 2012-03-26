\NeedsTeXFormat{LaTeX2e}
\usepackage{ifthen}
\usepackage[OT1]{fontenc}
\usepackage{pbsi}
\ProvidesClass{resume}[2005/11/14 1.3 (c) Lindsay Bradford]

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
%                -                                                            %
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
\RequirePackage[colorlinks=true,pdfpagemode=UseThumbs,pdfstartview=FitV,pdfpagelayout=SinglePage,linkcolor=blue,citecolor=blue,urlcolor=blue]{hyperref}

\usepackage[OT1]{fontenc}
\usepackage{pacioli}
\newcommand*\headerfont{\cpcfamily}

\usepackage[T1]{fontenc}
\usepackage{gfsdidot}

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
% Supply \ResumeTitle[<DocumentTitle>]{<PersonName>} command.                 %
%   Leaving the optional parameter <DocumentTitle> out will                   %
%   generate the title "Curriculum Vitae"                                     %
%-----------------------------------------------------------------------------%

\newcommand{\ResumeTitle}[2][Curriculum Vitae]{
  \renewcommand{\DH@ResumeTitle}{#1}       % set \DH@ResumeTitle  to variable 1
  \renewcommand{\DH@ResumeAuthor}{#2}      % set \DH@ResumeAuthor to variable 2
    \begin{bfseries}
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

\newenvironment{Profile}
  {\ResumeHeader{PROFILE}}
  {}

%-----------------------------------------------------------------------------%
% The environment Achievemens and command \Achievement                        %
%   are to be used together                                                   %
%-----------------------------------------------------------------------------%

\newenvironment{Achievements}
  {\ResumeHeader{ACHIEVEMENTS}
    \begin{itemize}}
  {\end{itemize}}

\newcommand{\Achievement}[1]{
  \item #1
}

%-----------------------------------------------------------------------------%
% The environment Skills and command \Skill                                   %
%   are to be used together                                                   %
%-----------------------------------------------------------------------------%

\newenvironment{Skills}
  {\ResumeHeader{PROFESIONAL SKILLS}
    \begin{center}
    \begin{itemize}}
  { \end{itemize}
    \end{center}}

\newcommand{\Skill}[3]{
  \item {\bfseries #1} - {#2} ({#3} yrs)
}

\newenvironment{HobbyItems}
  {\begin{center}
    \begin{itemize}}
  { \end{itemize}
   \end{center}}

\newenvironment{MembershipItems}
  {\begin{center}
    \begin{itemize}}
  { \end{itemize}
   \end{center}}

\newenvironment{TrainingItems}
  {\begin{center}
    \begin{itemize}}
  { \end{itemize}
   \end{center}}


\newenvironment{WorkHistory}
  {\vfillForced\begin{center}\begin{tabular}{lcr}}
  {\end{tabular}\end{center}\vfillForced}

\newcommand{\CareerDetailItem}[4] {
                        & \hspace*{\fill} &  \\
  {\bfseries #1} - {#2} &                 & {\em #3} \\ \hline
                        &                 &    \\
  \multicolumn{3}{l}{\parbox{16cm}{
    \begin{itemize}
      {#4}
    \end{itemize}
  }} \\
}

\newenvironment{EducationSummary}
 {\ResumeHeader{EDUCATION}
   \begin{center}
      \begin{scshape}
      \begin{tabular}{ccc}}
 {    \end{tabular}
     \end{scshape}
   \end{center}}

\newcommand{\EducationItem}[3] {
  #1 & \hspace*{2em} & {\bfseries #2}  \\
     &               & {#3} \\[4mm] 
}

\newenvironment{Publications}
  {\hypertarget{Publications}{\ResumeHeader{PUBLICATIONS}}
    \begin{center}
    \begin{itemize}}
  { \end{itemize}
   \end{center}}

\newcommand{\Publication}[1] {
  \item #1
}

\newenvironment{Patents}
  {\hypertarget{Patents}{\ResumeHeader{PATENTS}}
    \begin{center}
    \begin{itemize}}
  { \end{itemize}
   \end{center}}

\newcommand{\Patent}[1] {
  \item #1
}

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

%-----------------------------------------------------------------------------%
% Supply \ResumeHeader{<HeaderText>} command.                                 %
%-----------------------------------------------------------------------------%

\newcommand{\ResumeHeader}[1]{
  \begin{center}
    \begin{tabular}{c}
      {\Large \headerfont{\bf #1}}  \\
    \end{tabular}
  \end{center}
}
