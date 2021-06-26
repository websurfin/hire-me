\LoadClass{article}
\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{resume}[2021/06/15 - current Tommy White's custom resume class]

\RequirePackage{titlesec}
\RequirePackage{xcolor}
\RequirePackage{fontspec}

%%% CUSTOMIZE FONTS AND COLORS
\setmainfont{Droid Serif}
\setsansfont{Arial}
\newfontfamily{\titlefont}{Play} % Go is big/kinda clean, arial, 


% colors
\definecolor{heading}{HTML}{00693e}
\definecolor{body}{HTML}{5a6773}
\definecolor{accent}{HTML}{2f4f4f}
\definecolor{emphasis}{HTML}{2b6900}

\colorlet{heading}{heading}
\colorlet{accent}{accent}
\colorlet{emphasis}{emphasis}
\colorlet{body}{body}



%%% GENERAL FORMATTING
\newcommand{\resumesection}[2][]{
	\medskip
	\ifstrequal{#1}{}
	{} 
	{   % if an argument is passed, it is sidebar data to load
		\marginpar{ % use marginpar to align to right before writing sidebar
			\vspace*{\dimexpr1pt-\baselineskip}
			\raggedright
			\input{#1}
		}
	}
	{\color{heading}\LARGE\bfseries\MakeUppercase{#2}}\\[-1ex]
	{\color{heading}\rule{\linewidth}{2pt}\par}
}

% customize `\subsection`
\titleformat{\subsection}
{\rmfamily\large\raggedright} % serif, less large, left aligned font
{} % set section label
{0em} % set section label spacing
{} % run code before heading





%%% PERSONAL INFORMATION SECTION
\newcommand{\personalinfo}[1]{\def\@personalinfo{#1}}
\newcommand{\printinfo}[2]{\mbox{\textcolor{accent}{#1}\hspace{0.5em}#2\hspace{1.5em}}}

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
		\printinfo{\faGithub}{\textcolor{heading}{#1}}
	}
}
% I don't use these much, perhaps link on website?
% \newcommand{\twitter}[1]{\printinfo{\twittersymbol}{#1}}
% \newcommand{\linkedin}[1]{\printinfo{\linkedinsymbol}{#1}}

%% display personal info
\newcommand{\makeheader}{%
	\begingroup
	\raggedright\color{heading}%
	{\Huge\titlefont\scshape{\@name}\par}
	\medskip
	{\footnotesize\rmfamily\@personalinfo\par}
	\endgroup\medskip
}
