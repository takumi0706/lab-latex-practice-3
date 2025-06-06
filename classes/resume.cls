\ProvidesClass{classes/resume}[2023/02/06 resume]

% (u)pLaTeX非互換パッケージに対して互換させるパッチを読み込む命令
\RequirePackage{plautopatch}

% 2カラム,A4,フォントサイズ9pt
\LoadClass[
    twocolumn,
    paper=a4,
    fontsize=11pt,
    disablejfam,
    head_space=20mm,
    foot_space=20mm,
    gutter=15mm,
    fore-edge=15mm,
    column_gap=10mm]
    {jlreq}

\RequirePackage{ifptex}
\RequirePackage{ifluatex}

\PassOptionsToPackage{hyphens}{url}
\RequirePackage{secdot} % sectionの数字の後のドットの制御
\sectiondot{section}
\RequirePackage{setspace} % 行間設定用パッケージ
\setstretch{0.8} % 行間設定
\RequirePackage{here} % 好きな位置にfigなどを置くためのパッケージ
\RequirePackage{bm} % ベクトルを大文字で書くためのパッケージ
\RequirePackage[hyphens]{xurl} % URLを表示するためのパッケージ、ハイフンでの改行を許可
\urlstyle{same} % URLの表示形式を本文と同じにする
\RequirePackage{paralist} % インラインリストのパッケージ
\RequirePackage{amssymb, amsmath} % 高度な数式記述用パッケージ
\RequirePackage{mathtools} % 高度な数式記述用パッケージ
\RequirePackage{newtxtext,newtxmath} % Times系フォントを使用するためのパッケージ
\RequirePackage{tabularray} % 高度な表組み用パッケージ
% \RequirePackage{minted} % ソースコード表示の用パッケージ
\RequirePackage{siunitx} % SI単位記法に準拠した形式で単位を書くためのパッケージ
\RequirePackage{subfiles} % 大規模な文章を分割して記述して、統合するためのパッケージ
\RequirePackage{indentfirst} % 最初の段落でインデントするためのパッケージ
\RequirePackage{type1cm} % 文字の大きさを自由に変えるためのパッケージ


\ifluatex
    % LuaTeXを日本語で使うための設定
    \RequirePackage{luatexja}
    % 日本語フォントは原ノ味フォントを使用
    \RequirePackage{luatexja-fontspec}
    \RequirePackage[haranoaji,no-math,deluxe]{luatexja-preset}

    % 図表関連のパッケージを読み込む
    \RequirePackage{graphicx}

    % ハイパーリンクを設定
    \RequirePackage[unicode,hidelinks,pdfusetitle]{hyperref}
\else
    \ifuptex
        % upLaTeXのフォントを設定
        \RequirePackage[deluxe]{otf}
        \RequirePackage[haranoaji,noalphabet]{pxchfon}

        % Font shape JY2/hmc/b/n' undefined (Font) using JY2/hmc/bx/n' instead.
        \DeclareFontShape{JY2}{hmc}{b}{n}{<->ssub*hmc/bx/n}{}

        % LaTeX Font: Font shape `JT2/hmc/b/n' undefine(Font)	using `JT2/hmc/m/n' instead.
        \DeclareFontShape{JT2}{hmc}{b}{n}{<->ssub*hmc/m/n}{}

        % 図表関連のパッケージを読み込む
        \RequirePackage{color}
        \RequirePackage[dvipdfmx]{graphicx}

        % ハイパーリンクを設定
        \RequirePackage[dvipdfmx,unicode,hidelinks,pdfusetitle]{hyperref}

    \else
        % pTeXでコンパイルしようとする場合はエラーを出す
        \ClassError{resume}{This class file is for LuaLaTeX or upLaTeX only.}{Use LuaLaTeX or upLaTeX to compile this document.}
    \fi
\fi

% \RequirePackage{enumitem} % 高機能番号付き箇条書きのパッケージ
\RequirePackage{tabularx} % 表の幅を指定するためのパッケージ
\RequirePackage[bibstyle=bibliography,
                sorting=none,
                isbn=false,
                doi,
                giveninits=false,
                uniquename=full,
                useprefix=true,
                urldate=iso,
                seconds
]{biblatex} % biblatexを使用するためのパッケージ
\addbibresource{references.bib}

%ページ数の書式
\pagestyle{empty}

% figの余白の調整
\setlength{\intextsep}{0pt}

% キャプションとサブキャプションの設定
\RequirePackage{silence}
\WarningFilter{caption}{Unknown document class (or package)}
\RequirePackage{caption}
\RequirePackage{subcaption}
\captionsetup[figure]{labelsep=quad, labelformat=simple, name=\bfseries Fig., skip=5pt, font={stretch=0.8}, belowskip=0pt}
\captionsetup[subfigure]{labelsep=space, labelformat=simple, name=\bfseries Fig., skip=3pt, font={stretch=0.8}, belowskip=0pt}
\renewcommand*{\thesubfigure}{(\alph{subfigure})}
\captionsetup[table]{labelsep=colon, labelformat=simple, name=表, skip=5pt, font={stretch=0.8}, belowskip=0pt}

% 本文中のFigureとTableの表記統一のため，\Fig・\Tableを定義
% 引数としてlabelを受け取り，それを使ってFigureやTableを参照する
% \FigTableマクロの定義
\newcommand{\FigTableEq}[3][]{%
    \def\temp{#1}%
    \ifx\temp\empty
        {#2~\ref{#3}}%
    \else
        \textbf{#2~\ref{#3}}%
    \fi
}

% \Figマクロの定義
\newcommand{\Fig}[2][]{%
    \FigTableEq[#1]{Fig.}{#2}%
}

% \Figureマクロの定義
\newcommand{\Figure}[2][]{%
    \FigTableEq[#1]{Figure}{#2}%
}

% \Tableマクロの定義
\newcommand{\Table}[2][]{%
    \FigTableEq[#1]{Table}{#2}%
}

% \Equationマクロの定義
\newcommand{\Eq}[2][]{%
    \FigTableEq[#1]{Eq.}{#2}%
}

% sectionのサイズを合わせる
\RenewBlockHeading{section}{1}{font={\Large\bfseries},after_label_space=0\jlreq@zw}
\RenewBlockHeading{subsection}{2}{font={\large\bfseries},after_label_space=0\jlreq@zw}
\RenewBlockHeading{subsubsection}{3}{font={\normalsize\bfseries},after_label_space=0\jlreq@zw}

% セクション類の空白の設定
\ModifyHeading{section}{before_space=15pt, after_space=15pt}
\ModifyHeading{subsection}{before_space=15pt, after_space=15pt}
\ModifyHeading{subsubsection}{before_space=5pt, after_space=5pt}
% セクションタイトルが一行以下なら下、２行以上なら上
% \ModifyHeading{section}{lines=1}
% \ModifyHeading{subsection}{lines=1}
% \ModifyHeading{subsubsection}{lines=1}

% セクションが連続する際の行取りを設定
\SetBlockHeadingSpaces{
    {_section{*},_subsection{before_space=0pt, after_space=5pt}}
    {_subsection{*},_subsubsection{before_space=0pt, after_space=5pt}}
}

% タイトルの設定
\makeatletter
\renewcommand{\@maketitle}{\newpage
    \centering
    \fontsize{14pt}{14pt}\selectfont
    \@title
    \par

    \vspace{.5\jlreq@zh}
    \fontsize{10pt}{10pt}\selectfont
    \@author
    \par
    \vspace{2\jlreq@zh}
}
\normalsize
\makeatother

% fancyhdr を使ってページ上部に横線を設定
\RequirePackage{fancyhdr}
\AtBeginDocument{%
  % デフォルトページスタイルを fancy に
  \pagestyle{fancy}%
  % ヘッダ／フッタをクリア
  \fancyhf{}%
  % ヘッダルールの太さ
  \renewcommand{\headrulewidth}{1pt}%
  % フッタルール不要
  \renewcommand{\footrulewidth}{0pt}%
  \fancypagestyle{plain}{%
    \fancyhf{}%
    \renewcommand{\headrulewidth}{1pt}%
    \renewcommand{\footrulewidth}{0pt}%
  }%
}

\newtheorem{theorem}{定理} % 定理環境
\newtheorem{lemma}{補題} 


% 著者名のフォント設定（普通のフォントに）
\renewcommand*{\mkbibnamefamily}[1]{\textup{#1}}
\renewcommand*{\mkbibnamegiven}[1]{\textup{#1}}

% タイトルのフォーマット（普通のフォントに）
\DeclareFieldFormat[article,inbook,incollection,inproceedings]{title}{#1}

% ジャーナル名をイタリックに
\DeclareFieldFormat{journaltitle}{\textit{#1}}

% エントリ間のスペース調整
\setlength{\bibitemsep}{0.5em}
\setlength{\bibparsep}{0pt}

% ボリュームに「Vol.」を追加
\DeclareFieldFormat[article,inbook,incollection,inproceedings]{volume}{Vol.~#1}

% ナンバーに「No.」を追加
\DeclareFieldFormat[article,inbook,incollection,inproceedings]{number}{No.~#1}

% 基本の区切り文字をドット+スペースに設定
\renewcommand*{\newunitpunct}{.\space}

% ジャーナルタイトル以降の区切り文字を読点+スペースに変更
\renewbibmacro*{journal+issuetitle}{%
  \usebibmacro{journal}%
  \setunit*{，\space}% ジャーナル名の後は読点
  \iffieldundef{series}
    {}
    {\newunit
     \printfield{series}%
     \setunit{\addspace}}%
  \usebibmacro{volume+number+eid}%
  \setunit{，\space}% 巻・号の後は読点
  \usebibmacro{issue+date}%
  \setunit{\addcolon\space}%
  \usebibmacro{issue}%
  \newunit
}

% ページ番号と年の間も読点に
\DeclareFieldFormat[article,inbook,incollection,inproceedings]{pages}{pp.~#1\addcomma}

% 出力の調整
\AtEveryBibitem{%
  \csappto{blx@bbx@\thefield{entrytype}}{\setunit{，\space}}%
}

% 発行年を最後に移動するための設定
\renewbibmacro*{date+extrayear}{%
  % 年を出力しないようにする（後で最後に表示する）
}

% 著者名の後の発行年を削除
\renewbibmacro*{author/translator+others}{%
  \usebibmacro{author}%
  \setunit{\printdelim{authortypedelim}}%
  \usebibmacro{bytranslator+others}%
  % 著者名の後の年表示をスキップ
}

% 記事(article)用のドライバーを修正
\DeclareBibliographyDriver{article}{%
  \usebibmacro{bibindex}%
  \usebibmacro{begentry}%
  \usebibmacro{author/translator+others}%
  \setunit{\labelnamepunct}\newblock
  \usebibmacro{title}%
  \newunit
  \printlist{language}%
  \newunit\newblock
  \usebibmacro{byauthor}%
  \newunit\newblock
  \usebibmacro{bytranslator+others}%
  \newunit\newblock
  \printfield{version}%
  \newunit\newblock
  \usebibmacro{journal+issuetitle}%
  \newunit
  \usebibmacro{byeditor+others}%
  \newunit
  \usebibmacro{note+pages}%
  \newunit\newblock
  \iftoggle{bbx:isbn}
    {\printfield{issn}}
    {}%
  \newunit\newblock
  \usebibmacro{doi+eprint+url}%
  \newunit\newblock
  \setunit{\addcomma\space}% 年の前にカンマとスペースを追加
  \printfield{year}% 最後に年を表示
  \newunit\newblock
  \usebibmacro{addendum+pubstate}%
  \setunit{\bibpagerefpunct}\newblock
  \usebibmacro{pageref}%
  \newunit\newblock
  \iftoggle{bbx:related}
    {\usebibmacro{related:init}%
     \usebibmacro{related}}
    {}%
  \usebibmacro{finentry}%
}

% 他の文献タイプも同様に修正（book, incollection, inproceedings など）
\DeclareBibliographyDriver{inproceedings}{%
  \usebibmacro{bibindex}%
  \usebibmacro{begentry}%
  \usebibmacro{author/editor+others/translator+others}%
  \setunit{\labelnamepunct}\newblock
  \usebibmacro{maintitle+title}%
  \newunit
  \printlist{language}%
  \newunit\newblock
  \usebibmacro{byauthor}%
  \newunit\newblock
  \usebibmacro{byeditor+others}%
  \newunit\newblock
  \printfield{edition}%
  \newunit
  \printfield{volumes}%
  \newunit\newblock
  \usebibmacro{series+number}%
  \newunit\newblock
  \printfield{note}%
  \newunit\newblock
  \usebibmacro{publisher+location+date}%
  \newunit\newblock
  \usebibmacro{chapter+pages}%
  \newunit
  \printfield{pagetotal}%
  \newunit\newblock
  \iftoggle{bbx:isbn}
    {\printfield{isbn}}
    {}%
  \newunit\newblock
  \usebibmacro{doi+eprint+url}%
  \newunit\newblock
  \setunit{\addcomma\space}% 年の前にカンマとスペースを追加
  \printfield{year}% 最後に年を表示
  \newunit\newblock
  \usebibmacro{addendum+pubstate}%
  \setunit{\bibpagerefpunct}\newblock
  \usebibmacro{pageref}%
  \newunit\newblock
  \iftoggle{bbx:related}
    {\usebibmacro{related:init}%
     \usebibmacro{related}}
    {}%
  \usebibmacro{finentry}%
}

% 出版社と場所のマクロを修正（年を除く）
\renewbibmacro*{publisher+location+date}{%
  \printlist{publisher}%
  \setunit*{\addcomma\space}%
  \printlist{location}%
  \newunit
}

% labelyearの出力を無効化
\AtEveryBibitem{%
  \clearfield{labelyear}%
  \clearfield{labelmonth}%
}

% date+extrayear マクロを空にする
\renewbibmacro*{date+extrayear}{}

% articleの問題を解決するため、issue+dateマクロを修正
\renewbibmacro*{issue+date}{%
  \printfield{issue}%
  % ここで日付表示を削除
  \newunit
}

% volume+number+eidマクロも修正して年を表示しない
\renewbibmacro*{volume+number+eid}{%
  \printfield{volume}%
  \setunit*{\addspace}%
  \printfield{number}%
  \setunit{\addcomma\space}%
  \printfield{eid}%
}

% journal+issuetitleマクロのさらなる修正
\renewbibmacro*{journal+issuetitle}{%
  \usebibmacro{journal}%
  \setunit*{，\space}% ジャーナル名の後は読点
  \iffieldundef{series}
    {}
    {\newunit
     \printfield{series}%
     \setunit{\addspace}}%
  \usebibmacro{volume+number+eid}%
  \setunit{，\space}% 巻・号の後は読点
  \iffieldundef{issue}
    {}
    {\printfield{issue}%
     \setunit{\addcolon\space}}%
  % ここでは年を出力しない
  \newunit
}

% ボリュームに「Vol.」を追加し、後ろにカンマとスペースを入れる
\DeclareFieldFormat[article,inproceedings]{volume}{Vol.~#1\addcomma\space}
