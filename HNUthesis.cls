% !Mode:: "TeX:UTF-8"
\NeedsTeXFormat{LaTeX2e}[1999/12/01]
\ProvidesClass{HNUthesis}[2015/04/20 0.1 HuaiBei Normal University Thesis Template for Master Candidate]

\newif\iflib\libfalse
\DeclareOption{forlib}{\libtrue}
\newif\ifprint\printfalse
\DeclareOption{forprint}{\printtrue}
\ProcessOptions

\iflib
  \LoadClass[cs4size,a4paper,fancyhdr,fntef,UTF8,hyperref,oneside]{ctexbook}
\else
  \LoadClass[cs4size,a4paper,fancyhdr,fntef,UTF8,hyperref]{ctexbook}
\fi

\DeclareOption*{\PassOptionsToClass{\CurrentOption}{ctexbook}}
\ProcessOptions

% ----- 定义字号，CTex 的存在误差 -------------%
\newcommand{\chuhao}{\fontsize{42bp}{\baselineskip}\selectfont}
\newcommand{\xiaochuhao}{\fontsize{36bp}{\baselineskip}\selectfont}
\newcommand{\yihao}{\fontsize{28bp}{\baselineskip}\selectfont}
\newcommand{\erhao}{\fontsize{21bp}{\baselineskip}\selectfont}
\newcommand{\xiaoerhao}{\fontsize{18bp}{\baselineskip}\selectfont}
\newcommand{\sanhao}{\fontsize{15.75bp}{\baselineskip}\selectfont}
\newcommand{\xiaosanhao}{\fontsize{15bp}{\baselineskip}\selectfont}
\newcommand{\sihao}{\fontsize{14bp}{\baselineskip}\selectfont}
\newcommand{\xiaosihao}{\fontsize{12bp}{\baselineskip}\selectfont}
\newcommand{\wuhao}{\fontsize{10.5bp}{\baselineskip}\selectfont}
\newcommand{\xiaowuhao}{\fontsize{9bp}{\baselineskip}\selectfont}
\newcommand{\liuhao}{\fontsize{7.875bp}{\baselineskip}\selectfont}
\newcommand{\qihao}{\fontsize{5.25bp}{\baselineskip}\selectfont}

%------------------------ Page layout ----------------------------------
\hypersetup{pdfencoding=auto}
\hypersetup{citecolor=magenta,linkcolor=blue}
\RequirePackage[top=2.5cm,bottom=2.5cm,left=3.5cm,right=3cm]{geometry}    % 页面设置%
% \setlength{\headheight}{1.5cm}
% \setlength{\footskip}{1.75cm}

\newtoks\fenleihao      %分类号
\newtoks\xuexiaodaima   %学校代码
\newtoks\miji           %密级
\newtoks\xuehao         %学号

%\title                 %题目
\newtoks\Etitle         %英文题目
%\author                %作者
\newtoks\Csupervisor    %指导教师中文名
\newtoks\Cmajor         %专业中文名
\newtoks\Especiality    %研究方向


\pagestyle{fancyplain}
\fancyhf{}  %清除以前对页眉页脚的设置
\renewcommand{\headrulewidth}{0pt}
\fancyfoot[C]{-\,\thepage\,-}
\fancypagestyle{plain}
{
\fancyhead{}                                    % clear all header fields
\renewcommand{\headrulewidth}{0pt}
\fancyfoot{}                                    % clear all footer fields
\fancyfoot[C]{-\,\thepage\,-}
}

%%%=== 封面 ===%%%
\def\maketitle{%
  \thispagestyle{empty}%
  \begin{center}
    {\heiti\xiaosihao
    \renewcommand{\arraystretch}{0.5}
    \begin{tabular}{llp{8cm}ll}
      分\hfill 类\hfill 号： & \the\fenleihao \hfill & \hfill{} & 学\hfill 校\hfill 代\hfill 码： & \the\xuexiaodaima \\
      密\hfill 级： & \the\miji \hfill & \hfill{} & 学\hfill 号： & \the\xuehao \\
    \end{tabular}
    }\par
    \vspace*{60pt} %插入空白
    \includegraphics[width=300pt]{HNU-logo.pdf}\\
    \vspace*{60pt}
    {\songti \fontsize{50bp}{\baselineskip}\selectfont \bfseries{硕士学位论文}}\\
    \vspace{50pt}
    {\heiti\erhao\bfseries{题~目：\underline{\@title}} \par}%
    \vspace{50pt}
    {\heiti\sanhao \bfseries{
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
%    \vspace{48pt}
    \vfill
    {
      {\songti \sanhao 淮北师范大学研究生处\\ \@date \par}%
    }
  \end{center}
}

%------------------------ Abstract & Keywords -------------------------
\newcommand\cnabstractname{摘要}
\newcommand\enabstractname{ABSTRACT}
\newcommand\cnkeywords[1]{ {\bfseries\heiti\xiaosihao\cnkeywordsname: }#1}
\newcommand\cnkeywordsname{关键词}
\newcommand\enkeywords[1]{ {\bfseries\heiti\xiaosihao\enkeywordsname: }#1}
\newcommand\enkeywordsname{Key words}

\newenvironment{cnabstract}{
  \chapter*{\@title}   %%%终于解决了书签乱码的问题 2005-04-12.huangzh
  \thispagestyle{empty}{\xiaosihao\heiti\textbf{\cnabstractname：}\songti\@afterheading}
}

\newenvironment{enabstract}{
  \chapter*{\the\Etitle}
  \thispagestyle{empty}{\xiaosihao\heiti\textbf{\enabstractname: }\songti\@afterheading}
}

%%------------------------常用宏包-----------------------------------
\RequirePackage{amsmath,amssymb}% AMSLaTeX宏包.
\RequirePackage[amsmath,thmmarks]{ntheorem}
\RequirePackage{graphicx}                 % 图形
\RequirePackage{color,xcolor}             %支持彩色
\RequirePackage{cite} % 参考文献引用, 得到形如 [3-7] 的样式.
\RequirePackage{url}
\RequirePackage{enumerate}
%%----------------------- Theorems -----------------------------------
\theoremstyle{plain}
\theoremheaderfont{\heiti}
\theorembodyfont{\songti} \theoremindent0em
%\theorempreskip{0pt}
%\theorempostskip{0pt}
%\theoremseparator{\hspace{1em}}
\theoremnumbering{arabic}
%\theoremsymbol{} %定理结束时自动添加的标志
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

%%%---  Publications -------------------------------
\newenvironment{publications}[1]
  {\renewcommand\bibname{}\begin{thebibliography}{#1}}
  {\end{thebibliography}}

%%%--- \upcite ----------------------------------------
\newcommand{\upcite}[1]{\textsuperscript{\cite{#1}}}  %自定义新命令\upcite, 使参考文献引用以上标出现

%%%%%%%--判断是否需要彩色链接-----------------------------
  \iflib
  \hypersetup{allcolors=black}
  \else
  \fi
%%%%%%%-------------------------------------------------
%%%%%%%--判断是否需要彩色链接-----------------------------
  \ifprint
  \hypersetup{allcolors=black}
  \else
  \fi
%%%%%%%-------------------------------------------------
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
\renewcommand{\contentsname}{目\quad 录}
\newcommand\acknowledgement{\backmatter\chapter[致谢]{\ziju{2}致谢}}

%%% ---- 章节标题设置 ----- %%%%
% 章标题 - 小二 / 黑体+Times New Roman
% 正  文 - 四号 / 宋体+Times New Roman
\CTEXsetup[format={\centering},titleformat={\heiti\xiaoerhao},nameformat={\heiti\xiaoerhao}]{chapter}
\CTEXsetup[format={\raggedright\sihao},titleformat={\heiti\sihao},nameformat={\heiti\sihao}]{section}
\CTEXsetup[format={\raggedright\wuhao},titleformat={\songti\wuhao},nameformat={\songti\wuhao}]{subsection}
%\CTEXsetup[format={\zihao{-4}\kaishu\raggedright}]{subsubsection}
\CTEXoptions[bibname={\xiaoerhao 参考文献}]
\setcounter{tocdepth}{4}
\setcounter{secnumdepth}{4}
\RequirePackage[font=small,textfont=it]{caption}

\allowdisplaybreaks
\endlinechar `\^^M
\endinput
