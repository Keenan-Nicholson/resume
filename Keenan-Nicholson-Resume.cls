% Class Identifier and Version
\ProvidesClass{Keenan-Nicholson-Resume}[2023/08/09 Keenan Nicholson Class]
\NeedsTeXFormat{LaTeX2e}

\usepackage{enumitem}
% Set font size and paper type
\LoadClass[11pt,letterpaper]{article}

% Enable custom and named colors
\RequirePackage[usenames,dvipsnames]{color}

% Remove paragraph indentation
\RequirePackage[parfill]{parskip}

% Set margin width
\RequirePackage[hmargin=1.25cm,vmargin=0.75cm]{geometry}

% Use cool fonts
\RequirePackage{fontspec}

% Using IBM Plex Sans
\RequirePackage[sfdefault,light]{plex-sans}

% Use hyperref
\RequirePackage[xetex]{hyperref}

% Use extended columns definitions
\RequirePackage{array}

% Make custom tables
\RequirePackage{tabularx}

% Use FontAwesome icons
\RequirePackage{fontawesome5}

% Adjust page width in the middle of the page
\RequirePackage{changepage}

% Adjust bullet size
\RequirePackage{scalerel}

% Remove page numbers
\pagestyle{empty}

% Define navy-blue color for later use. Color code is taken from Canva
\definecolor{navyblue}{RGB}{0, 83, 137}
\definecolor{links}{RGB}{3, 43, 198}

% Define new resizable bullet with default 0.7 size for later use
% Taken from https://tex.stackexchange.com/questions/534192/medium-sized-circle-as-a-bullet
\newcommand{\vbullet}[1][.7]{\mathbin{\ThisStyle{\vcenter{\hbox{%
  \scalebox{#1}{$\SavedStyle\bullet$}}}}}%
}

% Setup Hyperlink style
\hypersetup{
    colorlinks=true,
    urlcolor=links
}

% Define some social accounts and contact information formats
\newcommand{\linkedin}[2]{
    \href{https://linkedin.com/in/#1}{\textcolor{black}
    {\faLinkedinIn}\hspace{0.5em}#2}
}
\newcommand{\email}[2]{
    \href{mailto:#1}{\textcolor{black}
    {\faEnvelope[regular]}\hspace{0.5em}#2}
}
\newcommand{\github}[2]{
    \href{https://github.com/#1}{\textcolor{black}
    {\faGithub}\hspace{0.5em}#2}
}
\newcommand{\website}[2]{
    \href{https://#1}{\textcolor{black}
    {\faGlobeAmericas}\hspace{0.5em}#2}
}
\newcommand{\phone}[2]{
    \textcolor{black}{\faPhone*}\hspace{0.5em}#2
}

% Define commands for fullname and job title
\def \fullname#1{\def\@name{#1}}
\def \@name {}
\def \jobtitle#1{\def\@title{#1}}
\def \@title {}

% Convenience commands
\newcommand{\italicitem}[1]{\item{\textit{#1}}}
\newcommand{\bolditem}[1]{\item{\textbf{#1}}}
\newcommand{\entry}[2]{#1 & #2 \tabularnewline}

% Define the resume header
\newcommand{\resumeheader}[6]{
    % \phantomsection
    % \addcontentsline{toc}{chapter}{\@name}
    \begin{tabularx}{\textwidth}{Xr}{
        \begin{tabular}[c]{l}
            \fontsize{35}{45}\selectfont{\color{navyblue}{\textbf{\@name}}}
            \ifx\empty\@title\empty\else
                \\ \textit{\small\@title}
                
            \fi
       \end{tabular}
    \vspace{0.5em}
       
    } & {
        \begin{tabular}{l}
            \entry{\small#4}{\small#2} 
            \entry{\small#5}{\small#1} 
            \entry{\small#3}{}
        \end{tabular}
    }
    \end{tabularx}
}

% Renew section command for resume section
\renewenvironment{section}[1]{
    \phantomsection
    \addcontentsline{toc}{section}{#1}
    \medskip
    {\color{navyblue}{\textbf{\textit{#1}}}}
    \medskip
    {\color{navyblue}\hrule}
    \begin{list}{}{
        \setlength{\leftmargin}{1.5em}
    }
\item[]}{
    \end{list}
}

% Renew subsection command for resume subsections
% All arguments are compulsory
% #1: Name, #2: Description, #3: Time Period, #4: Location
\renewenvironment{subsection}[4]{
    \phantomsection
    \addcontentsline{toc}{subsection}{#1}
    \textbf{#1} \hfill \textit{#3} \newline
    \textit{#2} \hfill \textit{#4}
    \begin{list}{$\vbullet$}{
        \leftmargin=2em
    }
    \itemsep -0.5em \vspace{-0.5em}
}{
    \end{list}
    \vspace{0.5em}
}

% Define command for resume subsections with no bullets
% All arguments are compulsory
% #1: Name, #2: Description, #3: Time Period, #4: Location
\newenvironment{subsectionnobullet}[4]{
    \phantomsection
    \addcontentsline{toc}{subsection}{#1}
    \textbf{#1} \hfill \textit{#3} \newline
    \ifx\empty#2\else
        \textit{#2} \hfill \textit{#4}
    \fi
    \begin{list}{}{
        \leftmargin=0em \itemindent=0em \labelwidth=0em \labelsep=0em
    }
    \itemsep -0.7em 
}{
    \end{list}
}


% Define new sectiontable command, which makes a section with a table
% All arguments are compulsory
% #1: Name of the section, #2: Body of the section
\newcommand{\sectiontable}[2]{
    \begin{section}{#1}
        \begin{adjustwidth}{0.0in}{0.1in}
            \begin{tabularx}{\linewidth}{@{} >{\bfseries}l @{\hspace{5ex}} X @{}}
                #2
            \end{tabularx}
        \end{adjustwidth}
    \end{section}
}
