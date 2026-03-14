%!TEX TS-program = lualatex
%% vim: set fenc=utf-8 ts=1 sw=0 sts=0 sr et si tw=0 fdm=marker fmr=<<<,>>>:
%%
%% My personal document class by Andy3153
%%
%% https://github.com/Andy3153/my_style.cls
%% https://gitlab.com/Andy3153/my_style.cls
%%

% <<< Class info
\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{my_style}[2026-03-13 Andy3153's personal LaTeX document style]
% >>>

% <<< Packages before class gets loaded
\RequirePackage{expl3}      % LaTeX3 API
\RequirePackage{etoolbox}   % e-TeX tools for LaTeX
% >>>

% <<< Class options
% <<< Default values
\def\mystyle@options@fontsize {12}
\def\mystyle@options@papersize{a4}
\def\mystyle@options@language {english}

\def\mystyle@options@imagesupport{}
\def\mystyle@options@mathsupport {}
\def\mystyle@options@tablesupport{}
\def\mystyle@options@urlsupport  {}

\def\mystyle@options@docstyle                  {article}
\def\mystyle@options@docstyleChapterClearpage  {false}
\def\mystyle@options@docstyleChapterStyle      {article}
\def\mystyle@options@docstylePageLayout        {oneside}
\def\mystyle@options@docstyleSectioningOpen    {any}
\def\mystyle@options@docstyleToCClearpageBefore{false}
\def\mystyle@options@docstyleToCClearpageAfter {false}
% >>>

% <<< Declare keys
\DeclareKeys
{
 fontsize  .store = \mystyle@options@fontsize,
 papersize .store = \mystyle@options@papersize,
 language  .store = \mystyle@options@language,
 %
 imagesupport .store = \mystyle@options@imagesupport,
 mathsupport  .store = \mystyle@options@mathsupport,
 tablesupport .store = \mystyle@options@tablesupport,
 urlsupport   .store = \mystyle@options@urlsupport,
 %
 docstyle                   .store = \mystyle@options@docstyle,
 docstyleChapterClearpage   .store = \mystyle@options@docstyleChapterClearpage,
 docstyleChapterStyle       .store = \mystyle@options@docstyleChapterStyle,
 docstylePageLayout         .store = \mystyle@options@docstylePageLayout,
 docstyleSectioningOpen     .store = \mystyle@options@docstyleSectioningOpen,
 docstyleToCClearpageBefore .store = \mystyle@options@docstyleToCClearpageBefore,
 docstyleToCClearpageAfter  .store = \mystyle@options@docstyleToCClearpageAfter,
}
% >>>

% <<< Process options
\DeclareUnknownKeyHandler{\PassOptionsToClass{\CurrentOption}{memoir}}
\ProcessKeyOptions
% >>>
% >>>

% <<< `docstyle` options before class gets loaded
% <<< docstyle
\ifdefstring{\mystyle@options@docstyle}{article}
{
 \def\mystyle@options@docstyleChapterClearpage  {false}
 \def\mystyle@options@docstyleChapterStyle      {article}
 \def\mystyle@options@docstylePageLayout        {oneside}
 \def\mystyle@options@docstyleSectioningOpen    {any}
 \def\mystyle@options@docstyleToCClearpageBefore{false}
 \def\mystyle@options@docstyleToCClearpageAfter {false}
}

\ifdefstring{\mystyle@options@docstyle}{book}
{
 \def\mystyle@options@docstyleChapterClearpage  {true}
 \def\mystyle@options@docstyleChapterStyle      {hangnum}
 \def\mystyle@options@docstylePageLayout        {twoside}
 \def\mystyle@options@docstyleSectioningOpen    {right}
 \def\mystyle@options@docstyleToCClearpageBefore{true}
 \def\mystyle@options@docstyleToCClearpageAfter {true}
}
% >>>

% <<< docstylePageLayout
\ifdefstring{\mystyle@options@docstylePageLayout}{oneside}
{
 \PassOptionsToClass{oneside}{memoir}
}{}

\ifdefstring{\mystyle@options@docstylePageLayout}{twoside}
{
 \PassOptionsToClass{twoside}{memoir}
}{}
% >>>

% <<< docstyleSectioningOpen
\ifdefstring{\mystyle@options@docstyleSectioningOpen}{any}
{
 \PassOptionsToClass{openany}{memoir}
}{}

\ifdefstring{\mystyle@options@docstyleSectioningOpen}{left}
{
 \PassOptionsToClass{openleft}{memoir}
}{}

\ifdefstring{\mystyle@options@docstyleSectioningOpen}{right}
{
 \PassOptionsToClass{openright}{memoir}
}{}
% >>>
% >>>

% <<< Memoir class settings
\LoadClass[
 \mystyle@options@fontsize pt,
 \mystyle@options@papersize paper,
 extrafontsizes,                   % using scalable fonts that can exceed 25pt
]{memoir}
% >>>

% <<< `docstyle` options after class gets loaded
% <<< docstyleChapterClearpage
\ifdefstring{\mystyle@options@docstyleChapterClearpage}{false}
{
 \def\clearforchapter{}
}{}
% >>>

% <<< docstyleChapterStyle
\chapterstyle{\mystyle@options@docstyleChapterStyle}
% >>>

% <<< docstyleToCClearpageBefore
\ifdefstring{\mystyle@options@docstyleToCClearpageBefore}{true}
{
 \let\stdtableofcontents\tableofcontents
 \RenewDocumentCommand\tableofcontents{}{\cleardoublepage\stdtableofcontents}
}{}
% >>>

% <<< docstyleToCClearpageAfter
\ifdefstring{\mystyle@options@docstyleToCClearpageAfter}{true}
{
 \def\cfttocafterlisthook{\cleardoublepage}
}{}
% >>>
% >>>

% <<< Packages after class gets loaded
\RequirePackage{fontspec}   % advanced font selection in LuaLaTeX
\RequirePackage{xcolor}     % color extensions for LaTeX
\RequirePackage[
 \mystyle@options@language,
 provide*=*,
]{babel}                    % multilingual support for LaTeX

% <<< Conditionals to load packages
\AtEndPreamble
{
 \@ifpackageloaded{graphicx}{\def\mystyle@options@imagesupport{true}}{}
 \@ifpackageloaded{mathtools}{\def\mystyle@options@mathsupport{true}}{}
 \@ifpackageloaded{hyperref}{\def\mystyle@options@urlsupport{true}}{}
}
% >>>>

% <<< For images
\ifdefstring{\mystyle@options@imagesupport}{true}
{
 \RequirePackage{graphicx} % graphics support
 \RequirePackage{float}    % better floating figures
 \RequirePackage{caption}  % better figure captions
 \RequirePackage{mdframed} % frames around figures
 \RequirePackage{rotating} % float rotation
}{}
% >>>

% <<< For tables
\ifdefstring{\mystyle@options@tablesupport}{true}
{
 \RequirePackage{ltablex}  % table extensions
 \RequirePackage{multirow} % table cells spanning multiple rows
 \RequirePackage{siunitx}  % `S` column type
}{}
% >>>

% <<< For math
\ifdefstring{\mystyle@options@mathsupport}{true}
{
 \RequirePackage[fleqn]{mathtools} % mathematical tools to use with amsmath
 %\RequirePackage{unicode-math}          % unicode mathematics support
}{}
% >>>

% <<< For URLs
\AtEndPreamble
{
 \RequirePackage{hyperref} % hypertext in LaTeX

 \ifdefstring{\mystyle@options@urlsupport}{true}
 {
  \PassOptionsToPackage{hyphens}{url}           % URLs will break at hyphens
  \PassOptionsToPackage{naturalnames}{hyperref} % LaTeX-computed names for links

  \RequirePackage{xurl}     % break URLs wherever
  \RequirePackage{bookmark} % better hyperref bookmarks
 }{}
}
% >>>
% >>>

% <<< Page layout
\setlrmarginsandblock{25mm}{20mm}{*}   % spine and edge margins
\setulmarginsandblock{20mm}{*}   {*}   % top and bottom margins
\setmarginnotes      {3mm} {20mm}{0mm} % `\marginparsep`, `\marginparwidth`
\checkandfixthelayout                  % apply margin settings

\setlength\parindent{10mm} % paragraph indentation
% >>>

% <<< Document division styles
% <<< Document division numbering depth
\setsecnumdepth{subsubsection} %part
\maxsecnumdepth{subsubsection}
% >>>
% >>>

% <<< Pagination
\pagestyle{plain}
% >>>

% <<< Paragraph
% <<< Indent paragraphs after document divisions
\let\@afterindentfalse\@afterindenttrue
\@afterindenttrue % this is basically the entirety of the `indentfirst` package
% >>>
% >>>

% <<< Contents lists
% <<< ToC
\settocdepth{subsubsection} % ToC doc division depth

% <<< Document division
% <<< Indentation
\setlength{\cftchapterindent}{0bp}
\setlength{\cftsectionindent}{0bp}
\setlength{\cftsubsectionindent}{0bp}
\setlength{\cftsubsubsectionindent}{0bp}
% >>>

% <<< Name
%\RenewDocumentCommand\cftchaptername{}{\chaptername\space}
% >>>
% >>>
% >>>
% >>>

% <<< Floats and captions
% <<< Caption title
\addto\captionsromanian
{
 \RenewDocumentCommand\figurename{}{Fig.}
 \RenewDocumentCommand\tablename{}{Tabelul}
}
% >>>
% >>>


% <<< Margin notes
\@ifpackageloaded{marginnote}
{
 % <<< Custom font
 \renewcommand\marginfont{\ttfamily\footnotesize}
% >>>

 % <<< Make \ttfamily hyphenate words for the margin notes
 \DeclareFontFamily{OT1}{cmtt}{\hyphenchar\font=-1}
 \DeclareFontFamily{\encodingdefault}{\ttdefault}{\hyphenchar\font=`\-}
 \DeclareFontFamily{T1}{cmtt}{\hyphenchar\font=45}
% >>>
}
{}
% >>>

% <<< URLs
\AtEndPreamble
{
 \ifdefstring{\mystyle@options@urlsupport}{true}
 {
  \pdfstringdefDisableCommands
  {
   \def\\{}
   \def\texttt#1{<#1>}
  }

  \hypersetup
  {
   pdftitle={\@title},
   pdfauthor={\@author},
   breaklinks=true,
   colorlinks=true,
   urlcolor=black,
   linkcolor=black
  }
 }{}
}
% >>>

% <<< Math
\AtEndPreamble
{
 \ifdefstring{\mystyle@options@mathsupport}{true}
 {
  % <<< Declare operator tg
  \DeclareMathOperator{\tg}{tg}
  % >>>

  % <<< Replace multiplication symbol
  \let\stdtimes\times
  %\let\times\cdot
  \let\times\empty
  % >>>

  % <<< Use the second \epsilon variant
  \let\stdepsilon\epsilon
  \let\epsilon\varepsilon
  % >>>

  % <<< Display fractions nicely
  \let\stdfrac\frac
  \RenewDocumentCommand\frac{}{\displaystyle\stdfrac}
  \everymath{\displaystyle}
  % >>>
 }{}
}
% >>>

% <<< Custom commands
% <<< Insert image
\AtEndPreamble
{
 \ifdefstring{\mystyle@options@imagesupport}{true}
 {
  \NewDocumentCommand\insertimg{mO{}d<>}
  {
   \IfNoValueTF{#3}
   {
    \begin{figure}[H]
     \centering
     \includegraphics[#2]{#1}
    \end{figure}
   }
   {
    \begin{figure}[H]
     \centering
     \includegraphics[#2]{#1}
     \caption{#3}
    \end{figure}
   }
  }
 }{}
}
% >>>

% <<< Insert table
\AtEndPreamble
{
 \ifdefstring{\mystyle@options@tablesupport}{true}
 {
  \NewDocumentCommand\inserttbl{md<>m}
  {
   \IfNoValueTF{#2}
   {
    \begin{table}[!ht]
     \centering
     \begin{tabular}{#1}
      #3
     \end{tabular}
    \end{table}
   }
   {
    \begin{table}[!ht]
     \centering
     \begin{tabular}{#1}
      #3
     \end{tabular}
     \caption{#2}
    \end{table}
   }
  }
 }{}
}
% >>>

% <<< Insert URL
\ExplSyntaxOn
\AtEndPreamble
{
 \ifdefstring{\mystyle@options@urlsupport}{true}
 {
  \NewDocumentCommand\inserturl{m}
  {
   \tl_set:Nn \l__inserturl_url_tl {#1}
   \regex_replace_all:nnN {.*:\/\/(?:www.)?(.*[^\/])\/?} {\1} \l__inserturl_url_tl
   \inserturl_print:nV { #1 } \l__inserturl_url_tl
  }

  \tl_new:N \l__inserturl_url_tl
  \cs_new_protected:Nn \inserturl_print:nn
  {
   \href{#1}{\nolinkurl{#2}}
  }
  \cs_generate_variant:Nn \inserturl_print:nn { nV }
 }{}
}
\ExplSyntaxOff
% >>>

% <<< Insert note
\newlength{\Lnote}
\NewDocumentCommand\insertnote{m}
{
 \addtolength{\leftmargini}{4em}
 \settowidth{\Lnote}{\textbf{Notă:~}}
 \begin{quote}
  \rule{\dimexpr\textwidth-2\leftmargini}{1pt}\\
  \mbox{}\hspace{-\Lnote}\textbf{Notă:~}#1\\[-0.5ex]
  \rule{\dimexpr\textwidth-2\leftmargini}{1pt}
 \end{quote}
 \addtolength{\leftmargini}{-4em}
}
% >>>
% >>>

% <<< Reproducible build
\pdfvariable suppressoptionalinfo \numexpr32+64+512\relax
% >>>
