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
%                Identification
%-------------------------------------------------------------------------------
\ProvidesClass{awesome-cv}[Awesome Curriculum Vitae Class]
\NeedsTeXFormat{LaTeX2e}

%-------------------------------------------------------------------------------
%                Class options
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
%                3rd party packages
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
% Needed to use \ifxetex-\else-\fi statement
\RequirePackage{ifxetex}
% Needed to use \if-\then-\else statement
\RequirePackage{xifthen}
% Needed to strip chars from telephone number
\RequirePackage{xstring}
% Needed to use a toolbox of programming tools
\RequirePackage{etoolbox}
% Needed to change line spacing in specific environment
\RequirePackage{setspace}
% Needed to manage fonts
\RequirePackage[quiet]{fontspec}
% To support LaTeX quoting style
\defaultfontfeatures{Ligatures=TeX}
% Needed to manage math fonts
\RequirePackage{unicode-math}
% Needed to use icons from font-awesome
\RequirePackage{fontawesome}
% Needed to use the roboto font
\RequirePackage{roboto}
% Needed to use the sourcesanspro font
\RequirePackage[default,opentype]{sourcesanspro}
% Needed for the photo ID
\RequirePackage[skins]{tcolorbox}
% Needed to deal a paragraphs
\RequirePackage{parskip}
% Needed to deal hyperlink
\RequirePackage[hidelinks,unicode]{hyperref}
\hypersetup{%
  pdftitle={},
  pdfauthor={},
  pdfsubject={},
  pdfkeywords={}
}
% For additional icons (including orcid)
\RequirePackage{academicons}
% Require additional space to be filled by content
\RequirePackage{needspace}

%-------------------------------------------------------------------------------
%                Configuration for layout
%-------------------------------------------------------------------------------
%% Page Layout
% Configure page margins with geometry
\geometry{left=1cm, top=.5cm, right=1cm, bottom=1cm, footskip=0.2cm}

%% Header & Footer
% Set offset to each header and footer
\fancyhfoffset{0em}
% Remove head rule
\renewcommand{\headrulewidth}{0pt}
% Clear all header & footer fields
\fancyhf{}
% Enable if you want to make header or footer using fancyhdr
\pagestyle{fancy}

%-------------------------------------------------------------------------------
%                Configuration for colors
%-------------------------------------------------------------------------------
% Gray-scale colors
\definecolor{white}{HTML}{FFFFFF}
\definecolor{black}{HTML}{000000}
\definecolor{darkgray}{HTML}{333333}
\definecolor{gray}{HTML}{5D5D5D}
\definecolor{lightgray}{HTML}{999999}
% Basic colors
\definecolor{green}{HTML}{C2E15F}
\definecolor{orange}{HTML}{FDA333}
\definecolor{purple}{HTML}{D3A4F9}
\definecolor{red}{HTML}{FB4485}
\definecolor{blue}{HTML}{6CE0F1}
% Text colors
\definecolor{darktext}{HTML}{414141}
\colorlet{text}{darkgray}
\colorlet{graytext}{gray}
\colorlet{lighttext}{lightgray}
% Awesome colors
\definecolor{awesome-emerald}{HTML}{00A388}
\definecolor{awesome-skyblue}{HTML}{0395DE}
\definecolor{awesome-red}{HTML}{DC3522}
\definecolor{awesome-pink}{HTML}{EF4089}
\definecolor{awesome-orange}{HTML}{FF6138}
\definecolor{awesome-nephritis}{HTML}{27AE60}
\definecolor{awesome-concrete}{HTML}{95A5A6}
\definecolor{awesome-darknight}{HTML}{131A28}
\colorlet{awesome}{awesome-red}

% Boolean value to switch section color highlighting
\newbool{acvSectionColorHighlight}
\setbool{acvSectionColorHighlight}{true}

% Awesome section color
\def\@sectioncolor#1#2#3{%
  \ifbool{acvSectionColorHighlight}{{\color{awesome}#1#2#3}}{#1#2#3}%
}

%-------------------------------------------------------------------------------
%                Configuration for fonts
%-------------------------------------------------------------------------------
\newcommand*{\headerfont}{\roboto}
\newcommand*{\headerfontlight}{\robotolight}
\newcommand*{\footerfont}{\sourcesanspro}
\newcommand*{\bodyfont}{\sourcesanspro}
\newcommand*{\bodyfontlight}{\sourcesanspro}

%-------------------------------------------------------------------------------
%                Configuration for styles
%-------------------------------------------------------------------------------
% Configure styles for each CV elements
% For fundamental structures
\newcommand*{\headerfirstnamestyle}[1]{{\fontsize{20pt}{1em}\headerfontlight\color{black} #1}} %32pt
\newcommand*{\headerlastnamestyle}[1]{{\fontsize{20pt}{1em}\headerfont\bfseries\color{black} #1}} %32pt
\newcommand*{\headerpositionstyle}[1]{{\fontsize{8pt}{1em}\bodyfont\scshape\color{black} #1}}%7.6
\newcommand*{\headeraddressstyle}[1]{{\fontsize{7pt}{1em}\headerfont\itshape\color{black} #1}} %8
\newcommand*{\headersocialstyle}[1]{{\fontsize{6.8pt}{1em}\headerfont\color{black} #1}}
\newcommand*{\headerquotestyle}[1]{{\fontsize{9pt}{1em}\bodyfont\itshape\color{black} #1}}
\newcommand*{\footerstyle}[1]{{\fontsize{8pt}{1em}\footerfont\scshape\color{black} #1}}
\newcommand*{\sectionstyle}[1]{{\fontsize{12pt}{1em}\bodyfont\bfseries\color{black}\@sectioncolor #1}}%16
\newcommand*{\subsectionstyle}[1]{{\fontsize{10pt}{1em}\bodyfont\scshape\textcolor{black}{#1}}}%10
\newcommand*{\paragraphstyle}{\fontsize{8pt}{1em}\bodyfontlight\upshape\color{black}} %9

% For elements of entry
\newcommand*{\entrytitlestyle}[1]{{\fontsize{10pt}{1em}\bodyfont\bfseries\color{black} #1}}%10
\newcommand*{\entrypositionstyle}[1]{{\fontsize{9pt}{1em}\bodyfont\scshape\color{black} #1}} %8
\newcommand*{\entrydatestyle}[1]{{\fontsize{8pt}{1em}\bodyfontlight\slshape\color{black} #1}} %8
\newcommand*{\entrylocationstyle}[1]{{\fontsize{8pt}{1em}\bodyfontlight\slshape\color{black} #1}} %9
\newcommand*{\descriptionstyle}[1]{{\fontsize{9pt}{1em}\bodyfontlight\upshape\color{black} #1}} %9

% For elements of subentry
\newcommand*{\subentrytitlestyle}[1]{{\fontsize{8pt}{1em}\bodyfont\mdseries\color{black} #1}}
\newcommand*{\subentrypositionstyle}[1]{{\fontsize{7pt}{1em}\bodyfont\scshape\color{black} #1}}
\newcommand*{\subentrydatestyle}[1]{{\fontsize{7pt}{1em}\bodyfontlight\slshape\color{black} #1}}
\newcommand*{\subentrylocationstyle}[1]{{\fontsize{7pt}{1em}\bodyfontlight\slshape\color{black} #1}}
\newcommand*{\subdescriptionstyle}[1]{{\fontsize{8pt}{1em}\bodyfontlight\upshape\color{black} #1}}

% For elements of honor
\newcommand*{\honortitlestyle}[1]{{\fontsize{9pt}{1em}\bodyfont\upshape\color{black} #1}}
\newcommand*{\honorpositionstyle}[1]{{\fontsize{9pt}{1em}\bodyfont\bfseries\color{black} #1}}
\newcommand*{\honordatestyle}[1]{{\fontsize{9pt}{1em}\bodyfont\color{black} #1}}
% \newcommand*{\honorlocationstyle}[1]{{\fontsize{9pt}{1em}\bodyfontlight\slshape\color{black} #1}}

% For elements of skill
\newcommand*{\skilltypestyle}[1]{{\fontsize{10pt}{1em}\bodyfont\bfseries\color{black} #1}}
\newcommand*{\skillsetstyle}[1]{{\fontsize{9pt}{1em}\bodyfontlight\color{black} #1}}

% For elements of the cover letter
\newcommand*{\lettersectionstyle}[1]{{\fontsize{14pt}{1em}\bodyfont\bfseries\color{black}\@sectioncolor #1}}
\newcommand*{\recipientaddressstyle}[1]{{\fontsize{9pt}{1em}\bodyfont\scshape\color{black} #1}}
\newcommand*{\recipienttitlestyle}[1]{{\fontsize{11pt}{1em}\bodyfont\bfseries\color{black} #1}}
\newcommand*{\lettertitlestyle}[1]{{\fontsize{10pt}{1em}\bodyfontlight\bfseries\color{black} \underline{#1}}}
\newcommand*{\letterdatestyle}[1]{{\fontsize{9pt}{1em}\bodyfontlight\slshape\color{black} #1}}
\newcommand*{\lettertextstyle}{\fontsize{10pt}{1.4em}\bodyfontlight\upshape\color{black}}
\newcommand*{\letternamestyle}[1]{{\fontsize{10pt}{1em}\bodyfont\bfseries\color{black} #1}}
\newcommand*{\letterenclosurestyle}[1]{{\fontsize{10pt}{1em}\bodyfontlight\slshape\color{black} #1}}

%-------------------------------------------------------------------------------
%                Commands for personal information
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

% % Define photo ID
% % Usage: \photo[circle|rectangle,edge|noedge,left|right]{<path-to-image>}
\newcommand{\photo}[2][circle,edge,left]{%
  \def\@photo{#2}
  \@for\tmp:=#1\do{%
    \ifthenelse{\equal{\tmp}{circle} \or \equal{\tmp}{rectangle}}%
    {\let\@photoshape\tmp}{}%
    \ifthenelse{\equal{\tmp}{edge} \or \equal{\tmp}{noedge}}%
    {\let\@photoedge\tmp}{}%
    \ifthenelse{\equal{\tmp}{left} \or \equal{\tmp}{right}}%
    {\let\@photoalign\tmp}{}%
  }%
}
\def\@photoshape{circle}
\def\@photoedge{edge}
\def\@photoalign{left}

% Define writer's name
% Usage: \name{<firstname>}{<lastname>}
% Usage: \firstname{<firstname>}
% Usage: \lastname{<lastname>}
% Usage: \familyname{<familyname>}
\newcommand*{\name}[2]{\def\@firstname{#1}\def\@lastname{#2}}
\newcommand*{\firstname}[1]{\def\@firstname{#1}}
\newcommand*{\lastname}[1]{\def\@lastname{#1}}
\newcommand*{\familyname}[1]{\def\@lastname{#1}}
\def\@familyname{\@lastname}

% Define writer's address
% Usage: \address{<address>}
\newcommand*{\address}[1]{\def\@address{#1}}

% Define writer's position
% Usage: \position{<position>}
\newcommand*{\position}[1]{\def\@position{#1}}

% Defines writer's mobile (optional)
% Usage: \mobile{<mobile number>}
\newcommand*{\mobile}[1]{%
  \def\@mobile{#1}
  \def\@teluri{tel:\@mobile}
  % Strip unwanted characters
  \StrDel{\@teluri}{ }[\@teluri]%
  \StrDel{\@teluri}{-}[\@teluri]%
  \StrDel{\@teluri}{(}[\@teluri]%
  \StrDel{\@teluri}{)}[\@teluri]%
  \headeradd{\href{\@teluri}{\faMobile\acvHeaderIconSep\@mobile}}%
}

% Defines writer's email (optional)
% Usage: \email{<email address>}
\newcommand*{\email}[1]{\headersocial{\faEnvelope}{mailto:}{#1}}

% Defines writer's homepage (optional)
% Usage: \homepage{<url>}
\newcommand*{\homepage}[1]{\headersocial{\faHome}{https://}{#1}}

% Defines writer's linked-in (optional)
% Usage: \linkedin{<linked-in-nick>}
\newcommand*{\linkedin}[1]{\headersocial{\faLinkedinSquare}{https://www.linkedin.com/in/}{#1}}

% Defines writer's github (optional)
% Usage: \github{<github-nick>}
\newcommand*{\github}[1]{\headersocial{\faGithub}{https://github.com/}{#1}}

% Defines writer's gitlab (optional)
% Usage: \gitlab{<gitlab-nick>}
\newcommand*{\gitlab}[1]{\headersocial{\faGitlab}{https://gitlab.com/}{#1}}

% Defines writer's stackoverflow profile (optional)
% Usage: \stackoverflow{<so userid>}{<so username>}
%   e.g.https://stackoverflow.com/users/123456/sam-smith
%       would be \stackoverflow{123456}{sam-smith}
\newcommand*{\stackoverflow}[2]{\headeradd{\href{https://stackoverflow.com/users/#1}{\faStackOverflow\acvHeaderIconSep#2}}}

% Defines writer's twitter (optional)
% Usage: \twitter{<twitter handle>}
\newcommand*{\twitter}[1]{\headerSocial{\faTwitter}{https://twitter.com/}{#1}}

% Defines writer's skype (optional)
% Usage: \skype{<skype account>}
\newcommand*{\skype}[1]{\headeradd{\faSkype\acvHeaderIconSep#1}}

% Defines writer's reddit (optional)
% Usage: \reddit{<reddit account>}
\newcommand*{\reddit}[1]{\headersocial{\faReddit}{https://www.reddit.com/user/}{#1}}

% Defines writer's medium profile (optional)
% Usage: \medium{<medium account>}
\newcommand*{\medium}[1]{\headersocial{\faMedium}{https://medium.com/@}{#1}}

% Defines writer's google scholar profile (optional)
% Usage: \googlescholar{<googlescholar userid>}{<googlescholar username>}
% e.g.https://scholar.google.co.uk/citations?user=wpZDx1cAAAAJ
% would be \googlescholar{wpZDx1cAAAAJ}{Name-to-display-next-icon}
% If 'googlescholar-name' is not provided than it defaults to
% '\firstname \lastname'
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
\newcommand*{\orcid}[1]{\headersocial{\aiOrcid}{https://orcid.org/}{#1}}

% Defines writer's extra informations (optional)
% Usage: \extrainfo{<extra informations>}
\newcommand*{\extrainfo}[1]{\headeradd{#1}}

% Defines writer's quote (optional)
% Usage: \quote{<quote>}
\renewcommand*{\quote}[1]{\def\@quote{#1}}

% Defines recipient's information (cover letter only)
% Usage: \recipient{<recipient name>}{<recipient address>}
% Usage: \recipientname{<recipient name>}
% Usage: \recipientaddress{<recipient address>}
\newcommand*{\recipient}[2]{\def\@recipientname{#1}\def\@recipientaddress{#2}}
\newcommand*{\recipientname}[1]{\def\@recipientname{#1}}
\newcommand*{\recipientaddress}[1]{\def\@recipientaddress{#1}}

% Defines the title for letter (cover letter only, optional)
% Usage: \lettertitle{<title>}
\newcommand*{\lettertitle}[1]{\def\@lettertitle{#1}}

% Defines the date for letter (cover letter only)
% Usage: \letterdate{<date>}
\newcommand*{\letterdate}[1]{\def\@letterdate{#1}}

% Defines a message of opening for letter (cover letter only)
% Usage: \letteropening{<message>}
\newcommand*{\letteropening}[1]{\def\@letteropening{#1}}

% Defines a message of closing for letter (cover letter only)
% Usage: \letterclosing{<message>}
\newcommand*{\letterclosing}[1]{\def\@letterclosing{#1}}

% Defines an enclosure for letter (cover letter only, optional)
% Usage: \letterenclosure[<enclosure name>]{<enclosure>}
\newcommand*{\letterenclname}[1][Enclosure]{\def\@letterenclname{#1}}
\newcommand*{\letterenclosure}[2][]{%
  % if an optional argument is provided, use it to redefine \enclname
  \ifthenelse{\equal{#1}{}}{}{\def\@letterenclname{#1}}
  \def\@letterenclosure{#2}
}

%-------------------------------------------------------------------------------
%                Commands for extra
%-------------------------------------------------------------------------------
%% Define helper macros a user can change easily
% Header
\newcommand{\acvHeaderNameDelim}{\space}
\newcommand{\acvHeaderAfterNameSkip}{.4mm}
\newcommand{\acvHeaderAfterPositionSkip}{.4mm}
\newcommand{\acvHeaderAfterAddressSkip}{-.5mm}
\newcommand{\acvHeaderIconSep}{\space}
\newcommand{\acvHeaderSocialSep}{\quad\textbar\quad}
\newcommand{\acvHeaderAfterSocialSkip}{6mm}
\newcommand{\acvHeaderAfterQuoteSkip}{5mm}

% Others
\newcommand{\acvSectionTopSkip}{0mm} %3 mm
\newcommand{\acvSectionContentTopSkip}{2.5mm} %2.5 mm

%-------------------------------------------------------------------------------
%                Commands for utilities
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
%                Commands for elements of CV structure
%-------------------------------------------------------------------------------
% Define a header for CV
% Usage: \makecvheader
\newcommand*{\makecvheader}[1][C]{%
  % Formatting for photo
  \newcommand*{\drawphoto}{%
    \ifthenelse{\isundefined{\@photo}}{}{%
      \newlength{\photodim}
      \ifthenelse{\equal{\@photoshape}{circle}}%
      {\setlength{\photodim}{1.3cm}}%
      {\setlength{\photodim}{1.8cm}}%
      \ifthenelse{\equal{\@photoedge}{edge}}%
      {\def\@photoborder{darkgray}}%
      {\def\@photoborder{none}}%
      \begin{tikzpicture}%
        \node[\@photoshape, draw=\@photoborder, line width=0.3mm, inner sep=\photodim, fill overzoom image=\@photo] () {};
      \end{tikzpicture}
    }%
  }
  \newlength{\headertextwidth}
  \newlength{\headerphotowidth}
  \ifthenelse{\isundefined{\@photo}}{
    \setlength{\headertextwidth}{\textwidth}
    \setlength{\headerphotowidth}{0cm}
  }{%
    \setlength{\headertextwidth}{0.76\textwidth}
    \setlength{\headerphotowidth}{0.24\textwidth}
  }%
  \begin{minipage}[c]{\headerphotowidth}%
    \ifthenelse{\equal{\@photoalign}{left}}{\raggedright\drawphoto}{}
  \end{minipage}

  % Formatting rest of header
  \begin{minipage}[c]{\headertextwidth}
    \ifthenelse{\equal{#1}{L}}{\raggedright}{\ifthenelse{\equal{#1}{R}}{\raggedleft}{\centering}}
    \headerfirstnamestyle{\@firstname}\headerlastnamestyle{{}\acvHeaderNameDelim\@lastname}%
    \\[\acvHeaderAfterNameSkip]%
    \ifthenelse{\isundefined{\@position}}{}{\headerpositionstyle{\@position\\[\acvHeaderAfterPositionSkip]}}%
    \ifthenelse{\isundefined{\@address}}{}{\headeraddressstyle{\@address\\[\acvHeaderAfterAddressSkip]}}%
    \headersocialstyle{%
      \header{}
    } \\[\acvHeaderAfterSocialSkip]%
    \ifthenelse{\isundefined{\@quote}}%
    {}%
    {\headerquotestyle{\@quote\\}\vspace{\acvHeaderAfterQuoteSkip}}%
  \end{minipage}%
  \begin{minipage}[c]{\headerphotowidth}%
    \ifthenelse{\equal{\@photoalign}{right}}{\raggedleft\drawphoto}{}
  \end{minipage}
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
}

% Define a paragraph for CV
\newenvironment{cvparagraph}{%
  \vspace{\acvSectionContentTopSkip}
  \vspace{-3mm}
  \paragraphstyle
}{%
  \par
  \vspace{2mm}
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
    {\entrypositionstyle{#2} & \entrydatestyle{#4} \\}
    {\entrytitlestyle{#1} & \entrylocationstyle{#3} \\
    \entrypositionstyle{#2} & \entrydatestyle{#4} \\}
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
    \entrytitlestyle{#1} & \entrydatestyle{#2} \\
    \multicolumn{2}{L{\textwidth}}{\descriptionstyle{#3}}
  \end{tabular*}%
}

% Define an environment for cvsubentry
\newenvironment{cvsubentries}{%
  \begin{center}
  }{%
  \end{center}
}
% Define a subentry of cv information
% Usage: \cvsubentry{<position>}{<title>}{<date>}{<description>}
\newcommand*{\cvsubentry}[4]{%
  \vspace{-2mm}
  \setlength\tabcolsep{0pt}
  \setlength{\extrarowheight}{0pt}
  \begin{tabular*}{\textwidth}{@{\extracolsep{\fill}} L{\textwidth - 4.5cm} R{4.5cm}}
    \setlength\leftskip{0.2cm}
    \subentrytitlestyle{#2} & \ifthenelse{\equal{#1}{}}
    {\subentrydatestyle{#3}}{}
    \ifthenelse{\equal{#1}{}}
    {}
    {\subentrypositionstyle{#1} & \subentrydatestyle{#3} \\}
    \ifthenelse{\equal{#4}{}}
    {}
    {\multicolumn{2}{L{17.0cm}}{\subdescriptionstyle{#4}} \\}
  \end{tabular*}
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
%                Commands for elements of Cover Letter
%-------------------------------------------------------------------------------
% Define an environment for cvletter
\newenvironment{cvletter}{%
  \lettertextstyle
}{%
}

% Define a section for the cover letter
% Usage: \lettersection{<section-title>}
\newcommand{\lettersection}[1]{%
  \par\addvspace{2.5ex}
  \phantomsection{}
  \lettersectionstyle{#1}
  \color{gray}\vhrulefill{0.9pt}
  \par\nobreak\addvspace{0.4ex}
}

% Define a title of the cover letter
% Usage: \makelettertitle
\newcommand*{\makelettertitle}{%
  \vspace{8.4mm}
  \setlength\tabcolsep{0pt}
  \setlength{\extrarowheight}{0pt}
  \begin{tabular*}{\textwidth}{@{\extracolsep{\fill}} L{\textwidth - 4.5cm} R{4.5cm}}
    \recipienttitlestyle{\@recipientname} & \letterdatestyle{\@letterdate}
  \end{tabular*}
  \begin{singlespace}
    \recipientaddressstyle{\@recipientaddress} \\\\
  \end{singlespace}
  \ifthenelse{\isundefined{\@lettertitle}}
  {}
  {\lettertitlestyle{\@lettertitle} \\}
  \lettertextstyle{\@letteropening}
}

% Define a closing of the cover letter
% Usage: \makeletterclosing
\newcommand*{\makeletterclosing}{%
  \vspace{3.4mm}
  \lettertextstyle{\@letterclosing} \\\\
  \letternamestyle{\@firstname\ \@lastname}
  \ifthenelse{\isundefined{\@letterenclosure}}
  {\\}
  {%
    \\\\\\
    \letterenclosurestyle{\@letterenclname: \@letterenclosure} \\
  }
}

%-------------------------------------------------------------------------------
%                Bibliography
%-------------------------------------------------------------------------------
%\RequirePackage[style=verbose, maxnames=99, sorting=ydnt]{biblatex}
\RequirePackage[ % BibLaTeX
  sorting=ymdnt, % Sorts entries using custom sorting order defined below
  style=verbose,
  doi=true,
  % isbn=true,
  % url=false,
  % eprint=false,
  % backref = false, % include back references in bibliography
  minnames=3,
  maxnames=99,
  hyperref=true,
  dateabbrev=false,
  % block=none,
  backend=biber % {Options: bibtex, biber}
]{biblatex}

% Avoid splitting entries across page break (only for 3 or fewer lines)
% Tip: http://tex.stackexchange.com/a/51261
\AtBeginEnvironment{thebibliography}{%
  \clubpenalty10000
  \@clubpenalty \clubpenalty
  \widowpenalty10000
\interlinepenalty5000}

% Customized format, based on Fancy CV template created by Adrien Friggeri
\DeclareFieldFormat[article]{title}{#1\par}
\DeclareFieldFormat[inproceedings]{title}{#1\par}
\DeclareFieldFormat[misc]{title}{#1\par}
\DeclareFieldFormat[report]{title}{#1\par}
\DeclareFieldFormat[incollection]{title}{#1\par}
\DeclareFieldFormat[patent]{title}{#1\par}
\DeclareFieldFormat[thesis]{title}{#1\par}
\DeclareFieldFormat[article,inproceedings]{number}{\mkbibparens{#1}}
\DeclareFieldFormat[article,inproceedings]{pages}{#1}
\DeclareFieldFormat{doi}{%
  doi\addcolon\space
  \ifhyperref
  {\lowercase{\href{https://doi.org/#1}{\nolinkurl{#1}}}}
{\lowercase{\nolinkurl{#1}}}}
\renewcommand*{\bibpagespunct}{\addcolon}
\DeclareDelimFormat{finalnamedelim}{\addcomma\space}
\DeclareFieldFormat{pubstate}{\MakeCapital{#1}.}

\DeclareBibliographyDriver{article}{%
  \entrytitlestyle{\printfield{title}}%
  \newblock%
  \entrypositionstyle{\printnames{author}}%
  \par%
  \newblock%
  \descriptionstyle{%
    \usebibmacro{journal}%
    \newunitpunct%
    \printfield{year}%
    \setunit{\addsemicolon}%
    \printfield{volume}%
    \printfield{number}%
    \setunit{\bibpagespunct}%
    \printfield{pages}%
    \setunit{\adddot\addspace}%
    \printfield{doi}%
    \finentrypunct%
    \printfield{pubstate}%
  }
  \par\vspace{0.1\baselineskip}
}

\DeclareBibliographyDriver{inproceedings}{%
  \entrytitlestyle{\printfield{title}}%
  \newblock%
  \entrypositionstyle{\printnames{author}}%
  \par%
  \newblock%
  \descriptionstyle{%
    \printfield{booktitle}%
    \newunitpunct%
    \printfield{year}%
    \setunit{\addsemicolon}%
    \printfield{volume}%
    \printfield{number}%
    \setunit{\bibpagespunct}%
    \printfield{pages}%
    \setunit{\adddot\addspace}%
    \printfield{doi}%
    \finentrypunct%
  }
  \par\vspace{0.1\baselineskip}
}

\DeclareBibliographyDriver{incollection}{%
  \entrytitlestyle{\printfield{title}}%
  \newblock%
  \entrypositionstyle{\printnames{author}}%
  \par%
  \newblock%
  \descriptionstyle{%
    \printfield{booktitle}%
    \setunit{\addcomma\space}%
    \printfield{year}%
    \setunit{\addcomma\space}%
    \printfield{location}%
    \finentrypunct%
  }
  \par\vspace{0.1\baselineskip}
}

\DeclareBibliographyDriver{misc}{%
  \entrytitlestyle{\printfield{title}}%
  \newblock%
  \entrypositionstyle{\printnames{author}}%
  \par%
  \newblock%
  \descriptionstyle{%
    \printfield{note}%
    \printfield{eventtitle}%
    \setunit{\addsemicolon\space}%
    \usebibmacro{date}%
    \setunit{\addsemicolon\space}%
    \printfield{location}%
    \printfield{venue}%
    \finentrypunct%
  }
  \par\vspace{0.1\baselineskip}
}

\DeclareBibliographyDriver{report}{%
  \entrytitlestyle{\printfield{title}}%
  \newblock%
  \entrypositionstyle{\printnames{author}}%
  \par%
  \newblock%
  \descriptionstyle{%
    \printfield{type}%
    \setunit{\space}%
    \printfield{number}%
    \setunit{\addcomma\space}%
    \printfield{year}%
    \finentrypunct%
  }
  \par\vspace{0.1\baselineskip}
}

\DeclareBibliographyDriver{patent}{%
  \entrytitlestyle{\printfield{title}}%
  \newblock%
  \entrypositionstyle{\printnames{author}}%
  \par%
  \newblock%
  \descriptionstyle{%
    \printnames{holder}%
    \setunit{\addcomma\space}%
    \printfield{number}%
    \setunit{\addcomma\space}%
    \usebibmacro{date}%
    \finentrypunct%
  }
  \par\vspace{0.1\baselineskip}
}

\DeclareBibliographyDriver{thesis}{%
  \entrytitlestyle{\printfield{title}}%
  \newblock%
  \entrypositionstyle{\printnames{author}}%
  \par%
  \newblock%
  \descriptionstyle{%
    \printlist{institution}%
    \setunit{\addcomma\space}%
    \printfield{type}%
    \setunit{\addcomma\space}%
    \printfield{year}%
    \finentrypunct%
  }
  \par\vspace{0.1\baselineskip}
}

\DeclareNameFormat{author}{%
  \fontsize{8pt}{1em}\bodyfontlight%
  \renewcommand*{\multinamedelim}{\addcomma\addspace}%
  \nameparts{#1}%
  \usebibmacro{name:family-given}
  {\namepartfamily\nopunct}
  {\namepartgiveni}
  {\namepartprefix}
  {\namepartsuffix}%
  \usebibmacro{name:andothers}%
}

% Add custom sorting. We sort by year (descending), month (descending), name,
% title.
\DeclareSortingTemplate{ymdnt}{
  \sort{\field{presort}}
  \sort[final]{\field{sortkey}}
  \sort[direction=descending]{\field{sortyear}\field{year}\literal{9999}}
  \sort[direction=descending]{
    \field[padside=left,padwidth=2,padchar=0]{month}
    \literal{99}
  }
  % Don't sort by day!
  % \sort[direction=descending]{
  %   \field[padside=left,padwidth=2,padchar=0]{day}
  %   \literal{99}
  % }
  \sort{
    \field{sortname}
    \field{author}
    \field{editor}
    \field{translator}
    \field{sorttitle}
    \field{title}
  }
  \sort{\field{sorttitle}}
}