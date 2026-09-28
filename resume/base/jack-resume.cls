% Intro Options
\ProvidesClass{jack-resume}[2019/27/08 CV class]
\NeedsTeXFormat{LaTeX2e}
\DeclareOption{print}{\def\@cv@print{}}
\DeclareOption*{%
  \PassOptionsToClass{\CurrentOption}{article}
}
\ProcessOptions\relax
\LoadClass{article}

% Package Imports
%\usepackage[hmargin=1.25cm, vmargin=0.7cm]{geometry}
\usepackage[hmargin=0.4in, vmargin=0.5in, bottom=0cm]{geometry}
\usepackage[usenames,dvipsnames]{xcolor}
\usepackage[hidelinks]{hyperref}
\usepackage{titlesec}
\usepackage[absolute]{textpos}
\usepackage[UKenglish]{babel}
\usepackage[UKenglish]{isodate}
\usepackage{fontspec,xltxtra,xunicode,pagecolor}

% Color definitions
\definecolor{date}{HTML}{666666}
\definecolor{primary}{HTML}{2b2b2b}
\definecolor{headings}{HTML}{ea526e}
\definecolor{subheadings}{HTML}{333333}
\definecolor{darkmodeBackground}{HTML}{2D3142}
\definecolor{darkmodeDate}{HTML}{4F5D75}
\definecolor{darkmodePrimary}{HTML}{c4cfde}
\definecolor{darkmodeHeadings}{HTML}{0CA4A5}
\definecolor{darkmodeSubheadings}{HTML}{f6f6f6}

% Set main fonts
\defaultfontfeatures{Mapping=tex-text}
\setmainfont[Color=darkmodePrimary, Path = fonts/lato/]{Lato-Lig}
\setsansfont[Scale=MatchLowercase,Mapping=tex-text, Path = fonts/raleway/]{Raleway-Light}
\newcommand{\custombold}[1]{\color{darkmodeSubheadings}\fontspec[Path = fonts/lato/]{Lato-Lig.ttf}\selectfont #1 \normalfont}
\newcommand{\customitalic}[1]{\color{darkmodeSubheadings}\fontspec[Path = fonts/lato/]{Lato-LigIta.ttf}\selectfont #1 \normalfont}
\newcommand{\customsignature}[1]{\color{darkmodeSubheadings}\fontspec[Path = fonts/adine/]{Adine-Kirnberg.ttf}\fontsize{16pt}{12pt}\selectfont #1 \normalfont}

% Date command
\setlength{\TPHorizModule}{1mm}
\setlength{\TPVertModule}{1mm}
\textblockorigin{0mm}{5mm}
\newcommand{\lastupdated}{\begin{textblock}{60}(165,0)
\color{darkmodeDate}\fontspec[Path = fonts/raleway/]{Raleway-ExtraLight}\fontsize{8pt}{10pt}\selectfont
Last Updated on
\today
\end{textblock}}

% Name command
\newcommand{\namesection}[3]{
	\centering{
		\sffamily
		\color{headings}\fontspec[Path = fonts/lato/]{Lato-Hai}\fontsize{24pt}{10cm}\selectfont #1
		\fontspec[Path = fonts/lato/]{Lato-Lig}\selectfont #2
	} \\
	\vspace{5pt}
	\centering{ \color{darkmodeSubheadings}\fontspec[Path = fonts/raleway/]{Raleway-Medium}\fontsize{14pt}{16pt}\selectfont #3}
	\noindent\makebox[\linewidth]{\rule{\paperwidth}{0.4pt}}
	\vspace{-41.6pt}
}
\titlespacing{\section}{0pt}{0pt}{0pt}

% Headings command
\titleformat{\section}{\color{darkmodeHeadings}
\scshape\fontspec[Path = fonts/raleway/]{Raleway-Medium}\fontsize{12pt}{20pt}\selectfont\centering\uppercase}{} {0em}{}

% Subeadings command
\titleformat{\subsection}{\color{darkmodeSubheadings}
\raggedright\fontspec[Path = fonts/lato/]{Lato-Bol}\fontsize{10pt}{11pt}\selectfont\bfseries}{}{0em}{}
\titlespacing{\subsection}{0pt}{\parskip}{-\parskip}
\titlespacing{\subsubsection}{0pt}{\parskip}{-\parskip}
\newcommand{\runsubsection}[1]{\color{darkmodeSubheadings}
\fontspec[Path = fonts/lato/]{Lato-Bol}\fontsize{10pt}{11pt}\selectfont\bfseries {#1} \normalfont}

\newcommand{\awards}[1]{\color{darkmodeSubheadings}
\fontspec[Path = fonts/lato/]{Lato-Reg}\fontsize{10pt}{11pt}\selectfont\bfseries {#1} \normalfont}

% Descriptors command
\newcommand{\descript}[1]{\color{darkmodeSubheadings}\raggedright\scshape\fontspec[Path = fonts/lato/]{Lato-Lig}\fontsize{10pt}{11pt}\selectfont {#1 \\} \normalfont}
\newcommand{\descriptbf}[1]{\color{darkmodeSubheadings}\raggedright\scshape\fontspec[Path = fonts/lato/]{Lato-Reg}\fontsize{10pt}{11pt}\selectfont {#1 \\} \normalfont}

\newcommand{\descriptit}[1]{\color{darkmodeSubheadings}\raggedright\scshape\fontspec[Path = fonts/lato/]{Lato-RegIta}\fontsize{10pt}{11pt}\selectfont {#1} \normalfont}
% \newcommand{\subdescript}[1]{\color{darkmodeSubheadings}\raggedright\scshape\fontspec[Path = fonts/lato/]{Lato-RegIta}\fontsize{10pt}{11pt}\selectfont {#1} \normalfont}

% Location command
\newcommand{\location}[1]{\hfill\color{darkmodePrimary}\fontspec[Path = fonts/lato/]{Lato-Lig}\fontsize{10pt}{12pt}\selectfont {#1\\} \normalfont}

% Section seperators command
\newcommand{\sectionsep}[0]{\vspace{8pt}}

% Bullet Lists with fewer gaps command
\newenvironment{tightemize}{\vspace{-\topsep}\begin{itemize}\itemsep1pt \parskip0pt \parsep0pt \fontspec[Path = fonts/lato/]{Lato-Reg}}{\end{itemize}\vspace{-\topsep}}

% Link icon
\newcommand{\ExternalLink}{%
    \tikz[x=1.2ex, y=1.2ex, baseline=-0.05ex]{%
        \begin{scope}[x=1ex, y=1ex]
            \clip (-0.1,-0.1)
                --++ (-0, 1.2)
                --++ (0.6, 0)
                --++ (0, -0.6)
                --++ (0.6, 0)
                --++ (0, -1);
            \path[draw,
                line width = 0.5,
                rounded corners=0.5]
                (0,0) rectangle (1,1);
        \end{scope}
        \path[draw, line width = 0.5] (0.5, 0.5)
            -- (1, 1);
        \path[draw, line width = 0.5] (0.6, 1)
            -- (1, 1) -- (1, 0.6);
        }
    }