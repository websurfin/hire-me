\LoadClass{article}
\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{resume}[2021/06/15 - current Tommy White's custom resume class]

\RequirePackage{titlesec}

%%% GENERAL FORMATTING
\titleformat{\section}
{\rmfamily\Large\scshape\raggedright} % serif, large, small capital, left aligned font
{} % used to set section label (often a number)
{0em} % used to set spacing from label to actual title
{} % used to run code before the heading 
[\titlerule] % used to run code after the heading

% customize `\subsection`
\titleformat{\subsection}
{\rmfamily\large\raggedright} % serif, less large, left aligned font
{} % set section label
{0em} % set section label spacing
{} % run code before heading
