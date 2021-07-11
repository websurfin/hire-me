%%% set up latex class
\LoadClass{article}
\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{resume}[2021/06/15 - 2021/06/28: Tommy White's current custom resume class]

\RequirePackage{anyfontsize}
\RequirePackage{changepage}
\RequirePackage{dashrule}
\RequirePackage{enumitem}
\RequirePackage{etoolbox}
\RequirePackage{fontawesome}
\RequirePackage{fontspec}
\RequirePackage[margin=2cm]{geometry}
\RequirePackage{hyperref}
\RequirePackage{tikz}
\RequirePackage{titlesec}
\RequirePackage{xcolor}

% change how lists are displayed from margins to spacing to the item marker
\setlist{leftmargin=*, labelsep=0em, nosep, itemsep=0.22\baselineskip}
\newcommand{\itemmarker}{
	{
		\textcolor{accent}{
			\raisebox{1pt}{$\odot$}
		}
	}
}
\setlist[itemize]{label=\itemmarker}

% tell LaTex which commands to run when the document is loaded
\AtBeginDocument{
  \color{body}
  \raggedright
  \thispagestyle{empty}
}


%%% CUSTOMIZE FONTS AND COLORS
\setmainfont{Garamond}
\setsansfont{Arial}  % Arial is easily readable and dyslexia-friendly, and so makes a great option
\newfontfamily{\titlefont}{Arial Black}

% set resume colors
\definecolor{heading}{HTML}{00693e}
\definecolor{body}{HTML}{5a6773}
\definecolor{accent}{HTML}{2f4f4f}
\definecolor{emphasis}{HTML}{2D6904}

\colorlet{heading}{heading}
\colorlet{accent}{accent}
\colorlet{emphasis}{emphasis}
\colorlet{body}{body}

% set up hyperref link formatting
\hypersetup{
	colorlinks=true,
	linkcolor=emphasis,
	filecolor=emphasis,
	urlcolor=emphasis
}


%%% GENERAL FORMATTING
\setlength{\parindent}{0pt}
\newcommand{\divider}{  % adds a divider when \divider is called
    \textcolor{body!50}{
		\hdashrule[0.5ex]{\linewidth}{0.5pt}{%
			0.5pt 0.2mm 1mm 0.4pt}
    }\\[-2ex]  % adjust this value if the divider is misaligned vertically
}

\newenvironment{fullwidth}  % use this environment to print to full-width page rather than column
    {\begin{adjustwidth}{}{\dimexpr-\marginparwidth-\marginparsep\relax}}
    {\end{adjustwidth}}

\newcommand{\resumesection}[2][]{  % use \resumesection rather than \section
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
	\\[-0.25ex]  % can be adjusted if line below section header is misaligned vertically
	{
	    \color{heading}\rule{\linewidth}{2pt}\par
	}
}

\newcommand{\datedentry}[4]{  % use \datedentry to add resume items which are tied to a date or date rante (e.g. jobs)
	{  % expects title, employer, daterange, location
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
\newcommand{\name}[1]{\def\@name{#1}}  % set author name with \name
\newcommand{\contactbar}[1]{\def\@contactbar{#1}}  % set contact bar info using \contactbar and the commands below

\newcommand{\printinfo}[2]{  % command used by content_bar commands below
	\mbox{
		\textcolor{accent}{#1}
		\hspace{0.5em}
		\textcolor{body}{#2}
		\hspace{1.5em}
	}
}  

%% contact_bar commands
\newcommand{\location}[1]{\printinfo{\faMapMarker}{#1}}  % add a location
\newcommand{\address}[1]{\printinfo{\faMapMarker}{#1}}  % add an address. Feels a bit sensitive to share address so 
							% easily? Maybe use \location for more public cases and \address for more private cases
\newcommand{\phone}[1]{\printinfo{\faMobile}{#1}}  % add a phone number
\newcommand{\email}[1]{  % add an email address with a mailto: link
	\href{mailto:#1}{
		\printinfo{\faEnvelope}{\textcolor{heading}{#1}}
	}
}
\newcommand{\website}[1]{  % add a website with an https link (use format site.tld/)
	\href{https://#1}{
		\printinfo{\faChain}{\textcolor{heading}{#1}}
	}
}
\newcommand{\github}[2]{  % add a github account, provide account name then link to the account
	\href{#2}{
		\printinfo{\faGithub}{#1}
	}
}

% I don't use these much, perhaps link on website? Convert link format if used.
% \newcommand{\twitter}[1]{\printinfo{\twittersymbol}{#1}}  % add a Twitter
% \newcommand{\linkedin}[1]{\printinfo{\linkedinsymbol}{#1}}  % add a LinkedIn

%% display personal info
\newcommand{\makecontactbar} {  % after setting \name and \contactbar, call this to print personal information
	\begingroup
	\centering\color{heading}
	\fontsize{36}{45}{  % set size of name on resume
		\titlefont\bfseries\scshape{\@name}
	}\par
	\medskip
	{\normalsize\rmfamily\@contactbar\par}
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
  \tikz[baseline]
  \node[
	  anchor=base, 
	  draw=body!30,
	  rounded corners,
	  inner xsep=1ex,
	  inner ysep =0.75ex,
	  text height=1.5ex,
	  text depth=.25ex
	  ]{#1};
}
