%% Start of file `awesome-cv.cls'.
% Awesome CV Class File
%
% The original awesome-cv class has been downloaded from:
% https://github.com/posquit0/Awesome-CV
%
% Original Author:
% Claud D. Park <posquit0.bj@gmail.com>
% http://www.posquit0.com
%
% Modifications:
% The class has been modified by Aris Paschalidis <https://www.arispas.com/>.
% Modifications include changing the color of fonts, adding additional FA icons,
% and adding the ability to add a bibliography.
%
% Class license:
% LPPL v1.3c (http://www.latex-project.org/lppl)

%-------------------------------------------------------------------------------
%                Metadata
%-------------------------------------------------------------------------------
\ProvidesClass{awesome-cv}
\NeedsTeXFormat{LaTeX2e}

%-------------------------------------------------------------------------------
%                Options
%
% (need to be done before the external package loading, for example because
% we need \paperwidth, \paperheight and \@ptsize to be defined before loading
% geometry and fancyhdr)
%-------------------------------------------------------------------------------
% Options for draft or final
\DeclareOption{draft}{\setlength\overfullrule{5pt}}
\DeclareOption{final}{\setlength\overfullrule{0pt}}
% Inherit options of article
\DeclareOption*{%
  \PassOptionsToClass{\CurrentOption}{article}
}
\ProcessOptions\relax
\LoadClass{article}

%-------------------------------------------------------------------------------
%                Dependencies and fonts
%-------------------------------------------------------------------------------
% Needed to make fixed length table
\RequirePackage{array}
% Needed to handle list environment
\RequirePackage{enumitem}
% Needed to handle text alignment
\RequirePackage{ragged2e}
% Needed to configure page layout
\RequirePackage{geometry}
% Needed to make header & footer efficiently
\RequirePackage{fancyhdr}
% Needed to manage colors
\RequirePackage{xcolor}
% Needed to use \if-\then-\else statement
\RequirePackage{xifthen}
% Needed to use a toolbox of programming tools
\RequirePackage{etoolbox}
% Needed to manage fonts
\RequirePackage[quiet]{fontspec}
% To support LaTeX quoting style
\defaultfontfeatures{Ligatures=TeX}
% Needed for consistent Unicode math glyphs
\RequirePackage{unicode-math}
% Needed to use icons from font-awesome
\RequirePackage{fontawesome7}
\defaultfontfeatures{
  Renderer=HarfBuzz,
}
\setmainfont{Source Sans 3}[
  UprightFont=*,
  ItalicFont=* Italic,
  BoldFont=* Bold,
  BoldItalicFont=* Bold Italic,
  FontFace={l}{n}{Font=* Light},
  FontFace={l}{it}{Font=* Light Italic},
]
\setsansfont{Source Sans 3}[
  UprightFont=*,
  ItalicFont=* Italic,
  BoldFont=* Bold,
  BoldItalicFont=* Bold Italic,
  FontFace={l}{n}{Font=* Light},
  FontFace={l}{it}{Font=* Light Italic},
]
\newfontfamily\roboto{Roboto}[
  UprightFont=*,
  ItalicFont=* Italic,
  BoldFont=* Bold,
  BoldItalicFont=* Bold Italic,
  FontFace={l}{n}{Font=* Light},
  FontFace={l}{it}{Font=* Light Italic},
]
% Needed to configure paragraph spacing
\RequirePackage{parskip}
% Needed to create hyperlinks
\RequirePackage[hidelinks,unicode]{hyperref}
\hypersetup{%
  pdftitle={},
  pdfauthor={},
  pdfsubject={},
  pdfkeywords={}
}
% Require additional space to be filled by content
\RequirePackage{needspace}

%-------------------------------------------------------------------------------
%                Layout
%-------------------------------------------------------------------------------
% Configure page margins with geometry
\geometry{left=1cm, top=.5cm, right=1cm, bottom=1cm, footskip=0.2cm}

% Set offset to each header and footer
\fancyhfoffset{0em}
% Remove head rule
\renewcommand{\headrulewidth}{0pt}
% Clear all header & footer fields
\fancyhf{}
% Enable if you want to make header or footer using fancyhdr
\pagestyle{fancy}

%-------------------------------------------------------------------------------
%                Font helpers
%-------------------------------------------------------------------------------
\newcommand*{\headerfont}{\roboto\selectfont}
\newcommand*{\headerfontlight}{\roboto\fontseries{l}\selectfont}
\newcommand*{\footerfont}{\sffamily}
\newcommand*{\bodyfont}{\sffamily}
\newcommand*{\bodyfontlight}{\sffamily\fontseries{l}\selectfont}

%-------------------------------------------------------------------------------
%                Styles
%-------------------------------------------------------------------------------
% Configure styles for each CV elements
% For fundamental structures
\newcommand*{\headerfirstnamestyle}[1]{{\fontsize{20pt}{1em}\headerfontlight\color{black} #1}}
\newcommand*{\headerlastnamestyle}[1]{{\fontsize{20pt}{1em}\headerfont\bfseries\color{black} #1}}
\newcommand*{\headerpositionstyle}[1]{{\fontsize{8pt}{1em}\bodyfont\scshape\color{black} #1}}
\newcommand*{\headeraddressstyle}[1]{{\fontsize{7pt}{1em}\headerfont\itshape\color{black} #1}}
\newcommand*{\headersocialstyle}[1]{{\fontsize{6.8pt}{1em}\headerfont\color{black} #1}}
\newcommand*{\footerstyle}[1]{{\fontsize{8pt}{1em}\footerfont\scshape\color{black} #1}}
\newcommand*{\sectionstyle}[1]{{\fontsize{12pt}{1em}\bodyfont\bfseries\color{black} #1}}
\newcommand*{\subsectionstyle}[1]{{\fontsize{10pt}{1em}\bodyfont\scshape\textcolor{black}{#1}}}
\newcommand*{\paragraphstyle}{\fontsize{9pt}{1em}\bodyfont\upshape\color{black}}

% For elements of entry
\newcommand*{\entrytitlestyle}[1]{{\fontsize{10pt}{1em}\bodyfont\bfseries\color{black} #1}}
\newcommand*{\entrypositionstyle}[1]{{\fontsize{9pt}{1em}\bodyfont\scshape\color{black} #1}}
\newcommand*{\entrymetadatastyle}[1]{{\fontsize{8pt}{1em}\bodyfont\slshape\color{black} #1}}
\newcommand*{\descriptionstyle}[1]{{\fontsize{9pt}{1em}\bodyfont\upshape\color{black} #1}}

% For elements of honor
\newcommand*{\honortitlestyle}[1]{{\fontsize{9pt}{1em}\bodyfont\upshape\color{black} #1}}
\newcommand*{\honorpositionstyle}[1]{{\fontsize{9pt}{1em}\bodyfont\bfseries\color{black} #1}}
\newcommand*{\honordatestyle}[1]{{\fontsize{9pt}{1em}\bodyfont\color{black} #1}}
% \newcommand*{\honorlocationstyle}[1]{{\fontsize{9pt}{1em}\bodyfontlight\slshape\color{black} #1}}

% For elements of skill
\newcommand*{\skilltypestyle}[1]{{\fontsize{10pt}{1em}\bodyfont\bfseries\color{black} #1}}
\newcommand*{\skillsetstyle}[1]{{\fontsize{9pt}{1em}\bodyfontlight\color{black} #1}}

%-------------------------------------------------------------------------------
%                Personal information
%-------------------------------------------------------------------------------
% Define a collection of header information
\edef\header{}
\newcommand*{\headeradd}[1]{
  \ifnonprint{\ignorespaces\header}{%
    \protected@edef\header{#1}%
  }{%
    \protected@edef\header{\header{} \acvHeaderSocialSep #1}%
  }%
}%
\newcommand*{\headersocial}[3]{
  \headeradd{\href{#2#3}{#1\acvHeaderIconSep#3}}
}

% Define writer's name
% Usage: \name{<firstname>}{<lastname>}
\newcommand*{\name}[2]{\def\@firstname{#1}\def\@lastname{#2}}

% Define writer's address
% Usage: \address{<address>}
\newcommand*{\address}[1]{\def\@address{#1}}

% Define writer's position
% Usage: \position{<position>}
\newcommand*{\position}[1]{\def\@position{#1}}

% Defines writer's email (optional)
% Usage: \email{<email address>}
\newcommand*{\email}[1]{\headersocial{\faEnvelope}{mailto:}{#1}}

% Defines writer's homepage (optional)
% Usage: \homepage{<url>}
\newcommand*{\homepage}[1]{\headersocial{\faHouseChimney}{https://}{#1}}

% Defines writer's linked-in (optional)
% Usage: \linkedin{<linked-in-nick>}
\newcommand*{\linkedin}[1]{\headersocial{\faLinkedin}{https://www.linkedin.com/in/}{#1}}

% Defines writer's github (optional)
% Usage: \github{<github-nick>}
\newcommand*{\github}[1]{\headersocial{\faGithub}{https://github.com/}{#1}}

% Defines writer's google scholar profile (optional)
% Usage: \googlescholar{<googlescholar userid>}{<googlescholar username>}
% e.g.https://scholar.google.co.uk/citations?user=wpZDx1cAAAAJ
% would be \googlescholar{wpZDx1cAAAAJ}{Name-to-display-next-icon}
% If no display name is provided, default to the configured full name.
\newcommand*{\googlescholar}[2]{%
  \ifthenelse{\equal{#2}{}}{%
    \def\@googlescholarname{\@firstname~\@lastname}%
  }{%
    \def\@googlescholarname{#2}%
  }%
  \headeradd{\href{https://scholar.google.com/citations?user=#1}{\faGraduationCap\acvHeaderIconSep\@googlescholarname}}%
}

% Defines writer's orcid (optional)
% Usage: \orcid{<orcid name>}
\newcommand*{\orcid}[1]{\headersocial{\faOrcid}{https://orcid.org/}{#1}}

%-------------------------------------------------------------------------------
%                Customizable spacing
%-------------------------------------------------------------------------------
% Header
\newcommand{\acvHeaderNameDelim}{\space}
\newcommand{\acvHeaderAfterNameSkip}{.4mm}
\newcommand{\acvHeaderAfterPositionSkip}{.4mm}
\newcommand{\acvHeaderAfterAddressSkip}{-.5mm}
\newcommand{\acvHeaderIconSep}{\space}
\newcommand{\acvHeaderSocialSep}{\quad\textbar\quad}
\newcommand{\acvHeaderAfterSocialSkip}{6mm}

% Others
\newcommand{\acvSectionTopSkip}{0mm}
\newcommand{\acvSectionContentTopSkip}{2.5mm}

%-------------------------------------------------------------------------------
%                Utilities
%-------------------------------------------------------------------------------
% Use to align an element of tabular table
\newcolumntype{L}[1]{>{\raggedright\let\newline\\\arraybackslash\hspace{0pt}}m{#1}}
\newcolumntype{C}[1]{>{\centering\let\newline\\\arraybackslash\hspace{0pt}}m{#1}}
\newcolumntype{R}[1]{>{\raggedleft\let\newline\\\arraybackslash\hspace{0pt}}m{#1}}

% Use to draw horizontal line with specific thickness
\def\vhrulefill#1{\leavevmode\leaders\hrule\@height#1\hfill \kern\z@}

% Use to execute conditional statements by checking empty string
\newcommand*{\ifempty}[3]{\ifthenelse{\isempty{#1}}{#2}{#3}}

% Use to execute conditional statements by checking non-printing string
\newcommand*{\ifnonprint}[3]{
  \setbox0=\hbox{#1\unskip}\ifdim\wd0=0pt
  #2
  \else
  #3
  \fi
}

%-------------------------------------------------------------------------------
%                Document components
%-------------------------------------------------------------------------------
% Define a header for CV
% Usage: \makecvheader
\newcommand*{\makecvheader}[1][C]{%
  \begin{minipage}[c]{\textwidth}
    \ifthenelse{\equal{#1}{L}}{\raggedright}{\ifthenelse{\equal{#1}{R}}{\raggedleft}{\centering}}
    \headerfirstnamestyle{\@firstname}\headerlastnamestyle{{}\acvHeaderNameDelim\@lastname}%
    \\[\acvHeaderAfterNameSkip]%
    \ifthenelse{\isundefined{\@position}}{}{\headerpositionstyle{\@position\\[\acvHeaderAfterPositionSkip]}}%
    \ifthenelse{\isundefined{\@address}}{}{\headeraddressstyle{\@address\\[\acvHeaderAfterAddressSkip]}}%
    \headersocialstyle{%
      \header{}
    } \\[\acvHeaderAfterSocialSkip]%
  \end{minipage}%
}

% Define a footer for CV
% Usage: \makecvfooter{<left>}{<center>}{<right>}
\newcommand*{\makecvfooter}[3]{%
  \fancyfoot{}
  \fancyfoot[L]{\footerstyle{#1}}
  \fancyfoot[C]{\footerstyle{#2}}
  \fancyfoot[R]{\footerstyle{#3}}
}

% Define a section for CV
% Usage: \cvsection{<section-title>}
\newcommand{\cvsection}[1]{%
  \needspace{5\baselineskip}
  \vspace{\acvSectionTopSkip}
  \sectionstyle{#1}
  \phantomsection
  \color{black}\vhrulefill{0.9pt} %horizontal line for each section
}

% Define a subsection for CV
% Usage: \cvsubsection{<subsection-title>}
\newcommand{\cvsubsection}[1]{%
  \needspace{5\baselineskip}
  \vspace{\acvSectionContentTopSkip}
  \vspace{-3mm}
  \subsectionstyle{#1}
  \phantomsection
  % \noindent\color{black}\rule{0.2\textwidth}{0.9pt}
}

% Define a paragraph for CV
\newenvironment{cvparagraph}{%
  \vspace{\acvSectionContentTopSkip}
  \vspace{-3mm}
  \paragraphstyle
}{%
  \par
  % \vspace{2mm}
}

% Define an environment for cventry
\newenvironment{cventries}{%
  \vspace{\acvSectionContentTopSkip}
  \begin{center}
  }{%
  \end{center}
}
% Define an entry of cv information
% Usage: \cventry{<position>}{<title>}{<location>}{<date>}{<description>}
\newcommand*{\cventry}[5]{%
  \vspace{-2mm}
  \setlength\tabcolsep{0pt}
  \setlength{\extrarowheight}{0pt}
  \begin{tabular*}{\textwidth}{@{\extracolsep{\fill}} L{\textwidth - 4.5cm} R{4.5cm}}
    \ifempty{#1#3}
    {\entrypositionstyle{#2} & \entrymetadatastyle{#4} \\}
    {\entrytitlestyle{#1} & \entrymetadatastyle{#3} \\
    \entrypositionstyle{#2} & \entrymetadatastyle{#4} \\}
    \ifstrempty{#5}
    {}
    {\multicolumn{2}{L{\textwidth}}{\descriptionstyle{#5}} \\}
  \end{tabular*}%
}

% Define an environment for cvproject
\newenvironment{cvprojects}{%
  \vspace{\acvSectionContentTopSkip}
  \begin{center}
  }{%
  \end{center}
}
% Define an entry of cv information
% Usage: \cvproject{<project>}{<date>}{<description>}
\newcommand*{\cvproject}[3]{%
  \vspace{-2mm}
  \setlength\tabcolsep{0pt}
  \setlength{\extrarowheight}{0pt}
  \begin{tabular*}{\textwidth}{@{\extracolsep{\fill}} L{\textwidth - 4.5cm} R{4.5cm}}
    \entrytitlestyle{#1} & \entrymetadatastyle{#2} \\
    \multicolumn{2}{L{\textwidth}}{\descriptionstyle{#3}}
  \end{tabular*}%
}

% Define an environment for cvhonor
\newenvironment{cvhonors}{%
  \vspace{\acvSectionContentTopSkip}
  \vspace{-2mm}
  \begin{center}
    \setlength\tabcolsep{0pt}
    \setlength{\extrarowheight}{0pt}
    \begin{tabular*}{\textwidth}{@{\extracolsep{\fill}} C{1.5cm} L{\textwidth - 4.0cm} R{2.5cm}}
    }{%
    \end{tabular*}
  \end{center}
}
% Define a line of cv information(honor, award or something else)
% Usage: \cvhonor{<position>}{<title>}{<location>}{<date>}
% Usage: \cvhonor{<position>}{<title>}{<date>}
\newcommand*{\cvhonor}[3]{%
  \honordatestyle{#3} & \honorpositionstyle{#1}\ifempty{#2}{}{,} \honortitlestyle{#2} & {} \\
}

% Define an environment for cvskill
\newenvironment{cvskills}{%
  \vspace{\acvSectionContentTopSkip}
  \begin{center}
    \setlength\tabcolsep{1ex}
    \setlength{\extrarowheight}{0pt}
    \begin{tabular*}{\textwidth}{@{\extracolsep{\fill}} r L{\textwidth * \real{0.9}}}
    }{%
    \end{tabular*}
  \end{center}
}
% Define a line of cv information(skill)
% Usage: \cvskill{<type>}{<skillset>}
\newcommand*{\cvskill}[2]{%
  \skilltypestyle{#1} & \skillsetstyle{#2} \\
}

% Define an environment for cvitems(for cventry)
\newenvironment{cvitems}{%
  \vspace{-4.0mm}
  \begin{justify}
    \begin{itemize}[leftmargin=2ex, nosep, noitemsep]
        \setlength{\parskip}{0pt}
        \renewcommand{\labelitemi}{\bullet}
      }{%
    \end{itemize}
  \end{justify}
  % \vspace{1.0mm}
}

%-------------------------------------------------------------------------------
%                Bibliography integration
%-------------------------------------------------------------------------------
\RequirePackage[
  bibstyle=awesome-cv,
  citestyle=verbose,
  doi=true,
  minnames=3,
  maxnames=99,
  hyperref=true,
  dateabbrev=false,
  backend=biber
]{biblatex}
