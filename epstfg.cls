\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{epstfg}[2016/02/03 EPS End-of-degree template]

%%% Options

\DeclareOption{palatino}{%
	\renewcommand{\rmdefault}{ppl}
	\renewcommand{\sfdefault}{lmss}
	\renewcommand{\ttdefault}{lmtt}
	\renewcommand*{\familydefault}{\rmdefault}
	\def\@fontsizeopt{11pt}
	\message{Loading Palatino fonts}
}

\DeclareOption{sansserif}{
	\renewcommand*{\familydefault}{\sfdefault}
	\def\@fontsizeopt{12pt}
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

\DeclareOption*{\PassOptionsToClass{\CurrentOption}{memoir}}

\ExecuteOptions{palatino, twoside}
\ProcessOptions\relax

\PassOptionsToClass{\@fontsizeopt}{memoir}
\LoadClass[a4paper]{memoir}

%% Load packages
\RequirePackage[usenames,dvipsnames]{xcolor}
\RequirePackage[left=3cm,right=3cm,top=3cm,bottom=2cm]{geometry}
\RequirePackage{imakeidx} % Correct index creation
\RequirePackage[spanish,es-noquoting,es-noshorthands,english]{babel}
\RequirePackage{amsthm}
\RequirePackage{framed}
\RequirePackage{mdframed}
\RequirePackage[pdfencoding=auto,psdextra]{hyperref}
\RequirePackage[T1]{fontenc}
\RequirePackage[utf8x]{inputenc}
\RequirePackage{graphicx}
\RequirePackage{setspace}

\PrerenderUnicode{ÁáÉéÍíÓóÚúÑñ} % Ensure spanish characters are accepted
\selectlanguage{spanish}
\strictpagecheck

% Constants
\def\@theuniversity{Universidad Aut\'onoma de Madrid}
\def\@thecenter{Escuela Polit\'ecnica Superior}
\def\@thecenterlogo{img/logo_eps.png}
\def\@theuniversitylogo{img/logo_uam.jpg}

% Language-dependent strings
\newcommand{\deftranslation}[3]{\@namedef{#1-spa}{#2}\@namedef{#1-eng}{#3}}

\@namedef{eng}{english}\@namedef{spa}{spanish}
\newcommand{\selectlang}[1]{\selectlanguage{\@nameuse{#1}}} % Allow setting language from commands

\deftranslation{endofdegree}{Trabajo de Fin de Grado}{Bachelor Work}
\deftranslation{tutor}{Tutor}{Tutor}
\deftranslation{ponent}{Ponente}{Ponent}
\deftranslation{author}{Autor}{Author}

% Attributes
\def\setdegreeDouble{
	\deftranslation{degree}
		{Doble Grado en Ingenier\'ia Inform\'atica y Matem\'aticas}
		{Double Degreee in Computer Engineering and Mathematics}
}

\def\setdegreeCompSci{
	\deftranslation{degree}
		{Grado en Ingenier\'ia Inform\'atica}
		{Degreee in Computer Engineering}
}

% Undefine memoir's title and date so we can redefine them
\let\title\relax
\let\date\relax
\newcommand{\title}[2][spa]{\@namedef{title-#1}{#2}}
\newcommand{\date}[2][spa]{\@namedef{date-#1}{#2}}

\newif\if@tutorpresent
\def\thetutor{}
\newcommand{\tutor}[1]{\def\thetutor{#1}\@tutorpresenttrue}

\newif\if@ponentpresent
\def\theponent{}
\newcommand{\ponent}[1]{\def\thetutor{#1}\@ponentpresenttrue}

\newif\if@grouppresent
\newcommand{\group}[2][spa]{\@namedef{group-#1}{#2}\@grouppresenttrue}

\newif\if@departmentpresent
\newcommand{\department}[2][spa]{\@namedef{department-#1}{#2}\@departmentpresenttrue}

% Title page
\let\maketitle\relax
\newcommand{\maketitle}[1][spa]{
	\thispagestyle{empty}
	\centering
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
	\textbf{\@nameuse{degree-#1}}

	\vspace{15pt}
	\textbf{\MakeUppercase{\Huge\@nameuse{endofdegree-#1}}}

	\vspace{30pt}
	\textsc{\Large\begin{OnehalfSpace}\@nameuse{title-#1}\end{OnehalfSpace}}

	\vfill
	{\large
		\theauthor
		\vspace{5pt}

		\if@tutorpresent\@nameuse{tutor-#1}: \thetutor\\\fi
		\if@ponentpresent\@nameuse{ponent-#1}: \theponent\fi
	}

	\vspace{10pt}
	\@nameuse{date-#1}

	\newpage
	\if@twoside
		\null\thispagestyle{empty}\newpage % Blank page after in twoside mode
	\fi
}

\newcommand{\makeinnertitle}[1][spa]{ % For second (internal) titles
	\thispagestyle{empty}
	\centering
	\vspace{30pt}
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

	\newpage
	\if@twoside
		\null\thispagestyle{empty}\newpage % Blank page after in twoside mode
	\fi
}
