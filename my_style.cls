%!TEX TS-program = lualatex
%% vim: set fenc=utf-8 ts=1 sw=0 sts=0 sr et si tw=0 fdm=marker fmr=<<<,>>>:
%%
%% My personal document class by Andy3153
%%
%% https://gitlab.com/Andy3153/my_style.cls
%% https://github.com/Andy3153/my_style.cls
%%

% <<< Class info
\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{my_style}[2026-03-13 Andy3153's personal LaTeX document style]
% >>>

% <<< Class options
% <<< Process options
\DeclareOption*{\PassOptionsToClass{\CurrentOption}{memoir}} % pass options to base class if not defined
\ProcessOptions\relax
% >>>
% >>>

% <<< Memoir class settings
\LoadClass[
 extrafontsizes, % using scalable fonts that can exceed 25pt
 *pt,            % custom size as the normal type size
]{memoir}
% >>>

% <<< Packages
\RequirePackage{expl3}    % LaTeX3 API
\RequirePackage{etoolbox} % e-TeX tools for LaTeX
\RequirePackage{fontspec} % advanced font selection in LuaLaTeX
\RequirePackage{xcolor}   % color extensions for LaTeX

% <<< Conditionals to load packages
\NewDocumentCommand\LoadPackagesForImages{}{\def\@LoadPackagesForImages{true}}
\NewDocumentCommand\LoadPackagesForTables{}{\def\@LoadPackagesForTables{true}}
\NewDocumentCommand\LoadPackagesForMath{}{\def\@LoadPackagesForMath{true}}
\NewDocumentCommand\LoadPackagesForURLs{}{\def\@LoadPackagesForURLs{true}}

\AtEndPreamble
{
 \@ifpackageloaded{graphicx}{\def\@LoadPackagesForImages{true}}{}
 \@ifpackageloaded{mathtools}{\def\@LoadPackagesForMath{true}}{}
 \@ifpackageloaded{hyperref}{\def\@LoadPackagesForURLs{true}}{}
}
% >>>>

% <<< For images
\AtEndPreamble
{
 \ifdefstring{\@LoadPackagesForImages}{true}
 {
  \RequirePackage{graphicx} % graphics support
  \RequirePackage{float}    % better floating figures
  \RequirePackage{caption}  % better figure captions
  \RequirePackage{mdframed} % frames around figures
  \RequirePackage{rotating} % float rotation
 }{}
}
% >>>

% <<< For tables
\AtEndPreamble
{
 \ifdefstring{\@LoadPackagesForTables}{true}
 {
  \RequirePackage{ltablex}  % table extensions
  \RequirePackage{multirow} % table cells spanning multiple rows
  \RequirePackage{siunitx}  % `S` column type
 }{}
}
% >>>

% <<< For math
\AtEndPreamble
{
 \ifdefstring{\@LoadPackagesForMath}{true}
 {
  \PassOptionsToPackage{fleqn}{mathtools} % mathematical tools to use with amsmath
  %\RequirePackage{unicode-math}          % unicode mathematics support
 }{}
}
% >>>

% <<< For URLs
\AtEndPreamble
{
 \RequirePackage{hyperref} % hypertext in LaTeX

 \ifdefstring{\@LoadPackagesForURLs}{true}
 {
  \PassOptionsToPackage{hyphens}{url}           % URLs will break at hyphens
  \PassOptionsToPackage{naturalnames}{hyperref} % LaTeX-computed names for links

  \RequirePackage{xurl}     % break URLs wherever
  \RequirePackage{bookmark} % better hyperref bookmarks
 }{}
}
% >>>
% >>>

% <<< Language
\RequirePackage[english,romanian,provide*=*]{babel} % Romanian characters support
% >>>

% <<< Page layout
\setlrmarginsandblock{25mm}{20mm}{*}   % spine and edge margins
\setulmarginsandblock{20mm}{*}   {*}   % top and bottom margins
\setmarginnotes      {3mm} {20mm}{0mm} % `\marginparsep`, `\marginparwidth`
\checkandfixthelayout                  % apply margin settings

\setlength\parindent{10mm} % paragraph indentation
\setlength\parskip{2mm}    % paragraph spacing
% >>>

% <<< Document division styles
% <<< Document division numbering depth
\setsecnumdepth{subsubsection} %part
\maxsecnumdepth{subsubsection}
% >>>

% <<< Chapter
\chapterstyle{article}
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
 \ifdefstring{\@LoadPackagesForURLs}{true}
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
 \ifdefstring{\@LoadPackagesForMath}{true}
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
 \ifdefstring{\@LoadPackagesForImages}{true}
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
 \ifdefstring{\@LoadPackagesForTables}{true}
 {
  \NewDocumentCommand\inserttbl{md<>m}
  {
   \IfNoValueTF{#2}
   {
    \begin{table}[!ht]
     \centering\xbp
     \begin{tabular}{#1}
      #3
     \end{tabular}
    \end{table}
   }
   {
    \begin{table}[!ht]
     \centering\xbp
     \captionnamefont{\xbp\bfseries\itshape}
     \captiontitlefont{\xbp\bfseries\itshape}
     \RenewDocumentCommand\thetable{}{\arabic{table}}
     \caption{#2}
     \begin{tabular}{#1} #3 \end{tabular}
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
 \ifdefstring{\@LoadPackagesForURLs}{true}
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
