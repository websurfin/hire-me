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
