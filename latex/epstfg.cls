\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{epstfg}[2016/02/03 EPS End-of-degree template]

%%% Options

\DeclareOption{palatino}{%
	\renewcommand{\rmdefault}{ppl}
	\renewcommand{\sfdefault}{fla}
	\renewcommand{\ttdefault}{lmtt}
	\renewcommand*{\familydefault}{\rmdefault}
	\PassOptionsToClass{11pt}{memoir}
	\message{Loading Palatino fonts}
}

\DeclareOption{sansserif}{
	\renewcommand*{\familydefault}{\sfdefault}
	\PassOptionsToClass{12pt}{memoir}
	\message{Loading Sans-Serif fonts}
}

\newif\if@twoside
\DeclareOption{oneside}{
	\PassOptionsToClass{oneside}{memoir}
	\@twosidefalse
}

\DeclareOption{twoside}{
	\PassOptionsToClass{twoside}{memoir}
	\@twosidetrue
}

\DeclareOption{spanish}{\def\@use@lang{spa}}
\DeclareOption{english}{\def\@use@lang{eng}}

\newif\if@draftbanner
\DeclareOption{draftbanner}{\@draftbannertrue}
\DeclareOption{nodraftbanner}{\@draftbannerfalse}

\DeclareOption*{\PassOptionsToClass{\CurrentOption}{memoir}}

\ExecuteOptions{palatino,twoside,draftbanner,spanish}
\ProcessOptions\relax

\LoadClass[a4paper]{memoir}

%% Load packages
\RequirePackage[usenames,dvipsnames]{xcolor}
\RequirePackage[left=3cm,right=3cm,top=3cm,bottom=2cm]{geometry}
\RequirePackage{imakeidx} % Correct index creation
\RequirePackage[pdfencoding=auto,psdextra,final]{hyperref}
\RequirePackage[acronym, toc]{glossaries}
\RequirePackage[spanish,es-noquoting,es-noshorthands,es-tabla,english]{babel}
\RequirePackage{amsthm}
\RequirePackage{amsmath}
\RequirePackage{amsfonts}
\RequirePackage{amssymb}
\RequirePackage{framed}
\RequirePackage{mdframed}
\RequirePackage[T1]{fontenc}
\RequirePackage[utf8x]{inputenc}
\RequirePackage[final]{graphicx}
\RequirePackage{setspace}
\RequirePackage{collect}
\RequirePackage{lastpage}
\RequirePackage{imakeidx}
\RequirePackage{langvariables}
\RequirePackage{lato}
\RequirePackage{caption}
\RequirePackage{algpseudocode}
\RequirePackage{float}

% Avoid widow/orphan lines
\widowpenalty10000
\clubpenalty10000
\raggedbottom

% Try to remove hyphenation as much as possible
\pretolerance=9000
\tolerance=2000
\emergencystretch=2pt

% Algorithm floats
\newfloat{algorithm}{t}{lop}[chapter]
\floatname{algorithm}{\@nameuse{algorithm-\@default@lang}}

\makeindex[intoc]
\indexsetup{firstpagestyle = chapter}

\PrerenderUnicode{ÁáÉéÍíÓóÚúÑñ} % Ensure spanish characters are accepted

\selectlang{\@use@lang}

\ifdraftdoc\else
	\@draftbannerfalse % Do not activate the banner in the titlepage unless we're in draft mode.
\fi

% Paragraph formatting
\setlength{\parskip}{0.5\baselineskip}

% Some color definitions
\colorlet{bannercolor}{Bittersweet}
\colorlet{linkcolor}{blue!50!black}
\definecolor[named]{chapnumcolor}{HTML}{86001a}

% Glossary and acronyms
\setacronymstyle{long-short}
\makenoidxglossaries
\renewcommand{\acronymname}{\@nameuse{acronyms-\@default@lang}}
\glsdisablehyper % glossaries hyperlinks don't work correctly.

% Hyperref settings
\hypersetup{
	hyperindex,
	colorlinks,
	allcolors = linkcolor
}

% Page styling
\pagestyle{ruled}

\def\titlefootstyle{\footnotesize}
\def\pagenumberstyle{\small}

% Footer for odd pages
\makeoddfoot{ruled}
	{\ifdraftdoc\textit{\tiny\@nameuse{draft-spa}}\fi}	% left
	{\titlefootstyle\@nameuse{title-spa}}				% center
	{\pagenumberstyle\thepage}							% right

% Same as above: left, center, right footers on even pages.
\makeevenfoot{ruled}
	{\pagenumberstyle\thepage}
	{\titlefootstyle\@nameuse{title-eng}}
	{\ifdraftdoc\textit{\tiny\@nameuse{draft-eng}}\fi}

% Same, just with the headers.
\makeevenhead{ruled}
	{\sffamily\scshape\leftmark}
	{}
	{}

\makeoddhead{ruled}
	{}
	{}
	{\sffamily\small\rightmark}

% Put a horizontal line above the footers.
\makefootrule{ruled}{\textwidth}{0.7pt}{2pt}

% Set plain pagestyle for chapter pages.
\copypagestyle{chapter}{plain}

% Fix styling in chapter pages to add the footers.
\def\@fixchapterstyle{
	\makeoddfoot{chapter}
		{\ifdraftdoc\textit{\tiny\@nameuse{draft-spa}}\fi}
		{\titlefootstyle\@nameuse{title-spa}}
		{\pagenumberstyle\thepage}

	\makefootrule{chapter}{\textwidth}{0.7pt}{2pt}
}

% Fix styling (footer, header) in frontmatter
\copypagestyle{frontmatterstyle}{plain}

\makeoddfoot{frontmatterstyle}{}{\pagenumberstyle\thepage}{}
\makeevenfoot{frontmatterstyle}{}{\pagenumberstyle\thepage}{}


% TOC fixes
\newlength{\extratocentriesskip}
\setlength{\extratocentriesskip}{2pt}

% No separation between chapters in the
% frontmatter (e.g., table of contents, list of
% figures/tables).
\setlength{\cftbeforechapterskip}{\extratocentriesskip}


\def\@mainmattertocsettings{
	\addtocontents{toc}{
		\setlength{\cftbeforechapterskip}{10pt}
	} % Restore separation between chapters in TOC.
	\addtocontents{toc}{
		\vspace{10pt}
	}	% Extra separation between frontmatter and mainmatter chapters in TOC.
}

% Patch \mainmatter to introduce fixes in chapter styling, toc and more.
\let\@internal@mainmatter\mainmatter
\def\mainmatter{
	\pagestyle{ruled}
	\@internal@mainmatter
	\@fixchapterstyle
	\@mainmattertocsettings
}

% Same with \backmatter, patch to fix ToC.
\let\@internal@backmatter\backmatter
\def\backmatter{
	\addtocontents{toc}{
		\vspace{10pt}
		\setlength{\cftbeforechapterskip}{\extratocentriesskip}
	}
	\@internal@backmatter
}

\if@twoside
	\let\clearsidepage\cleardoublepage
\else
	\let\clearsidepage\clearpage
\fi

\let\@internal@frontmatter\frontmatter
\def\frontmatter{
	\@internal@frontmatter
	\pagenumbering{Roman}
	\pagestyle{frontmatterstyle}
}

% Division styling
\headstyles{memman}
\chapterstyle{pedersen}

\renewcommand{\chaptitlefont}{\HUGE\sffamily\scshape}
\renewcommand{\afterchapskip}{200pt}

% Change the chapter number style
\renewcommand*{\printchapternum}{% Align baselines with the chapter title
\sidebar{
	\raisebox{-1.2\baselineskip}[0pt][0pt]{
	\makebox[0pt][l]{
	\resizebox{!}{\midchapskip}{
		\color{chapnumcolor}\chapnumfont\thechapter
}}}}}

\setsecheadstyle{\sffamily\Large}
\setsubsecheadstyle{\sffamily\bfseries}
\setparaheadstyle{\sffamily\bfseries}

% Reduce the spacing before the sections and subsections
\renewcommand{\beforesecskip}{15pt}
\renewcommand{\beforesubsecskip}{10pt}

% Show subsections in the table of contents
\setsecnumdepth{subsection}
\setcounter{tocdepth}{3}

% Caption setups
\captionsetup[figure]{font = {small, sf}, labelfont = {bf}}
\captionsetup[table]{font = {small, sf}, labelfont = {bf}}
\captionsetup[algorithm]{font = {small, sf}, labelfont = {bf}}

% Useful commands
\newcommand{\todo}[1]{
	\textcolor{red}{#1}
	\marginpar{\textcolor{red}{\textit{\hspace{4pt}TODO}}}
}

% For input of gnuplot files. Automatically resizes the image based on linewidth.
% Note: use latexmk to compile so it detects the dependency with .gp wiles.
\newcommand{\inputgnuplot}[2][1]{
	\vspace{-2ex}
	\resizebox{#1\linewidth}{!}{
		\IfFileExists{#2.tex}{
			\fontsize{7pt}{7pt}\fontfamily{ppl}\selectfont
			\input{#2.tex}
			\vspace{-15pt} % Adjust for font size
		}{
			\PackageWarning{epstfg}{File `#2.tex' not found.}
			\fbox{Gnuplot not found.\begin{minipage}{4.7in}\hfill\vspace{3in}\end{minipage}}
		}
	}
	\vspace{-3ex}
}

% Title page
\let\maketitle\relax
\newcommand{\maketitle}[1][spa]{
	\if@twoside
		\cleardoublepage
	\else
		\clearpage
	\fi
	\thispagestyle{empty}
	\begin{center}
	\textsc{\LARGE\@theuniversity}
	\vspace{15pt}
	\par{\Large\@thecenter}

	\vspace{30pt}
	\begin{minipage}{\textwidth}
	\centering
	\raisebox{-0.5\height}{\includegraphics[width=4cm]{\@thecenterlogo}}
	\hspace{20pt}
	\raisebox{-0.5\height}{\includegraphics[width=4cm]{\@theuniversitylogo}}
	\end{minipage}

	\vspace{100pt}
	{\fontfamily{fla}\selectfont\textbf{\@nameuse{degree-#1}}}

	\vspace{15pt}
	{\fontfamily{fla}\selectfont\textbf{\MakeUppercase{\Huge\@nameuse{endofdegree-#1}}}}

	\vspace{30pt}
	\textsc{\Large\begin{OnehalfSpace}\@nameuse{title-#1}\end{OnehalfSpace}}

	\vfill

	\if@draftbanner
		\begingroup
		\color{bannercolor}
		\noindent\makebox[\linewidth]{\rule{1.1\paperwidth}{2pt}}
		\vspace{-6pt}

		\textit{\Large\@nameuse{draft-#1}}

		\noindent\makebox[\linewidth]{\rule{1.1\paperwidth}{2pt}}

		\vspace{50pt}
		\endgroup
	\fi

	{\large
		\theauthor
		\vspace{5pt}

		\if@tutorpresent\@nameuse{tutor-#1}: \thetutor\\\fi
		\if@ponentpresent\@nameuse{ponent-#1}: \theponent\fi
	}

	\vspace{10pt}
	\@nameuse{date-#1}

	\end{center}
	\newpage
	\setcounter{page}{0}
}

\newcommand{\makeinnertitle}[1][spa]{ % For second (internal) titles
	\if@twoside
		\cleardoublepage
	\else
		\clearpage
	\fi
	\thispagestyle{empty}
	\begin{center}
	\centering
	\vspace{30pt}
	\ifdraftdoc\textit{\Large\@nameuse{draft-#1} - \today}\par\fi
	\textsc{\LARGE\begin{OnehalfSpace}\@nameuse{title-#1}\end{OnehalfSpace}}

	\vspace{150pt}
	{\large
		\@nameuse{author-#1}: \theauthor\\
		\if@tutorpresent\@nameuse{tutor-#1}: \thetutor\\\fi
		\if@ponentpresent\@nameuse{ponent-#1}: \theponent\\\fi
	}

	\vfill
	{\large
		\if@grouppresent\@nameuse{group-#1}\\\fi
		\if@departmentpresent\@nameuse{department-#1}\\\fi
		\@thecenter\\
		\@theuniversity

		\vspace{15pt}
		\@nameuse{date-#1}
	}

	\end{center}
	\newpage
	\setcounter{page}{0}
}

%% Abstract and keywords

\definecollection{abstract-contents-spa}
\definecollection{abstract-contents-eng}
\let\abstract\@undefined
\let\endabstract\@undefined
\newenvironment{abstract}[1][spa]
{
	\@nameuse{collect}{abstract-contents-#1}{}{}{}{}
}
{\@nameuse{endcollect}}

\newif\if@keywordspresent
\newcommand{\keywords}[2][spa]{\@namedef{keywords-contents-#1}{#2}\@keywordspresenttrue}

\newcommand{\makeabstract}[1][spa]{
	\if@twoside
		\cleardoublepage
	\else
		\clearpage
	\fi
	\chapter*{\@nameuse{abstract-#1}}

	\paragraph{\bfseries\@nameuse{abstract-#1}}
	\includecollection{abstract-contents-#1}

	\par\vspace{10pt}
	\if@keywordspresent
		\paragraph{\bfseries\@nameuse{keywords-#1}}
		\@nameuse{keywords-contents-#1}
	\fi
	\newpage
}


