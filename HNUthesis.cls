% !Mode:: "TeX:UTF-8"
\NeedsTeXFormat{LaTeX2e}[1999/12/01]
\ProvidesClass{HNUthesis}[2015/04/20 0.1 HuaiBei Normal University Thesis Template for Master Candidate]

\LoadClass[cs4size,a4paper,fancyhdr,fntef,UTF8,hyperref,openany,oneside]{ctexbook}
\DeclareOption*{\PassOptionsToClass{\CurrentOption}{ctexbook}}
\ProcessOptions

\newif\ifprint\printfalse
\DeclareOption{forprint}{\printtrue}
\ProcessOptions

%------------------------ Page layout ----------------------------------
\hypersetup{pdfencoding=auto}
\hypersetup{citecolor=magenta,linkcolor=blue}
\RequirePackage[top=2.5cm,bottom=2.5cm,left=3.5cm,right=3cm]{geometry}

%----------- 相关设置项 -------------%
\newtoks\fenleihao      %分类号
\newtoks\xuexiaodaima   %学校代码
\newtoks\miji           %密级
\newtoks\xuehao         %学号
\newtoks\Etitle         %英文题目
\newtoks\Csupervisor    %指导教师中文名
\newtoks\Cmajor         %专业中文名
\newtoks\Especiality    %研究方向

\pagestyle{fancyplain}
\fancyhf{}
\renewcommand{\headrulewidth}{0pt}
\fancyfoot[C]{-\,\thepage\,-}

\fancypagestyle{plain}
{
\fancyhead{}                                    % clear all header fields
\renewcommand{\headrulewidth}{0pt}
\fancyfoot{}                                    % clear all footer fields
\fancyfoot[C]{-\,\thepage\,-}
}

%----------- 封面 -------------%
\def\maketitle{
  \thispagestyle{empty}
  \begin{center}
    {\heiti\zihao{-4} \renewcommand{\arraystretch}{0.5}
      \begin{tabular}{llp{7cm}ll}
        分\hfill 类\hfill 号： & \the\fenleihao \hfill & \hfill{} & 学\hfill 校\hfill 代\hfill 码： & \the\xuexiaodaima \\
        密\hfill 级： & \the\miji \hfill & \hfill{} & 学\hfill 号： & \the\xuehao \\
      \end{tabular}
    }

    \par
    \vspace*{60pt} %插入空白

    \includegraphics[width=300pt]{HNU-logo.pdf}\\

    \vspace*{60pt}

    {\songti \fontsize{50bp}{\baselineskip}\selectfont \bfseries{硕士学位论文} \par}

    \vspace{50pt}

    {\heiti\zihao{2}\bfseries{题~目：\underline{\@title}} \par}%

    \vspace{50pt}

    {\heiti\zihao{3}\bfseries{
      \renewcommand{\arraystretch}{1.25}
        \begin{tabular}{lp{5.5cm}}
          论文作者： & \underline{\makebox[5.5cm][l]{\@author}} \\
          指导教师： & \underline{\makebox[5.5cm][l]{\the\xuehao}} \\
          专业名称： & \underline{\makebox[5.5cm][l]{\the\Csupervisor}} \\
          研究方向： & \underline{\makebox[5.5cm][l]{\the\Cmajor}} \\
         \end{tabular}
      }
      \renewcommand{\arraystretch}{1}
    }

    \par
    \vfill

    {\songti \zihao{3} 淮北师范大学研究生处\\[1em] \@date}\\[2em]
  \end{center}
}

%------------------------ Abstract & Keywords -------------------------
\newcommand\cnabstractname{摘要}
\newcommand\enabstractname{ABSTRACT}
\newcommand\cnkeywords[1]{ {\bfseries\heiti\zihao{-4}\cnkeywordsname: }#1}
\newcommand\cnkeywordsname{关键词}
\newcommand\enkeywords[1]{ {\bfseries\heiti\zihao{-4}\enkeywordsname: }#1}
\newcommand\enkeywordsname{Key words}

\newenvironment{cnabstract}{
  \chapter*{\@title}
  \thispagestyle{empty}{\zihao{-4}\heiti\bfseries{\cnabstractname：}\songti\@afterheading}
}

\newenvironment{enabstract}{
  \chapter*{\the\Etitle}
  \thispagestyle{empty}{\zihao{-4}\heiti\bfseries{\enabstractname: }\songti\@afterheading}
}


%%------------------------常用宏包-----------------------------------
\RequirePackage{amsmath,amssymb}% AMSLaTeX宏包.
\RequirePackage[amsmath,thmmarks]{ntheorem}
\RequirePackage{graphicx}                 % 图形
\RequirePackage{color,xcolor}             %支持彩色
\RequirePackage{url}
\RequirePackage{enumerate}
%%----------------------- Theorems -----------------------------------
\theoremstyle{plain}
\theoremheaderfont{\heiti}
\theorembodyfont{\songti} \theoremindent0em
\theorempreskip{0pt}
\theorempostskip{0pt}
\theoremnumbering{arabic}
% \theoremseparator{\hspace{1em}}

\newtheorem{theorem}{\hspace{2em}定理}[section]
\newtheorem{definition}{\hspace{2em}定义}[section]
\newtheorem{lemma}{\hspace{2em}引理}[section]
\newtheorem{corollary}{\hspace{2em}推论}[section]
\newtheorem{proposition}{\hspace{2em}性质}[section]
\newtheorem{example}{\hspace{2em}例}[section]
\newtheorem{remark}{\hspace{2em}注}[section]

\theoremstyle{nonumberplain}
\theoremheaderfont{\heiti}
\theorembodyfont{\normalfont \rm \songti}
\theoremindent0em \theoremseparator{\hspace{1em}}
\theoremsymbol{$\square$}
\newtheorem{proof}{\hspace{2em}证明}

\newcommand{\upcite}[1]{\textsuperscript{\cite{#1}}}

%--------- 判断是否需要彩色链接 ------------%
\ifprint
  \hypersetup{allcolors=black}
\fi

%%%===  suppress extra inter-line spacing in \list environments
\makeatletter \setlength\partopsep{0pt}
\def\@listI{\leftmargin\leftmargini
            \parsep 0pt
            \topsep \parsep
            \itemsep \parsep}
\@listI
\def\@listii {\leftmargin\leftmarginii
              \labelwidth\leftmarginii
              \advance\labelwidth-\labelsep
              \parsep    \z@ \@plus\z@  \@minus\z@
              \topsep    \parsep
              \itemsep   \parsep}
\def\@listiii{\leftmargin\leftmarginiii
              \labelwidth\leftmarginiii
              \advance\labelwidth-\labelsep
              \parsep    \z@ \@plus\z@  \@minus\z@
              \topsep    \parsep
              \itemsep   \parsep}
\def\@listiv{\leftmargin\leftmarginiv
              \labelwidth\leftmarginiv
              \advance\labelwidth-\labelsep
              \parsep    \z@ \@plus\z@  \@minus\z@
              \topsep    \parsep
              \itemsep   \parsep}
\def\@listv{\leftmargin\leftmarginv
              \labelwidth\leftmarginv
              \advance\labelwidth-\labelsep
              \parsep    \z@ \@plus\z@  \@minus\z@
              \topsep    \parsep
              \itemsep   \parsep}
\def\@listvi{\leftmargin\leftmarginvi
              \labelwidth\leftmarginvi
              \advance\labelwidth-\labelsep
              \parsep    \z@ \@plus\z@  \@minus\z@
              \topsep    \parsep
              \itemsep   \parsep}
%
% Change default margins for \list environments
\setlength\leftmargini   {2\ccwd} \setlength\leftmarginii
{\leftmargini} \setlength\leftmarginiii {\leftmargini}
\setlength\leftmarginiv  {\leftmargini} \setlength\leftmarginv
{\ccwd} \setlength\leftmarginvi  {\ccwd} \setlength\leftmargin
{\leftmargini} \setlength\labelsep      {.5\ccwd}
\setlength\labelwidth    {\leftmargini}
%
\setlength\listparindent{2\ccwd}
% Change \listparindent to 2\ccwd in \list
\def\list#1#2{\ifnum \@listdepth >5\relax \@toodeep
     \else \global\advance\@listdepth\@ne \fi
  \rightmargin \z@ \listparindent2\ccwd \itemindent \z@
  \csname @list\romannumeral\the\@listdepth\endcsname
  \def\@itemlabel{#1}\let\makelabel\@mklab \@nmbrlistfalse #2\relax
  \@trivlist
  \parskip\parsep \parindent\listparindent
  \advance\linewidth -\rightmargin \advance\linewidth -\leftmargin
  \advance\@totalleftmargin \leftmargin
  \parshape \@ne \@totalleftmargin \linewidth
  \ignorespaces}

\makeatother
%---------------------------------------------------
\newcommand\acknowledgement{\backmatter\chapter[致谢]{\ziju{2}致谢}}

%%% ---- 章节标题设置 ----- %%%%
% 章标题 - 小二 / 黑体+Times New Roman
% 正  文 - 四号 / 宋体+Times New Roman
\CTEXsetup[format={\centering},titleformat={\heiti\zihao{-2}},nameformat={\heiti\zihao{-2}}]{chapter}
\CTEXsetup[format={\raggedright\zihao{4}},titleformat={\heiti\zihao{4}},nameformat={\heiti\zihao{4}}]{section}
\CTEXsetup[format={\raggedright\zihao{5}},titleformat={\songti\zihao{5}},nameformat={\songti\zihao{5}}]{subsection}

\setcounter{tocdepth}{4}
\setcounter{secnumdepth}{4}

\renewcommand\figurename{\bfseries\zihao{-4} 图}
\renewcommand\tablename{\zihao{-4} 表}

\CTEXoptions[contentsname={目\quad 录}]
\CTEXoptions[bibname={\zihao{-2} 参考文献}]

\endlinechar `\^^M
\endinput
