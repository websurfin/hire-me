%%% set up latex class
\LoadClass{article}
\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{resume}[2021/06/15 - 2021/06/28: Tommy White's current custom resume class]

\RequirePackage{titlesec}
\RequirePackage{xcolor}
\RequirePackage{fontspec}
\RequirePackage{hyperref}
\RequirePackage[margin=2cm]{geometry}
\RequirePackage{fontawesome}
\RequirePackage{etoolbox}
\RequirePackage{changepage}
\RequirePackage{dashrule}
\RequirePackage{enumitem}
\RequirePackage{anyfontsize}
\RequirePackage{tikz}

\setlist{leftmargin=*, labelsep=0em, nosep, itemsep=0.22\baselineskip}

\newcommand{\itemmarker}{
	{
		\textcolor{accent}{
			\raisebox{1pt}{$\odot$}
		}
	}
}
\setlist[itemize]{label=\itemmarker}

\AtBeginDocument{
  \color{body}
  \raggedright
  \thispagestyle{empty}
}

%%% CUSTOMIZE FONTS AND COLORS
\setmainfont{Garamond}
\setsansfont{Arial}
\newfontfamily{\titlefont}{Arial Black} % Go arial, Kurier Heavy lowercase

% colors
\definecolor{heading}{HTML}{00693e}
\definecolor{body}{HTML}{5a6773}
\definecolor{accent}{HTML}{2f4f4f}
\definecolor{emphasis}{HTML}{2b6900}

\colorlet{heading}{heading}
\colorlet{accent}{accent}
\colorlet{emphasis}{emphasis}
\colorlet{body}{body}

\hypersetup{
	colorlinks=true,
	linkcolor=emphasis,
	filecolor=emphasis,
	urlcolor=emphasis
}


%%% GENERAL FORMATTING
\setlength{\parindent}{0pt}
\newcommand{\divider}{
    \textcolor{body!50}{
		\hdashrule[0.5ex]{\linewidth}{0.5pt}{%
			0.5pt 0.2mm 1mm 0.4pt}
        % \hdashrule{\linewidth}{0.5pt}{0.5ex}
    }\\[-2ex]
}

\newenvironment{fullwidth}
    {\begin{adjustwidth}{}{\dimexpr-\marginparwidth-\marginparsep\relax}}
    {\end{adjustwidth}}

\newcommand{\resumesection}[2][]{
	\smallskip
	\ifstrequal{#1}{}
	{} 
	{   % if an argument is passed, it is sidebar data to load
		\marginpar{ % use marginpar to align to right before writing sidebar
			\vspace*{\dimexpr1pt-\baselineskip}
			\raggedright
			\input{#1}
		}
	}
	{
	    \color{heading}\LARGE\rmfamily\bfseries\MakeUppercase{#2}
	}
	\\[-0.5ex]
	{
	    \color{heading}\rule{\linewidth}{2pt}\par
	}
}

\newcommand{\datedentry}[4]{
	{
	    \large\color{emphasis} #1 \par
	}
	\smallskip
	\textbf{\color{accent} #2}\par
	\smallskip
	{
		\makebox[0.5\linewidth][l]{
		    \faCalendar\hspace{0.5em} #3
		}
		\ifstrequal{#4}{}
			{}
			{
				\makebox[0.45\linewidth][r]{
					\faMapMarker\hspace{0.5em}#4
				}
			}
		\par
	}
	\medskip
}


%%% PERSONAL INFORMATION SECTION
\newcommand{\personalinfo}[1]{\def\@personalinfo{#1}}
\newcommand{\printinfo}[2]{\mbox{\textcolor{accent}{#1}\hspace{0.5em}\textcolor{body}{#2}\hspace{1.5em}}}

\newcommand{\name}[1]{\def\@name{#1}}
\newcommand{\email}[1]{\href{mailto:#1}{\printinfo{\faEnvelope}{#1}}}
\newcommand{\location}[1]{\printinfo{\faMapMarker}{#1}}
\newcommand{\address}[1]{\printinfo{\faMapMarker}{#1}} % feels a bit sensitive to share address so easily? 
% Maybe use \location for more public cases and \address for more private cases
\newcommand{\phone}[1]{\printinfo{\faMobile}{#1}}
\newcommand{\website}[1]{
	\href{#1}{
		\printinfo{\faChain}{\textcolor{heading}{Website}}
	}
}
\newcommand{\github}[2]{
	\href{#2}{
		\printinfo{\faGithub}{#1}
	}
}
% I don't use these much, perhaps link on website?
% \newcommand{\twitter}[1]{\printinfo{\twittersymbol}{#1}}
% \newcommand{\linkedin}[1]{\printinfo{\linkedinsymbol}{#1}}

%% display personal info
\newcommand{\makeheader} {
	\begingroup
	\centering\color{heading}
	\fontsize{36}{45}{
		\titlefont\bfseries\scshape{\@name}
	}\par
	\medskip
	{\small\rmfamily\@personalinfo\par}
	\endgroup\medskip
}


%%% SKILL SECTIONS
\newcommand{\skillrank}[2]{
	\textcolor{emphasis}{\textbf{#1}}
	\hfill
	\foreach \x in {1,...,5}{
		\ifnumgreater{\x}{#2}
			{\color{body!40}}
			{\color{accent}}
		\faCircle
	}\par
}

\newcommand{\skilltag}[1]{%
  \tikz[baseline]\node[anchor=base,draw=body!30,rounded corners,inner xsep=1ex,inner ysep =0.75ex,text height=1.5ex,text depth=.25ex]{#1};
}
