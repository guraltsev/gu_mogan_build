<TeXmacs|2.1.4>

<style|<tuple|article|preview-ref|number-long-article|smart-ref|framed-session|llm>>

<\body>
  <\hide-preamble>
    <specific|latex|% !!!!begin[TeXmacs][preamble]>

    * TOC depth:

    Stop at sections (do not include subsections)

    <assign|subsubsection-toc|<macro|name|>>

    \;

    * The \<less\>todo\<gtr\> macro

    We want to avoid conflict with the LaTeX package todonotes so we redefine
    the todo macro

    <assign|tmtodo|<macro|body|<todo|<arg|body>>>>

    \ 

    * Equation alignment environments

    This construct can be exported to \ LaTeX and is rendered as a
    left-top-aligned block of equations. This is very convenient for
    splitting multi-line equations

    \;

    <assign|ltae|<macro|body|<tabular*|<tformat|<twith|table-valign|T>|<twith|table-min-cols|1>|<twith|table-max-cols|1>|<cwith|1|-1|1|-1|cell-halign|l>|<cwith|1|-1|1|-1|cell-lsep|0ln>|<arg|body>>>>>

    <assign|cases|<macro|body|<math-table-base|<style-with|src-compact|none|<left|{><tformat|<cwith|1|-1|1|-1|cell-swell|<value|table-math-swell>>|<twith|table-min-cols|1>|<twith|table-max-cols|2>|<arg|body>><right|.>>>>>

    \;

    * Common macro defitions

    ** Fonts

    <assign|mc|<macro|1|<with|math-font|cal|<arg|1>>>> calligraphic math

    <assign|mf|<macro|1|<with|math-font|Euler|<arg|1>>>> fraktur math

    <assign|mbb|<macro|1|<with|math-font|Bbb|<arg|1>>>> blackboard math

    <assign|mbf|<macro|1|<with|font-series|bold|<arg|1>>>> boldface math

    <assign|mb|<macro|1|<with|font-series|bold|<arg|1>>>> boldface math

    <assign|mrm|<macro|1|<math-up|<arg|1>>>> math

    <assign|ms|<macro|1|<with|math-font|cal*|<arg|1>>>> script math

    ** Noteworthy sets

    <assign|N|<macro|<mbb|N>>> naturals

    <assign|Z|<macro|<mbb|Z>>> integers

    <assign|Q|<macro|<mbb|Q>>> rationals

    <assign|R|<macro|<mbb|R>>> reals

    <assign|C|<macro|<mbb|C>>> complex numbers

    <assign|W|<macro|<mbb|W>>> walsh numbers

    <assign|F|<macro|<mbb|F>>> a finite field

    <assign|HH|<macro|<mbb|H>>> quaternions

    ** Function spaces / sets

    <assign|Sch|<macro|<ms|S>>> Schwarz space

    <assign|Bor|<macro|<ms|B>>> Borel functions/sets

    <assign|Lip|<macro|<math-up|Lip>>> Lipshitz functions

    <assign|loc|<macro|<math-up|loc>>> locally

    ** Linear algebra

    <assign|Lin|<macro|<math-up|Lin>>>

    <assign|End|<macro|<math-up|End>>>

    <assign|Hom|<macro|<math-up|Hom>>>

    <assign|Id|<macro|<math-up|id>>>

    <assign|rk|<macro|<math-up|rk>>>

    <assign|tr|<macro|<math-up|tr>>>

    ** Point set topology / metric spaces\ 

    <assign|diam|<macro|<math-up|diam>>> diameter

    <assign|dist|<macro|<math-up|dist>>> distance

    <assign|spt|<macro|<math-up|spt>>> support

    ** Left/right -hand-side

    <assign|LHS|<macro|1|<math-up|LHS><arg|1>>> Left hand side

    <assign|RHS|<macro|1|<math-up|RHS><arg|1>>> Right hand side

    ** Miscellaneous math

    <assign|eqdef|<macro|\<assign\>>> assignment

    <assign|eqd|<macro|\<assign\>>> assignment

    <assign|dd|<macro|\<mathd\>>> d of the differential

    <assign|st|<macro|\<suchthat\>>> such that

    <assign|Fourier|<macro|<mf|F>>> Fourier transform operator

    <assign|FT|<macro|body|<wide|<arg|body>|^>>> Fourier transform

    <assign|pv|<macro|<math-up|pv>>> principle value

    <assign|E|<macro|<mbb|E>>> expectation

    <assign|restrict|<macro|1|<move|<left|lvert>|0pt|-3pt><rsub|<arg|1>>>>
    restriction to a domain

    <assign|1|<macro|<mbb|1>>> characteristic function

    <assign|sgn|<macro|<math-up|sgn>>> signum

    ** Symmetries

    <assign|Mod|<macro|<math-up|Mod>>> Modulation

    <assign|Tr|<macro|<math-up|Tr>>> Translation

    <assign|Dil|<macro|<math-up|Dil>>> Dilation

    \;

    <specific|latex|% !!!!end[TeXmacs][preamble]>

    \;

    <specific|latex|% !!!!begin[LaTeX][document]>

    <specific|latex|%% ********>

    <specific|latex|%% Uncomment only one of the following>

    <specific|latex|\\documentclass[a4paper,10pt,intlimits,sumlimits]{amsart}>

    <specific|latex|%\\documentclass[a4paper,10pt,intlimits,sumlimits,draft]{amsart}>

    <specific|latex|%\\documentclass[a4paper,10pt,intlimits,sumlimits,final]{amsart}>

    <specific|latex|%% ********>

    <specific|latex|\\usepackage{my-paper}>

    <specific|latex|\\usepackage{my-macros}>

    <specific|latex|\\usepackage{my-texmacs}>

    <specific|latex|%% ********>

    <specific|latex|%% * TOC depth: >

    <specific|latex|%% the number determines the depth in the table of
    contents>

    <specific|latex|%% 1: Stop at sections (do not include subsubsections)>

    <specific|latex|%% 2: Stop at subsections (do not include
    subsubsections)>

    <specific|latex|\\setcounter{tocdepth}{2}>

    <specific|latex|% !!!!begin[LaTeX][bibliography]>

    <specific|latex|\\addbibresource{ubht.bib}>

    <specific|latex|% !!!!end[LaTeX][bibliography]>

    \;

    * Macros Local to this file:

    ** Operators and forms related to BHT\ 

    <assign|BHWF|<macro|<math-up|BHWF>>> Bilinear Hilbert wave packet form

    <assign|BHF|<macro|<math-up|BHF>>> \ Bilinear Hilbert form

    <assign|BHT|<macro|<math-up|BHT>>> Bilinear Hilbert transform

    <assign|Hil|<macro|<math-up|H>>> Hilbert transform

    <assign|HLM|<macro|<math-up|M>>> Hardy Littlewood maximal function

    ** Parameter\ 

    <assign|gr|<macro|<mf|r>>> wave packet frequency radius

    ** Time frequency notions\ 

    <assign|Emb|<macro|<math-up|Emb>>> Wave packet embedding

    <assign|mT|<macro|<mf|T>>> Model tree

    <assign|TT|<macro|<mbb|T>>> Collection of all trees

    <assign|DD|<macro|<mbb|D>>> Collection of all strips

    <assign|Rad|<macro|<ms|R>>> Radon measures

    ** Sizes\ 

    <assign|SF|<macro|<mbb|F>>> Full size

    <assign|SU|<macro|<mbb|U>>> Uniform size

    <assign|SB|<macro|<mbb|B>>> Bilinear size

    <assign|SI|<macro|<mbb|I>>> Integral size

    <assign|SJ|<macro|<mbb|J>>> Maximal truncation size

    <assign|SL|<macro|<mbb|L>>> Lebesgue size

    <assign|SO|<macro|<mbb|S>>> Some other size

    <assign|XO|<macro|<mbb|X>>> Some other space

    <assign|BO|<macro|<mbb|B>>> Some other generating collections

    <assign|fL|<macro|<neg|L>>> Local outer Lebesgue

    ** Wave packet and defect operators

    <assign|wpD|<macro|<with|font|Euler|d>>> boost

    <assign|dfct|<macro|\<box\>>> defect
  </hide-preamble>

  <doc-data|<doc-title|The full range of uniform bounds for the bilinear
  Hilbert transform>|<doc-author|<author-data|<author-name|Gennady
  Uraltsev>>>|<doc-author|<author-data|<author-name|Michaª Warchalski>>>>

  <\table-of-contents|toc>
    <vspace*|1fn><with|font-series|bold|math-font-series|bold|<locus|<id|%1EBD134ADC8-1EBECF95370-4946892E>|<link|hyperlink|<id|%1EBD134ADC8-1EBECF95370-4946892E>|<url|#auto-1>>|1<space|2spc>Introduction>><vspace|0.5fn>

    <with|par-left|1tab|<locus|<id|%1EBD134ADC8-1EBED20AFA0--790CE52>|<link|hyperlink|<id|%1EBD134ADC8-1EBED20AFA0--790CE52>|<url|#auto-3>>|1.1<space|2spc>Applications>>

    <with|par-left|1tab|<locus|<id|%1EBD134ADC8-1EBECF6B718--790CE52>|<link|hyperlink|<id|%1EBD134ADC8-1EBECF6B718--790CE52>|<url|#auto-4>>|1.2<space|2spc>The
    symmetry space and the wave packet representation>>

    <with|par-left|1tab|<locus|<id|%1EBD134ADC8-1EBED106308--790CE52>|<link|hyperlink|<id|%1EBD134ADC8-1EBED106308--790CE52>|<url|#auto-5>>|1.3<space|2spc>Outline
    of the argument for non-uniform bounds>>

    <with|par-left|1tab|<locus|<id|%1EBD134ADC8-1EBE0E8CC98--790CE52>|<link|hyperlink|<id|%1EBD134ADC8-1EBE0E8CC98--790CE52>|<url|#auto-6>>|1.4<space|2spc>Outline
    of the proof of uniform bounds and structure of the paper.>>

    <with|par-left|1tab|<locus|<id|%1EBD134ADC8-1EBED3614C8--790CE52>|<link|hyperlink|<id|%1EBD134ADC8-1EBED3614C8--790CE52>|<url|#auto-7>>|1.5<space|2spc>Notation>>

    <with|par-left|1tab|<locus|<id|%1EBD134ADC8-1EBD91D6318--790CE52>|<link|hyperlink|<id|%1EBD134ADC8-1EBD91D6318--790CE52>|<url|#auto-8>>|1.6<space|2spc>Acknowledgements>>

    <vspace*|1fn><with|font-series|bold|math-font-series|bold|<locus|<id|%1EBD134ADC8-1EBDAC46268-4946892E>|<link|hyperlink|<id|%1EBD134ADC8-1EBDAC46268-4946892E>|<url|#auto-9>>|2<space|2spc>Wave
    packet representation.>><vspace|0.5fn>

    <vspace*|1fn><with|font-series|bold|math-font-series|bold|<locus|<id|%1EBD134ADC8-1EBDABC00A0-4946892E>|<link|hyperlink|<id|%1EBD134ADC8-1EBDABC00A0-4946892E>|<url|#auto-10>>|3<space|2spc>Outer
    Lebesgue spaces and the time-frequency-scale space.>><vspace|0.5fn>

    <with|par-left|1tab|<locus|<id|%1EBD134ADC8-1EBDAC0ED90--790CE52>|<link|hyperlink|<id|%1EBD134ADC8-1EBDAC0ED90--790CE52>|<url|#auto-11>>|3.1<space|2spc>Generalities
    of outer measure spaces>>

    <with|par-left|1tab|<locus|<id|%1EBD134ADC8-1EBD9BCB5F0--790CE52>|<link|hyperlink|<id|%1EBD134ADC8-1EBD9BCB5F0--790CE52>|<url|#auto-12>>|3.2<space|2spc>The
    time-frequency-scale space>>

    <with|par-left|1tab|<locus|<id|%1EBD134ADC8-1EBECEAB9F8--790CE52>|<link|hyperlink|<id|%1EBD134ADC8-1EBECEAB9F8--790CE52>|<url|#auto-13>>|3.3<space|2spc>Changes
    of variables and product sizes>>

    <with|par-left|1tab|<locus|<id|%1EBD134ADC8-1EBDAF2CF00--790CE52>|<link|hyperlink|<id|%1EBD134ADC8-1EBDAF2CF00--790CE52>|<url|#auto-14>>|3.4<space|2spc>Localized
    outer Lebesgue spaces>>

    <vspace*|1fn><with|font-series|bold|math-font-series|bold|<locus|<id|%1EBD134ADC8-1EBDAF8A780-4946892E>|<link|hyperlink|<id|%1EBD134ADC8-1EBDAF8A780-4946892E>|<url|#auto-15>>|4<space|2spc>The
    single tree estimate>><vspace|0.5fn>

    <vspace*|1fn><with|font-series|bold|math-font-series|bold|<locus|<id|%1EBD134ADC8-1EBD96E5E60-4946892E>|<link|hyperlink|<id|%1EBD134ADC8-1EBD96E5E60-4946892E>|<url|#auto-16>>|5<space|2spc>Forest
    estimates>><vspace|0.5fn>

    <vspace*|1fn><with|font-series|bold|math-font-series|bold|<locus|<id|%1EBD134ADC8-1EBE0B28C00-4946892E>|<link|hyperlink|<id|%1EBD134ADC8-1EBE0B28C00-4946892E>|<url|#auto-17>>|6<space|2spc>Non-uniform
    embedding bounds>><vspace|0.5fn>

    <with|par-left|1tab|<locus|<id|%1EBD134ADC8-1EBE0B34380--790CE52>|<link|hyperlink|<id|%1EBD134ADC8-1EBE0B34380--790CE52>|<url|#auto-18>>|6.1<space|2spc>SIO
    truncation size control>>

    <with|par-left|1tab|<locus|<id|%1EBD134ADC8-1EBE0C49F20--790CE52>|<link|hyperlink|<id|%1EBD134ADC8-1EBE0C49F20--790CE52>|<url|#auto-19>>|6.2<space|2spc>Counting
    function improvement>>

    <vspace*|1fn><with|font-series|bold|math-font-series|bold|<locus|<id|%1EBD134ADC8-1EBE0C74178-4946892E>|<link|hyperlink|<id|%1EBD134ADC8-1EBE0C74178-4946892E>|<url|#auto-20>>|7<space|2spc>Uniform
    embedding bounds - linear case >><vspace|0.5fn>

    <with|par-left|1tab|<locus|<id|%1EBD134ADC8-1EBE0C6FAF8--790CE52>|<link|hyperlink|<id|%1EBD134ADC8-1EBE0C6FAF8--790CE52>|<url|#auto-21>>|7.1<space|2spc>Uniform
    bounds for the exterior size>>

    <with|par-left|1tab|<locus|<id|%1EBD134ADC8-1EBECE8E798--790CE52>|<link|hyperlink|<id|%1EBD134ADC8-1EBECE8E798--790CE52>|<url|#auto-22>>|7.2<space|2spc>Uniform
    bounds for the singular size>>

    <with|par-left|1tab|<locus|<id|%1EBD134ADC8-1EBE0DD5B88--790CE52>|<link|hyperlink|<id|%1EBD134ADC8-1EBE0DD5B88--790CE52>|<url|#auto-23>>|7.3<space|2spc>Uniform
    bounds for the <with|mode|math|<with|math-font|Bbb|U><rsub|\<Gamma\>><rsup|u>\<Phi\><rsub|<with|math-font|Euler|r>><rsup|N>>
    size>>

    <vspace*|1fn><with|font-series|bold|math-font-series|bold|<locus|<id|%1EBD134ADC8-1EBECFF7E30-4946892E>|<link|hyperlink|<id|%1EBD134ADC8-1EBECFF7E30-4946892E>|<url|#auto-24>>|8<space|2spc>Uniform
    embedding bounds - bilinear case >><vspace|0.5fn>

    <vspace*|1fn><with|font-series|bold|math-font-series|bold|<locus|<id|%1EBD134ADC8-1EBECEE73C0-4946892E>|<link|hyperlink|<id|%1EBD134ADC8-1EBECEE73C0-4946892E>|<url|#auto-25>>|9<space|2spc>Summary
    and proof of uniform bounds>><vspace|0.5fn>

    <vspace*|1fn><with|font-series|bold|math-font-series|bold|<locus|<id|%1EBD134ADC8-1EBECE9DB58-4946892E>|<link|hyperlink|<id|%1EBD134ADC8-1EBECE9DB58-4946892E>|<url|#auto-26>>|10<space|2spc>Extra>><vspace|0.5fn>

    <vspace*|1fn><with|font-series|bold|math-font-series|bold|<locus|<id|%1EBD134ADC8-1EBECE98CA8-4946892E>|<link|hyperlink|<id|%1EBD134ADC8-1EBECE98CA8-4946892E>|<url|#auto-27>>|Bibliography>><vspace|0.5fn>
  </table-of-contents>

  <section|Introduction<label|sec:intro>>

  \;

  The bilinear Hilbert transform with parameter
  <math|\<beta\>\<in\><around*|[|0,1|]>> is a bilinear singular integral
  operator given by

  <\equation>
    <label|eq:BHT><BHT><rsub|\<beta\>><around*|[|f<rsub|1>,f<rsub|2>|]><around*|(|x|)><eqd><pv><big|int><rsub|<R>>f<rsub|1><around*|(|x-t|)>f<rsub|2><around*|(|x+\<beta\>
    t|)><frac|<dd>t|t>
  </equation>

  where <math|f<rsub|1>> and <math|f<rsub|2>> are Schwartz functions on the
  real line. This operator arises in diverse contexts: averages of
  <eqref|eq:BHT> over \ <math|\<beta\>> yield relevant correction terms for
  evaluating Cauchy integrals along boundaries of Lipschitz domains in
  <math|<C>> and for inverting elliptic operators with non-constant
  coefficients; fiberwise applications of bounds on <eqref|eq:BHT> can be
  used to bound multilinear singular integral operators with full
  <math|Gl<rsub|2>> symmetry. We elaborate and provide references for these
  applications further on.

  One is interested in showing the bounds\ 

  <\equation>
    <label|eq:BHT-bounds><around*|<left|\<\|\|\>|2>|<BHT><rsub|\<beta\>><around*|[|f<rsub|1>,f<rsub|2>|]>|<right|\<\|\|\>|2>><rsub|L<rsup|p><around*|(|<R>|)>>\<leq\>C<rsup|><rsub|p<rsub|1>,p<rsub|2>,\<beta\>><around*|\<\|\|\>|f<rsub|1>|\<\|\|\>><rsub|L<rsup|p<rsub|1>><around*|(|<R>|)>><around*|\<\|\|\>|f<rsub|2>|\<\|\|\>><rsub|L<rsup|p<rsub|2>><around*|(|<R>|)>>,<space|2em>p<rsup|-1>=p<rsub|1><rsup|-1>+p<rsub|2><rsup|-1>
  </equation>

  with a constant <math|C<rsub|p<rsub|1>,p<rsub|2>,\<beta\>>\<gtr\>0> that
  does not depend on <math|f<rsub|1>> and <math|f<rsub|2>>. The constraint on
  the exponents <math|<around*|(|p<rsub|1>,p<rsub|2>,p|)>> is the same as
  that of Hölder's inequality, which would apply if
  <math|<BHT><rsub|\<beta\>>> were replaced by the pointwise product
  <math|f<rsub|1>f<rsub|2>>. A scaling argument shows that these constraints
  are in fact necessary.

  \ In <cite|laceyEstimatesBilinearHilbert1997>, Lacey and Thiele proved the
  first estimates of type <smart-ref|eq:BHT-bounds>: they showed that
  <eqref|eq:BHT-bounds> holds when <math|2\<less\>p<rsub|1>,p<rsub|2>\<less\>\<infty\>>,
  <math|p\<less\>2>. This corresponds to the open triangle <math|c> in
  <smart-ref|fig:triangle>. The range of exponents for
  <smart-ref|eq:BHT-bounds> was later extended by Lacey and Thiele in
  <cite|laceyCalderonConjectureBilinear1998> to the convex hull of the open
  triangles <math|a<rsub|1>,a<rsub|2>,a<rsub|3>> in <smart-ref|fig:triangle>,
  where bounds below the li<marginal-note|normal|c|>ne
  <math|<around*|(|0,1,0|)>-<around*|(|0,0,1|)>> and to the upper left side
  of the line <math|<around*|(|1,0,0|)>-<around*|(|0,1,0|)>> are to be
  intended in the restricted weak sense, discussed in
  <cite-detail|thieleWavePacketAnalysis2006|Chapter 3>. Inspired by the works
  of Carleson <cite|carlesonConvergenceGrowthPartial1966> and Fefferman
  <cite|feffermanPointwiseConvergenceFourier1973> the authors of the above
  results used the paradigm of time-scale-frequency analysis.\ 

  When <math|\<beta\>=0> the operator <math|<BHT><rsub|\<beta\>><around*|[|f<rsub|1>,f<rsub|2>|]><around*|(|x|)>>
  is simpler, given by the pointwise product of the Hilbert transform of
  <math|f<rsub|1>> with <math|f<rsub|2>>:

  <\equation*>
    <BHT><rsub|0><around*|[|f<rsub|1>,f<rsub|2>|]><around*|(|x|)>=<around*|<left|(|1>|<Hil>f<rsub|1><around*|(|x|)>|<right|)|1>>f<rsub|2><around*|(|x|)>.
  </equation*>

  Bounds <eqref|eq:BHT-bounds> follow immediately for any
  <math|p<rsub|1>,p<rsub|2>\<in\><around*|(|1,\<infty\>|)>> by the
  boundedness of <math|f\<mapsto\><Hil>f> on
  <math|L<rsup|p<rsub|1>><around*|(|<R>|)>> and by Hölder's inequality.
  However, for fixed <math|p<rsub|1>,p<rsub|2>\<in\><around*|(|1,\<infty\>|)>>,
  the constant <math|C<rsub|p<rsub|1>,p<rsub|2>,\<beta\>>> obtained in
  <cite|laceyEstimatesBilinearHilbert1997> and
  <cite|laceyCalderonConjectureBilinear1998> grows linearly in
  <math|<around*|\||\<beta\>|\|><rsup|-1>>, though this is not stated
  explicitly therein. Naturally, in <cite|laceyCalderonConjectureBilinear1998>
  the authors posed the question of whether bounds <smart-ref|eq:BHT-bounds>
  hold with a constant <math|C<rsub|p<rsub|1>,p<rsub|2>>> independent of
  <math|\<beta\>>, in place of <math|C<rsup|><rsub|p<rsub|1>,p<rsub|2>,\<beta\>>>,
  and if so, for which range of exponents <math|p<rsub|1>,p<rsub|2>>. This is
  in accordance with the observation that in the limit <math|\<beta\>=0> we
  are still dealing with a bounded operator. <math|>Furthermore, the control
  of <math|C<rsub|p<rsub|1>,p<rsub|2>,\<beta\>>> with respect to
  <math|\<beta\>> is relevant for many applications where crucial terms are
  averages of <math|<BHT><rsub|\<beta\>>> over
  <math|\<beta\>\<in\><around*|[|0,1|]>>. Bounds <smart-ref|eq:BHT-bounds>
  with constant independent of <math|\<beta\>> are referred to as \Puniform
  bounds\Q; any bound that holds only for <math|\<beta\>\<gtrsim\>1> or with
  a constant that is allowed to depend on <math|\<beta\>>, are
  \Pnon-uniform\Q.\ 

  There is a rich collection of partial results concerning the uniform bound
  <smart-ref|eq:BHT-bounds>. In <cite|thieleUniformEstimate2002> Thiele
  established weak uniform bounds at the two upper corners of the triangle
  <math|c> in <smart-ref|fig:triangle>. Grafakos and Li in
  <cite|grafakosUniformBoundsBilinear2004> showed the uniform inequality in
  the open triangle <math|c>, and Li <cite|liUniformBoundsBilinear2006>
  proved the uniform bounds in the open triangles <math|a<rsub|1>>,
  <math|a<rsub|2>>. Using interpolation, one obtains the uniform bound
  <smart-ref|eq:BHT-bounds> in the range corresponding to the convex hull of
  the open triangles <math|a<rsub|2>>, <math|a<rsub|3>>, and <math|c> in
  <smart-ref|fig:triangle>. What, however, was not known up to date, is
  whether the uniform bound <smart-ref|eq:BHT-bounds> holds in the vicinity
  of <math|<around*|(|p<rsub|1>,p<rsub|2>|)>=<around*|(|\<infty\>,1|)>> and
  <math|<around*|(|p<rsub|1>,p<rsub|2>|)>=<around*|(|\<infty\>,\<infty\>|)>>
  i.e. in the corners of triangles <math|b<rsub|2>> and <math|b<rsub|3>>.
  This is precisely the main result of this work.

  <\theorem>
    <label|thm:main-1>The bound <eqref|eq:BHT-bounds> holds for all functions
    <math|f<rsub|1>,f<rsub|2>\<in\><Sch><around*|(|<R>|)>> as long as
    <math|p<rsub|1>\<in\><around*|(|1,\<infty\>|)>>,
    <math|p<rsub|2>\<in\><around*|(|1,\<infty\>|)>>, and
    <math|p\<gtr\><frac|2|3>> with a constant
    <math|C<rsub|p<rsub|1>,p<rsub|2>,\<beta\>>=C<rsub|p<rsub|1>,p<rsub|2>>>
    dependent only on <math|p<rsub|1>> and <math|p<rsub|2>> but <em|not on>
    <math|\<beta\>\<in\><around*|[|0,1|]>>.
  </theorem>

  The union of the regions <math|b<rsub|1>,b<rsub|2>,b<rsub|3>,c> in
  <smart-ref|fig:triangle> i.e. the triangle
  <math|<around*|(|1,0,0|)>-<around*|(|0,1,0|)>-<around*|(|0,0,1|)>> with its
  interior, is referred to as the Banach triangle because it corresponds to
  <math|p<rsub|1>,p<rsub|2>,p\<in\><around*|[|1,\<infty\>|]>>. Our methods
  cover this region directly while the extension to the full shaded region in
  <smart-ref|fig:triangle> is obtained by interpolation with
  <cite-detail|liUniformBoundsBilinear2006|Theorem 2>. As noted before,
  bounds outside the Banach triangle are to be intended in the restricted
  weak sense. Alternatively, we believe our methods can be used to obtain a
  uniform sparse domination (similar to that in
  <cite|culiucDominationMultilinearSingular2018> but uniform in
  <math|\<beta\>>), of the trilinear form associated to
  <math|<BHT><rsub|\<beta\>>>; this would imply <smart-ref|thm:main-1> in the
  full range directly. We leave this for possible subsequent work.\ 

  Since the Hilbert transform is not bounded on <math|L<rsup|\<infty\>>>, the
  uniform bound <smart-ref|eq:BHT-bounds> cannot hold on or below the
  <math|<around*|(|0,1,0|)>-<around*|(|0,0,1|)>> segment. Thus,
  <smart-ref|thm:main-1> covers the full range where the uniform bound
  <smart-ref|eq:BHT-bounds> for <math|\<beta\>\<in\><around*|[|0,1|]>> can
  hold, inside the range where bound <smart-ref|eq:BHT-bounds> is known to
  hold at all (non-uniformly). Furthermore, Lacey in
  <cite|laceyBilinearMaximalFunctions2000a> shows that even for the
  non-uniform bound <smart-ref|eq:BHT-bounds> \ the above range of exponents
  is sharp modulo endpoints, if considered for the
  natural<space|1em>modulation invariant class invariant bilinear operators
  comprising <math|<BHT><rsub|\<beta\>>> (see
  <cite|muscaluUniformEstimatesMultilinear2002> for a description of this
  class).

  Oberlin and Thiele <cite|oberlinNewUniformBounds2011>, prved
  <smart-ref|thm:main-1> for a Walsh model of the bilinear Hilbert transform.
  Their techniques rely on the perfect time frequency analysis of the Walsh
  phase space and on the possibility of constructing phase space tree
  projections, tools that are unavailable and we were unable to generalize to
  the real case.\ 

  <\big-figure|<image|<tuple|<#255044462D312E370A312030206F626A0A3C3C2F54797065202F436174616C6F672F50616765732032203020523E3E0A656E646F626A0A0A322030206F626A0A3C3C2F54797065202F50616765732F436F756E7420312F4B696473205B3320302052205D3E3E0A656E646F626A0A0A332030206F626A0A3C3C2F54797065202F506167652F506172656E742032203020522F4D65646961426F78205B30203020353132203531325D2F436F6E74656E74732034203020522F5265736F7572636573203C3C2F457874475374617465203C3C2F416C70686130203C3C2F434120312F636120313E3E0A2F416C70686131203C3C2F434120302E32343730353838323335323934313137382F636120302E32343730353838323335323934313137383E3E0A2F416C70686132203C3C2F434120302E363938303339323135363836323734352F636120302E363938303339323135363836323734353E3E0A2F416C70686133203C3C2F434120312F636120313E3E0A3E3E0A3E3E0A3E3E0A656E646F626A0A0A342030206F626A0A3C3C2F4C656E67746820353038312F46696C746572202F466C6174654465636F64653E3E0A0A73747265616D0A789CED5DCD8EE4B80D7E953A0788235996651F730A905B92430E410EC1044910EC06F90136AF9F8FFC6897CB624FA9AA3BBDBD3D9AD99D2E966899222992A22875BC04FCFDB9FCC871BC7CF9FEC26FF82FC05FFCF2BB7FFEED4FE1F2D7FFE837E1F2EFBFDA87DFFE0AFFFC1A987FBFA4CB7FF5ABEFB59370F94E7FCAFFDF59C7F253BEFFDBE5F797CB3FF090FC4557FCF054577F31DAA2D136A4758C795EE6B14C39AC4B483BB56ED3E9A5639E879897B08C6B1897759CD2655E86B9AC2BFE5BCA92C39240554C7108615C4B98D615586B71D0BE93EFA6314F711AD7659AE28851963284B94C0BFE1F532C82E5BC735CF23065F49DA6752E4B2A13F0A6290DCB1A4A8E399434A5E2F696963824D0B7E614F292D7D5A5AC699C22A8BFFCCC34C1245E89A9658C2EC3DC31B6F2A281B016767DEFB0EBF574FD611C3248F823C8F9B3A9E7787FEA3CAF7A2E25BFBBFC8104D46F8D87B7B675D7CC27BCF538F8AF8FB8A9CFEF5B75F5A157E76199F0E412D679CDD088E8F23A877998E6258552C2B2C06CBCC18B1BBA74879CC3388C29845042C825CEE5D13737F589313770E6A05D54EFE4ABF751D1DED6B23EAFDDDE4BDBEC74E33BDFD620FE68D3B8E5AD8D13B8CD7135BEF359B3FE0A2D6AE9EC1133D5F2CEC6E9F29C6D6CF6496DBADC2CDF1840C472B5561F2A587B7BFADEDAFABC31796DC26D8D7CDE45BCAF332F6F4CDF1B5BA237A6EEAD8DD68F3377FF1FB15FE3B44C71194ACA735A638070E7385FD20A8963CEE069AC41113D3D1C84B54925E23D18741EE712E2149652BD19C43C3AEA963E9F1EF557C3C01BB9CFB149EE355A8903ACD41452490857A78260232FC30A568679CE6398E6E952D2B92B47816AA42F404BD05AF4B3C68C172C5376FB6A22AA6180F2C21A2D63344BCEF39896799D212187AAB965843592BCF0CC2CA72B473835512D12FC222BE1FB914EEC1AF12D694443EC2B1A11D3DCB49871F196618CF314CB38E53515F8E49486324F699D8010CAB2E60BC83C77E6AD9F6AAC2F9738A2FF29E6692E70FA25BA7D8D2D647948D518E5850EDE38CC2B6CF45AA632237873A85A9A465863E1850EBFBCDE5AC86A92E303A6A22BC6B7A6188D160396A82511E1A19DF90F9B3A8432CD710D193111404F944EE6C3D38A549621672C0B22EC650979F53B2B0D6439380EC73CB433F73DA26A417AB91D6F840EBBBCCE1AC86A91E103C6A2EBC437A413573B318CF3E94FF377A249AF78FCA47FEB2991EE46B5155209C3B2AC312E408A18DC3204F00396729DC1C33923A205936EBBA953F6350EA432CC097DAE612D33B21548593868F1D4552815450E8A17ED7968D8FAC0AEC78494C092C702963934CDD3FDE1D5385F1C46D558B5482A8A1AA4F6800DEA3AF08975E003DA9C8C2CDDFDDDC51AEB2C5F20E2B132216E0C0BD29B192A50AB5CB595E9A95C0ED33062B98A8562C05A137924B7ABF12E45670C4F280E56255D872047DFEA6D5A47DF1C36395DD532A9696A90DB0366A7ABC1E756830F6879C639B45417B868D38055659C66A085B42E5857223395E6328EF00AF8278BB4E6535F6E39C3198969BC755A56BC214864398A0ED57D8D4D543958E721CA1B1DB43084312CF3120232EB49FAAAC89A56C4F7F7865823318F77CB2DA72B8FEF15512D327C28B3DB75E29BD1890F689362CA2D1B7D0E5A15EF22F73562873CAC4019117EBA71739D48F33CA1E4E4CA9A96044F11E6100B02FEBAAF113BC97768AA51DC18DC41AB1C8F4353EDC1BC7D53C71B3ABCF2FAAA455353D522BF87D2C75D1FBE097DF880B628216F757FE3BFC63A4B193219F238265929E78850D18BA3EB3C9D9B0C28EB804D7E2C9913D6CAF0169E1223CF788FA20AC3138A835567026A826A4D712A281CA573D8E47555C9A4A6A9416E0F25A5BB1A7C6635F8809607C26C28F3F3B0D641C63E2205866D07D1B08054DD94738209969D406CE4410AB73D39458515CE176130B632C692C7555428C07BD53D21D8BE479187731E1BDEE6604D03127C69C2AA1D244C4827D614A1DCE3EED82A9C2F1E972A2C8FDB678A5AE4F680E5E96AF0B9D5E0035A9EB8969692430F0DF5013962050A9C5C12E2C3350F283940A512169D05458A529658CE7D79358E151222D215BEA3605F1269362C7633CA189DBE96F53E550E4E3540BCCF418BD08E9466E0C41505950E4978E8FEF06A24195ECD2BAFB39AEB15510DF27B64FDD5F5E1DBD0870F688BA60912BD5BACEF619D9D0DD2FC4340D487E206544ECE33AA1B6AAFE59C0D70FC1FECF9302F51181C16C8397B3D2588EA1E490E4EED233CACB3B77128AABC9677EEA1F67F1E9B9CAE6A7ED724DD97DC0346A82BC26757840F687DD238369CAAC0C2DFC3BBF53248C0A73160A3008C596248A877C037277F85CEDC831C151696C871C61279C6971102CA2FF435B590E561558394373A78B7AE263A649D5CD60B43ACB1F0C29A5F4E671EEB2BAA9AE4F8483EA82BC637A6181FD03AD5719D7B62DDC13AFB1F27D4AC1D591DB67A2EB18E809D9EAA40DA21C9C1A9BD868775F63F0E45951F73C6E6B8448F4D4E5735BF6B92EE4BEE550BB4AE089F4B113EA0F5714CA77B8EDA433BCBB836E8B5AE38CEC153BBCACF783D55FECA21C943AA45E3A29DA55CD354298B373A47F11C46D55D791CAF486A91DEEB02A2AE0D9F4F1B3EA01D722A9DFCEBA83CBC32CC389993509330C730F320F26DFD1550CF7DB9175C54586EBD9ADB5B5563E6D1E52039276A5C3CD4714CD8FC9C50788112380CC9A30BC79F1B46596179256B5E671EF32BBA9A24F9BA42C6AE1A9F5C357E77F917CCA76A83FDC03D98FF823AC8476CCB0D52378E02A40125006995C6265592CB51E6CBCFF16381C21C21DC6889412E02C159A0BCF2FA6792A6A82DE3E507316638F74F08C35947ED01A75DA4093E4741F408007215804FC551A1712A02C42240C4F1166D8BDA23F4E100D86384027BC46257003CAD6DA88155107C199025BC215BE992262519E785774C085381126F1E20665A9409A88007204E53486113F63F6F1E4846A6B4E84346F284C5F6DE42249C3DD2168570B2E7CAFB809B0FF4BDA84CBB0E65FBACA30C420A5B5092C287B23605783DED5E3ADC804C9E1A384A5384EADE0E55E4822A93DBE1E8DB48D6840D25611BE58EAE94460232AE14549A02906B7C4ADB6A0592B7410207E6C809D22B8039756C53CE2185A3F4831EBEC1406DA31E08A06D3654B6A16E583B211B507D4325649B0114C706E244F92D238424EA353CB562E22727CA71D2FCA046FC37F8FBD5D9BA5C2452C1A6FE03F37484E9AAB419873374DA466A81B044E62D4A8CAECCC731D65A497731E170C855843866AB92A0E07150DF919AAA81DB54BFE8C55E625185A79450D9C429598408D14599C8ABAAB8CD6AD574D577047927361CE7C52D01D7A710F1E99B4CAD700F0AA79D58320350467F6C83B2C863CA2CB150DA3FCD1CB288B76F1196C7ACEA3FD3606D00357C03F186BD93795A8F7D0AA8DD80BD0242D9643C7C0E805206135FCD596262D5AF80998E0D54BE49ED5AFDD8C673580301D71B1C0EC9D7B833E65734F3303E29755345A5668EB06D3A5C9841B55087CF9B992718E0222B811B437196FBB6CDD48053F3257D393A019A17B3B1507BD5466B4379DEF1CFC1508B59514A3743ADD4882B92F9A15D8EF09C3444FA5CA20931003C3FB44D6AAB47CE3DF11B744F6C43D72A8A93E8D9C8D97DF4C34A17DD304D923961B35D42C441209BB53A18263CBCE2742B4E52D038850156592F51E3CFAFD92BB9572B5CED1507048D945E0C0A8806743C0642EB8514CA6BF3295491208613168D1202406342C103946E04945BB7058F1D2A9FB1BEDD001D3DFBA30B85D3099C2316005857A8433F82B880A89E34240901DF46BBF29C9C063B69790988F5B0CF18F2553619319ABE8E9115CEAB54060B96CF6BE1BCA641801693C81D14F5E5C436FFC4D8CAD69A5426DCD274D42D01290B0319F36D72431AF128C446CF86CB9810F9E1C800EAF5716CB0FBB7EEDFBA7FEBFEEDA3F8375CDF324F6A9E20669AA7E73D1C56F1E4CB5902D2E98B8DEAB750364BBF052AF70FAA0DA229328DD5DDD8BC98CDFBD0752097A112C8D4E204BB2DE3C5D27A07A6E2592A6BCCE84EF843CB6EEB5011A082B6F0372537906A24D35D64C007F7B94F4C6DB3095D1910FA5BED24AB5FD99C1C24C6363A4788D3B372D6C4E976DB787C8E7CC1C15223CC4073B878AF8287CFF026C42448BD621E62B280C34624519100B753C6522034742826BA6206643F043093CBFE4FD9050D478C105BBCD3FCCE47DBB82536F0E5D59FCB558E9541DA16A6D5227E7F0E1B717553B62533AAA714540EC91C21B7D84426A8B9DD0057C5AC31E140CAD5DD9A90137D3832F357F59384171348CC8A402D68990DBC09CD305FA99BB7A0C5714C1F98FD3386BAF919147FE91434477D9E9F87617893B7290A5A07A419E109B009BA16FCEC51508F827A14D4A3A00F1205E15A9784F4A7D827DC6C47FBF49A85BEBE092FE7427F83689C491113DFB41FB63130D126C96A7A0784B987365CFC50CDF42D21008E3059A0896ECDE58E934E747CDE54726BB19922111427FFBE32DF011CE63EB645D858DA2C0190F46698C27C3AA4260033FC0098645051B02D9AFF40A4750845646F4300F669B41828D191E8DAAD8336C369F6C54D49A801DB7628B67D158B250FD909E0517538A5A88C6698013004E463DA663973D988A30321D1305557C08465A07874995EE63F6C7A319295E92216E4D64770CF61E303792B20F323A639CA16DAF5841BDB9CED096BD4948B884D008E08554806C9C8D93F6CFDE6851414254916C999F7DF415A2F8B85278C8FA0CD67267C2C90D9413E5A79436DC30681346A7C6780A4D9F49D04672A324D1BEEA133265A1246ED17F553001DE2290CA3D9574C5C9AA0C0662F19D8E28AA963A06EEE89B92301AF805166E0648ABD0582D47936955BB968304E9E552DF45B2F3E56EFC009257023FADC4B8DBA7EF21BC97951631D924E6A03AC538338FFA8F5F3A693F06ED7A01B7EFD1866D303B00DB5B50A9853B39014B35F177B8CAB6F3D9446D26C304B666E42AD56A2E743F5AF19395BE23125B719D8C6941CCA7E756B1807CDF14B30E2235BC3F495B88C957BC3F8A9CA7D0E003939AE0E0A07D53D3FC69D40274E942686DDB6A2524C587379F9B64B68A0468C72D8421962EE82D29629CE5C304DB15A049CDEA7B935636551836AFA06C0DB1CDBB8256C9BB1DB4E2F9D17DBA809E20DB48951393765EB65D1C1B77051256E5A3E1B91163F9B37017805704BC0F18F31C91AA1135B8F7247A5369DA220063330C1422431C145725354DF06BA7DDEECD0DE6289739B0D7B9A9EEB37B659288AC5D435143B2F92AFBD8BCFBC06EB962ADF7CF2D50DDAEAC162675B76006FDFFBAFF7670F9BFFB6514DB7B06D549B5FDAD64AB689BD6D16D358717574D5790E9ADCAEB6CB7542BCD478CCCB80629652987F3B7EB6F71BA8B2DFA2470BAC13DDD657967816135E6345B35AB4102F84C60981D91E42A3E6C6CCB905B52C10B098DDBC0064A65AA731BC011A5CEEA0E8C91EFAEC05193741FAD7EA31E84B2C485F9C44C516DE983FA62E593240F4826D06CAEFA33908E81C567D457675B83C493E430D282E71A501ED49C39E34EC49C39E347CCBA461C4F5D416A84D2B8A837AA0D603B51EA8F540AD076AAD815A1CF7486DC655476A417B5EB3E7357B5EB3E7357B5EF3B3E535455E6235B19B0513028BF640BCCC424E96A6EE007559012556D6DBF29173475448BF974D3FFC8B2F5489711FF1F18F3A769E68D16149F4441B4B0B053BB203D6B7415ACCBAADD964C5ABDD5333B73A4E05E46A2FA5893156D988E5670A7183AE9F6D17D3205D79CB8908011093D064DB629BCB5DBAB16DC1AEE11E03759024846DA729B8397C368107BED68E1A77B5166C76B689EE943FB14888F912FA26A75800673BE97E6CD8087F2566B99D99F4241A26EFDE558748EFEAAEDC2D94B2E483940EECEE74ABF4C555FCF4923A2B2D54302D2084DFCCA1535BC9CF5BDD816DD22BFBF1CB4C5F5EADD30F0A44953D94FADA14CDB618DB416AB7BBDECBE546837562990E5A44C31CC55C9F89D985C1A58514636BACA49FE836C0030D966F6789AD49B6A51EBDBC2A175D84B87A6DC202DD96F83BB047E304BD0C899DE7C25DB9B66E70866D2E0973E4E07646CB9868C425C330800E630739C53DEB7708993467C59519EE9F3111D37D305943601B8E81AC82B10211B95E935A49DDA3FDE154DFBC8E33F57611382132D8F6E4CC933368FA5EAEA90E206BD1193CB2F8C5221D8E4B1DAC4A50AA3E0EA1A553C86371A6D7B245815E9BE671A21E9893B512C5552F6F792C8E453FB0B687AAA3D3C4B0371AA3AFF549024296BB3208C0973152B536B718E5852A1615579465DE4BC353BE6A1F96CFACD70FD2784A42501E2EE61622B88D2628CEBB8A184AD41A75B066EC2CD8B6D0C2DAB894809E99ABA4C6E0F11BF5F1B474C11A1417B33DA1A5FDD8C9673C7672D50DACF19FD68D6EC1BA057B1F0B867B4724C0E8016E0F707B80FB9E012E6ED87872E2E1FE0D792D485011EF102B7369BE9476A9A69679624B6367728A05DF0ACF655B92591EC6089A1350FBB1EDDF1AB07F341349C059582375CEE2FF2D1D2FC827EBCF3773B7CD320984B6AD74A6012CB1631315BF38C5CA0A54F64C126CC0952A81B6615C730E621CB61666C9B0996916D5746EA3DBF6AB952A327652965E79DE980242C29FC74D57796FCFFFFC54F23F31C95E568BDCBA6FECBEB1FBC6B74AFEA014F89969D7D74D7DDDF45E991FFC16EC798563EB9EA17B86EE19DECD33E07ED767A65DF70CDD33BC9767C8729E18027F5445FB86C0E7DE108062C8E5F78F2B46CFF7FCD4F23D05B8388383FD419492613AF58CCF4F25E383DB9D71C4A44D72DD7E7F53F67B91D9F39C6AF4E8B3479FEF137D2E52602CBFFCE66125ED99899E99E89989A73313AB9C4E796AE275EFD0BDC33B7907FC8E3631D8DD3974E7D09DC37BA6AD45079F9A783DF9F3134CFEF07A04DC9380938CF8D0EF47E8F723F4FB11FAFD08FD7E0457765E1283D723C0824EF845E1AFBCFEBE27663F6562F63797FF0118CE83A40A656E6473747265616D0A656E646F626A0A0A787265660A3020350A3030303030303030303020363535333520660A30303030303030303039203030303030206E0A30303030303030303536203030303030206E0A30303030303030313131203030303030206E0A30303030303030333838203030303030206E0A747261696C65720A3C3C2F53697A6520352F526F6F742031203020523E3E0A0A7374617274787265660A353534310A2525454F460A>|triangle.pdf>|0.5par|0.5par||>>
    <label|fig:triangle>

    Points <math|<around*|(|p<rsub|1><rsup|-1>,p<rsub|2><rsup|-1>,1-p<rsup|-1>|)>\<in\><around*|(|-1,1|)><rsup|3>>
    with <math|><math|p<rsup|-1>=p<rsub|1><rsup|-1>+p<rsub|2><rsup|-1>> for
    which <eqref|eq:BHT-bounds> may hold, represented as affine combinations.
  </big-figure>

  <subsection|Applications>

  The bilinear Hilbert transform shows up in multiple circumstances. One of
  the original motivations for the interest in <math|<BHT><rsub|\<beta\>>>
  was Calderón's first commutator <math|C<rsub|1><around*|(|f,A|)>>, that
  arises naturally as a correction term when studying solutions for elliptic
  operators with non-smooth coefficients. In the one-dimensional case one has

  <\equation*>
    C<rsub|1><around*|(|f,A|)><around*|(|x|)><eqd><big|int><rsub|<R>><frac|A<around*|(|x|)>-A<around*|(|y|)>|<around*|(|x-y|)><rsup|2>>f<around*|(|y|)><dd>y.
  </equation*>

  In <cite|calderonCommutatorsSingularIntegral1965>, Calderón showed that
  <math|f\<mapsto\>C<rsub|1><around*|(|f,A|)>> is bounded on
  <math|L<rsup|p><around*|(|<R>|)>> for all
  <math|p\<in\><around*|(|1,\<infty\>|)>> when
  <math|<around*|\<\|\|\>|A|\<\|\|\>><rsub|Lip>\<less\>+\<infty\>>. Rewriting
  <math|C<rsub|1><around*|(|f,A|)>> using the fundamental theorem of calculus
  yields\ 

  <\equation*>
    C<rsub|1><around*|(|f,A|)><around*|(|x|)><eqd><big|int><rsub|0><rsup|1><big|int><rsub|<R>>f<around*|(|y|)>A<rprime|'><around*|(|y+\<beta\><around*|(|x-y|)>|)><frac|<dd>y|x-y><dd>\<beta\>=<big|int><rsub|-1><rsup|0><BHT><rsub|\<beta\>><around*|[|f,A<rprime|'>|]><dd>\<beta\>.
  </equation*>

  Dualizing and enacting a change of variables allows one to recover
  Calderón's result for <math|p\<in\><around*|(|<frac|4|3>,4|)>> from
  <cite|liUniformBoundsBilinear2006>, and for all
  <math|p\<in\><around*|(|1,\<infty\>|)>> from <smart-ref|thm:main-1>. An
  alternative proof of the boundedness of Calderón's first commutator was
  given in <cite|muscaluCalderonCommutatorsCauchy2014>. For a more detailed
  discussion of Calderón's commutators see
  <cite-detail|muscaluClassicalMultilinearHarmonic2013a|Chapter 4>.

  More recently in <cite|gressmanTrilinearSingularIntegral2016>, bounds on a
  trilinear form with full <math|GL<around*|(|<R><rsup|2>|)>> symmetry acting
  on functions on <math|<R><rsup|2>> was obtained by a fiber-wise application
  of uniform bounds in the range covered by
  <cite|grafakosUniformBoundsBilinear2004>.\ 

  Generalizations of the bilinear Hilbert transform to functions on
  <math|<R><rsup|2>> have been systematically studied in
  <cite|demeterTwodimensionalBilinearHilbert2010>. Instead of just one
  parameter <math|\<beta\>>, the corresponding trilinear form on
  <math|<R><rsup|2>> is determined by two matrixes
  <math|<wide|B|\<vect\>>=<around*|(|B<rsub|j>|)><rsub|j\<in\><around*|{|1,2|}>>\<in\><around*|(|<R><rsup|2\<times\>2>|)><rsup|2>>
  and is given by

  <\equation*>
    <BHT><rsup|K><rsub|<wide|B|\<vect\>>><around*|[|f<rsub|1>,f<rsub|2>|]><around*|(|x,y|)><eqd><big|int><rsub|<R><rsup|2>><big|prod><rsub|j=1><rsup|2>f<rsub|j><around*|(|<matrix|<tformat|<cwith|2|2|1|1|cell-valign|b>|<cwith|1|1|1|1|cell-valign|b>|<table|<row|<cell|x>>|<row|<cell|y>>>>>+B<rsub|j><matrix|<tformat|<table|<row|<cell|s>>|<row|<cell|t>>>>>|)>K<around*|(|s,t|)><dd>s<dd>t,
  </equation*>

  where <math|K> is a two-dimensional smooth Calderón-Zygmund kernel. If
  <math|B> is degenerate, one can obtain completely novel multilinear
  integral operators, some of which have been studied independently (see
  Kova£'s work on the twisted paraproduct in
  <cite|kovacBoundednessTwistedParaproduct2012>), while others remain beyond
  the current level understanding, like the triangular Hilbert transform (see
  <cite|kovacDyadicTriangularHilbert2015>). A partial investigation of
  uniform bounds in the context of the 2-dimensional bilinear Hilbert
  transform has been carried by the second author in his PhD thesis
  <cite|warchalskiUniformEstimatesOne2019>. A preliminary version of this
  joint work also appeared there.\ 

  <subsection|The symmetry space and the wave packet representation>

  We approach the problem of establishing bounds <eqref|eq:BHT-bounds> by
  analyzing the symmetries of <eqref|eq:BHT>: translations, modulations, and
  dilations, given by

  <\equation>
    <label|eq:symmetries><ltae|<tformat|<cwith|1|1|1|1|cell-halign|l>|<table|<row|<cell|<Tr><rsub|y>\<phi\><around|(|z|)><eqd>\<phi\><around|(|z-y|)>,<space|1em><Dil><rsub|t>\<phi\><around|(|z|)><eqd>t<rsup|-1>\<phi\><around*|(|<frac|z|t>|)>,<space|1em><Mod>
    <rsub|\<eta\>>\<phi\><around|(|z|)><eqd>e<rsup|2\<pi\>i\<eta\>z>\<phi\><around|(|z|)>,>>|<row|<cell|<around*|(|\<eta\>,y,t|)>\<in\><R><rsup|3><rsub|+><eqd><R><rsup|2>\<times\><R><rsub|+>.>>>>>
  </equation>

  Up to a linear combination with the pointwise product
  <math|<around*|(|f<rsub|1>,f<rsub|2>|)>\<mapsto\>f<rsub|1>f<rsub|2>>,
  <math|<BHT><rsub|\<beta\>>> is the unique bilinear operator that satisfies
  the identities

  <\equation>
    <label|eq:BHT-symmetry-relations><ltae|<tformat|<cwith|1|1|1|1|cell-halign|l>|<table|<row|<cell|<BHT><rsub|\<beta\>><around*|[|<Tr><rsub|y>f<rsub|1>,<Tr><rsub|y>f<rsub|2>|]>=<Tr><rsub|y><BHT><rsub|\<beta\>><around*|[|f<rsub|1>,f<rsub|2>|]><space|2.0em>\<forall\>y\<in\><R>,>>|<row|<cell|t<rsup|2><BHT><rsub|\<beta\>><around*|[|<Dil><rsub|t>f<rsub|1>,<Dil><rsub|t>f<rsub|2>|]>=t<Dil><rsub|t><BHT><rsub|\<beta\>><around*|[|f<rsub|1>,f<rsub|2>|]><space|2em>\<forall\>t\<in\><R><rsup|+>,>>|<row|<cell|<BHT><rsub|\<beta\>><around*|[|<Mod>
    <rsub|\<beta\>\<eta\>>f<rsub|1>,<Mod> <rsub|\<eta\>>f<rsub|2>|]>=<Mod>
    <rsub|<around*|(|1+\<beta\>|)>\<eta\>><BHT><rsub|\<beta\>><around*|[|f<rsub|1>,f<rsub|2>|]><space|2em>\<forall\>\<eta\>\<in\><R>.>>>>>
  </equation>

  The geometric meaning of the parameter <math|\<beta\>> is encoded in the
  latter symmetry relation. Based on this observation, we show
  (<smart-ref|sec:wave-packet-representation>) that
  <math|<BHT><rsub|\<beta\>>> admits the following
  <with|font-shape|italic|wave packet representation>

  <\equation>
    <label|eq:BHT-wave-packet-representation><frac|1|\<pi\>i><BHT><rsub|\<beta\>><around*|[|f<rsub|1>,f<rsub|2>|]><around*|(|x|)>
    =<ltae|<tformat|<table|<row|<cell|f<rsub|1><around*|(|x|)>f<rsub|2><around*|(|x|)>>>|<row|<cell|-C<rsub|\<beta\>><big|int><rsub|<R><rsup|3><rsub|+>><ltae|<tformat|<table|<row|<cell|<Emb><around*|[|f<rsub|1>|]><around*|(|\<eta\>,y,t|)><around*|[|\<phi\><rsub|0>|]>
    <Emb><around*|[|f<rsub|2>|]><around*|<left|(|1>|\<beta\><rsup|-1>\<eta\>-<around*|(|\<beta\>t|)><rsup|-1>,y,\<beta\>t|<right|)|1>><around*|[|\<phi\><rsub|0>|]>>>|<row|<cell|<space|1em>\<times\><Tr><rsub|y><Mod><rsub|<frac|1+\<beta\>|\<beta\>>\<eta\>-<around*|(|\<beta\>t|)><rsup|-1>><Dil><rsub|\<beta\>t>\<phi\><rsub|0><around*|(|x|)><dd>\<eta\><dd>y<dd>t.>>>>>>>>>>
  </equation>

  with a \ constant <math|C<rsub|\<beta\>>\<gtr\>0> bounded uniformly in
  <math|\<beta\>\<in\><around*|(|0,1|]>>. The
  <with|font-shape|italic|embedded functions>
  <math|<Emb><around*|[|f<rsub|j>|]><around|(|\<eta\>,y,t|)><around*|[|\<phi\>|]>>,
  appearing above, are given by

  <\equation>
    <label|eq:embedding><Emb><around*|[|f|]><around|(|\<eta\>,y,t|)><around*|[|\<phi\>|]><eqd><big|int><rsub|<R>>f<around|(|z|)><Tr><rsub|y><Mod><rsub|-\<eta\>><Dil><rsub|t>\<phi\><around|(|z|)><dd>z.
  </equation>

  They are coefficients indexed by <math|<R><rsup|3><rsub|+>> that describe
  the functions <math|f<rsub|j>> in terms of <math|>the group of defining
  symmetries of <math|<BHT><rsub|\<beta\>>>, described in
  <eqref|eq:symmetries>. The wave packet <math|\<phi\><rsub|0>\<in\><Sch><around*|(|<R>|)>>
  is chosen independently of <math|\<beta\>>. Hölder's inequality shows that
  the pointwise product <math|<around*|(|f<rsub|1>,f<rsub|2>|)>\<mapsto\>f<rsub|1><around*|(|x|)>f<rsub|2><around*|(|x|)>>
  satisfies the bounds of <smart-ref|thm:main-1>; thus we concern ourselves
  only with the second summand on <RHS|<eqref|eq:BHT-wave-packet-representation>>.

  When <math|p\<gtr\>1>, we prove <smart-ref|thm:main-1> by using identity
  <math|<smart-ref|eq:BHT-wave-packet-representation>>, dualizing with a
  third function <math|f<rsub|3>>, and showing that\ 

  <\equation>
    <label|eq:BHT-dual-bounds><around*|<left|\||-2>|<big|int><rsub|<R><rsup|3><rsub|+>><big|prod><rsub|j=1><rsup|3><Emb><around*|[|f<rsub|j>|]>\<circ\>\<Gamma\><rsub|j><around*|(|\<eta\>,y,t|)><around*|[|\<phi\><rsub|0>|]><dd>\<eta\><dd>y<dd>t|<right|\||-2>>\<lesssim\><rsub|><big|prod><rsub|j=1><rsup|3><around*|\<\|\|\>|f<rsub|j>|\<\|\|\>><rsub|L<rsup|p<rsub|j>><around*|(|<R>|)>>
  </equation>

  holds as long as <math|p<rsub|1>,p<rsub|2>,p<rsub|3>\<in\><around*|(|1,\<infty\>|)>>
  and <math|<big|sum><rsub|j=1><rsup|3>p<rsub|j><rsup|-1>=1>. The maps
  <math|\<Gamma\><rsub|j>\<of\><R><rsup|3><rsub|+>\<rightarrow\><R><rsup|3><rsub|+>>
  are given by

  <\equation>
    <label|eq:gamma:params><ltae|<tformat|<cwith|3|3|1|1|cell-halign|l>|<table|<row|<cell|\<Gamma\><rsub|j><rsup|><around*|(|\<eta\>,y,t|)><eqd>\<Gamma\><rsub|<around*|(|\<alpha\><rsub|j>,\<beta\><rsub|j>,\<gamma\><rsub|j>|)>><rsup|><around*|(|\<eta\>,y,t|)><eqd><around*|<left|(|2>|\<alpha\><rsub|j><around*|(|\<eta\>+\<gamma\><rsub|j>t<rsup|-1>|)>,y,\<beta\><rsub|j>t|<right|)|2>>,>>|<row|<cell|<space|1em><ltae|<tformat|<table|<row|<cell|<around*|(|\<alpha\><rsub|1>,\<beta\><rsub|1>,\<gamma\><rsub|1>|)>=<around*|(|1,1,0|)>,>>|<row|<cell|<around*|(|\<alpha\><rsub|2>,\<beta\><rsub|2>,\<gamma\><rsub|2>|)><eqd><around*|<left|(|-1>|<frac|1|\<beta\>>,\<beta\>,-1|<right|)|-1>>,>>|<row|<cell|<around*|(|\<alpha\><rsub|3>,\<beta\><rsub|3>,\<gamma\><rsub|3>|)><eqd><around*|<left|(|-1>|-<frac|1+\<beta\>|\<beta\>>,\<beta\>,<frac|-1|1+\<beta\>>|<right|)|-1>>.>>>>>>>>>>
  </equation>

  One should think of <math|\<Gamma\><rsub|j>> as a deformation of the group
  of symmetries generated by <eqref|eq:symmetries> that encodes the geometric
  datum of the parameter <math|\<beta\>\<in\><around*|(|0,1|]>>.

  An appropriate functional ansalytic framework for working with the embedded
  functions <math|F=<Emb><around*|[|f|]>:<R><rsup|3><rsub|+>\<times\>\<Phi\><rsub|<gr>><rsup|\<infty\>>\<rightarrow\><C>>
  is given by <with|font-shape|italic|outer Lebesgue spaces>, first
  introduced in <cite|doTheoryOuterMeasures2015>. The goal of this theory is
  to provide an abstract integration theory for embedded functions \U
  coefficients indexed by the symmetry group of the problem at hand. This
  framework allows us both to bound <LHS|<eqref|eq:BHT-dual-bounds>> in term
  of <em|outer Lebesgue quasi-norms> as well as to formulate boundedness for
  the <em|embedding map>s <math|f\<mapsto\><Emb><around*|[|f|]>>. In this
  paper we develop a geometric understanding of the group generated by the
  symmetries <eqref|eq:symmetries> proving stability of <em|outer Lebesgue
  quasi-norms> under composition with the maps <math|\<Gamma\><rsub|j>> in
  <eqref|eq:gamma:params>.

  <subsection|Outline of the argument for non-uniform
  bounds><label|sec:outline-non-uniform>

  We begin with a summary of the proof of the non-uniform
  (<math|\<beta\>\<gtrsim\>1>) bound <eqref|eq:BHT-bounds>, which follows
  from <smart-ref|eq:BHT-dual-bounds>; the procedure below also allows
  proving bounds <eqref|eq:BHT-bounds> for all
  <math|\<beta\>\<in\><around*|(|0,1|]>> with an implicit constant depending
  <math|\<beta\>>.\ 

  First of all, one invokes two abstract inequalities for
  <with|font-shape|italic|iterated outer Lebesgue quasi-norms>

  <\equation>
    <label|eq:outer-domination:non-uniform><around*|<left|\||-2>|<big|int><rsub|<R><rsup|3><rsub|+>><big|prod><rsub|j=1><rsup|3><Emb><around*|[|f<rsub|j>|]>\<circ\>\<Gamma\><rsub|j><around*|(|\<eta\>,y,t|)><around*|[|\<phi\><rsub|0>|]><dd>\<eta\><dd>y<dd>t|<right|\||-2>><ltae|<tformat|<table|<row|<cell|\<lesssim\><around*|<left|\<\|\|\>|-3>|<big|prod><rsub|j=1><rsup|3><Emb><around*|[|f<rsub|j>|]>\<circ\>\<Gamma\><rsub|j><around*|[|\<phi\><rsub|0>|]>|<right|\<\|\|\>|-3>><rsub|L<rsup|1><rsub|\<nu\><rsub|1>><fL><rsup|1><rsub|\<mu\><rsup|1><rsub|\<Theta\>>,\<nu\><rsub|1>><SL><rsup|<around*|(|1,1|)>><rsub|\<Theta\>>>>>|<row|<cell|\<lesssim\><big|prod><rsub|j=1><rsup|3><around*|<left|\<\|\|\>|2>|<Emb><around*|[|f<rsub|j>|]>\<circ\>\<Gamma\><rsub|j><around*|[|\<phi\><rsub|0>|]>|<right|\<\|\|\>|2>><rsub|L<rsup|p<rsub|j>><rsub|\<nu\><rsub|1>><fL><rsup|q<rsub|j>,+><rsub|\<mu\><rsup|1><rsub|\<Theta\>>,\<nu\><rsub|1>><SO><rsub|en,j>>.>>>>>
  </equation>

  The symbols <math|L<rsup|1><rsub|\<nu\><rsub|1>><fL><rsup|1><rsub|\<mu\><rsup|1><rsub|\<Theta\>>,\<nu\><rsub|1>><SL><rsup|<around*|(|1,1|)>><rsub|\<Theta\>>>
  and <math|L<rsup|p<rsub|j>><rsub|\<nu\><rsub|1>><fL><rsup|q<rsub|j>,+><rsub|\<mu\><rsup|1><rsub|\<Theta\>>,\<nu\><rsub|1>><SO><rsub|en,j>>
  are <with|font-shape|italic|iterated outer Lebesgue quasi-norms>, which we
  describe in detail in <smart-ref|sec:outer-space>. One should think of
  these quasi-norms as appropriate generalizations of product Lebesgue
  integral norms defined on <math|<R><rsup|3><rsub|+>>, the parameterization
  of the symmetries <smart-ref|eq:symmetries> of the problem at hand. Indeed,
  the later is an \Pouter Hölder inequality\Q and resembles the classical
  Hölder inequality for Lebesgue spaces. The former is an outer Radon-Nykodim
  -type domination lemma. Both inequalities in
  <eqref|eq:outer-domination:non-uniform> are abstract functional analytic
  statements about (iterated) outer Lebesgue quasi-norms: they do not depend
  on the properties of the maps <math|f<rsub|j>\<mapsto\><Emb><around*|[|f<rsub|j>|]>>
  but only on the specifics of the spaces
  <math|L<rsup|1><rsub|\<nu\><rsub|1>><fL><rsup|1><rsub|\<mu\><rsup|1><rsub|\<Theta\>>,\<nu\><rsub|1>><SL><rsup|<around*|(|1,1|)>><rsub|\<Theta\>>>,
  <math|L<rsup|p<rsub|j>><rsub|\<nu\><rsub|1>><fL><rsup|q<rsub|j>,+><rsub|\<mu\><rsup|1><rsub|\<Theta\>>,\<nu\><rsub|1>><SO><rsub|en,j>>,
  and their relation to the space <math|<R><rsup|3><rsub|+>> with the
  geometric datum given by <math|\<Gamma\><rsub|j>>.\ 

  Next, one proves the <with|font-shape|italic|embedding bounds>

  <\equation>
    <label|eq:iterated-embedding-bounds:non-uniform><around*|\<\|\|\>|<Emb><around*|[|f<rsub|j>|]>\<circ\>\<Gamma\><rsub|j>|\<\|\|\>><rsub|L<rsup|p<rsub|j>><rsub|\<nu\><rsub|1>><fL><rsup|q<rsub|j>,+><rsub|\<mu\><rsup|1><rsub|\<Theta\>>,\<nu\><rsub|1>><SO><rsub|en,j>>\<lesssim\><around*|\<\|\|\>|f<rsub|j>|\<\|\|\>><rsub|L<rsup|p<rsub|j>><around*|(|<R>|)>><space|2em>p<rsub|j>\<in\><around*|(|1,\<infty\>|]>,q<rsub|j>\<in\><around*|(|min<around*|(|p<rsub|j><rprime|'>,2|)>,\<infty\>|]>.
  </equation>

  For this application the specifics of the numerology for the exponent
  <math|q<rsub|j>\<in\><around*|(|min<around*|(|p<rsub|j><rprime|'>,2|)>,\<infty\>|]>>
  is relevant only to be able to apply <eqref|eq:outer-domination:non-uniform>.\ 

  In <cite-detail|uraltsevVariationalCarlesonEmbeddings2016|Section 6.1>,
  with minor notational differences, one of the authors formulated
  inequalities <eqref|eq:iterated-embedding-bounds:non-uniform> using this
  framework in the context of the variation norm Carleson operator, deducing
  them from Di Plinio and Ou's ideas in <cite|diplinioModulationInvariantCarleson2018>.
  The iterated variants of outer Lebesgue spaces (e.g. bounds
  <smart-ref|eq:outer-domination:non-uniform>) were initially introduced in
  <cite|uraltsevVariationalCarlesonEmbeddings2016>. A complete study of
  non-uniform bounds for <math|<BHT><rsub|\<beta\>>> in this framework is
  carried out in <cite|amentaBilinearHilbertTransform2020> with suitable
  generalizations for Banach-valued functions; the results there subsume the
  non-uniform scalar results of <cite|uraltsevVariationalCarlesonEmbeddings2016>
  and <cite|diplinioModulationInvariantCarleson2018> above. Originally, the
  approach to non-uniform bounds for <math|<BHT><rsub|\<beta\>>> using outer
  Lebesgue spaces was carried out in <cite|doTheoryOuterMeasures2015>, where
  the non-iterated variants of outer Lebesgue quasi-norms (where
  <math|L<rsup|1><rsub|\<nu\><rsub|1>><fL><rsup|1><rsub|\<mu\><rsup|1><rsub|\<Theta\>>,\<nu\><rsub|1>><SL><rsup|<around*|(|1,1|)>><rsub|\<Theta\>>>
  and \ <math|L<rsup|p<rsub|j>><rsub|\<nu\><rsub|1>><fL><rsup|q<rsub|j>,+><rsub|\<mu\><rsup|1><rsub|\<Theta\>>,\<nu\><rsub|1>><SO><rsub|en,j>>
  are replace by simpler quasi-norms <math|L<rsup|1><rsub|\<mu\><rsup|1><rsub|\<Theta\>>><SL><rsup|<around*|(|1,1|)>><rsub|\<Theta\>>>
  and <math|L<rsup|p<rsub|j>,+><rsub|\<mu\><rsup|1><rsub|\<Theta\>>><SO><rsub|en,j>>)
  have been first introduced and were sufficient to obtain bounds
  <eqref|eq:BHT-dual-bounds> for <math|p<rsub|j>\<in\><around*|(|2,\<infty\>|]>>,
  <math|j\<in\><around*|{|1,2,3|}>>.\ 

  The proof of the non-iterated variant of bound
  <eqref|eq:iterated-embedding-bounds:non-uniform> in
  <cite-detail|doTheoryOuterMeasures2015|Chapter 5> relies on
  Caledr<strong|>ón-Zygmund techniques when <math|p=\<infty\>> and on
  orthogonality considerations together with a geometric covering lemma on
  <math|<R><rsup|3><rsub|+>> when <math|p=2>. The range
  <math|p\<in\><around*|(|2,\<infty\>|]>> is then obtained by interpolation.
  To go to <math|p\<less\>2>, <cite|diplinioModulationInvariantCarleson2018>
  made use of a multi-frequency Caledrón-Zygmund decomposition. In
  <cite|amentaBilinearHilbertTransform2020> an alternative proof of
  <eqref|eq:iterated-embedding-bounds:non-uniform> is provided in the context
  of Banach space-valued spaces; it uses an interpolation of the non-iterated
  result with <math|p\<gtr\>2> with an endpoint that does not rely on
  cancellation at all. This allows avoiding Hilbert space techniques like the
  aforementioned multi-frequency Caledrón-Zygmund decomposition, which does
  not seem to be appropriate in the Banach space-valued context.\ 

  On the other hand, in the recent result
  <cite|diplinioWeaktypeCarlesonTheorem2022>, Di Plinio and Fragos improve on
  <cite|diplinioModulationInvariantCarleson2018> and obtain an endpoint
  embedding result close to <math|L<rsup|1>> for the embedding bound
  <eqref|eq:iterated-embedding-bounds:non-uniform> in the context of endpoint
  estimates for the Carleson operator. Their result does not follow by
  interpolation; they make use of Gabor frame techniques and work in a
  localized outer Lebesgue endpoint space formally reminicent of the space
  <math|X<rsub|\<mu\><rsub|\<Theta\>><rsup|1>,\<nu\><rsub|\<beta\><rsup|>>><rsup|q,r,+>>
  we introduce in <smart-ref|sec:localized-outer-lebesgue>., albeit in the
  non-uniform context of <math|\<beta\>\<gtrsim\>1>.

  <subsection|Outline of the proof of uniform bounds and structure of the
  paper.><label|sec:outline-uniform>

  Now we outline how to deduce uniform bounds <eqref|eq:BHT-bounds>,
  emphasizing the differences with the non-uniform argument illustrated in
  <smart-ref|sec:outline-non-uniform>.

  The starting point is the identity <smart-ref|eq:BHT-wave-packet-representation>
  (shown in <smart-ref|sec:wave-packet-representation>), which allows us to
  concentrate on proving bound <eqref|eq:BHT-dual-bounds>. The specifics form
  of <smart-ref|eq:BHT-wave-packet-representation>, different from most prior
  literature, is crucial for obtaining uniform bounds.\ 

  We begin, as in <eqref|eq:outer-domination:non-uniform>, with an outer
  Radon-Nykodim -type result

  <\equation>
    <label|eq:RN-domination-BHT><around*|<left|\||-2>|<big|int><rsub|<R><rsup|3><rsub|+>><big|prod><rsub|j=1><rsup|3><Emb><around*|[|f<rsub|j>|]>\<circ\>\<Gamma\><rsub|j><around*|(|\<eta\>,y,t|)><around*|[|\<phi\><rsub|0>|]><dd>\<eta\><dd>y<dd>t|<right|\||-2>>\<lesssim\><ltae|<tformat|<table|<row|<cell|<around*|<left|\<\|\|\>|-3>|<big|prod><rsub|j=1><rsup|3><Emb><around*|[|f<rsub|j>|]>\<circ\>\<Gamma\><rsub|j>|<right|\<\|\|\>|-3>><rsub|L<rsup|1><rsub|\<nu\><rsub|1>><fL><rsup|1><rsub|\<mu\><rsup|1><rsub|\<Theta\>>,\<nu\><rsub|1>><SI><rsup|><rsub|\<Theta\>><rsup|<around*|(|l|)>>\<Phi\><rsub|<gr>><rsup|N>>>>|<row|<cell|+<around*|<left|\<\|\|\>|-3>|<big|prod><rsub|j=1><rsup|3><Emb><around*|[|f<rsub|j>|]>\<circ\>\<Gamma\><rsub|j>|<right|\<\|\|\>|-3>><rsub|L<rsup|1><rsub|\<nu\><rsub|1>><fL><rsup|1><rsub|\<mu\><rsup|1><rsub|\<Theta\>>,\<nu\><rsub|1>><SI><rsup|><rsub|\<Theta\>><rsup|<around*|(|o|)>>\<Phi\><rsub|<gr>><rsup|N>>,>>>>>
  </equation>

  formulated in <smart-ref|prop:outer-RN> of
  <smart-ref|sec:outer-generalities>. Appearing on
  <RHS|<eqref|eq:RN-domination-BHT>> are, again, <em|iterated outer Lebesgue
  spaces>; generalities of these function spaces are discussed in
  <smart-ref|sec:outer-generalities>. Instead of evaluating
  <math|<Emb><around*|[|f<rsub|j>|]>> of <eqref|eq:embedding> in a fixed
  <math|\<phi\><rsub|0>\<in\><Sch><around*|(|<R>|)>>, we track the dependence
  of <math|<Emb><around*|[|f|]>\<circ\>\<Gamma\><around*|[|\<phi\>|]>> on all
  possible generating wave packets <math|\<phi\>\<in\>\<Phi\><rsup|\<infty\>><rsub|<mf|r>>\<subset\>
  <Sch><around*|(|<R>|)>>, as emphasized by the notation
  <math|<SI><rsup|><rsub|\<Theta\>><rsup|<around*|(|l|)>>\<Phi\><rsub|<gr>><rsup|N>>
  and <math|<SI><rsup|><rsub|\<Theta\>><rsup|<around*|(|o|)>>\<Phi\><rsub|<gr>><rsup|N>>
  in place of <math|<SL><rsup|<around*|(|1,1|)>><rsub|\<Theta\>>> in
  <eqref|eq:outer-domination:non-uniform>. The parameters <math|N\<in\><N>>
  and <math|<gr>\<gtr\>0> govern the decay and Fourier support of
  <math|\<phi\>>. The quantities <math|<SI><rsup|><rsub|\<Theta\>><rsup|<around*|(|l|)>>\<Phi\><rsub|<gr>><rsup|N>>
  and <math|<SI><rsup|><rsub|\<Theta\>><rsup|<around*|(|o|)>>\<Phi\><rsub|<gr>><rsup|N>>,
  themselves norms, are called <with|font-shape|italic|sizes> and they
  replace the the simpler size <math|<SL><rsup|<around*|(|1,1|)>><rsub|\<Theta\>>>
  in <eqref|eq:outer-domination:non-uniform>, which was modeled locally on a
  classical <math|L<rsup|1>> Lebesgue norm. A detailed discussion of these
  notions is carried out in <smart-ref|sec:time-frequency-outer-lebesgue>. A
  further difference with <eqref|eq:outer-domination:non-uniform> is the
  presence of two summands. We believe this to be of crucial importance since
  for any fixed <math|f<rsub|j>\<in\><Sch><around*|(|<R>|)>>,
  <math|j\<in\><around*|{|1,2,3|}>>, the term

  <\equation*>
    <around*|<left|\<\|\|\>|-3>|<big|prod><rsub|j=1><rsup|3><Emb><around*|[|f<rsub|j>|]>\<circ\>\<Gamma\><rsub|j>|<right|\<\|\|\>|-3>><rsub|L<rsup|1><rsub|\<nu\><rsub|1>><fL><rsup|1><rsub|\<mu\><rsub|\<Theta\>><rsup|1>,\<nu\><rsub|1>><SI><rsup|<around*|(|o|)>><rsub|\<Theta\>>\<Phi\><rsup|N><rsub|<gr>>>
  </equation*>

  in <eqref|eq:RN-domination-BHT> is the most relevant one when
  <math|\<beta\>\<rightarrow\>0<rsup|+>> while
  <math|<around*|<left|\<\|\|\>|-3>|<big|prod><rsub|j=1><rsup|3><Emb><around*|[|f<rsub|j>|]>\<circ\>\<Gamma\><rsub|j>|<right|\<\|\|\>|-3>><rsub|L<rsup|1><rsub|\<nu\><rsub|1>><fL><rsup|1><rsub|\<mu\><rsup|1><rsub|\<Theta\>>,\<nu\><rsub|1>><SI><rsup|><rsub|\<Theta\>><rsup|<around*|(|l|)>>\<Phi\><rsub|<gr>><rsup|N>>>
  vanishes. Also, we treat the two summand in
  <math|<RHS|><eqref|eq:RN-domination-BHT>> separately.

  Next, we show that the first summand of
  <math|<RHS|><eqref|eq:RN-domination-BHT>> satisfies the bounds

  <\equation>
    <label|eq:iterated-Holder-type-bounds:linear><ltae|<tformat|<cwith|2|2|1|1|cell-halign|r>|<cwith|1|1|1|1|cell-halign|l>|<table|<row|<cell|<around*|<left|\<\|\|\>|-3>|<big|prod><rsub|j=1><rsup|3><Emb><around*|[|f<rsub|j>|]>\<circ\>\<Gamma\><rsub|j>|<right|\<\|\|\>|-3>><rsub|L<rsup|1><rsub|\<nu\><rsub|1>><fL><rsup|1><rsub|\<mu\><rsub|\<Theta\>><rsup|1>,\<nu\><rsub|1>><SI><rsup|><rsub|\<Theta\>><rsup|<around*|(|l|)>>\<Phi\><rsub|<gr>><rsup|N>>>>|<row|<cell|<space|1em>\<lesssim\><around*|\<\|\|\>|<Emb><around*|[|f<rsub|1>|]>|\<\|\|\>><rsub|L<rsup|p<rsub|1>><rsub|\<nu\><rsub|1>><fL><rsup|q<rsub|1>,+><rsub|\<mu\><rsub|\<Theta\>><rsup|\<infty\>>,\<nu\><rsub|1>><SF><rsup|u<rsub|1>><rsub|\<Gamma\><rsub|1>>\<Phi\><rsub|4<mf|r>><rsup|N-5>><big|prod><rsub|j=2><rsup|3><around*|\<\|\|\>|<Emb><around*|[|f<rsub|j>|]>\<circ\>\<Gamma\><rsub|j>|\<\|\|\>><rsub|L<rsup|p<rsub|j>><rsub|\<nu\><rsub|\<beta\><rsup|>>>X<rsub|\<mu\><rsub|\<Theta\>><rsup|1>,\<nu\><rsub|\<beta\><rsup|>>><rsup|q<rsub|j>,r<rsub|j>,+><SU><rsup|u<rsub|j>><rsub|\<Gamma\><rsub|j>>\<Phi\><rsub|4<mf|r>><rsup|N-5>>.>>>>>
  </equation>

  We show that the second summand of <math|<RHS|><eqref|eq:RN-domination-BHT>>
  satisfies the bounds

  <\equation>
    <label|eq:iterated-Holder-type-bounds:bilinear><ltae|<tformat|<table|<row|<cell|<around*|<left|\<\|\|\>|-3>|<big|prod><rsub|j=1><rsup|3><Emb><around*|[|f<rsub|j>|]>\<circ\>\<Gamma\><rsub|j>|<right|\<\|\|\>|-3>><rsub|L<rsup|1><rsub|\<nu\><rsub|1>><fL><rsup|1><rsub|\<mu\><rsub|\<Theta\>><rsup|1>,\<nu\><rsub|1>><SI><rsup|<around*|(|o|)>><rsub|\<Theta\>>\<Phi\><rsup|N><rsub|<gr>>>>>|<row|<cell|<space|1em>\<lesssim\><around*|<left|\<\|\|\>|2>|<Emb><around*|[|f<rsub|1>|]>|<right|\<\|\|\>|2>><rsub|L<rsup|p<rsub|1>><rsub|\<nu\><rsub|1>><fL><rsup|q<rsub|1>,+><rsub|\<mu\><rsub|\<Theta\>><rsup|\<infty\>>,\<nu\><rsub|1>><SF><rsub|\<Gamma\><rsub|1>><rsup|u<rsub|1>>\<Phi\><rsub|4<mf|r>><rsup|N-5>><around*|<left|\<\|\|\>|-2>|<big|prod><rsub|j=2><rsup|3><Emb><around*|[|f<rsub|j>|]>\<circ\>\<Gamma\><rsub|j>|<right|\<\|\|\>|-2>><rsub|L<rsup|<around*|(|p<rsub|2><rsup|-1>+p<rsub|3><rsup|-1>|)><rsup|-1>><rsub|\<nu\><rsub|\<beta\><rsup|>>>X<rsub|\<mu\><rsub|\<Theta\>><rsup|1>,\<nu\><rsub|\<beta\><rsup|>>><rsup|q<rsub|\<times\>>,r<rsub|\<times\>>,+><SU><rsup|u<rsub|\<times\>>><rsub|\<Gamma\><rsub|2>\<times\>\<Gamma\><rsub|3>>\<Phi\><rsub|4<mf|r>><rsup|N-5>>.>>>>>
  </equation>

  These bounds hold for any <math|p<rsub|j>\<in\><around*|(|1,\<infty\>|)>>,
  <math|j\<in\><around*|{|1,2,3|}>>, with
  <math|<big|sum><rsub|j=1><rsup|3>p<rsub|j><rsup|-1>=1>. All other exponents
  are chosen depending on <math|p<rsub|j>> but not on <math|\<beta\>> (and,
  consequently, not on <math|\<Gamma\><rsub|j>>). The Hölder -type bounds
  <eqref|eq:iterated-Holder-type-bounds:linear> and
  <eqref|eq:iterated-Holder-type-bounds:bilinear> follow abstractly from the
  \Patomic estimate\Q (<smart-ref|lem:atomic>) using restricted weak type
  interpolation for outer measure Lebesgue spaces
  (<smart-ref|prop:outer-restricted-interpolation>,
  <smart-ref|sec:outer-generalities>); this replaces the simpler outer Hölder
  inequality used in the non-uniform setting of
  <eqref|eq:outer-domination:non-uniform>.\ 

  <smart-ref|sec:single-tree> is dedicated to proving \Psingle tree
  estimates\Q of the form

  <\equation>
    <label|eq:STE:l-l-o><around*|\<\|\|\>|F<rsub|1>F<rsub|2>F<rsub|3>|\<\|\|\>><rsub|<SI><rsup|<around*|(|l|)>><rsub|\<Theta\>>\<Phi\><rsub|<gr>><rsup|N>>\<lesssim\><rsub|><around*|\<\|\|\>|F<rsub|1>|\<\|\|\>><rsub|<SF><rsub|\<Gamma\><rsub|1>><rsup|u<rsub|1>>\<Phi\><rsub|4<gr>><rsup|N-5>><around*|\<\|\|\>|F<rsub|2>|\<\|\|\>><rsub|<SU><rsub|\<Gamma\><rsub|2>><rsup|u<rsub|2>>\<Phi\><rsub|4<gr>><rsup|N-5>><around*|\<\|\|\>|F<rsub|3>|\<\|\|\>><rsub|<SU><rsub|\<Gamma\><rsub|3>><rsup|u<rsub|3>>\<Phi\><rsub|4<gr>><rsup|N-5>>
  </equation>

  and\ 

  <\equation>
    <label|eq:STE:l-o-o><around*|\<\|\|\>|F<rsub|1>F<rsub|2>F<rsub|3>|\<\|\|\>><rsub|<SI><rsup|<around*|(|o|)>><rsub|\<Theta\>>\<Phi\><rsub|<gr>><rsup|N>>\<lesssim\><around*|\<\|\|\>|F<rsub|1>|\<\|\|\>><rsub|<SF><rsub|\<Gamma\><rsub|1>><rsup|u<rsub|1>>\<Phi\><rsub|4<gr>><rsup|<around*|(|N-5|)>>><around*|\<\|\|\>|F<rsub|2>F<rsub|3>|\<\|\|\>><rsub|<SU><rsub|\<Gamma\><rsub|\<times\>>><rsup|u<rsub|\<times\>>>\<Phi\><rsub|4<gr>><rsup|<around*|(|N-5|)>>>.
  </equation>

  These are Hölder -type bounds at the level of sizes \U norms localized to
  distinguished localized portions of <math|<R><rsup|3><rsub|+>>, on which
  the embedded functions <math|F<rsub|j>> are defined. This section informs
  the choice of sizes <math|<SF><rsub|\<Gamma\><rsub|1>><rsup|u<rsub|1>>>,
  <math|<SU><rsub|\<Gamma\><rsub|j>><rsup|u<rsub|j>>>,
  <math|j\<in\><around*|{|2,3|}>>, and <math|><math|<SU><rsub|\<Gamma\><rsub|\<times\>>><rsup|u<rsub|\<times\>>>\<Phi\><rsub|<gr>><rsup|N>>,
  defined in Sections <reference|sec:time-frequency-outer-lebesgue> and
  <reference|sec:derived-sizes>.

  <smart-ref|sec:forest> focuses on combining estimates for single trees into
  estimates for collections of trees a.k.a \Pforests\Q. Here, bounds
  <eqref|eq:STE:l-l-o> and <eqref|eq:STE:l-o-o> are used to prove the
  \Patomic estimates\Q (<smart-ref|lem:atomic>); in essence an interpolation
  result between geometric support considerations on
  <math|<R><rsup|3><rsub|+>> and the \Psingle tree estimates\Q.\ 

  Having shown that <math|<LHS|<eqref|eq:RN-domination-BHT>>\<lesssim\><RHS|<eqref|eq:iterated-Holder-type-bounds:linear>>+<RHS|><eqref|eq:iterated-Holder-type-bounds:bilinear>>,
  concluding the proof requires showing that

  <\equation*>
    <RHS|<eqref|eq:iterated-Holder-type-bounds:linear>>+<RHS|><eqref|eq:iterated-Holder-type-bounds:bilinear>\<lesssim\><big|prod><rsub|j=1><rsup|3><around*|\<\|\|\>|f<rsub|j>|\<\|\|\>><rsub|L<rsup|p<rsub|j>><around*|(|<R>|)>>,
  </equation*>

  i.e. showing that <em|embedding bounds> hold. These play the same role as
  bounds <eqref|eq:iterated-embedding-bounds:non-uniform> in
  <smart-ref|sec:outline-non-uniform>.\ 

  In <smart-ref|sec:non-uniform> we prove the non-uniform (<math|\<beta\>=1>)
  embedding bounds for <math|f<rsub|1>>\ 

  <\equation>
    <label|eq:embedding-bounds:non-uniform-iterated><around*|\<\|\|\>|<Emb><around*|[|f<rsub|1>|]>\<circ\>\<Gamma\><rsub|1>|\<\|\|\>><rsub|L<rsup|p<rsub|1>><rsub|\<nu\><rsub|1>><fL><rsup|q<rsub|1>,+><rsub|\<mu\><rsub|\<Theta\>><rsup|\<infty\>>,\<nu\><rsub|1>><SF><rsup|u<rsub|1>><rsub|\<Gamma\><rsub|1>>\<Phi\><rsub|<mf|r>><rsup|N>>\<lesssim\><around*|\<\|\|\>|f<rsub|1>|\<\|\|\>><rsub|L<rsup|p<rsub|1>><around*|(|<R>|)>>,
  </equation>

  appearing both in <math|<RHS|<eqref|eq:iterated-Holder-type-bounds:linear>>>
  and <math|<RHS|<eqref|eq:iterated-Holder-type-bounds:bilinear>>>.\ 

  In <smart-ref|sec:uniform-embeddings:linear> we prove the uniform embedding
  bounds\ 

  <\equation>
    <label|eq:embedding-bounds:uniform-iterated><around*|\<\|\|\>|<Emb><around*|[|f<rsub|j>|]>\<circ\>\<Gamma\><rsub|j>|\<\|\|\>><rsub|L<rsup|p<rsub|j>><rsub|\<nu\><rsub|\<beta\><rsup|>>>X<rsub|\<mu\><rsub|\<Theta\>><rsup|1>,\<nu\><rsub|\<beta\><rsup|>>><rsup|q<rsub|j>,r<rsub|j>,+><SU><rsup|u<rsub|j>><rsub|\<Gamma\><rsub|j>>\<Phi\><rsub|<mf|r>><rsup|N>>\<lesssim\><around*|\<\|\|\>|f<rsub|j>|\<\|\|\>><rsub|L<rsup|p<rsub|j>><around*|(|<R>|)>>
  </equation>

  for <math|f<rsub|j>>, <math|j\<in\><around*|{|2,3|}>>. They allow us to
  bound bound <math|<RHS|<eqref|eq:iterated-Holder-type-bounds:linear>>>.

  In <smart-ref|sec:uniform-embeddings:bilinear> we prove
  <with|font-shape|italic|bilinear uniform embedding bounds>

  <\equation>
    <label|eq:embedding-bound:bilinear><ltae|<tformat|<table|<row|<cell|<around*|<left|\<\|\|\>|2>|<Emb><around*|[|f<rsub|2>|]>\<circ\>\<Gamma\><rsub|2>
    <Emb><around*|[|f<rsub|3>|]>\<circ\>\<Gamma\><rsub|3>|<right|\<\|\|\>|2>><rsub|L<rsup|<rsup|p<rsub|\<times\>>>><rsub|\<nu\><rsub|\<beta\>>>X<rsup|q<rsub|\<times\>>,r<rsub|\<times\>>,+><rsub|\<mu\><rsub|\<Theta\>><rsup|1>,\<nu\><rsub|\<beta\>>><SU><rsup|u<rsub|\<times\>>><rsub|\<Gamma\><rsub|2>\<times\>\<Gamma\><rsub|3>>\<Phi\><rsub|<mf|r>><rsup|N>>\<lesssim\><around*|\<\|\|\>|f<rsub|2>|\<\|\|\>><rsub|L<rsup|p<rsub|2>><around*|(|<R>|)>><around*|\<\|\|\>|f<rsub|2>|\<\|\|\>><rsub|L<rsup|p<rsub|3>><around*|(|<R>|)>>>>>>>
  </equation>

  with <math|p<rsub|\<times\>><rsup|-1>=p<rsub|2><rsup|-1>+p<rsub|3><rsup|-1>>.
  They allow us to bound <math|<RHS|<eqref|eq:iterated-Holder-type-bounds:bilinear>>>.
  The bilinear bounds above have no analogue in the non-uniform case of
  <smart-ref|sec:outline-non-uniform> and are a novelty of this paper.
  Furthermore, we believe that bounds <eqref|eq:embedding-bound:bilinear> are
  intrinsically bilinear when <math|\<beta\>\<rightarrow\>0<rsup|+>> as we
  are unable to deduce them from linear embedding bounds
  <eqref|eq:embedding-bounds:uniform-iterated>.

  This concludes the proof of <smart-ref|thm:main-1>. We summarize the
  organization of the paper:

  <\itemize>
    <item>In <smart-ref|sec:wave-packet-representation> we prove identity
    <smart-ref|eq:BHT-wave-packet-representation>.

    <item>In <smart-ref|sec:outer-space> we describe the outer measure
    Lebesgue space framework in general and discuss the outer Lebesgue space
    structure on <math|<R><rsup|3><rsub|+>>, specifically. This section
    defines all the notation that appeared in
    <smart-ref|sec:outline-uniform>.

    <item>In <smart-ref|sec:single-tree> we prove the single tree estimates
    <eqref|eq:STE:l-l-o> and <eqref|eq:STE:l-o-o>.

    <item>In <smart-ref|sec:forest> we prove the Radon-Nikodym -type bound
    <smart-ref|eq:RN-domination-BHT>, \Patomic bounds\Q
    (<smart-ref|lem:atomic>), and then deduce the Hölder -type bounds
    <smart-ref|eq:iterated-Holder-type-bounds:linear> and
    <smart-ref|eq:iterated-Holder-type-bounds:bilinear>.

    <item>In <smart-ref|sec:non-uniform> we prove the non-uniform embedding
    bounds <eqref|eq:embedding-bounds:non-uniform-iterated>.

    <item>In <smart-ref|sec:uniform-embeddings:linear> we prove the uniform
    linear embedding bounds <eqref|eq:embedding-bounds:uniform-iterated>.

    <item>In <smart-ref|sec:uniform-embeddings:bilinear> we prove the uniform
    bilinear embedding bounds <smart-ref|eq:embedding-bound:bilinear>.

    <item>In <smart-ref|sec:final-summary> we prove <smart-ref|thm:main-1> by
    reviewing the main statements of this work and by choosing appropriate
    exponents for all the bounds outlined in <smart-ref|sec:outline-uniform>
    to hold.
  </itemize>

  <subsection|Notation>

  <\itemize>
    <item>We denote by <math|B<rsub|r><around*|(|x|)>> the Euclidean open
    ball of radius <math|r> and center <math|x>. The dimension can usually be
    extrapolated from context. If <math|x=0> then we use the shorthand
    <math|B<rsub|r>>. We use the bracket notation:

    <\equation*>
      <around*|\<langle\>|x|\<rangle\>><eqd><around*|(|1+x<rsup|2><rsup|>|)><rsup|<frac|1|2>>.
    </equation*>

    <item> The Schwartz space, denoted by
    <math|<Sch><around*|(|<R><rsup|d>|)>>, is the space of
    <math|C<rsup|\<infty\>><around*|(|<R><rsup|d>|)>> functions for which\ 

    <\equation*>
      <around*|\<\|\|\>|<around*|\<langle\>|x|\<rangle\>><rsup|N>f|\<\|\|\>><rsub|C<rsup|N>>\<less\>+\<infty\><space|2em>\<forall\>N\<in\>\<bbb-N\>.
    </equation*>

    <item>The Fourier transform of a function <math|f> on <math|<R><rsup|d>>
    is given by\ 

    <\equation*>
      <Fourier>f<around*|(|<FT|z>|)>\<equiv\><FT|f><around*|(|<FT|z>|)><eqd><big|int><rsub|<R><rsup|d>>f<around*|(|z|)>e<rsup|-2
      \<pi\> i z<FT|z>><dd>z.
    </equation*>

    If <math|f> depends on multiple variables we will denote the variable in
    which we take the Fourier transform by writing <math|<Fourier><rsub|z>>
    in place of <math|<Fourier>>. As we did above, we often denote the dual
    variable to <math|z> by <math|<FT|z>>. Given a functions <math|f> we set
    <math|f<rsup|\<vee\>><around*|(|z|)>=f<around*|(|-z|)>>.

    <item>The Banach space of band-limited wave packets of order
    <math|N\<in\><N>> and frequency radius <math|<gr>\<gtr\>0> is given by

    <\equation>
      <label|eq:def:wave-packets>\<Phi\><rsup|N><rsub|<gr>><eqd><around*|<left|{|2>|\<phi\>\<in\>C<rsup|\<infty\>><around|(|<R>|)><st><space|0.27em><FT|\<phi\>>\<in\>C<rsup|N><around*|(|<R>|)>,<spt><FT|\<phi\>>\<subseteq\><wide|B<rsub|<gr>><rsup|>|\<bar\>>|<right|}|2>>,
    </equation>

    with an associated norm <math|<around*|\<\|\|\>|\<phi\>|\<\|\|\>><rsub|\<Phi\><rsub|<mf|r>><rsup|N>>=<around*|\<\|\|\>|<FT|\<phi\>>|\<\|\|\>><rsub|C<rsup|N>>>;
    we set <math|\<Phi\><rsup|\<infty\>><rsub|<mf|r>><eqd><big|cap><rsub|N\<in\><N>>\<Phi\><rsub|<mf|r>><rsup|N>>.
    \ 

    <item>We write <math|<R><rsub|+><eqd><around*|(|0,+\<infty\>|)>> and
    <math|<R><rsup|d><rsub|+><eqd><R><rsup|d-1>\<times\><R><rsub|+>>. Given a
    set <math|E\<subset\><R><rsup|d>> we set\ 

    <\equation*>
      <ltae|<tformat|<table|<row|<cell|E+x=<around*|{|y+x:y\<in\>E|}>,<space|2em>\<lambda\>E=<around*|{|\<lambda\>y\<suchthat\>y\<in\>E|}>.>>>>>
    </equation*>

    <item>Given two subsets <math|A,B> of a metric space we set
    <math|<dist><around*|(|A,B|)><eqd>inf<rsub|a\<in\>A,b\<in\>B><dist><around*|(|a,b|)>>
    and <math|<dist><around*|(|a,B|)><eqd>inf<rsub|b\<in\>B><dist><around*|(|a,b|)>>.
    Given <math|A\<subset\><R>> we denote by <math|<around*|\||A|\|>> its
    Lebesgue measure.

    <item>We denote the total derivative in a variable (e.g. <math|z>) by
    <math|<dd><rsub|z>>; the partial derivative in the <math|i<rsup|th>>
    coordinate is denoted by <math|\<partial\><rsub|i>>. We use a convention
    on the order of variables that allows us to use more descriptive
    notation:

    <\equation*>
      <ltae|<tformat|<table|<row|<cell|\<partial\><rsub|\<eta\>>\<equiv\>\<partial\><rsub|\<theta\>>\<equiv\>\<partial\><rsub|1>,<space|2em>\<partial\><rsub|y>\<equiv\>\<partial\><rsub|\<zeta\>>\<equiv\>\<partial\><rsub|2>,<space|2em>\<partial\><rsub|t>\<equiv\>\<partial\><rsub|\<sigma\>>\<equiv\>\<partial\><rsub|3>.>>>>>
    </equation*>

    We do not use <math|\<phi\><rprime|'>> to denote the derivative of a
    function <math|\<phi\>>: we prefer <math|\<partial\>\<phi\>> and leave
    the notation <math|\<phi\><rprime|'>> to denote another function that is
    not necessarily related to <math|\<phi\>>.

    <item>Given an equality or inequality <math|<around*|(|\<star\>|)>> we
    denote by <math|<LHS|><around*|(|\<star\>|)>> and
    <math|<RHS|><around*|(|\<star\>|)>> the expressions on the left and right
    hand sides of <math|<around*|(|\<star\>|)>>, respectively.\ 

    <item>We write <math|A\<lesssim\>B> if there exists a universal constant
    <math|C\<gtr\>0> such that <math|A\<leq\>C B>. The constant may
    implicitly depend on some parameters, as deduced \ from context, but it
    will always be independent of <math|\<beta\>\<in\><around*|(|0,1|]>> in
    our problem. If we want to emphasize that the constant <math|C> may
    depend on a parameter <math|p>, we write <math|A\<lesssim\><rsub|p>B>. We
    generally allow the constant <math|C> in our bounds to change value from
    one line to the next. We say that a quantity <math|A> is bounded if
    <math|<around*|\||A|\|>\<lesssim\>1> and we say it is bounded away from
    <math|0> if <math|<around*|\||A|\|><rsup|-1>\<lesssim\>1>.

    <item>We use the shorthand <math|a\<vee\>b<eqd>max<around*|(|a,b|)>> and
    <math|a\<wedge\>b<eqd>min<around*|(|a,b|)>>.

    <item>If <math|K\<in\>D<rprime|'><around*|(|<R><rsup|d>|)>> is a
    distribution, we abuse the integral notation to denote duality pairing by
    writing <math|<big|int><rsub|<R><rsup|d>>f<around*|(|z|)>K<around*|(|z|)>><math|<dd>z>.
    In particular, if <math|K> is a Radon measure it is also a distribution
    and <math|<big|int><rsub|<R><rsup|d>>f<around*|(|z|)>K<around*|(|z|)>><math|<dd>z>
    corresponds to integrating <math|f> with respect to the measure <math|K>.\ 

    <item>The distribution <math|\<delta\>> is given by
    <math|<big|int>f<around*|(|z|)>\<delta\><around*|(|z|)><dd>z=f<around*|(|0|)>>.
    Given <math|\<phi\>\<in\>C<rsup|1><around*|(|<R><rsup|d>;<R>|)>> with
    <math|\<nabla\>\<phi\>\<neq\>0> on <math|\<phi\><rsup|-1><around*|(|0|)>>
    we set

    <\equation*>
      <big|int><rsub|<R><rsup|d>>f<around*|(|z|)>\<delta\><around*|(|\<phi\><around*|(|z|)>|)><dd>z=<big|int><rsub|\<phi\><rsup|-1><around*|(|0|)>\<subset\><R><rsup|d>><frac|f<around*|(|z|)>|<around*|\||\<nabla\>\<phi\><around*|(|z|)>|\|>><dd><mc|H><rsup|d-1><around*|(|z|)>.
    </equation*>

    This identity is justified by a limiting procedure: if
    <math|f\<in\>C<rsup|0><rsub|c><around*|(|<R><rsup|d>|)>> set\ 

    <\equation*>
      <big|int><rsub|<R><rsup|d>>f<around*|(|z|)>\<delta\><around*|(|\<phi\><around*|(|z|)>|)><dd>z=<big|int><rsub|<R><rsup|d>>f<around*|(|z|)>\<delta\><rsub|\<varepsilon\>><around*|(|\<phi\><around*|(|z|)>|)><dd>z
    </equation*>

    where <math|\<delta\><rsub|\<varepsilon\>><around*|(|z|)>=\<varepsilon\><rsup|-1>\<delta\><rsub|1><around*|(|z/\<varepsilon\>|)>>
    for some <math|\<delta\><rsub|1>\<in\>C<rsup|\<infty\>><rsub|c><around*|(|<R>|)>>
    with <math|<big|int>\<delta\><rsub|1><around*|(|x|)><dd>x=1>. We do not
    elaborate on the formal theory of integrals of the form above; the
    interested reader is directed to <cite|federerGeometricMeasureTheory1996>.

    <item>Given an exponent <math|p\<in\><around*|[|1,\<infty\>|]>> we denote
    by <math|p<rprime|'><eqd><frac|p|p-1>> the Hölder dual so that
    <math|<frac|1|p>+<frac|1|p<rprime|'>>=1>.

    <item>We say a set <math|<mc|B>> is countable if it is in bijection with
    <math|<N><rsup|\<leq\>>> where we denote by <math|<N><rsup|\<leq\>>>
    either a set of the form <math|<around*|{|0,\<ldots\>,N-1|}>>,
    <math|N\<in\><N>>, or <math|<N>>.
  </itemize>

  <subsection|Acknowledgements>We thank Christoph Thiele and Pavel
  Zorin-Kranich for their encouragement, suggestions, and insightful
  questions.\ 

  <section|Wave packet representation.<label|sec:wave-packet-representation>>

  In this section we prove the wave packet representation
  <eqref|eq:BHT-wave-packet-representation>, allowing us to \Plift\Q the
  proof of bounds <eqref|eq:BHT-bounds> for <math|<BHT><rsub|\<beta\>>> to
  bounds on the corresponding wave packet operator

  <\equation*>
    <around*|(|f<rsub|1,>f<rsub|2>|)>\<mapsto\><big|int><rsub|<R><rsup|3><rsub|+>><ltae|<tformat|<table|<row|<cell|<Emb><around*|[|f<rsub|1>|]><around*|(|\<eta\>,y,t|)><around*|[|\<phi\><rsub|0>|]>
    <Emb><around*|[|f<rsub|2>|]><around*|<left|(|1>|\<beta\><rsup|-1>\<eta\>-<around*|(|\<beta\>t|)><rsup|-1>,y,\<beta\>t|<right|)|1>><around*|[|\<phi\><rsub|0>|]>>>|<row|<cell|<space|1em>\<times\><Tr><rsub|y><Mod><rsub|<frac|1+\<beta\>|\<beta\>>\<eta\>-<around*|(|\<beta\>t|)><rsup|-1>><Dil><rsub|\<beta\>t>\<phi\><rsub|0><around*|(|x|)><dd>\<eta\><dd>y<dd>t.>>>>>
  </equation*>

  The existence of such a representation should not come as a surprise. The
  expression above formally satisfies the symmetry relations
  <eqref|eq:BHT-symmetry-relations>. On the other hand, any bilinear operator
  that satisfies <eqref|eq:BHT-symmetry-relations> must be given by

  <\equation*>
    <around*|(|f<rsub|1>,f<rsub|2>|)>\<mapsto\><big|int><rsub|<R><rsup|2>><FT|f<rsub|1>><around*|(|\<xi\><rsub|1>|)><FT|f<rsub|2>><around*|(|\<xi\><rsub|2>|)>e<rsup|2\<pi\>i<around*|(|\<xi\><rsub|1>+\<xi\><rsub|2>|)>x>m<around*|(|\<xi\><rsub|1>,\<xi\><rsub|2>|)><dd>\<xi\><rsub|1><dd>\<xi\><rsub|2>
  </equation*>

  with <math|m\<suchthat\><R><rsup|2>\<rightarrow\><C>> a multiplier that is
  homogeneous of degree <math|0> and invariant with respect to the
  transformation

  <\equation*>
    m<around*|(|\<xi\><rsub|1>,\<xi\><rsub|2>|)>\<rightarrow\>m<around*|(|\<xi\><rsub|1>+\<beta\>\<eta\>,\<xi\><rsub|2>+\<eta\>|)>
    <space|2em>\<forall\>\<eta\>\<in\><R>.
  </equation*>

  Our proof consists of proving that both
  <math|<frac|1|C<rsub|\<beta\>>><around*|<left|(|1>|f<rsub|1><around*|(|x|)>f<rsub|2><around*|(|x|)>-<frac|1|\<pi\>i><BHT><rsub|\<beta\>><around*|[|f<rsub|1>,f<rsub|2>|]><around*|(|x|)>|<right|)|1>>>
  and the above wave packet operator have the same multiplier representation.
  Care is taken to make sure that <math|C<rsub|\<beta\>>> remains uniformly
  bounded for all <math|\<beta\>\<in\><around*|(|0,1|]>>.

  <\proposition>
    <label|prop:wave-packet-represetion>Fix
    <math|\<phi\><rsub|0>\<in\>\<Phi\><rsup|\<infty\>><rsub|<gr><rsub|0>>>
    with <math|<gr><rsub|0>\<less\>2<rsup|-20>> to be real-valued, symmetric,
    with <math|<FT|\<phi\><rsub|0>>\<geq\>0>, and
    <math|<FT|\<phi\>><rsub|0><around*|(|0|)>=1>. Then identity
    <eqref|eq:BHT-wave-packet-representation> holds for all
    <math|\<beta\>\<in\><around*|(|0,1|]>> and all
    <math|f<rsub|j>\<in\><Sch><around*|(|<R>|)>>,
    <math|j\<in\><around*|{|1,2,3|}>> with a real constant
    <math|C<rsub|\<beta\>>\<gtr\>0> depending on <math|\<phi\><rsub|0>>,
    uniformly bounded from above and away from <math|0> for
    <math|\<beta\>\<in\><around*|(|0,1|]>>. The integral in
    <eqref|eq:BHT-wave-packet-representation> converges absolutely and
    locally uniformly in <math|x>. In particular, for any <math|R\<gg\>1> and
    <math|\<varepsilon\>\<gtr\>0> there exists a compact set
    <math|\<bbb-K\><rsub|R,\<varepsilon\>>\<subset\><R><rsup|3><rsub|+>> such
    that\ 

    <\equation*>
      <big|int><rsub|<R><rsup|3><rsub|+>\<setminus\>\<bbb-K\><rsub|R,\<varepsilon\>>><ltae|<tformat|<table|<row|<cell|<around*|<left|\||2>|<Emb><around*|[|f<rsub|1>|]><around*|(|\<eta\>,y,t|)><around*|[|\<phi\><rsub|0>|]><Emb><around*|[|f<rsub|2>|]><around*|<left|(|1>|\<beta\><rsup|-1>\<eta\>-<around*|(|\<beta\>t|)><rsup|-1>,y,\<beta\>t|<right|)|1>><around*|[|\<phi\><rsub|0>|]>
      |<right|.>>>>|<row|<cell|<space|1em>\<times\><around*|\<nobracket\>|<Tr><rsub|y><Mod><rsub|<frac|1+\<beta\>|\<beta\>>\<eta\>-<around*|(|\<beta\>t|)><rsup|-1>><Dil><rsub|\<beta\>t>\<phi\><rsub|0><around*|(|x|)>|\|><dd>\<eta\><dd>y<dd>t\<leq\>\<varepsilon\>>>>>>
    </equation*>

    for all <math|x\<in\>B<rsub|R>>.
  </proposition>

  <\proof>
    In the subsequent manipulations we often omit routine justification for
    limiting procedures. The Fourier inversion formula allows us to write

    <\equation*>
      <BHT><rsub|\<beta\>><around*|[|f<rsub|1>,f<rsub|2>|]><around*|(|x|)><ltae|<tformat|<table|<row|<cell|=lim<rsub|\<varepsilon\>\<rightarrow\>0><big|int><rsub|\<varepsilon\>\<less\><around*|\||t|\|>\<less\>\<varepsilon\><rsup|-1>><big|int><rsub|<R><rsup|2>><FT|f<rsub|1>><around*|(|\<xi\><rsub|1>|)><FT|f<rsub|2>><around*|(|\<xi\><rsub|2>|)>
      e<rsup|2\<pi\>i<around*|(|\<xi\><rsub|1><around*|(|x-t|)>+\<xi\><rsub|2><around*|(|x+\<beta\>t|)>|)>><dd>\<xi\><rsub|1><dd>\<xi\><rsub|2><frac|<dd>t|t>>>|<row|<cell|=-\<pi\>i<big|int><rsub|<R><rsup|2>><FT|f<rsub|1>><around*|(|\<xi\><rsub|1>|)><FT|f<rsub|2>><around*|(|\<xi\><rsub|2>|)>e<rsup|2\<pi\>i<around*|(|\<xi\><rsub|1>+\<xi\><rsub|2>|)>x><sgn><around*|(|\<xi\><rsub|1>-\<beta\>\<xi\><rsub|2>|)><dd>\<xi\><rsub|1><dd>\<xi\><rsub|2>,>>>>>
    </equation*>

    having used that the Fourier transform of the Hilbert kernel
    <math|<frac|1|t>> is <math|-\<pi\>i <sgn><around*|(|\<xi\>|)>>:

    <\equation*>
      lim<rsub|\<varepsilon\>\<rightarrow\>0><big|int><rsub|<around*|\||t|\|>\<gtr\>\<varepsilon\>>e<rsup|-2\<pi\>i\<xi\>t><frac|<dd>t|t>=-\<pi\>i
      <sgn><around*|(|\<xi\>|)>.
    </equation*>

    We thus get that

    <\equation>
      <label|eq:BHT-multiplier><frac|1|2>f<rsub|1><around*|(|x|)>f<rsub|2><around*|(|x|)>-<frac|1|2\<pi\>i><BHT><rsub|\<beta\>><around*|[|f<rsub|1>,f<rsub|2>|]><around*|(|x|)>=<big|int><rsub|<R><rsup|2>><FT|f<rsub|1>><around*|(|\<xi\><rsub|1>|)><FT|f<rsub|2>><around*|(|\<xi\><rsub|2>|)>e<rsup|2\<pi\>i<around*|(|\<xi\><rsub|1>+\<xi\><rsub|2>|)>x><1><rsub|<around*|(|\<xi\><rsub|1>-\<beta\>\<xi\><rsub|2>|)>\<gtr\>0><rsub|><dd>\<xi\><rsub|1><dd>\<xi\><rsub|2>.
    </equation>

    Our next goal is to represent the multiplier
    <math|<1><rsub|\<xi\><rsub|1>-\<beta\>\<xi\><rsub|2>\<gtr\>0><rsub|>> as
    a superposition of bumps; we claim that

    <\equation*>
      <1><rsub|<around*|(|\<xi\><rsub|1>-\<beta\><rsup|>\<xi\><rsub|2>|)>\<gtr\>0>=<frac|1|C<rsub|\<phi\><rsub|0>,\<beta\>>><big|int><rsub|<R><rsub|+>><big|int><rsub|<R>><FT|\<phi\>><rsub|0><around*|(|t\<xi\><rsub|1>-\<theta\>|)><FT|\<phi\>><rsub|0><around*|(|<rsup|>\<beta\>t\<xi\><rsub|2>-\<theta\>+1|)><FT|\<phi\>><rsub|0><around*|(|\<beta\>t<around*|(|\<xi\><rsub|1>+\<xi\><rsub|2>|)>-<around*|(|1+\<beta\>|)>\<theta\>+1|)><dd>\<theta\><frac|<dd>t|t>
    </equation*>

    and the integral converges uniformly for
    <math|<around*|(|\<xi\><rsub|1>,\<xi\><rsub|2>|)>> on any compact subset
    of <math|<R><rsup|2>\\<around*|{|<around*|(|\<beta\>
    \<xi\>,\<xi\>|)>,\<xi\>\<in\><R>|}>>. to show this we begin with a
    variables <math|\<theta\>-t\<xi\><rsub|1>\<mapsto\>\<theta\>> and denote
    <math|<wide|\<xi\>|~><eqd>t<around*|(|\<xi\><rsub|1>-\<beta\>\<xi\><rsub|2>|)>>
    to obtain that

    <\equation*>
      m<around*|(|<wide|\<xi\>|~>|)><ltae|<tformat|<table|<row|<cell|<eqd><big|int><rsub|<R>><FT|\<phi\>><rsub|0><around*|(|t\<xi\><rsub|1>-\<theta\>|)><FT|\<phi\>><rsub|0><around*|(|<rsup|>\<beta\>t\<xi\><rsub|2>-\<theta\>+1|)><FT|\<phi\>><rsub|0><around*|(|\<beta\>t<around*|(|\<xi\><rsub|1>+\<xi\><rsub|2>|)>-<around*|(|1+\<beta\>|)>\<theta\>+1|)><dd>\<theta\>>>|<row|<cell|=<big|int><rsub|<R>><FT|\<phi\>><rsub|0><around*|(|-\<theta\>|)><FT|\<phi\>><rsub|0><around*|(|-<wide|\<xi\>|~>-\<theta\>+1|)><FT|\<phi\>><rsub|0><around*|(|-<wide|\<xi\>|~>-<around*|(|1+\<beta\>|)>\<theta\>+1|)><dd>\<theta\>.>>>>>
    </equation*>

    The integrand vanishes unless <math|\<theta\>\<in\>B<rsub|<mf|r><rsub|0>>\<cap\>B<rsub|<mf|r><rsub|0>><around*|(|1-<wide|\<xi\>|~>|)>>
    and by continuity, it is larger than <math|1/2> when
    <math|><math|\<theta\>\<in\>B<rsub|2<mf|r><rsub|0><rprime|'>>\<cap\>B<rsub|2<mf|r><rsub|0><rprime|'>><around*|(|1-<wide|\<xi\>|~>|)>>
    for some <math|0\<less\><gr><rsub|0><rprime|'>\<less\><gr><rsub|0>>. This
    shows that\ 

    <\equation>
      <label|eq:single-scale-multiplier-bound><mf|r><rsub|0><rprime|'><1><rsub|B<rsub|<gr><rsub|0><rprime|'>><around*|(|1|)>><around*|<left|(|1>|<wide|\<xi\>|~>|<right|)|1>>\<leq\>m<around*|(|<wide|\<xi\>|~>|)>\<leq\>2<mf|r><rsub|0><1><rsub|B<rsub|2<mf|r><rsub|0>><around*|(|1|)>><around*|<left|(|1>|<wide|\<xi\>|~>|<right|)|1>>.
    </equation>

    It follows that\ 

    <\equation*>
      <big|int><rsub|<R><rsub|+>>m<around*|<left|(|1>|t<wide|\<xi\>|~>|<right|)|1>><frac|<dd>t|t>=C<rsub|\<phi\><rsub|0>,\<beta\>><1><rsub|<around*|(|0+\<infty\>|)>><around*|<left|(|1>|<wide|\<xi\>|~>|<right|)|1>>
    </equation*>

    with <math|C<rsub|\<phi\><rsub|0>,\<beta\>>\<in\><around*|(|<frac|<around*|(|<mf|r><rsub|0><rprime|'>|)><rsup|2>|8>,8<around*|(|<mf|r><rsup|><rsub|0>|)><rsup|2>|)>>.
    Indeed, if <math|<wide|\<xi\>|~>\<gtr\>0> it sufficies to enact the
    change of variables \ <math|t<wide|\<xi\>|~>\<mapsto\>t>, while if
    <math|<wide|\<xi\>|~>\<leq\>0> the integrand vanishes since
    <math|m<around*|(|t<wide|\<xi\>|~>|)>=0> unless
    <math|t<wide|\<xi\>|~>\<gtr\>0>. We can now use this representation of
    the multiplier to obtain identity <eqref|eq:BHT-wave-packet-representation>:

    <\equation*>
      <ltae|<tformat|<table|<row|<cell|<big|int><rsub|<R><rsup|2>><FT|f><rsub|1><around*|(|\<xi\><rsub|1>|)><FT|f><rsub|2><around*|(|\<xi\><rsub|2>|)><1><rsub|<around*|(|\<xi\><rsub|1>-\<beta\><rsup|>\<xi\><rsub|2>|)>\<gtr\>0><rsub|>e<rsup|2\<pi\>i
      <around*|(|\<xi\><rsub|1>+\<xi\><rsub|2>|)>x><dd>\<xi\><rsub|1><dd>\<xi\><rsub|2>>>|<row|<cell|<space|1em><ltae|<tformat|<table|<row|<cell|=<frac|1|C<rsub|\<phi\><rsub|0>,\<beta\>>><big|int><rsub|<R><rsup|2>><FT|f><rsub|1><around*|(|\<xi\><rsub|1>|)><FT|f><rsub|2><around*|(|\<xi\><rsub|2>|)><around*|(|<big|int><rsub|<R><rsub|+>>m<around*|<left|(|1>|t<around*|(|\<xi\><rsub|1>-\<beta\><rsup|>\<xi\><rsub|2>|)>|<right|)|1>><frac|<dd>t|t>|)>e<rsup|2\<pi\>i
      <around*|(|\<xi\><rsub|1>+\<xi\><rsub|2>|)>x><dd>\<xi\><rsub|1><dd>\<xi\><rsub|2>>>|<row|<cell|=<frac|1|C<rsub|\<phi\><rsub|0>,\<beta\>>><big|int><rsub|<R><rsup|2>><FT|f><rsub|1><around*|(|\<xi\><rsub|1>|)><FT|f><rsub|2><around*|(|\<xi\><rsub|2>|)><around*|(|<big|int><rsub|<R><rsub|+><rsup|2>>|\<nobracket\>><ltae|<tformat|<table|<row|<cell|<FT|\<phi\>><rsub|0><around*|(|t\<xi\><rsub|1>-\<theta\>|)><FT|\<phi\>><rsub|0><around*|(|<rsup|>\<beta\>t\<xi\><rsub|2>-\<theta\>+1|)>>>|<row|<cell|<around*|\<nobracket\>|<space|1em>\<times\><FT|\<phi\>><rsub|0><around*|(|\<beta\>t<around*|(|\<xi\><rsub|1>+\<xi\><rsub|2>|)>-<around*|(|1+\<beta\>|)>\<theta\>+1|)><dd>\<theta\><frac|<dd>t|t>|)>e<rsup|2\<pi\>i
      <around*|(|\<xi\><rsub|1>+\<xi\><rsub|2>|)>x><dd>\<xi\><rsub|1><dd>\<xi\><rsub|2>.>>>>>>>>>>>>>>>
    </equation*>

    Exchanging the order of integration and using the Fourier inversion
    formula gives\ 

    \;

    <\equation*>
      <ltae|<tformat|<table|<row|<cell|<big|int><rsub|<R><rsup|2>><FT|f><rsub|1><around*|(|\<xi\><rsub|1>|)><FT|f><rsub|2><around*|(|\<xi\><rsub|2>|)><1><rsub|<around*|(|\<xi\><rsub|1>-\<beta\><rsup|>\<xi\><rsub|2>|)>\<gtr\>0><rsub|>e<rsup|2\<pi\>i
      <around*|(|\<xi\><rsub|1>+\<xi\><rsub|2>|)>x><dd>\<xi\><rsub|1><dd>\<xi\><rsub|2>>>|<row|<cell|<space|1em><ltae|<tformat|<table|<row|<cell|=<frac|1|C<rsub|\<phi\><rsub|0>,\<beta\>>><big|int><rsub|<R><rsup|2><rsub|+>><big|int><rsub|<R><rsup|3>><big|int><rsub|<R><rsup|2>><ltae|<tformat|<table|<row|<cell|f<rsub|1>\<ast\><Dil><rsub|t><Mod><rsub|\<theta\>>\<phi\><rsub|0><around*|(|y<rsub|1>|)><ltae|<tformat|<table|<row|<cell|f<rsub|2>\<ast\><Dil><rsub|\<beta\>t><Mod><rsub|\<theta\>-1>\<phi\><rsub|0><around*|(|y<rsub|2>|)>>>|<row|<cell|<space|1em>\<times\><Dil><rsub|\<beta\>t><Mod><rsub|<around*|(|1+\<beta\>|)>\<theta\>-1>\<phi\><around*|(|y<rsub|3>|)>>>>>>>>|<row|<cell|<space|1em>\<times\>e<rsup|2\<pi\>i<around*|<left|(|1>|\<xi\><rsub|1><around*|(|x-y<rsub|1>-y<rsub|3>|)>+\<xi\><rsub|2><around*|(|x-y<rsub|2>-y<rsub|3>|)>|<right|)|1>>><dd>\<xi\><rsub|1><dd>\<xi\><rsub|2><dd>y<rsub|1><dd>y<rsub|2><dd>y<rsub|3><dd>\<theta\><frac|<dd>t|t>>>>>>>>|<row|<cell|=<frac|1|C<rsub|\<phi\>,\<beta\>>><big|int><rsub|<R><rsup|2><rsub|+>><big|int><rsub|<R><rsup|3>><ltae|<tformat|<table|<row|<cell|f<rsub|1>\<ast\><Dil><rsub|t><Mod><rsub|\<theta\>>\<phi\><rsub|0><around*|(|y<rsub|1>|)><ltae|<tformat|<table|<row|<cell|f<rsub|2>\<ast\><Dil><rsub|\<beta\>t><Mod><rsub|\<theta\>-1>\<phi\><rsub|0><around*|(|y<rsub|2>|)>>>|<row|<cell|<space|1em>\<times\><Dil><rsub|\<beta\>t><Mod><rsub|<around*|(|1+\<beta\>|)>\<theta\>-1>\<phi\><rsub|0><around*|(|y<rsub|3>|)>>>>>>>>|<row|<cell|<space|1em>\<times\>\<delta\><around*|(|x-y<rsub|1>-y<rsub|3>|)>\<delta\><around*|(|x-y<rsub|2>-y<rsub|3>|)><dd>y<rsub|1><dd>y<rsub|2><dd>y<rsub|3><dd>\<theta\><frac|<dd>t|t>>>>>>>>|<row|<cell|=<frac|1|C<rsub|\<phi\>,\<beta\>>><big|int><rsub|<R><rsup|3><rsub|+>><ltae|<tformat|<table|<row|<cell|f<rsub|1>\<ast\><Dil><rsub|t><Mod><rsub|\<theta\>>\<phi\><rsub|0><around*|(|y|)>f<rsub|2>\<ast\><Dil><rsub|\<beta\>t><Mod><rsub|\<theta\>-1>\<phi\><rsub|0><around*|(|y<rsub|>|)>>>|<row|<cell|<space|1em>\<times\><Tr><rsub|y><Dil><rsub|\<beta\>t><Mod><rsub|<around*|(|1+\<beta\>|)>\<theta\>-1>\<phi\><rsub|0><around*|(|x|)><dd>\<theta\><dd>y<frac|<dd>t|t>>>>>><space|2em>>>|<row|<cell|=<frac|1|C<rsub|\<phi\>,\<beta\>>><big|int><rsub|<R><rsup|3><rsub|+>><ltae|<tformat|<table|<row|<cell|f<rsub|1>\<ast\><Dil><rsub|t><Mod><rsub|\<theta\>>\<phi\><rsub|0><around*|(|y|)>f<rsub|2>\<ast\><Dil><rsub|\<beta\>t><Mod><rsub|\<theta\>-1>\<phi\><rsub|0><around*|(|y<rsub|>|)>>>|<row|<cell|<space|1em>\<times\><Tr><rsub|y><Mod><rsub|<frac|1+\<beta\>|\<beta\>>\<eta\>-<around*|(|\<beta\>t|)><rsup|-1>><Dil><rsub|\<beta\>t>\<phi\><rsub|0><around*|(|x|)><dd>\<eta\><dd>y<frac|<dd>t|t>.>>>>>>>>>>>>>>>
    </equation*>

    To justify the convergence claim let us first suppose that
    <math|<spt><FT|f<rsub|1>>,<spt><FT|f<rsub|2>>\<subset\>B<rsub|S>> for
    some <math|S\<gg\>1>. For <math|t\<gtr\><frac|1|100S>> and
    <math|x\<in\>B<rsub|R>> it holds that\ 

    <\equation*>
      <ltae|<tformat|<table|<row|<cell|<around*|\||f<rsub|1>\<ast\><Dil><rsub|t><Mod><rsub|\<theta\>>\<phi\><rsub|0><around*|(|y|)>|\|>+<around*|\||f<rsub|2>\<ast\><Dil><rsub|\<beta\>t><Mod><rsub|\<theta\>-1>\<phi\><rsub|0><around*|(|y<rsub|>|)>|\|>\<lesssim\><rsub|\<phi\>,\<beta\>>t<rsup|-1><around*|(|<around*|\<\|\|\>|f<rsub|1>|\<\|\|\>><rsub|L<rsup|1>>+<around*|\<\|\|\>|f<rsub|2>|\<\|\|\>><rsub|L<rsup|1>>|)>,>>|<row|<cell|<around*|\||<Tr><rsub|y><Mod><rsub|<frac|1+\<beta\>|\<beta\>>\<eta\>-<around*|(|\<beta\>t|)><rsup|-1>><Dil><rsub|\<beta\>t><FT|\<phi\>><rsub|0><around*|(|x|)>|\|>\<lesssim\><rsub|\<phi\>>t<rsup|-1><around*|\<langle\>|<frac|<around*|\||y|\|>-R|t>|\<rangle\>><rsup|-100><rsup|>,>>>>>
    </equation*>

    while for <math|t\<less\><frac|1|100S>> either
    <math|<FT|z>\<rightarrow\><FT|\<phi\><rsub|0>><around*|(|<FT|z>-\<theta\>|)>>
    or <math|<FT|z>\<rightarrow\><FT|\<phi\><rsub|0>><around*|(|<FT|z>-\<theta\>-1|)>>
    vanishes on <math|B<rsub|<frac|1|100>>> so\ 

    <\equation*>
      f<rsub|1>\<ast\><Dil><rsub|t><Mod><rsub|\<theta\>>\<phi\><rsub|0><around*|(|y|)>=0<infix-or>f<rsub|2>\<ast\><Dil><rsub|\<beta\>t><Mod><rsub|\<theta\>-1>\<phi\><rsub|0><around*|(|y<rsub|>|)>=0.
    </equation*>

    The claim for <math|f<rsub|1>,f<rsub|2>\<in\><Sch><around*|(|<R>|)>>
    without restrictions on the Fourier support follows by standard
    approximation arguments.\ 
  </proof>

  <section|Outer Lebesgue spaces and the time-frequency-scale
  space.<label|sec:outer-space>>

  In this section we discuss outer Lebesgue spaces and quasi-norms in general
  and, specifically, their details in the case of the time-scale-frequency
  space <math|<R><rsup|3><rsub|+>> and functions
  <math|F\<of\><R><rsup|3><rsub|+>\<times\>\<Phi\><rsub|<gr>><rsup|\<infty\>>\<rightarrow\><C>>
  thereon. An important example of such functions are those of the form
  <math|F=<Emb><around*|[|f|]>> given by <eqref|eq:embedding>. Let us briefly
  summarize the structure of this section before proceeding to a preliminary
  discussion of the nature of functions <math|F\<of\><R><rsup|3><rsub|+>\<times\>\<Phi\><rsub|<gr>><rsup|\<infty\>>\<rightarrow\><C>>
  (recall that spaces of band-limited wave packets
  \ <math|\<Phi\><rsub|<gr>><rsup|\<infty\>>> and
  <math|\<Phi\><rsub|<gr>><rsup|N>> were defined in
  <eqref|eq:def:wave-packets>).\ 

  <\itemize>
    <item>In <smart-ref|sec:outer-generalities> we discuss the general outer
    Lebesgue space framework. We review established results, we prove a
    restricted weak type interpolation theorem
    (<smart-ref|prop:outer-restricted-interpolation>), and we deduce a
    Radon-Nykodim -type domination result (<smart-ref|prop:outer-RN>).\ 

    <item>In <smart-ref|sec:time-frequency-outer-lebesgue> we discuss the
    outer Lebesgue space structure specifically on
    <math|<R><rsup|3><rsub|+>>, which we will be using throughout this paper.
    In particular, we introduce trees, the outer measures
    <math|\<mu\><rsup|1><rsub|\<Theta\>>> and
    <math|\<mu\><rsup|\<infty\>><rsub|\<Theta\>>>, and specific sizes used to
    control the magnitude of embedded functions
    <math|F\<of\><R><rsup|3><rsub|+>\<times\>\<Phi\><rsub|<gr>><rsup|\<infty\>>\<rightarrow\><C>>
    locally on trees. We then establish some recurrent technical lemmata as
    well as providing motivation for the sizes by relating them to well-known
    objects in harmonic analysis and Calderón-Zygmund theory. \ 

    <item>In <smart-ref|sec:derived-sizes> we discuss how the sizes are
    modified when dealing with compositions with diffeomorphisms:
    <math|F\<mapsto\>F\<circ\>\<Gamma\>>. We also define the product sizes
    used to deal with functions <math|F<rsub|\<times\>>=F<rsub|2>F<rsub|3>>
    appearing in <smart-ref|eq:iterated-Holder-type-bounds:bilinear> and
    <smart-ref|eq:embedding-bound:bilinear>. We then introduce the sizes
    <math|<SI><rsub|\<Theta\>><rsup|<around*|(|l|)>>> and
    <math|<SI><rsub|\<Theta\>><rsup|<around*|(|o|)>>> appearing in
    <smart-ref|eq:RN-domination-BHT>, adapted to controlling the term
    <math|<big|prod><rsub|j=1><rsup|3><Emb><around*|[|f<rsub|j>|]>\<circ\>\<Gamma\><rsub|j>>
    i.e. the product of several functions
    <math|F<rsub|j>\<of\><R><rsup|3><rsub|+>\<times\>\<Phi\><rsub|<gr>><rsup|\<infty\>>\<rightarrow\><C>>.\ 

    <item>In <smart-ref|sec:localized-outer-lebesgue> we introduce the strip
    outer measures <math|\<nu\><rsub|1>> and <math|\<nu\><rsub|\<beta\>>>,
    and we construct <with|font-shape|italic|localized outer Lebesgue
    quasi-norms> based on outer the Lebesgue quasi-norms defined up to that
    point.
  </itemize>

  \;

  An element <math|F\<in\><ms|R><around|(|<R><rsup|3><rsub|+>|)>\<otimes\><rsup|k>\<Phi\><rsub|<gr>><rsup|\<infty\>><rprime|'>>,
  that we improperly call a \Pfunction\Q, is a map such that
  \ <math|<around*|(|\<Phi\><rsup|\<infty\>><rsub|<gr>>|)><rsup|k>\<ni\><around*|(|\<phi\><rsub|1>,\<ldots\>,\<phi\><rsub|k>|)>\<mapsto\>F<around*|(|\<cdot\>|)><around*|[|\<phi\><rsub|1>,\<ldots\>\<phi\><rsub|k>|]>\<in\><ms|R><around|(|<R><rsup|3><rsub|+>|)>>
  is <math|k>-linear and is valued in signed Radon measures on
  <math|<R><rsup|3><rsub|+>> i.e. in Borel measures that are locally finite
  and inner and outer regular. In the special case of <math|k=0>, the space
  <math|<ms|R><around|(|<R><rsup|3><rsub|+>|)>\<otimes\><rsup|0>\<Phi\><rsub|<gr>><rsup|\<infty\>><rprime|'>=<ms|R><around|(|<R><rsup|3><rsub|+>|)>>
  is simply the space of <math|<C>>-valued Radon measures on
  <math|<R><rsup|3><rsub|+>>. We omit <math|k> from the notation when
  <math|k=1> and we write <math|<Rad><around*|(|<R><rsup|3><rsub|+>|)>\<otimes\>\<Phi\><rsub|<gr>><rsup|\<infty\>><rsub|><rprime|'>>.
  The space <math|L<rsup|\<infty\>><rsub|loc><around*|(|<R><rsup|3><rsub|+>|)>\<otimes\><rsup|k>\<Phi\><rsub|<gr>><rsup|\<infty\>><rsub|><rprime|'>>
  is the subspaces of <math|<Rad><around*|(|<R><rsup|3><rsub|+>|)>\<otimes\><rsup|k>\<Phi\><rsub|<gr>><rsup|\<infty\>><rsub|><rprime|'>>
  given by functions such that for every compact subset
  <math|K\<subset\><R><rsup|3><rsub|+>> there exists
  <math|N<rsub|K>\<in\><N>> such that

  <\equation*>
    <ltae|<tformat|<cwith|1|1|1|1|cell-halign|l>|<table|<row|<cell|sup<rsub|<tabular*|<tformat|<table|<row|<cell|\<phi\><rsub|1>,\<ldots\>,\<phi\><rsub|k>>>>>>><rsub|><around*|\<\|\|\>|F<around|(|\<eta\>,y,t|)><around*|[|\<phi\><rsub|1>,\<ldots\>,\<phi\><rsub|k>|]><rsub|>|\<\|\|\>><rsub|L<rsup|\<infty\>><around|(|K|)>>\<less\>\<infty\>,>>>>>
  </equation*>

  where the upper bound is taken over <math|\<phi\><rsub|j>\<in\>\<Phi\><rsub|<gr>><rsup|\<infty\>>>
  with <math|<around*|\<\|\|\>|\<phi\><rsub|j>|\<\|\|\>><rsub|\<Phi\><rsub|<gr>><rsup|N<rsub|K>>>\<leq\>1>,
  <math|j\<in\><around*|{|1,\<ldots\>,k|}>>. For any fixed
  <math|\<phi\><rsub|1>,\<ldots\>,\<phi\><rsub|k>\<in\>\<Phi\><rsup|\<infty\>><rsub|<gr>>>
  we have identified the function <math|F<around*|(|\<eta\>,y,t|)><around*|[|\<phi\><rsub|1>,\<ldots\>,\<phi\><rsub|k>|]>>
  with the measure <math|F<around*|(|\<eta\>,y,t|)><around*|[|\<phi\><rsub|1>,\<ldots\>,\<phi\><rsub|k>|]><dd>\<eta\><dd>y<dd>t>.
  According to this notation and definition <eqref|eq:embedding> it holds
  that <math|<Emb><around*|[|f|]>\<in\>L<rsup|\<infty\>><rsub|loc><around*|(|<R><rsup|3><rsub|+>|)>\<otimes\>\<Phi\><rsub|<gr>><rsup|\<infty\>><rsub|><rprime|'>>
  for any <math|f\<in\><Sch><around*|(|<R>|)>>. If
  <math|<gr><rprime|'>\<gtr\><gr>> then by restricting we can identify a
  function <math|F\<in\><Rad><around*|(|<R><rsup|3><rsub|+>|)>\<otimes\>\<Phi\><rsup|\<infty\>><rsub|<gr><rprime|'>><rprime|'>>
  with a function <math|F\<in\><Rad><around*|(|<R><rsup|3><rsub|+>|)>\<otimes\>\<Phi\><rsup|\<infty\>><rsub|<gr>><rprime|'>>.
  Generally, we could define <math|<Rad><around*|(|<XO>|)>\<otimes\><rsup|k>\<Phi\><rsup|\<infty\>><rsub|<gr><rprime|'>><rprime|'>>
  for any locally compact topological space <math|<XO>>.

  <subsection|Generalities of outer measure
  spaces<label|sec:outer-generalities>>

  Next, we provide the reader with a brief overview of the construction and
  properties of general outer Lebesgue spaces. While these notions in the
  context of the space <math|<R><rsup|3><rsub|+>>, specifically, are
  discussed in <smart-ref|sec:time-frequency-outer-lebesgue>, the reader may
  assume that <math|<XO>=<R><rsup|3><rsub|+>> for the purposes of this
  section, too.

  Let <math|<XO>> be a locally compact topological space. An <em|outer
  measure> <math|\<mu\>> on <math|<XO>> is a function
  <math|\<mu\>:2<rsup|<XO>>\<rightarrow\><around*|[|0,+\<infty\>|]>> that is
  <math|\<sigma\>>-subadditive i.e. such that

  <\equation*>
    \<mu\><around*|(|<big|cup><rsub|n\<in\><N><rsup|\<leq\>>>E<rsub|n>|)>\<leq\><big|sum><rsub|n\<in\><N><rsup|\<leq\>>>\<mu\><around*|(|E<rsub|n>|)><space|2em>\<forall\><around*|(|E<rsub|n>\<subset\><XO>|)><rsub|n\<in\><N><rsup|\<leq\>>>.
  </equation*>

  We define a <math|\<sigma\>>-generating collection on <math|<XO>> to be a
  collection <math|<BO>\<subset\><Bor><around*|(|\<bbb-X\>|)>> of Borel sets
  <math|B> with <math|\<mu\><around*|(|B|)>\<less\>\<infty\>> for each
  <math|B\<in\><BO>> such that <math|<XO>> can be written as a union of
  countably many elements of <math|<BO>> and such that
  <math|\<mu\><around*|(|E|)>> for any <math|E\<subset\><XO>> can be
  recovered by countable coverings of elements from <math|<BO>>:

  <\equation>
    <label|eq:measure-recovery>\<mu\><around*|(|E|)>=inf<around*|{|<big|sum><rsub|B\<in\><mc|B>>\<mu\><around*|(|B|)>\<suchthat\>E\<supseteq\><big|cup><rsub|B\<in\><mc|B>>B,<mc|B>\<subset\><BO>
    <text|countable>|}>.
  </equation>

  We denote countable unions of <math|<BO>> by\ 

  <\equation*>
    <BO><rsup|\<cup\>><eqd><around*|<left|{|-1>|<big|cup><rsub|B\<in\><mc|B>>B,<mc|B>\<subset\><BO>
    <text|countable>|<right|}|-1>>.
  </equation*>

  The collection <math|<BO>> need not be closed with respect to complement.\ 

  A <em|size> is a positive norm-like functional
  <math|<SO>\<of\><around*|<left|(|1>|<Rad><around*|<left|(|1>|<XO>|<right|)|1>>\<otimes\><rsup|k>\<Phi\><rsub|<gr>><rsup|\<infty\>><rsub|><rprime|'>|<right|)|1>>\<rightarrow\><around*|[|0,+\<infty\>|]>>
  with the following properties.\ 

  <\itemize>
    <item>Homogeneity:

    <\equation>
      <around*|\<\|\|\>|\<lambda\>F|\<\|\|\>><rsub|<SO>>=<around*|\||\<lambda\>|\|><around*|\<\|\|\>|F|\<\|\|\>><rsub|<SO>><space|2em>\<forall\>F\<in\><Rad><around*|(|<XO>|)>\<otimes\><rsup|k>\<Phi\><rsub|<mf|r>><rsup|\<infty\>><rprime|'>,<label|eq:size-homogeneity>
    </equation>

    <item>Quasi-triangle inequality: there exists
    <math|Tri<rsub|<SO>>\<geq\>1> such that

    <\equation>
      <label|eq:size-triangle><around*|\<\|\|\>|F<rsub|1>+F<rsub|2>|\<\|\|\>><rsub|<SO>>\<leq\>Tri<rsub|<SO>><around*|(|<around*|\<\|\|\>|F<rsub|1>|\<\|\|\>><rsub|<SO>>+<around*|\<\|\|\>|F<rsub|2>|\<\|\|\>><rsub|<SO>>|)>,<space|1em>\<forall\>F<rsub|1>,F<rsub|2>
      \<in\><Rad><around*|(|<XO>|)>\<otimes\><rsup|k>\<Phi\><rsub|<mf|r>><rsup|\<infty\>><rprime|'>.
    </equation>

    <item>Monotonicity: we express this notion by requiring

    <\equation>
      <around*|\<\|\|\>|<1><rsub|<XO>\\E>F|\<\|\|\>><rsub|<SO>>\<leq\><around*|\<\|\|\>|F|\<\|\|\>><rsub|<SO>>,<space|1em>\<forall\>F\<in\><Rad><around*|(|<XO>|)>\<otimes\><rsup|k>\<Phi\><rsub|<mf|r>><rsup|\<infty\>><rprime|'>,<space|1em>\<forall\>E\<in\><BO><rsup|\<cup\>>.<label|eq:size-monotonicity>
    </equation>

    <item>Regularity: if <math|E<rsub|n><rsup|+>\<in\><BO><rsup|\<cup\>>> is
    an increasing sequence of sets and <math|E<rsup|-><rsub|n>\<in\><BO><rsup|\<cup\>>>
    is a decreasing sequences of sets such that
    <math|<big|cup><rsub|n\<in\><N>><around*|(|E<rsub|n><rsup|+>\<setminus\>E<rsub|n><rsup|->|)>=<XO>>
    then

    <\equation>
      <label|eq:size-regularity><around*|\<\|\|\>|F|\<\|\|\>><rsub|<SO>>\<lesssim\>liminf<rsub|n><around*|\<\|\|\>|<1><rsub|E<rsub|n><rsup|+>\<setminus\>E<rsub|n><rsup|->>F|\<\|\|\>><rsub|<SO>>.
    </equation>
  </itemize>

  \;

  The monotonicity and regularity properties depend on the choice of the
  <math|\<sigma\>>-generating set <math|<BO>>. In general, we are allowed to
  have <math|<around*|\<\|\|\>|F|\<\|\|\>><rsub|<SO>>=0> for functions
  <math|F\<neq\>0>. We call the tuple <math|<around*|(|<XO>,<BO>,\<mu\>,<SO>|)>>
  an outer Lebesgue space. Given an outer Lebesgue space, we define outer
  Lebesgue quasi-norms by relating the notions of size and of outer measure.
  We define the <math|\<lambda\>>-superlevel measure of a function
  <math|F\<in\><Rad><around*|(|<XO>|)>\<otimes\><rsup|k>\<Phi\><rsub|<mf|r>><rsup|\<infty\>><rprime|'>>
  as

  <\equation>
    \<mu\><around|(|<around|\<\|\|\>|F|\<\|\|\>><rsub|<SO>>\<gtr\>\<lambda\>|)><eqd>inf
    <around*|<left|{|2>|\<mu\><around|(|E|)>:E\<in\><BO><rsup|\<cup\>>,<space|0.27em><around|\<\|\|\>|<1><rsub|<XO>\<setminus\>E>F|\<\|\|\>><rsub|<SO>>\<leq\>\<lambda\>|<right|}|2>>.<label|eq:superlevel-measure>
  </equation>

  This quantity is generally not a measure of any specific set; rather it
  interpolates between the outer measure <math|\<mu\>> and the size
  <math|<SO>>. The quantity <eqref|eq:superlevel-measure> encodes the optimal
  way of splitting <math|F> into two parts:
  <math|F=<1><rsub|E>F+<1><rsub|<XO>\<setminus\>E>F> with
  <math|E\<in\><BO><rsup|\<cup\>>> so that
  <math|<1><rsub|<XO>\<setminus\>E>F> has size controlled by
  <math|\<lambda\>> and <math|<1><rsub|E>F> is supported on a set of small
  measure.

  Given \ <math|F\<in\><Rad><around*|(|<XO>|)>\<otimes\><rsup|k>\<Phi\><rsub|<mf|r>><rsup|\<infty\>><rprime|'>>,
  its outer Lebesgue quasi-norms and their weak variants are given by\ 

  <\equation>
    <label|eq:superlevel-Lp><ltae|<tformat|<table|<row|<cell|<around|\<\|\|\>|F|\<\|\|\>><rsub|L<rsub|\<mu\>><rsup|p><SO>><eqd><around*|(|<big|int><rsub|0><rsup|\<infty\>>\<lambda\>\<mu\><around|(|<around|\<\|\|\>|F|\<\|\|\>><rsub|<SO>>\<gtr\>\<lambda\><rsup|<frac|1|p>>|)><space|0.17em><frac|<dd|>\<lambda\>|\<lambda\>>|)><rsup|<frac|1|p>><space|2em>p\<in\><around|(|0,\<infty\>|)>,>>|<row|<cell|<around|\<\|\|\>|F|\<\|\|\>><rsub|L<rsub|\<mu\>><rsup|p,\<infty\>><SO>><eqd><around*|(|sup<rsub|\<lambda\>\<gtr\>0>
    \<lambda\> \<mu\><around|(|<around|\<\|\|\>|F|\<\|\|\>><rsub|<SO>>\<gtr\>\<lambda\><rsup|<frac|1|p>>|)>|)><rsup|<frac|1|p>><rsup|><space|2em>p\<in\><around|(|0,\<infty\>|)>,>>|<row|<cell|<around|\<\|\|\>|F|\<\|\|\>><rsub|L<rsub|\<mu\>><rsup|\<infty\>><SO>><eqd><around|\<\|\|\>|F|\<\|\|\>><rsub|<SO>>.>>>>>
  </equation>

  The quantities above vanish only if <math|\<mu\><around|(|<around|\<\|\|\>|F|\<\|\|\>><rsub|<SO>>\<gtr\>0|)>=0>
  so we quotient out such functions, similarly to how one does in classical
  Lebesgue theory. We write <math|F\<in\>L<rsup|p><rsub|\<mu\>><SO>> if
  <math|F\<in\><Rad><around*|(|<XO>|)>\<otimes\><rsup|k>\<Phi\><rsub|<gr>><rsup|\<infty\>><rprime|'>>
  and <math|<around*|\<\|\|\>|F|\<\|\|\>><rsub|L<rsup|p><rsub|\<mu\>><SO>>\<less\>\<infty\>>;
  the space <math|<XO>> and the values of <math|k> and <math|<mf|r>> are
  encoded in the domains for the size <math|<SO>> and the measure
  <math|\<mu\>>.

  Next, we summarize some relevant properties of outer Lebesgue quasi-norms.\ 

  Sizes and measures can be combined via positive linear combinations. Two
  sizes <math|<SO>> and <math|<SO><rprime|'>> are equivalent if
  <math|<around|\<\|\|\>|F|\<\|\|\>><rsub|<SO>>\<approx\><around|\<\|\|\>|F|\<\|\|\>><rsub|<SO><rprime|'>>>
  and similarly two outer measures <math|\<mu\>> and <math|\<mu\><rprime|'>>
  are equivalent if <math|\<mu\><around|(|E|)>\<approx\>\<mu\><rprime|'><around|(|E|)>>
  for all <math|E\<in\><Bor><around|(|<XO>|)>>. Equivalence of sizes and
  measures imply the equivaluence of corresponding Lebesgue quasi-norms.\ 

  Using the monotonicity property <eqref|eq:size-monotonicity>, one can check
  that the quantities in <eqref|eq:superlevel-Lp> are indeed quasi-norms with

  <\equation*>
    <around*|\<\|\|\>|F<rsub|1>+F<rsub|2>|\<\|\|\>><rsub|L<rsup|p><rsub|\<mu\>><SO>>\<leq\>Tri<rsub|L<rsup|p><rsub|\<mu\>><SO>><around*|(|<around*|\<\|\|\>|F<rsub|1>|\<\|\|\>><rsub|L<rsup|p><rsub|\<mu\>><SO>>+<around*|\<\|\|\>|F<rsub|2>|\<\|\|\>><rsub|L<rsup|p><rsub|\<mu\>><SO>>|)>,<space|2em>Tri<rsub|L<rsup|p><rsub|\<mu\>><SO>>\<leq\>2<rsup|1+<frac|1|p>>Tri<rsub|<SO>>.
  </equation*>

  The quasi-norms <math|L<rsup|p><rsub|\<mu\>><SO>> are themselves regular
  for any <math|p\<in\><around*|(|0,\<infty\>|)>> since\ 

  <\equation*>
    \<mu\><around|(|<around|\<\|\|\>|<1><rsub|E<rsub|n><rsup|+>\<setminus\>E<rsub|n><rsup|->>F|\<\|\|\>><rsub|<SO>>\<gtr\>2\<lambda\>|)>\<lesssim\>liminf<rsub|n>\<mu\><around|(|<around|\<\|\|\>|<1><rsub|E<rsub|n><rsup|+>\<setminus\>E<rsub|n><rsup|->>F|\<\|\|\>><rsub|<SO>>\<gtr\>\<lambda\>|)>
  </equation*>

  for any sequence of sets <math|E<rsub|n><rsup|+>,E<rsup|-><rsub|n>\<in\><BO><rsup|\<cup\>>>
  (increasing \ and decreasing, respectively) such that
  <math|<big|cup><rsub|n\<in\><N>><around*|(|E<rsub|n><rsup|+>\<setminus\>E<rsub|n><rsup|->|)>=<XO>>.

  <\remark>
    <label|remark:finite-quasi-subadditivity>If
    \ <math|<around*|\<\|\|\>|\<cdot\>|\<\|\|\>>:X\<rightarrow\><around*|[|0,+\<infty\>|]>>
    is a function on a vector space <math|X> that satisfies\ 

    <\equation*>
      <around*|\<\|\|\>|v<rsub|1>+v<rsub|2>|\<\|\|\>><rsub|>\<leq\>Tri<rsub|<around*|\<\|\|\>|\<cdot\>|\<\|\|\>>><around*|(|<around*|\<\|\|\>|v<rsub|1>|\<\|\|\>>+<around*|\<\|\|\>|v<rsub|2>|\<\|\|\>>|)>
    </equation*>

    then for any <math|K\<in\><N>> one has

    <\equation*>
      <around*|<left|\<\|\|\>|-2>|<big|sum><rsub|k=1><rsup|K>v<rsub|k>|<right|\<\|\|\>|-2>>\<leq\>C<rsub|<around*|\<\|\|\>|\<cdot\>|\<\|\|\>>><around*|<left|(|-1>|<big|sum><rsub|k=1><rsup|K>k<rsup|C<rsub|<around*|\<\|\|\>|\<cdot\>|\<\|\|\>>>><around*|\<\|\|\>|v<rsub|k>|\<\|\|\>>|<right|)|-1>>
    </equation*>

    for some <math|C<rsub|<around*|\<\|\|\>|\<cdot\>|\<\|\|\>>>\<gtr\>0>
    depending only on <math|Tri<rsub|<around*|\<\|\|\>|\<cdot\>|\<\|\|\>>>>.
    In particular, for any <math|\<varepsilon\>\<gtr\>0> there exists
    <math|<wide|Tri<rsub|>|~><rsub|<around*|\<\|\|\>|\<cdot\>|\<\|\|\>>,\<varepsilon\>><rsub|>>
    such that\ 

    <\equation>
      <label|eq:multi-triangle><around*|<left|\<\|\|\>|-2>|<big|sum><rsub|k=1><rsup|K>v<rsub|k>|<right|\<\|\|\>|-2>>\<leq\><wide|Tri<rsub|>|~><rsub|<around*|\<\|\|\>|\<cdot\>|\<\|\|\>>,\<varepsilon\>><rsub|><around*|<left|(|-1>|<big|sum><rsub|k=1><rsup|K>2<rsup|\<varepsilon\>k><around*|\<\|\|\>|v<rsub|k>|\<\|\|\>>|<right|)|-1>>.
    </equation>

    We omit the proof of this fact; it relies on a standard dyadic
    partitioning argument.\ 
  </remark>

  Outer Lebesgue quasi-norms satisfy many of the properties that hold for
  classical Lebesgue norms. We suggest the first-time reader to skip the
  proofs below (where given) as they are adaptations either of classical
  measure theory proofs or of proofs that have appeared in prior works using
  outer Lebesgue spaces. The reader may also want to skip the remainder of
  this subsection entirely until the results herein get referenced.

  <\proposition>
    <label|prop:outer-properties> Let <math|<around|(|<XO>,<BO>,\<mu\>,<SO>|)>>
    be an outer space.\ 

    <\itemize>
      <item>If <math|<wide|\<mu\>|~>> is another outer measure for which
      <math|<BO>> is a generating collection, then for any
      <math|p\<in\><around*|(|0,\<infty\>|)>> it holds that\ 

      <\equation>
        <label|eq:outer-measure-Lp-comparison><around*|\<\|\|\>|F|\<\|\|\>><rsub|L<rsup|p<rsub|>><rsub|<wide|\<mu\>|~>><SO>>\<leq\>sup<rsub|E\<in\><BO><rsup|\<cup\>>><around*|(|<frac|<wide|\<mu\>|~><around*|(|E|)>|\<mu\><around*|(|E|)>>|)><rsup|<frac|1|p>><around*|\<\|\|\>|F|\<\|\|\>><rsub|L<rsup|p><rsub|\<mu\>><SO>>
      </equation>

      (the bound above is non-trivial only if
      <math|\<mu\><around*|(|E|)>=0\<Longrightarrow\><wide|\<mu\>|~><around*|(|E|)>=0>).\ 

      <item>The Chebyshev inequality holds: for any
      <math|p\<in\><around*|(|0,\<infty\>|)>> it holds that\ 

      <\equation>
        <label|eq:outer-chebychev><around*|\<\|\|\>|F|\<\|\|\>><rsub|L<rsup|p,\<infty\>><rsub|\<mu\>><SO>>\<lesssim\><around*|\<\|\|\>|F|\<\|\|\>><rsub|L<rsup|p><rsub|\<mu\>><SO>><space|2em>\<forall\>F\<in\>L<rsup|p><rsub|\<mu\>><SO>.
      </equation>

      <item>On finite measure spaces, outer Lebesgue quasi-norms are nested:
      for any \ <math|p<rsub|->,p<rsub|+>\<in\><around*|(|0,\<infty\>|]>>
      with <math|p<rsub|->\<leq\>p<rsub|+>> it holds that\ 

      <\equation>
        <label|eq:outer-Lp-finite-support><around*|\<\|\|\>|F|\<\|\|\>><rsub|L<rsup|p<rsub|->><rsub|\<mu\>><SO>>\<lesssim\>\<mu\><around*|(|<around*|\<\|\|\>|F|\<\|\|\>><rsub|<SO>>\<gtr\>0|)><rsup|<frac|1|p<rsub|->>-<frac|1|p<rsub|+>>><around*|\<\|\|\>|F|\<\|\|\>><rsub|L<rsup|p<rsub|+>,\<infty\>><rsub|\<mu\>><SO>>
      </equation>

      for any <math|F\<in\>L<rsup|p><rsub|\<mu\>><SO> > with an implicit
      constant independent of <math|F>.\ 

      <item>Outer Lebesgue quasi-norms are log-convex in the exponent
      <math|p>. Given any any <math|p<rsub|0>,p<rsub|1>\<in\><around*|(|0,\<infty\>|]>>
      and any <math|\<theta\>\<in\><around*|(|0,1|)>> it holds that

      <\equation>
        <label|eq:outer-log-convexity><around*|\<\|\|\>|F|\<\|\|\>><rsub|L<rsup|p<rsub|\<theta\>>><rsub|\<mu\>><SO>>\<leq\>C<rsub|p<rsub|0>,p<rsub|1>,\<theta\>><around*|\<\|\|\>|F|\<\|\|\>><rsub|L<rsup|p<rsub|0>,\<infty\>><rsub|\<mu\>><SO>><rsup|1-\<theta\>><around*|\<\|\|\>|F|\<\|\|\>><rsub|L<rsup|p<rsub|1,\<infty\>>><rsub|\<mu\>><SO>><rsup|\<theta\>>,<space|2em>\<forall\>F\<in\>L<rsup|p<rsub|0>,\<infty\>><rsub|\<mu\>><SO>\<cap\>L<rsup|p<rsub|1>,\<infty\>><rsub|\<mu\>><SO>.
      </equation>

      with <math|p<rsub|\<theta\>><rsup|-1><eqd><around*|(|1-\<theta\>|)>p<rsub|0><rsup|-1>+\<theta\>p<rsub|1><rsup|-1>>.
    </itemize>
  </proposition>

  The proofs (ommitted) of these statements rely on the super-level set
  representation <eqref|eq:superlevel-Lp> and they are similar to the ones
  for classical Lebesgue spaces.

  Next, we focus on interpolation results for linear and multi-linear
  operators between outer Lebesgue spaces. We begin with the notion of an
  <math|L<rsup|p><rsub|\<mu\>><SO>>-atom and an associated atomic
  decomposition statement for functions <math|F\<in\>L<rsup|p><rsub|\<mu\>><SO>>.
  Note however, that we do not claim that <math|L<rsup|p><rsub|\<mu\>><SO>>
  is an atomic space in the classical sense.

  <\proposition>
    <label|prop:atomic-decomposition><dueto|Decomposition into atoms> Let
    <math|<around|(|<XO>,<BO>,\<mu\>,<SO>|)>> be an outer space. Given
    <math|p\<in\><around*|(|0,\<infty\>|]>>, an
    <math|L<rsup|p><rsub|\<mu\>><SO>>-atom is a function
    <math|F\<in\>L<rsup|\<infty\>><rsub|\<mu\>><SO>> such that

    <\equation>
      <label|eq:def:p-atom>\<mu\><around*|(|<around*|\<\|\|\>|F|\<\|\|\>><rsub|<SO>>\<gtr\>0|)><rsup|<frac|1|p>><around*|\<\|\|\>|F|\<\|\|\>><rsub|L<rsup|\<infty\>><rsub|\<mu\>><SO>>\<leq\>1.
    </equation>

    Given any <math|F\<in\>L<rsup|p><rsub|\<mu\>><SO>> there exists a
    sequence of nested sets <math|A<rsub|k>\<subset\>A<rsub|k-1>\<subset\><XO>>
    such that, setting <math|\<Delta\>A<rsub|k><eqd>A<rsub|k-1>\\A<rsub|k>>,
    it holds that:

    <\itemize>
      <item>

      <\equation*>
        <around*|\<\|\|\>|F|\<\|\|\>><rsub|L<rsup|p><rsub|\<mu\>><SO>>\<approx\><around*|(|<big|sum><rsub|k\<in\><Z>>\<mu\><around*|(|\<Delta\>A<rsub|k>|)>2<rsup|k>|)><rsup|<frac|1|p>>,<space|2em><around*|\<\|\|\>|<1><rsub|\<Delta\>A<rsub|k>>F|\<\|\|\>><rsub|<SO>>\<leq\>2<rsup|<frac|k|p>>,
      </equation*>

      \ 

      <item>the functions

      <\equation*>
        C<rsup|-1><frac|<1><rsub|\<Delta\>A<rsub|k>>F|<around*|\<\|\|\>|F|\<\|\|\>><rsub|L<rsup|p><rsub|\<mu\>><SO>>>
      </equation*>

      are <math|L<rsup|p><rsub|\<mu\>><SO>>-atoms for some
      <math|C\<gtrsim\>1> independent of <math|F>;

      <item><math|lim<rsub|N><around*|\<\|\|\>|<1><rsub|<XO>\<setminus\>A<rsub|-N-1>>F|\<\|\|\>><rsub|L<rsup|p><rsub|\<mu\>><SO>>=lim<rsub|N><around*|\<\|\|\>|<1><rsub|A<rsub|N>>F|\<\|\|\>><rsub|L<rsup|p><rsub|\<mu\>><SO>>=0>
      and thus

      <\equation*>
        lim<rsub|N><around*|\<\|\|\>|F-<big|sum><rsub|k=-N><rsup|N><1><rsub|\<Delta\><rsub|>A<rsub|k>>F|\<\|\|\>><rsub|L<rsup|p><rsub|\<mu\>><SO>>=0;
      </equation*>

      <item>if <math|<around*|\<\|\|\>|F|\<\|\|\>><rsub|L<rsup|\<infty\>><rsub|\<mu\>><SO>>\<less\>\<infty\>>
      then <math|A<rsub|k>=\<emptyset\>> for all
      <math|k\<gtr\><around*|\<\|\|\>|F|\<\|\|\>><rsub|<SO>><rsup|p>>;

      <item>the bounds\ 

      <\equation*>
        <around*|\<\|\|\>|<1><rsub|<XO>\<setminus\>A<rsub|-N-1>>F|\<\|\|\>><rsub|<SO>>\<leq\>2<rsup|-<frac|<around*|(|N+1|)>|p>>,<space|2em>\<mu\><around*|(|<around*|\<\|\|\>|<1><rsub|A<rsub|N>>F|\<\|\|\>><rsub|<SO>>\<gtr\>0|)>\<leq\>2<rsup|-N><around*|\<\|\|\>|F|\<\|\|\>><rsub|L<rsup|p><rsub|\<mu\>><SO>><rsup|p>,
      </equation*>

      hold.
    </itemize>
  </proposition>

  <\corollary>
    Finite linear combination of <math|L<rsup|p><rsub|\<mu\>><SO>>-atoms and
    functions <math|F\<in\>L<rsup|\<infty\>><rsub|\<mu\>><SO>> with
    <math|\<mu\><around*|(|<around*|\<\|\|\>|F|\<\|\|\>><rsub|<SO>>\<gtr\>0|)>\<less\>\<infty\>>
    are dense in <math|L<rsup|p><rsub|\<mu\>><SO>>.
  </corollary>

  <\render-proof|Proof of <smart-ref|prop:atomic-decomposition>>
    Choose <math|<wide|A|~><rsub|k>\<subset\><XO>> such that\ 

    <\equation*>
      <around*|\<\|\|\>|<1><rsub|<XO>\<setminus\><wide|A|~><rsup|k>>F|\<\|\|\>><rsub|<SO>>\<leq\>2<rsup|<frac|k|p>>,<space|2em>\<mu\><around*|(|<wide|A|~><rsub|k>|)>\<leq\>2\<mu\><around*|(|<around*|\<\|\|\>|F|\<\|\|\>><rsub|<SO>>\<gtr\>2<rsup|<frac|k|p>>|)>.
    </equation*>

    Setting <math|A<rsub|k><eqd><big|cup><rsub|l\<geq\>k><wide|A|~><rsub|l>>
    we guarantee that <math|A<rsub|k>\<subset\>A<rsub|k-1>> and we have that
    \ 

    <\equation*>
      <big|sum><rsub|k\<in\><Z>>\<mu\><around*|(|A<rsub|k>|)>2<rsup|k><ltae|<tformat|<table|<row|<cell|\<leq\><big|sum><rsub|k\<in\><Z>><big|sum><rsub|l\<geq\>k>\<mu\><around*|(|<wide|A|~><rsup|l>|)>2<rsup|k>\<leq\><big|sum><rsub|l\<in\><Z>>\<mu\><around*|(|<wide|A|~><rsub|l>|)>2<rsup|l><big|sum><rsub|k\<leq\>l>2<rsup|k-l>>>|<row|<cell|\<leq\>2<big|sum><rsub|l\<in\><Z>>\<mu\><around*|(|<wide|A|~><rsub|l>|)>2<rsup|l>\<leq\>4<big|sum><rsub|l\<in\><Z>>\<mu\><around*|(|<around*|\<\|\|\>|F|\<\|\|\>><rsub|<SO>>\<gtr\>2<rsup|<frac|l|p>>|)>2<rsup|l>>>|<row|<cell|<tabular*|<tformat|<cwith|1|1|1|1|cell-halign|r>|<table|<row|<cell|\<leq\>4<big|int><rsub|0><rsup|\<infty\>>\<lambda\>\<mu\><around*|(|<around*|\<\|\|\>|F|\<\|\|\>><rsub|<SO>>\<gtr\>\<lambda\><rsup|<frac|1|p>>|)><frac|<dd>\<lambda\>|\<lambda\>>\<leq\>4<around*|\<\|\|\>|F|\<\|\|\>><rsub|L<rsup|p><rsub|\<mu\>><SO>><rsup|p>.>>>>>>>>>>
    </equation*>

    Since <math|\<Delta\>A<rsub|k>=A<rsub|k-1>\\A<rsub|k>>, for any
    <math|N\<in\><N>> it holds that\ 

    <\equation*>
      F=<big|sum><rsub|k=-N><rsup|N><1><rsub|\<Delta\>A<rsub|k>>F+<1><rsub|A<rsub|N>>F+<1><rsub|<XO>\<setminus\>A<rsub|-N-1>>F.
    </equation*>

    To show the claims on outer Lebesgue norm convergence notice that\ 

    <\equation*>
      <around*|\<\|\|\>|<1><rsub|A<rsub|N>>F|\<\|\|\>><rsub|L<rsup|p><rsub|\<mu\>><SO>><rsup|p>\<leq\>
      <big|int><rsub|2<rsup|N>><rsup|\<infty\>>\<lambda\>\<mu\><around*|(|<around*|\<\|\|\>|F|\<\|\|\>><rsub|<SO>>\<gtr\>\<lambda\><rsup|<frac|1|p>>|)><frac|<dd>\<lambda\>|\<lambda\>>+2<rsup|N>\<mu\><around*|(|A<rsub|N>|)>
    </equation*>

    while

    <\equation*>
      <around*|\<\|\|\>|<1><rsub|<XO>\<setminus\>A<rsub|-N-1>>F|\<\|\|\>><rsub|L<rsup|p><rsub|\<mu\>><SO>><rsup|p>\<leq\><big|int><rsub|0><rsup|2<rsup|-N-1>>\<lambda\>\<mu\><around*|(|<around*|\<\|\|\>|F|\<\|\|\>><rsub|<SO>>\<gtr\>\<lambda\><rsup|<frac|1|p>>|)><frac|<dd>\<lambda\>|\<lambda\>>.
    </equation*>
  </render-proof>

  The following interpolation statement shows that proving boundedness of
  multilinear maps on functions on outer Lebesgue spaces can be done by
  checking boundedness on atoms.

  <\proposition>
    <label|prop:outer-restricted-interpolation><dueto|Weak type interpolation
    for outer measure spaces> Let <math|<around|(|<XO><rsub|j>,<BO><rsub|j>,\<mu\><rsub|j>,<SO><rsub|j>|)>>,
    <math|j\<in\><around|{|\<times\>,1,\<ldots\>,M|}>>, be outer spaces and
    let\ 

    <\equation*>
      \<Pi\>:<big|prod><rsub|j=1><rsup|M>L<rsup|\<infty\>><rsub|\<mu\><rsub|j>><SO><rsub|j>\<to\><Rad><around*|(|<XO><rsub|0>|)>\<otimes\><rsup|k>\<Phi\><rsup|\<infty\>><rsub|<gr>><rprime|'>
    </equation*>

    be an <math|M>-linear map. Let <math|\<Omega\><rsub|restr>\<subset\><around|[|0,1|]><rsup|M>>
    be the set of points <math|<around|(|p<rsub|1><rsup|-1>,\<ldots\>,p<rsub|M><rsup|-1>|)>\<in\><around|[|0,1|]><rsup|M>>
    such that the restricted bounds\ 

    <\equation>
      <label|eq:abstract-endpoint-holder><around|<left|\<\|\|\>|2>|\<Pi\><around|(|F<rsub|1>,\<ldots\>,F<rsub|M>|)>|<right|\<\|\|\>|2>><rsub|L<rsup|p<rsub|\<times\>>,\<infty\>><rsub|\<mu\><rsub|\<times\>>><SO><rsub|\<times\>>>\<leq\>C<rsub|restr><around*|(|<wide|p|\<vect\>>|)>
    </equation>

    hold with <math|p<rsub|\<times\>><rsup|-1><eqd><big|sum><rsub|j=1><rsup|M>p<rsub|j><rsup|-1>>
    for all <math|L<rsup|p<rsub|j>><rsub|\<mu\><rsub|j>><SO><rsub|j>> atoms
    <math|F<rsub|j>> on <math|<XO><rsub|j>>, for some constant
    <math|C<rsub|restr><around*|(|<wide|p|\<vect\>>|)>\<gtr\>0> independent
    of <math|F<rsub|j>>. Then

    <\itemize>
      <item><math|\<Omega\><rsub|restr>> is convex;

      <item>if <math|<around|(|<wide|p|\<bar\>><rsub|1><rsup|-1>,\<ldots\>,<wide|p|\<bar\>><rsub|M><rsup|-1>|)>\<in\><around|[|0,1|]><rsup|M>>
      is an interior point of <math|\<Omega\><rsub|restr>> then the strong
      bounds

      <\equation>
        <label|eq:abstract-Lq-holder><around|\<\|\|\>|\<Pi\><around|(|F<rsub|1>,\<ldots\>,F<rsub|M>|)>|\<\|\|\>><rsub|L<rsub|\<mu\><rsub|\<times\>>><rsup|<wide|p|\<bar\>><rsub|\<times\>>><SO><rsub|\<times\>>>\<leq\>C<around*|(|<wide|<wide|p|\<bar\>>|\<vect\>>|)><big|prod><rsub|j=1><rsup|M><around|\<\|\|\>|F<rsub|j>|\<\|\|\>><rsub|L<rsub|\<mu\><rsub|j>><rsup|<wide|p|\<bar\>><rsub|j>><SO><rsub|j>><space|2em>\<forall\>F<rsub|j>\<in\>L<rsub|\<mu\><rsub|j>><rsup|<wide|p|\<bar\>><rsub|j>><SO><rsub|j>
      </equation>

      hold with <math|<wide|p|\<bar\>><rsub|\<times\>><rsup|-1><eqd><big|sum><rsub|j=1><rsup|M><wide|p|\<bar\>><rsub|j><rsup|-1>>
      and some <math|C<around*|(|<wide|<wide|p|\<bar\>>|\<vect\>>|)>\<geq\>0>
      independent of <math|F<rsub|j>>.
    </itemize>
  </proposition>

  The proof, provided below, is a direct adaptation of restricted weak type
  interpolation for multilinear forms on classical Lebesgue spaces (see
  <cite-detail|thieleWavePacketAnalysis2006|Chapter 3>).

  <\proof>
    Let us first show that <math|\<Omega\><rsub|restr>> is convex. Let
    <math|<around|(|p<rsub|1,0><rsup|-1>,\<ldots\>,p<rsub|M,0><rsup|-1>|)>,<around|(|p<rsub|1,1><rsup|-1>,\<ldots\>,p<rsub|M,1><rsup|-1>|)>\<in\>\<Omega\><rsub|restr>>
    and let <math|<wide|p|\<bar\>><rsub|j<rsup|>><rsup|-1>=<around*|(|1-\<theta\>|)>p<rsub|j,0><rsup|-1>+\<theta\>p<rsub|j,1><rsup|-1>>,
    <math|j\<in\><around*|{|\<times\>,1,\<ldots\>,M|}>> for a fixed
    <math|\<theta\>\<in\><around*|(|0,1|)>>. By log convexity of outer
    Lebesgue spaces (<eqref|eq:outer-log-convexity>,
    <smart-ref|prop:outer-properties>) it holds that

    <\equation*>
      <around|\<\|\|\>|\<Pi\><around|(|F<rsub|1>,\<ldots\>,F<rsub|M>|)>|\<\|\|\>><rsub|L<rsub|\<mu\><rsub|\<times\>>><rsup|<wide|p|\<bar\>><rsub|\<times\>>,\<infty\>><SO><rsub|\<times\>>><ltae|<tformat|<table|<row|<cell|\<leq\><around|\<\|\|\>|\<Pi\><around|(|F<rsub|1>,\<ldots\>,F<rsub|M>|)>|\<\|\|\>><rsub|L<rsub|\<mu\><rsub|\<times\>>><rsup|<wide|p|\<bar\>><rsub|\<times\>>><SO><rsub|\<times\>>>>>|<row|<cell|\<leq\>C<rsub|<wide|p|\<vect\>><rsub|0>,<wide|p|\<vect\>><rsub|1>,\<theta\>><around|\<\|\|\>|\<Pi\><around|(|F<rsub|1>,\<ldots\>,F<rsub|M>|)>|\<\|\|\>><rsub|L<rsub|\<mu\><rsub|0>><rsup|p<rsub|\<times\>,0>,\<infty\>><SO><rsub|0>><rsup|<around*|(|1-\<theta\>|)>><around|\<\|\|\>|\<Pi\><around|(|F<rsub|1>,\<ldots\>,F<rsub|M>|)>|\<\|\|\>><rsub|L<rsub|\<mu\><rsub|0>><rsup|p<rsub|\<times\>,1>,\<infty\>><SO><rsub|0>><rsup|\<theta\>>>>|<row|<cell|\<leq\>C<rsub|<wide|p|\<vect\>><rsub|0>,<wide|p|\<vect\>><rsub|1>,\<theta\>>C<rsub|0><rsup|<around*|(|1-\<theta\>|)>>C<rsub|1><rsup|\<theta\>><big|prod><rsub|j=1><rsup|M>\<mu\><rsub|j><around|(|<around*|\<\|\|\>|F<rsub|j>|\<\|\|\>><rsub|<SO><rsub|j>>\<gtr\>0|)><rsup|<frac|1-\<theta\>|p<rsub|j,0>>+<frac|\<theta\>|p<rsub|j,1>>><around|\<\|\|\>|F<rsub|j>|\<\|\|\>><rsub|<SO><rsub|j>>,>>>>>
    </equation*>

    <\equation*>
      C<rsub|0><eqd>C<rsub|restr><around*|<left|(|1>|<around*|(|p<rsub|1,0>,\<ldots\>,p<rsub|M,0>|)>|<right|)|1>><space|2em>C<rsub|1><eqd>C<rsub|restr><around*|<left|(|1>|<around*|(|p<rsub|1,1>,\<ldots\>,p<rsub|M,1>|)>|<right|)|1>>,
    </equation*>

    thus showing that <math|<around*|(|<wide|p|\<bar\>><rsub|1><rsup|-1>,\<ldots\>,<wide|p|\<bar\>><rsub|M><rsup|-1>|)>\<in\>\<Omega\><rsub|restr>>,
    as required. We need to show that the bounds above hold with the strong
    outer Lebesgue norm on <math|<LHS|>> instead of the weak norm.

    Assuming that the right hand side of <eqref|eq:abstract-Lq-holder> is
    finite and non-zero, by homogeneity we suppose that
    <math|<around|\<\|\|\>|F<rsub|j>|\<\|\|\>><rsub|L<rsup|<wide|p|\<bar\>><rsub|j>><rsub|\<mu\><rsub|j>><SO><rsub|j>>=1>
    for each <math|j\<in\><around|{|1,\<ldots\>,M|}>>. Using the atomic
    decomposition of <math|F<rsub|j>> (<smart-ref|prop:atomic-decomposition>)
    let us represent

    <\equation*>
      F<rsub|j>=<big|sum><rsub|k<rsub|j>\<in\><Z>>F<rsub|j><rsup|k<rsub|j>>
    </equation*>

    with

    <\equation*>
      F<rsub|j><rsup|k<rsub|j>><eqd><1><rsub|\<Delta\>A<rsub|j><rsup|k<rsub|j>>>F<rsub|j>,<space|2em><around*|\<\|\|\>|F<rsub|j><rsup|k<rsub|j>>|\<\|\|\>><rsub|<SO><rsub|j>>\<leq\>
      2<rsup|<frac|k<rsub|j>|<wide|p|\<bar\>><rsub|j>>>,<space|2em><big|sum><rsub|k\<in\><Z>>\<mu\><rsub|j><around*|(|\<Delta\>A<rsup|k<rsub|j>><rsub|j>|)>2<rsup|k<rsub|j>>\<approx\>1.
    </equation*>

    We omit the limiting argument and we reason under the assumptions that
    the above sums are finite. Given a tuple
    <math|<wide|k|\<vect\>>=<around*|(|k<rsub|1>,\<ldots\>,k<rsub|M>|)>\<in\><Z><rsup|M>>
    we wish emphasize how far it is from being diagonal i.e. of the form
    <math|<around*|(|k,\<ldots\>,k|)>\<in\><Z><rsup|M>> for some
    <math|k\<in\><Z>>. We construct a family
    <math|<around*|<left|(|1>|<wide|<mf|w>|\<vect\>><rsub|i>\<in\><Z><rsup|M><rsub|0>|<right|)|1>><rsub|i\<in\><around*|{|1,\<ldots\>,M-1|}>>><math|>
    of pairwise orthogonal vectors with integer coefficients that lie in the
    space <math|<Z><rsup|M><rsub|0>\<subset\><Z><rsup|M>> given by

    <\equation*>
      <Z><rsup|M><rsub|0><eqd><around*|<left|{|-2>|<wide|<mf|w>|\<vect\>>=<around*|(|<mf|w><rsub|1>,\<ldots\>,<mf|w><rsub|M>|)>\<in\><Z><rsup|M>\<suchthat\><big|sum><rsub|j=1><rsup|M><mf|w><rsub|j>=0<rsub|>|<right|}|-2>>;
    </equation*>

    we denote <math|<wide|<mf|w>|\<vect\>><rsub|i><eqd><around*|(|<mf|w><rsub|i,j>|)><rsub|j\<in\><around*|{|1,\<ldots\>,M|}>>>.
    The vectors <math|<around*|<left|(|1>|<wide|<mf|w>|\<vect\>><rsub|i>|<right|)|1>><rsub|i\<in\><around*|{|1,\<ldots\>,M-1|}>>>
    allow us to represent any <math|<wide|k|\<vect\>>=<around*|(|k<rsub|1>,\<ldots\>,k<rsub|M>|)>\<in\><Z><rsup|M>>
    as

    <\equation*>
      k<rsub|j>=n+d<rsup|-1><big|sum><rsub|i=1><rsup|M-1>l<rsub|i><mf|s><rsub|i><mf|w><rsub|i,j>,
    </equation*>

    where <math|n=M<rsup|-1><big|sum><rsub|i=1><rsup|M>k<rsub|i>\<in\><frac|1|M><Z>>
    is the average value of the components of <math|<wide|k|\<vect\>>>,
    <math|<wide|<mf|s>|\<vect\>>=<around*|(|<mf|s><rsub|1>,\<ldots\>,<mf|s><rsub|M-1>|)>\<in\><around*|{|-1,1|}><rsup|M-1>>
    is a collection of signs, and <math|<wide|l|\<vect\>>=<around*|(|l<rsub|1>,\<ldots\>,l<rsub|M-1>|)>\<in\><N><rsup|M-1>>
    are non-negative integer coefficients. One needs to choose
    <math|d\<in\><N>> large enough, e.g. <math|d=M\<cdot\><mrm|MCD><around*|<left|(|1>|<around*|{|<mf|w><rsub|i,j>\<suchthat\><mf|w><rsub|i,j>\<neq\>0|}>|<right|)|1>>>,
    so that any vector in <math|M<rsup|-1><Z><rsup|M><rsub|0><rsub|>> can be
    written as an integer linear combination of
    <math|<around*|(|<wide|<mf|w>|\<vect\>><rsub|i>|)><rsub|i\<in\><around*|{|1,\<ldots\>,M-1|}>>>.

    We now decompose the multilinear operator based on the signs
    <math|<wide|<mf|s>|\<vect\>>>, using the atomic decomposition of
    <math|F<rsub|j>>:

    <\equation*>
      \<Pi\><around|(|F<rsub|1>,\<ldots\>,F<rsub|M>|)>=<big|sum><rsub|<wide|<mf|s>|\<vect\>>\<in\><around*|{|-1,1|}><rsup|M-1>><rsub|<mf|<wide||\<vect\>>>>\<Pi\><rsup|<wide|<mf|s>|\<vect\>>><around|(|F<rsub|1>,\<ldots\>,F<rsub|M>|)>,
    </equation*>

    where\ 

    <\equation*>
      \<Pi\><rsup|<wide|<mf|s>|\<vect\>>><around|(|F<rsub|1>,\<ldots\>,F<rsub|M>|)><eqd><big|sum><rsub|n\<in\><frac|1|M><Z>><big|sum><rsub|<around|(|l<rsub|1>,\<ldots\>,l<rsub|M-1>|)>\<in\><N><rsup|M>>\<Pi\><around*|(|F<rsub|1><rsup|n+d<rsup|-1><big|sum><rsub|i=1><rsup|M-1>l<rsub|i><mf|s><rsub|i><mf|w><rsub|i,1>>,\<ldots\>,F<rsub|M><rsup|n+d<rsup|-1><big|sum><rsub|i=1><rsup|M-1>l<rsub|i><mf|s><rsub|i><mf|w><rsub|i,M>>|)>.
    </equation*>

    In the above notation we simply set <math|F<rsub|j><rsup|k<rsub|j>>=0> if
    <math|k<rsub|j>\<notin\><Z>>.\ 

    We prove the claim by showing that <eqref|eq:abstract-Lq-holder> holds
    for <math|\<Pi\><rsup|<wide|<mf|s>|\<vect\>>>> in place of
    <math|><math|\<Pi\><rsup|>> for any fix <math|<wide|<mf|s>|\<vect\>>> we
    henceforth fix. We start by finding a point
    <math|<wide|p|\<vect\>>=<around*|(|p<rsub|1>,\<ldots\>,p<rsub|M>|)>\<in\><around*|(|1,\<infty\>|)>>
    with <math|<around*|(|p<rsub|1><rsup|-1>,\<ldots\>,p<rsub|M><rsup|-1>|)>>
    in the interior of <math|\<Omega\><rsub|restr>> and an
    <math|\<varepsilon\>\<gtr\>\<varepsilon\><rprime|''>\<gtr\>0> small
    enough such that

    <\equation*>
      <ltae|<tformat|<table|<row|<cell|<big|sum><rsub|j=1><rsup|M>p<rsub|j><rsub|><rsup|-1>=<wide|p|\<bar\>><rsub|\<times\>><rsup|-1>,<space|2em><mf|s><rsub|i><big|sum><rsub|j=1><rsup|M><around*|<left|(|1>|p<rsub|j><rsup|-1>-<wide|p|\<bar\>><rsub|j><rsup|-1>|<right|)|1>><mf|w><rsub|i,j>\<gtr\>0<space|2em>\<forall\>i\<in\><around*|{|1,\<ldots\>,M-1|}>,>>|<row|<cell|<around*|<left|(|2>|<around*|(|1+<mf|s><rsub|\<times\>>\<varepsilon\>|)><rsup|-1>p<rsub|1><rsup|-1>,\<ldots\>,<around*|(|1+<mf|s><rsub|\<times\>>\<varepsilon\>|)><rsup|-1>p<rsub|M><rsup|-1>|<right|)|2>>\<in\>\<Omega\><rsub|restr><space|2em>\<forall\><mf|s><rsub|\<times\>>\<in\><around*|{|-1,+1|}>.>>>>>
    </equation*>

    Using the restricted weak boundedness assumptions
    <eqref|eq:abstract-endpoint-holder> with the exponents above, it holds
    that

    <\equation*>
      <ltae|<tformat|<cwith|1|1|1|1|cell-halign|l>|<table|<row|<cell|\<mu\><rsub|\<times\>><around*|(|<around*|\<\|\|\>|\<Pi\><around|(|F<rsub|1><rsup|n+d<rsup|-1><big|sum><rsub|i=1><rsup|M-1>l<rsub|i><mf|s><rsub|i><mf|w><rsub|i,1>>,\<ldots\>,F<rsub|M><rsup|n+d<rsup|-1><big|sum><rsub|i=1><rsup|M-1>l<rsub|i><mf|s><rsub|i><mf|w><rsub|i,M>>|)>|\<\|\|\>><rsub|<SO><rsub|\<times\>>>\<gtr\>\<lambda\><rsup|<frac|1|<wide|p|\<bar\>><rsub|\<times\>>>>|)>>>|<row|<cell|<space|1em><ltae|<tformat|<cwith|1|1|1|1|cell-halign|l>|<table|<row|<cell|\<lesssim\>\<lambda\><rsup|-<around*|(|1+<mf|s><rsub|\<times\>>\<varepsilon\>|)>><big|prod><rsub|j=1><rsup|M><ltae|<tformat|<table|<row|<cell|<around*|(|\<mu\><rsub|j><around*|<left|(|1>|<around*|\<\|\|\>|F<rsub|j><rsup|n+d<rsup|-1><big|sum><rsub|i=1><rsup|M-1>l<rsub|i><mf|s><rsub|i><mf|w><rsub|i,j>>|\<\|\|\>><rsub|<SO><rsub|j>>\<gtr\>0|<right|)|1>><rsup|<frac|<wide|p|\<bar\>><rsub|\<times\>>|p<rsub|j>>>|\<nobracket\>>>>|<row|<cell|<space|1em><around*|<left|\<nobracket\>|2>|\<times\><around*|\<\|\|\>|F<rsub|j><rsup|n+d<rsup|-1><big|sum><rsub|i=1><rsup|M-1>l<rsub|i><mf|s><rsub|i><mf|w><rsub|i,j>>|\<\|\|\>><rsub|<SO><rsub|j>><rsup|<around*|(|1+<mf|s><rsub|\<times\>>\<varepsilon\>|)><wide|p|\<bar\>><rsub|\<times\>>>|<right|)|2>>>>>>>>>|<row|<cell|\<lesssim\>\<lambda\><rsup|-<around*|(|1+<mf|s><rsub|\<times\>>\<varepsilon\>|)>><big|prod><rsub|j=1><rsup|M><around*|(|\<mu\><rsub|j><around*|(|\<Delta\>A<rsup|n+d<rsup|-1><big|sum><rsub|i=1><rsup|M-1>l<rsub|i><mf|s><rsub|i><mf|w><rsub|i,j>><rsub|j>|)><rsup|<frac|<wide|p|\<bar\>><rsub|\<times\>>|p<rsub|j>>>2<rsup|<around*|(|1+<mf|s><rsub|\<times\>>\<varepsilon\>|)><frac|<wide|p|\<bar\>><rsub|\<times\>>|<wide|p|\<bar\>><rsub|j>><around*|<left|(|-2>|n+d<rsup|-1><big|sum><rsub|i=1><rsup|M-1>l<rsub|i><mf|s><rsub|i><mf|w><rsub|i,j>|<right|)|-2>>>|)>>>>>>>>>>>
    </equation*>

    for any <math|\<lambda\>\<in\><around*|(|0,\<infty\>|)>>.

    By the quasi-triangle inequality on <math|<around*|\<\|\|\>|\<cdot\>|\<\|\|\>><rsub|<SO><rsub|\<times\>>>>,
    for any <math|\<varepsilon\><rprime|'>\<gtr\>0>, any sufficiently large
    <math|C\<gtr\>1>, and for any <math|n<rsub|\<times\>>\<in\><Z>> \ it
    holds that

    <\equation*>
      <ltae|<tformat|<table|<row|<cell|\<mu\><rsub|\<times\>><around*|(|<around*|\<\|\|\>|\<Pi\><rsup|<wide|<mf|s>|\<vect\>>><around|(|F<rsub|1>,\<ldots\>,F<rsub|M>|)>|\<\|\|\>><rsub|<SO><rsub|\<times\>>>\<gtr\>C2<rsup|<frac|n<rsub|\<times\>>|<wide|p|\<bar\>><rsub|\<times\>>>>|)>>>|<row|<cell|<space|1em><ltae|<tformat|<table|<row|<cell|=\<mu\><rsub|\<times\>><ltae|<tformat|<table|<row|<cell|<around*|<left|(|-1>|<around*|<left|\<\|\|\>|-2>|<big|sum><rsub|n\<in\><frac|1|M><Z>><big|sum><rsub|<around|(|l<rsub|1>,\<ldots\>,l<rsub|M-1>|)>\<in\><N><rsup|M>>\<Pi\><around|<left|(|2>|F<rsub|1><rsup|n<rsub|\<times\>>+n+d<rsup|-1><big|sum><rsub|i=1><rsup|M-1>l<rsub|i><mf|s><rsub|i><mf|w><rsub|i,1>>,\<ldots\>|<right|\<nobracket\>|2>>|<right|.>>|<right|\<nobracket\>|-1>>>>|<row|<cell|<around*|<left|.>|<around*|<left|.>|<around|<left|\<nobracket\>|2>|<space|1em>\<ldots\>,F<rsub|M><rsup|n<rsub|\<times\>>+n+d<rsup|-1><big|sum><rsub|i=1><rsup|M-1>l<rsub|i><mf|s><rsub|i><mf|w><rsub|i,M>>|<right|)|2>>|<right|\<\|\|\>|1>><rsub|<SO><rsub|0>>\<gtr\>C2<rsup|<frac|n<rsub|\<times\>>|<wide|p|\<bar\>><rsub|\<times\>>>>|)>>>>>>>>|<row|<cell|\<leq\><ltae|<tformat|<table|<row|<cell|<big|sum><rsub|n\<in\><frac|1|M><Z>><big|sum><rsub|<around|(|l<rsub|1>,\<ldots\>,l<rsub|M-1>|)>\<in\><N><rsup|M>><ltae|<tformat|<table|<row|<cell|\<mu\><rsub|\<times\>><around*|<left|(|2>|<around*|<left|\<\|\|\>|2>|\<Pi\><around|<left|(|2>|F<rsub|1><rsup|n<rsub|\<times\>>+n+d<rsup|-1><big|sum><rsub|i=1><rsup|M-1>l<rsub|i><mf|s><rsub|i><mf|w><rsub|i,1>>,\<ldots\>|<right|\<nobracket\>|2>>|<right|\<nobracket\>|2>>|<right|\<nobracket\>|2>>>>|<row|<cell|<space|2em><around*|<left|.>|<around*|<left|.>|<around|<left|\<nobracket\>|2>|\<ldots\>,F<rsub|M><rsup|n<rsub|\<times\>>+n+d<rsup|-1><big|sum><rsub|i=1><rsup|M-1>l<rsub|i><mf|s><rsub|i><mf|w><rsub|i,M>>|<right|)|2>>|<right|\<\|\|\>|1>><rsub|<SO><rsub|0>>\<gtr\>2<rsup|<frac|n<rsub|\<times\>>-\<varepsilon\><rprime|'><around*|\||n|\|>-\<varepsilon\><rprime|'><big|sum><rsub|i=1><rsup|M-1><around*|\||l<rsub|i>|\|>|<wide|p|\<bar\>><rsub|\<times\>>>>|)>.>>>>>>>>>>>>>>>>>>>>
    </equation*>

    Using the consequence of <eqref|eq:abstract-endpoint-holder> recorded
    above and that <math|<big|sum><rsub|j=1><rsup|M>p<rsub|j><rsub|><rsup|-1>=<wide|p|\<bar\>><rsub|\<times\>><rsup|-1>=<big|sum><rsub|j=1><rsup|M><wide|p|\<bar\>><rsub|j><rsub|><rsup|-1>>
    we obtain that

    <\equation*>
      <ltae|<tformat|<table|<row|<cell|\<mu\><rsub|\<times\>><around*|(|<around*|\<\|\|\>|\<Pi\><rsup|<wide|<mf|s>|\<vect\>>><around|(|F<rsub|1>,\<ldots\>,F<rsub|M>|)>|\<\|\|\>><rsub|<SO><rsub|\<times\>>>\<gtr\>C2<rsup|<frac|n<rsub|\<times\>>|<wide|p|\<bar\>><rsub|\<times\>>>>|)>>>|<row|<cell|<space|1em><ltae|<tformat|<table|<row|<cell|\<lesssim\><ltae|<tformat|<table|<row|<cell|<big|sum><rsub|n\<in\><frac|1|M><Z>><big|sum><rsub|<around|(|l<rsub|1>,\<ldots\>,l<rsub|M-1>|)>\<in\><N><rsup|M>>2<rsup|-<around*|(|1+<mf|s><rsub|\<times\>>\<varepsilon\>|)><around*|(|n<rsub|\<times\>>-\<varepsilon\><rprime|'><around*|\||n|\|>-\<varepsilon\><rprime|'><big|sum><rsub|i=1><rsup|M-1><around*|\||l<rsub|i>|\|>|)>>>>|<row|<cell|<space|1em>\<times\><big|prod><rsub|j=1><rsup|M><around*|(|\<mu\><rsub|i><around*|(|\<Delta\>A<rsup|n<rsub|\<times\>>+n+d<rsup|-1><big|sum><rsub|i=1><rsup|M-1>l<rsub|i><mf|s><rsub|i><mf|w><rsub|i,j>><rsub|j>|)><rsup|<frac|<wide|p|\<bar\>><rsub|\<times\>>|p<rsub|j>>>2<rsup|<around*|(|1+<mf|s><rsub|\<times\>>\<varepsilon\>|)><frac|<wide|p|\<bar\>><rsub|\<times\>>|<wide|p|\<bar\>><rsub|j>><around*|<left|(|-2>|n<rsub|\<times\>>+n+d<rsup|-1><big|sum><rsub|i=1><rsup|M-1>l<rsub|i><mf|s><rsub|i><mf|w><rsub|i,j>|<right|)|-2>>>|)>>>>>>>>|<row|<cell|\<lesssim\><ltae|<tformat|<table|<row|<cell|<big|sum><rsub|n\<in\><frac|1|M><Z>><big|sum><rsub|<around|(|l<rsub|1>,\<ldots\>,l<rsub|M-1>|)>\<in\><N><rsup|M>>2<rsup|<around*|(|1+<mf|s><rsub|\<times\>>\<varepsilon\>|)>\<varepsilon\><rprime|'><around*|(|<around*|\||n|\|>+<big|sum><rsub|i=1><rsup|M-1><around*|\||l<rsub|i>|\|>|)>>>>|<row|<cell|<space|1em>\<times\>2<rsup|<mf|s><rsub|\<times\>>\<varepsilon\>n>2<rsup|<mf|s><rsub|\<times\>>\<varepsilon\>d<rsup|-1><big|sum><rsub|j=1><rsup|M><frac|<wide|p|\<bar\>><rsub|\<times\>>|<wide|p|\<bar\>><rsub|j>><big|sum><rsub|i=1><rsup|M-1>l<rsub|i><mf|s><rsub|i><mf|w><rsub|i,j>>2<rsup|<around*|(|1+<mf|s><rsub|\<times\>>\<varepsilon\>|)><frac|<wide|p|\<bar\>><rsub|\<times\>>|d><big|sum><rsub|j=1><rsup|M><around*|(|<wide|p|\<bar\>><rsub|j><rsup|-1>-p<rsub|j><rsup|-1>|)><big|sum><rsub|i=1><rsup|M-1>l<rsub|i><mf|s><rsub|i><mf|w><rsub|i,j>>>>|<row|<cell|<space|1em>\<times\><big|prod><rsub|j=1><rsup|M><around*|(|\<mu\><rsub|i><around*|(|\<Delta\>A<rsup|n<rsub|\<times\>>+n+d<rsup|-1><big|sum><rsub|i=1><rsup|M-1>l<rsub|i><mf|s><rsub|i><mf|w><rsub|i,j>><rsub|j>|)><rsup|<frac|<wide|p|\<bar\>><rsub|\<times\>>|p<rsub|j>>>2<rsup|<frac|<wide|p|\<bar\>><rsub|\<times\>>|p<rsub|j>><around*|(|n+d<rsup|-1><big|sum><rsub|i=1><rsup|M-1>l<rsub|i><mf|s><rsub|i><mf|w><rsub|i,j>|)>>|)>.>>>>>>>>>>>>>>>
    </equation*>

    Choosing <math|<mf|s><rsub|\<times\>>=+1> when <math|n\<geq\>0> and
    <math|<mf|s><rsub|\<times\>>=-1> otherwise, choosing
    <math|\<varepsilon\>\<gtr\>0> small enough so that <math|>

    <\equation*>
      \<varepsilon\><around*|<left|(|-3>|2+d<rsup|-1><around*|<left|(|-3>|max<rsub|i\<in\><around*|{|1,\<ldots\>,M-1|}>><big|sum><rsub|j=1><rsup|M><frac|<wide|p|\<bar\>><rsub|\<times\>>|<wide|p|\<bar\>><rsub|j>><around*|\||<mf|w><rsub|i,j>|\|>|<right|)|-3>>|<right|)|-3>>\<leq\><around*|(|1-\<varepsilon\>|)><frac|<wide|p|\<bar\>><rsub|\<times\>>|d>min<rsub|i\<in\><around*|{|1,\<ldots\>,M-1|}>><around*|<left|\||-2>|<big|sum><rsub|j=1><rsup|M><around*|(|<wide|p|\<bar\>><rsub|j><rsup|-1>-p<rsub|j><rsup|-1>|)><mf|w><rsub|i,j>|<right|\||-2>>
    </equation*>

    and <math|\<varepsilon\><rprime|'>\<less\><frac|\<varepsilon\>|4>> small
    enough we get that

    <\equation*>
      <tabular|<tformat|<table|<row|<cell|\<mu\><rsub|\<times\>><around*|(|<around*|\<\|\|\>|\<Pi\><rsup|<wide|<mf|s>|\<vect\>>><around|(|F<rsub|1>,\<ldots\>,F<rsub|M>|)>|\<\|\|\>><rsub|<SO><rsub|\<times\>>>\<gtr\>C2<rsup|<frac|n<rsub|\<times\>>|<wide|p|\<bar\>><rsub|\<times\>>>>|)>>>|<row|<cell|<space|1em>\<lesssim\><ltae|<tformat|<table|<row|<cell|<big|sum><rsub|n\<in\><frac|1|M><Z>><big|sum><rsub|<around|(|l<rsub|1>,\<ldots\>,l<rsub|M-1>|)>\<in\><N><rsup|M>>2<rsup|-\<varepsilon\><around*|(|<around*|\||n|\|>+<big|sum><rsub|i=1><rsup|M-1><around*|\||l<rsub|i>|\|>|)>/2>>>|<row|<cell|<space|1em>\<times\><big|prod><rsub|j=1><rsup|M><around*|(|\<mu\><rsub|i><around*|(|\<Delta\>A<rsup|n<rsub|\<times\>>+n+d<rsup|-1><big|sum><rsub|i=1><rsup|M-1>l<rsub|i><mf|s><rsub|i><mf|w><rsub|i,j>><rsub|j>|)><rsup|<frac|<wide|p|\<bar\>><rsub|\<times\>>|p<rsub|j>>>2<rsup|<frac|<wide|p|\<bar\>><rsub|\<times\>>|p<rsub|j>><around*|(|n+d<rsup|-1><big|sum><rsub|i=1><rsup|M-1>l<rsub|i><mf|s><rsub|i><mf|w><rsub|i,j>|)>>|)>>>>>>>>>>>
    </equation*>

    Multiplying by <math|2<rsup|n<rsub|\<times\>>>>, summing in
    <math|n<rsub|\<times\>>\<in\><frac|1|M><N>>, and applying Hölder's
    inequality we get that\ 

    <\equation*>
      <ltae|<tformat|<table|<row|<cell|<big|sum><rsub|n<rsub|\<times\>>\<in\><frac|1|M><N>>2<rsup|n<rsub|\<times\>>><rsup|>\<mu\><rsub|\<times\>><around*|(|<around*|\<\|\|\>|\<Pi\><rsup|<wide|<mf|s>|\<vect\>>><around|(|F<rsub|1>,\<ldots\>,F<rsub|M>|)>|\<\|\|\>><rsub|<SO><rsub|\<times\>>>\<gtr\>C2<rsup|<frac|n|<wide|p|\<bar\>><rsub|\<times\>>>>|)>>>|<row|<cell|<space|1em><ltae|<tformat|<table|<row|<cell|\<lesssim\><ltae|<tformat|<table|<row|<cell|<big|sum><rsub|n\<in\><frac|1|M><Z>><big|sum><rsub|<around|(|l<rsub|1>,\<ldots\>,l<rsub|M-1>|)>\<in\><N><rsup|M>>2<rsup|-\<varepsilon\><around*|(|<around*|\||n|\|>+<big|sum><rsub|i=1><rsup|M-1><around*|\||l<rsub|i>|\|>|)>/2>>>|<row|<cell|<space|1em>\<times\><big|sum><rsub|n<rsub|\<times\>>\<in\><frac|1|M><N>><big|prod><rsub|i=1><rsup|M><ltae|<tformat|<table|<row|<cell|<around*|(|\<mu\><rsub|j><around*|(|\<Delta\>A<rsup|n<rsub|\<times\>>+n+d<rsup|-1><big|sum><rsub|i=1><rsup|M-1>l<rsub|i><mf|s><rsub|i><mf|w><rsub|i,j>><rsub|j>|)><rsup|<frac|<wide|p|\<bar\>><rsub|\<times\>>|p<rsub|j>>>|\<nobracket\>>>>|<row|<cell|<around*|<left|\<nobracket\>|2>|<space|1em>\<times\>2<rsup|<frac|<wide|p|\<bar\>><rsub|\<times\>>|p<rsub|j>><around*|<left|(|-2>|n<rsub|\<times\>>+n+d<rsup|-1><big|sum><rsub|i=1><rsup|M-1>l<rsub|i><mf|s><rsub|i><mf|w><rsub|i,j>|<right|)|-2>>>|<right|)|2>>>>>>>>>>>>>>|<row|<cell|\<lesssim\><ltae|<tformat|<table|<row|<cell|<big|sum><rsub|n\<in\><frac|1|M><Z>><big|sum><rsub|<around|(|l<rsub|1>,\<ldots\>,l<rsub|M-1>|)>\<in\><N><rsup|M>>2<rsup|-\<varepsilon\><around*|(|<around*|\||n|\|>+<big|sum><rsub|i=1><rsup|M-1><around*|\||l<rsub|i>|\|>|)>/2>>>|<row|<cell|<space|1em>\<times\><big|prod><rsub|j=1><rsup|M><around*|(|<big|sum><rsub|n<rsub|\<times\>>\<in\><frac|1|M><N>>\<mu\><rsub|j><around*|(|\<Delta\>A<rsup|n<rsub|\<times\>>+n+d<rsup|-1><big|sum><rsub|i=1><rsup|M-1>l<rsub|i><mf|s><rsub|i><mf|w><rsub|i,j>><rsub|j>|)>2<rsup|n<rsub|\<times\>>+n+d<rsup|-1><big|sum><rsub|i=1><rsup|M-1>l<rsub|i><mf|s><rsub|i><mf|w><rsub|i,j>><rsup|><rsup|>|)><rsup|<frac|p<rsub|\<times\>>|p<rsub|j>>>>>>>>>>|<row|<cell|\<lesssim\><big|sum><rsub|n\<in\><frac|1|M><Z>><big|sum><rsub|<around|(|l<rsub|1>,\<ldots\>,l<rsub|M-1>|)>\<in\><N><rsup|M>>2<rsup|-\<varepsilon\><around*|(|<around*|\||n|\|>+<big|sum><rsub|i=1><rsup|M-1><around*|\||l<rsub|i>|\|>|)>/2>\<lesssim\>1>>>>>>>>>>
    </equation*>

    as required.\ 
  </proof>

  As a result, we deduce the outer Hölder inequality used extensively in the
  context of outer Lebesgue spaces; variants include
  <cite-detail|amentaBilinearHilbertTransform2020|Proposition 2.34> and
  <cite-detail|doTheoryOuterMeasures2015|Proposition 3.4>.\ 

  <\corollary>
    <label|cor:outer-holder-classical><dueto|Hölder inequality for outer
    Lebesgue spaces>Let <math|<around|(|<XO><rsub|j>,<BO><rsub|j><rsup|\<cup\>>,\<mu\><rsub|j>,<SO><rsub|j>|)>>,
    <math|j\<in\><around|{|\<times\>,1,\<ldots\>,M|}>>, be outer spaces and
    let \ <math|\<Pi\>:<big|prod><rsub|j=1><rsup|M>L<rsup|\<infty\>><rsub|\<mu\><rsub|j>><SO><rsub|j>\<to\>L<rsup|\<infty\>><rsub|\<mu\><rsub|\<times\>>><SO><rsub|j>>
    be an <math|M>-linear map such that for all
    <math|F<rsub|j>\<in\>L<rsup|\<infty\>><rsub|\<mu\><rsub|j>><SO><rsub|j>>
    it holds that\ 

    <\equation>
      <label|eq:abstract-size-holder><around|\<\|\|\>|\<Pi\><around|(|F<rsub|1>,\<ldots\>,F<rsub|M>|)>|\<\|\|\>><rsub|<SO><rsub|\<times\>>>\<leq\>C<rsub|\<infty\>><big|prod><rsub|j=1><rsup|M><around|\<\|\|\>|F<rsub|j>|\<\|\|\>><rsub|<SO><rsub|j>>
    </equation>

    and

    <\equation>
      <label|eq:abstract-measure-holder>\<mu\><rsub|0><around|(|<around*|\<\|\|\>|\<Pi\><around|(|F<rsub|1>,\<ldots\>,F<rsub|M>|)>|\<\|\|\>><rsub|<SO><rsub|\<times\>>>\<gtr\>0|)>\<leq\>
      min<rsub|j=1,\<ldots\>,M> \<mu\><rsub|j><around|<left|(|1>|<around*|\<\|\|\>|F<rsub|j>|\<\|\|\>><rsub|<SO><rsub|j>>\<gtr\>0|<right|)|1>>.
    </equation>

    Then for all <math|<wide|p|\<vect\>>=<around*|(|p<rsub|1>,\<ldots\>,p<rsub|M>|)>\<in\><around|(|0,1|]><rsup|M>>
    it holds that

    <\equation>
      <label|eq:abstract-Lp-holder><around|\<\|\|\>|\<Pi\><around|(|F<rsub|1>,\<ldots\>,F<rsub|M>|)>|\<\|\|\>><rsub|L<rsub|\<mu\><rsub|\<times\>>><rsup|p<rsub|\<times\>>><SO><rsub|0>>\<lesssim\><rsub|p<rsub|j>>C<big|prod><rsub|j=1><rsup|M><around|\<\|\|\>|F<rsub|j>|\<\|\|\>><rsub|L<rsub|\<mu\><rsub|j>><rsup|p<rsub|j>><SO><rsub|j>>
    </equation>

    with <math|p<rsub|\<times\>><rsup|-1><eqd><big|sum><rsub|j=1><rsup|M>p<rsub|j><rsup|-1>>.
  </corollary>

  <\proof>
    The claim above follows by noticing that\ 

    <\equation*>
      <around|<left|\<\|\|\>|2>|\<Pi\><around|(|F<rsub|1>,\<ldots\>,F<rsub|M>|)>|<right|\<\|\|\>|2>><rsub|L<rsub|\<mu\><rsub|\<times\>>><rsup|p<rsub|\<times\>>><SO><rsub|\<times\>>><ltae|<tformat|<cwith|2|2|1|1|cell-halign|l>|<table|<row|<cell|\<leq\>\<mu\><rsub|0><around*|(|<around*|\<\|\|\>|\<Pi\><around|(|F<rsub|1>,\<ldots\>,F<rsub|M>|)>|\<\|\|\>><rsub|<SO><rsub|\<times\>>>\<gtr\>0|)><rsup|<frac|1|p<rsub|\<times\>>>><around|<left|\<\|\|\>|2>|\<Pi\><around|(|F<rsub|1>,\<ldots\>,F<rsub|M>|)>|<right|\<\|\|\>|2>><rsub|L<rsub|\<mu\><rsub|\<times\>>><rsup|\<infty\>><SO><rsub|\<times\>>>>>|<row|<cell|\<leq\><big|prod><rsub|j=1><rsup|M>\<mu\><rsub|j><around|(|<around*|\<\|\|\>|F<rsub|j>|\<\|\|\>><rsub|<SO><rsub|j>>\<gtr\>0|)><rsup|<frac|1|p<rsub|j>>><around|\<\|\|\>|F<rsub|j>|\<\|\|\>><rsub|<SO><rsub|j>>>>>>>
    </equation*>

    and applying <smart-ref|prop:outer-restricted-interpolation>.
  </proof>

  The next statement is usually referred to as outer Radon-Nykodim (see
  <cite-detail|amentaBilinearHilbertTransform2020|Proposition 2.33>,
  <cite-detail|amentaBanachvaluedModulationInvariant2020|Corollary 4.13>,
  <cite-detail|uraltsevVariationalCarlesonEmbeddings2016|Lemma 2.2>); we
  merely sketch its proof. This result allows one to compare classical
  integrals with <math|L<rsup|1>>-type outer Lebesgue quasi-norms. For
  example, this is the case of bound <eqref|eq:RN-domination-BHT> where
  <LHS|<eqref|eq:RN-domination-BHT>> is an integral over the space
  <math|<R><rsup|3><rsub|+>> that describes the dual form to
  <math|<BHT><rsub|\<beta\>>> in terms of embedded functions while
  <RHS|<eqref|eq:RN-domination-BHT>> is an outer Lebesgue norm of the product
  of the embedded functions.

  <\proposition>
    <label|prop:outer-RN><dueto|Radon-Nykodim -type domination>Let
    <math|<around|(|<XO>,<BO><rsup|\<cup\>>,\<mu\>,<SO>|)>> be an outer space
    and let <math|<mf|m>> be a Radon measure on <math|<XO>> and let
    <math|\<phi\><rsub|1>,\<ldots\>,\<phi\><rsub|k>\<in\>\<Phi\><rsub|<gr>><rsup|\<infty\>>>.
    If the bound

    <\equation*>
      <mid|\|><big|int><rsub|B>F<around|(|x|)><around*|[|\<phi\><rsub|1>,\<ldots\>,\<phi\><rsub|k>|]><dd|<mf|m><around|(|x|)>><mf|m><around*|(|x|)><mid|\|>\<leq\>C<rsub|<mf|m>>\<mu\><around|(|B|)><around|\<\|\|\>|<1><rsub|B>F|\<\|\|\>><rsub|<SO>><space|2em>\<forall\>B\<in\><BO>,<space|0.17em>\<forall\>F\<in\>L<rsup|1><rsub|<dd><mf|m>><around|(|E|)>\<otimes\><rsup|k>\<Phi\><rsub|<gr>><rsup|N><rprime|'>
    </equation*>

    holds with some constant <math|C<rsub|<mf|m>>\<gtr\>0>, and the measure
    <math|<mf|m>> is absolutely continuous w.r.t to <math|\<mu\>> i.e.

    <\equation*>
      \<mu\><around|(|A|)>=0<space|0.17em>\<Rightarrow\><mf|m><around|(|A|)>=0<space|2em>\<forall\>A\<in\><Bor><around|(|<XO>|)>,
    </equation*>

    then it holds that\ 

    <\equation*>
      <around*|\||<big|int><rsub|<XO>>F<around|(|x|)><around*|[|\<phi\><rsub|1>,\<ldots\>,\<phi\><rsub|k>|]><space|0.17em><dd|<mf|m><around|(|x|)>><mf|m><around*|(|x|)>|\|>\<lesssim\>C<rsub|<mf|m>><around|\<\|\|\>|F|\<\|\|\>><rsub|L<rsup|1><rsub|\<mu\>><SO>><space|2em>\<forall\>F\<in\>L<rsup|1><rsub|<dd><mf|m>><around|(|E|)>\<otimes\><rsup|k>\<Phi\><rsub|<gr>><rsup|N><rprime|'>.
    </equation*>
  </proposition>

  <\proof>
    If <math|<around|\<\|\|\>|F|\<\|\|\>><rsub|L<rsup|1><rsub|\<mu\>><SO>>\<leq\>1>
    and <math|F\<in\>L<rsup|1><rsub|<dd><mf|m>><around|(|E|)>\<otimes\><rsup|k>\<Phi\><rsub|<gr>><rsup|N><rprime|'>>
    we enact the atomic decomposition of <math|F> as per
    <smart-ref|prop:atomic-decomposition> to obtain

    <\equation*>
      F=<big|sum><rsub|k\<in\><Z>>F<rsub|k>
    </equation*>

    with <math|F<rsub|k>> supported on disjoint sets and satisfying

    <\equation*>
      <big|sum><rsub|k\<in\><Z>>\<mu\><around*|(|<around*|\<\|\|\>|F<rsub|k>|\<\|\|\>><rsub|<SO>>\<gtr\>0|)><around*|\<\|\|\>|F<rsub|k>|\<\|\|\>><rsub|<SO>>\<lesssim\><around|\<\|\|\>|F|\<\|\|\>><rsub|L<rsup|1><rsub|\<mu\>><SO>>.
    </equation*>

    It holds that

    <\equation*>
      <around*|\||<big|int><rsub|<XO>>F<around|(|x|)><around*|[|\<phi\><rsub|1>,\<ldots\>,\<phi\><rsub|k>|]><space|0.17em><dd|<mf|m><around|(|x|)>><mf|m><around*|(|x|)>|\|><ltae|<tformat|<table|<row|<cell|\<leq\><big|sum><rsub|k\<in\><Z>><around*|\||<big|int><rsub|<XO>>F<rsub|k><around|(|x|)><around*|[|\<phi\><rsub|1>,\<ldots\>,\<phi\><rsub|k>|]><dd|<mf|m><around|(|x|)>><mf|m><around*|(|x|)>|\|>>>|<row|<cell|\<leq\>C<rsub|<mf|m>><big|sum><rsub|k\<in\><Z>>\<mu\><around*|(|<around*|\<\|\|\>|F<rsub|k>|\<\|\|\>><rsub|<SO>>\<gtr\>0|)><around*|\<\|\|\>|F<rsub|k>|\<\|\|\>><rsub|<SO>>\<lesssim\>C<rsub|<mf|m>><around|\<\|\|\>|F|\<\|\|\>><rsub|L<rsup|1><rsub|\<mu\>><SO>>,>>>>>
    </equation*>

    as required, as long as we show that\ 

    <\equation*>
      <around*|\||<big|int><rsub|<XO>>F<rsub|k><around|(|x|)><around*|[|\<phi\><rsub|1>,\<ldots\>,\<phi\><rsub|k>|]><dd|<mf|m><around|(|x|)>><mf|m><around*|(|x|)>|\|>\<leq\>C<rsub|<mf|m>>\<mu\><around*|(|<around*|\<\|\|\>|F<rsub|k>|\<\|\|\>><rsub|<SO>>\<gtr\>0|)><around*|\<\|\|\>|F<rsub|k>|\<\|\|\>><rsub|<SO>>.
    </equation*>

    The assumptions on <math|\<mu\>>, <math|<mf|m>>, and on the integrability
    of <math|F> justify the convergence of the series.\ 

    To prove the claimed bound on <math|F<rsub|k>> we choose
    <math|E<rsub|k>\<in\><BO><rsup|\<cup\>>> such that
    <math|<1><rsub|<XO>\<setminus\>E<rsub|k>>F<rsub|k>=0> and
    <math|\<mu\><around*|(|E<rsub|k>|)>\<approx\>\<mu\><around*|(|<around*|\<\|\|\>|F<rsub|k>|\<\|\|\>><rsub|<SO>>\<gtr\>0|)>>.
    We then cover <math|E<rsub|k>> optimally with sets from <math|<BO>> by
    selecting <math|B<rsub|k,n>\<in\><BO>> such that
    \ <math|E<rsub|k>\<subset\><big|cup><rsub|n\<in\><N>>B<rsub|k,n>> with
    <math|<big|sum><rsub|n\<in\><N>>\<mu\><around*|(|B<rsub|k,n>|)>\<lesssim\>\<mu\><around*|(|E<rsub|k>|)>>.
    \ It holds that\ 

    <\equation*>
      <around*|\||<big|int><rsub|<XO>>F<rsub|k><around|(|x|)><around*|[|\<phi\><rsub|1>,\<ldots\>,\<phi\><rsub|k>|]><dd|<mf|m><around|(|x|)>><mf|m><around*|(|x|)>|\|><ltae|<tformat|<cwith|2|2|1|1|cell-halign|l>|<table|<row|<cell|\<leq\><big|sum><rsub|n\<in\><N>><around*|\||<big|int><rsub|\<Delta\>B<rsub|k,n>>F<rsub|k><around|(|x|)><around*|[|\<phi\><rsub|1>,\<ldots\>,\<phi\><rsub|k>|]><dd|<mf|m><around|(|x|)>><mf|m><around*|(|x|)>|\|>>>|<row|<cell|\<lesssim\>C<rsub|<mf|m>><big|sum><rsub|n\<in\><N>>\<mu\><around*|(|\<Delta\>B<rsub|k,n>|)><around*|\<\|\|\>|<1><rsub|\<Delta\>B<rsub|k,n>>F<rsub|k>|\<\|\|\>><rsub|<SO>>\<lesssim\>\<mu\><around*|(|<around*|\<\|\|\>|F<rsub|k>|\<\|\|\>><rsub|<SO>>\<gtr\>0|)><around*|\<\|\|\>|F<rsub|k>|\<\|\|\>><rsub|<SO>>.>>>>>
    </equation*>

    We used the monotonicity property <eqref|eq:size-monotonicity> in the
    above inequalities, and <eqref|eq:measure-recovery> to find the sets
    <math|B<rsub|k,n>\<in\><BO>>. This concludes the proof.
  </proof>

  <subsection|The time-frequency-scale space<label|sec:time-frequency-outer-lebesgue>>

  In this section we discuss the outer Lebesgue space structure on the
  time-scale-frequency space <math|<R><rsup|3><rsub|+>>. First, we introduce
  trees: distinguished subsets of <math|<R><rsup|3><rsub|+>> that represent
  frequency and space -localized portions of <math|<R><rsup|3><rsub|+>>.
  Next, we introduce the sizes \U quasi-norms that represent the magnitude of
  functions on trees. We present these notions succinctly to allow for
  efficient consultation and we postpone discussing the motivation to the end
  of each subsection.\ 

  <subsubsection|The <math|\<sigma\>>-generating collection: trees>

  Trees are distinguished subsets of <math|<R><rsup|3><rsub|+>> that describe
  the local geometry of the time-scale-frequency space and are used to define
  the <math|\<sigma\>>-generating collection for the outer measures
  <math|\<mu\><rsub|\<Theta\>><rsup|<mf|p>>>,
  <math|<mf|p>\<in\><around*|{|1,\<infty\>|}>>.

  <\definition>
    <label|def:tree><dueto|Trees>We define a tree
    <math|T<rsub|\<Theta\>><around|(|\<xi\><rsub|T>,x<rsub|T>,s<rsub|T>|)>>
    with top <math|<around|(|\<xi\><rsub|T>,x<rsub|T>,s<rsub|T>|)>\<in\><R><rsup|3><rsub|+>>
    as the subset of <math|<R><rsup|3><rsub|+>> given by\ 

    <\equation>
      <label|eq:def:tree><ltae|<tformat|<cwith|1|-1|1|1|cell-halign|l>|<cwith|1|1|1|1|cell-halign|l>|<table|<row|<cell|T<rsub|\<Theta\>><around|(|\<xi\><rsub|T>,x<rsub|T>,s<rsub|T>|)><eqd>\<pi\><rsub|<around|(|\<xi\><rsub|T>,x<rsub|T>,s<rsub|T>|)>><around|(|<mT><rsub|\<Theta\>>|)>,>>|<row|<cell|<mT><rsub|\<Theta\>><eqd><around*|<left|{|2>|<around|(|\<theta\>,\<zeta\>,\<sigma\>|)>\<in\>\<Theta\>\<times\>B<rsub|1>\<times\><around|(|0,1|)><st>\<sigma\>\<less\>1-<around|\||\<zeta\>|\|>|<right|}|2>>,>>|<row|<cell|\<pi\><rsub|<around|(|\<xi\>,x,s|)>><around|(|\<theta\>,\<zeta\>,\<sigma\>|)><eqd><around*|(|\<xi\>+\<theta\><around|(|s
      \<sigma\>|)><rsup|-1>,x+s \<zeta\>,s \<sigma\>|)>.>>>>>
    </equation>

    The set <math|\<Theta\>\<subset\><R>> can be any Borel set, but mostly we
    will assume it to be an open interval
    <math|\<Theta\>\<supset\>B<rsub|4>>.
  </definition>

  <assign|TT|<macro|<mbb|T>>>We denote by <math|\<bbb-T\><rsub|\<Theta\>>>
  and <math|<TT><rsub|\<Theta\>><rsup|\<cup\>>> the collection of all trees
  <math|T=T<rsub|\<Theta\>><around|(|\<xi\><rsub|T>,x<rsub|T>,s<rsub|T>|)>>
  and countable unions thereof, respectively. We refer to the latter as
  <with|font-shape|italic|forests>

  <\definition>
    <label|def:forest-outer-measure><dueto|Forest outer measure>We define the
    counting function of a countable collection of trees
    <math|<mc|T>\<subset\>\<bbb-T\><rsub|\<Theta\>>> as

    <\equation>
      <label|eq:def:counting-function><ltae|<tformat|<cwith|1|-1|1|1|cell-rborder|0ln>|<table|<row|<cell|N<rsub|<mc|T>><around|(|z|)><eqd><big|sum><rsub|T\<in\><mc|T>><1><rsub|B<rsub|s<rsub|T>><around|(|x<rsub|T>|)>><around|(|z|)>.>>>>>
    </equation>

    The outer measures <math|\<mu\><rsub|\<Theta\>><rsup|<mf|p>>> of a set
    <math|E\<subset\><R><rsup|3><rsub|+>> is given by

    <\equation>
      <label|eq:def:mu>\<mu\><rsub|\<Theta\>><rsup|<mf|p>><around|(|E|)><eqd>inf
      <around*|<left|{|-2>|<around|\<\|\|\>|N<rsub|<mc|T>><around|(|z|)>|\<\|\|\>><rsub|L<rsup|<mf|p>><rsub|<dd>z><around|(|<R>|)>><st><mc|T>\<subset\><TT><rsub|\<Theta\>>,<space|0.27em>E\<subset\><big|cup><rsub|T\<in\><mc|T>>T|<right|}|-2>>,<space|2em><mf|p>\<in\><around*|{|1,\<infty\>|}>,
    </equation>

    i.e. by the <math|L<rsup|p>> norm of the counting function of an
    \Poptimal\Q covering by trees. When <math|<mf|p>=1> the collection of
    trees <math|<TT><rsub|\<Theta\>>> is a generating collection (cfr.
    <eqref|eq:measure-recovery>) for <math|\<mu\><rsup|1><rsub|\<Theta\>>>
    with

    <\equation*>
      \<mu\><rsup|1><rsub|\<Theta\>><around*|(|T<rsub|\<Theta\>><around|(|\<xi\><rsub|T>,x<rsub|T>,s<rsub|T>|)>|)><eqd>2s<rsub|T>.
    </equation*>

    When <math|<mf|p>=\<infty\>> this is no longer the case since
    <eqref|eq:measure-recovery> may fail to hold. Countable unions of trees
    <math|<TT><rsup|\<cup\>><rsub|\<Theta\>>>, though, are a generating
    collection for <math|\<mu\><rsub|\<Theta\>><rsup|<mf|p>>>,
    <math|<mf|p>\<in\><around*|{|1,\<infty\>|}>>.
  </definition>

  There is a one-to-one correspondence between the datum <math|\<Theta\>>,
  <math|<around|(|\<xi\><rsub|T>,x<rsub|T>,s<rsub|T>|)>> and a tree <math|T>.
  Given a tree <math|T>, we call <math|<mT><rsub|\<Theta\>>> its model tree,
  <math|\<Theta\>> is its model frequency band, <math|\<xi\><rsub|T>> is the
  tree's frequency, <math|B<rsub|s<rsub|T>><around|(|x<rsub|T>|)>> is its
  spatial interval, <math|\<xi\><rsub|T>+s<rsub|T><rsup|-1>\<Theta\>> is its
  frequency band, and <math|\<pi\><rsub|T><eqd>\<pi\><rsub|<around|(|\<xi\><rsub|T>,x<rsub|T>,s<rsub|T>|)>>>
  is its local coordinate map.\ 

  Trees are time-frequency -localized regioins of
  <math|<R><rsup|3><rsub|+>\<suchthat\>> if
  <math|<around*|(|\<eta\>,y,t|)>\<in\>T<rsub|\<Theta\>><around*|(|\<xi\><rsub|T>,x<rsub|T>,s<rsub|T>|)>>
  then <math|<Tr><rsub|y><Mod><rsub|\<eta\>><Dil><rsub|t>\<phi\><around|(|z|)>>
  decays away from <math|B<rsub|s<rsub|T>><around*|(|x<rsub|T>|)>>:

  <\equation*>
    <around*|\||<Tr><rsub|y><Mod><rsub|\<eta\>><Dil><rsub|t>\<phi\><around|(|z|)>|\|>\<lesssim\><around*|\<langle\>|<frac|z-x<rsub|T>|s<rsub|T>>|\<rangle\>><rsup|-N><around*|\<\|\|\>|\<phi\>|\<\|\|\>><rsub|\<Phi\><rsup|N><rsub|<gr>>>.
  </equation*>

  On the Fourier side, for any <math|<around*|(|\<eta\>,y,t|)>\<in\>T<rsub|\<Theta\>><around*|(|\<xi\><rsub|T>,x<rsub|T>,s<rsub|T>|)>>
  we have that

  <\equation*>
    <dist><around*|(|<spt><around*|(|<FT|<Tr><rsub|y><Mod><rsub|\<eta\>><Dil><rsub|t>\<phi\>>|)>,\<xi\><rsub|T>|)>\<lesssim\><diam><around*|(|<spt><around*|(|<FT|<Tr><rsub|y><Mod><rsub|\<eta\>><Dil><rsub|t>\<phi\>>|)>|)>\<approx\>t<rsup|-1>.
  </equation*>

  Trees, however, are not scale-localized e.g. if
  <math|<around*|(|\<eta\>,y,t|)>\<in\>T<rsub|\<Theta\>><around*|(|\<xi\><rsub|T>,x<rsub|T>,s<rsub|T>|)>>
  then <math|<around*|(|\<eta\>,y,t<rprime|'>|)>\<in\>T<rsub|\<Theta\>><around*|(|\<xi\><rsub|T>,x<rsub|T>,s<rsub|T>|)>>
  for all <math|t<rprime|'>\<less\>t>.\ 

  Trees respects the symmetry property of the map <math|f\<mapsto\><Emb>
  <around*|[|f|]>>. First of all, any tree
  <math|T<rsub|\<Theta\>><around*|(|\<xi\><rsub|T>,x<rsub|T>,s<rsub|T>|)>>
  can be obtained from <math|T<rsub|\<Theta\>><around*|(|0,0,1|)>> via

  <\equation>
    <label|eq:tree-symmetry>T<rsub|\<Theta\>><around*|(|\<xi\><rsub|T>,x<rsub|T>,s<rsub|T>|)>=<around*|<left|{|2>|<around*|(|\<xi\><rsub|T>+s<rsub|T><rsup|-1>\<eta\>,x<rsub|T>+s<rsub|T>y,s<rsub|T>t|)>\<suchthat\><around*|(|\<eta\>,y,t|)>\<in\>T<rsub|\<Theta\>><around*|(|0,0,1|)>|<right|}|2>>.
  </equation>

  More in detail, given any <math|T\<in\><TT><rsub|\<Theta\>>> it follows
  from <eqref|eq:embedding> that

  <\equation>
    <label|eq:emb-symmetry><ltae|<tformat|<cwith|1|1|1|1|cell-halign|l>|<table|<row|<cell|<Emb><around*|[|f|]><around*|(|\<eta\>,
    y,t|)><around*|[|\<phi\>|]>=e<rsup|2 \<pi\>
    i\<xi\><rsub|T><around*|(|y-x<rsub|T>|)>><Emb><around*|[|f<rsub|T>|]><around|<left|(|2>|s<around*|(|\<eta\>-\<xi\><rsub|T>|)>,<frac|y-x<rsub|T>|s<rsub|T>>,<frac|t|s<rsub|T>>|<right|)|2>><around*|[|\<phi\>|]>>>>>>
  </equation>

  and that\ 

  <\equation>
    <label|eq:piT-symmetry><Emb><around*|[|f|]>\<circ\>\<pi\><rsub|T><around|(|\<theta\>,\<zeta\>,\<sigma\>|)>=e<rsup|2
    \<pi\> i\<xi\><rsub|T>s<rsub|T>\<zeta\>><Emb><around*|[|f<rsub|T>|]>\<circ\>\<pi\><rsub|<around*|(|0,0,1|)>><around*|(|\<theta\>,\<zeta\>,\<sigma\>|)>,
  </equation>

  where <math|f<rsub|T><eqd>s<rsub|T><Dil><rsub|s<rsub|T><rsup|-1>><Mod><rsub|-\<xi\><rsub|T>><Tr><rsub|-x<rsub|T>>f>.

  <subsubsection|Sizes<label|sec:sizes>>

  The second ingredient of an outer Lebesgue space are sizes. We first
  introduce <with|font-shape|italic|local sizes> that measure how \Plarge\Q a
  function is on any fixed tree <math|T\<in\><TT><rsub|\<Theta\>>>. Formally,
  a <with|font-shape|italic|local size> is a collection
  <math|<around*|<left|(|1>|<SO><around*|(|T|)>|<right|)|1>><rsub|T\<in\><TT><rsub|\<Theta\>>>>
  indexed by <math|T\<in\><TT><rsub|\<Theta\>>> of quasi-norms on
  <math|<Rad><around*|(|T|)>\<otimes\><rsup|k>\<Phi\><rsub|<mf|r>><rsup|\<infty\>><rprime|'>>
  with be uniform quasi-triangle constants in <eqref|eq:size-triangle> i.e.
  for some <math|<mrm|Tri><rsub|<SO>>\<gtr\>0> it holds that

  <\equation*>
    <around*|\<\|\|\>|F<rsub|1>+F<rsub|2>|\<\|\|\>><rsub|<SO><around*|(|T|)>>\<leq\>Tri<rsub|<SO>><around*|(|<around*|\<\|\|\>|F<rsub|1>|\<\|\|\>><rsub|<SO><around*|(|T|)>>+<around*|\<\|\|\>|F<rsub|2>|\<\|\|\>><rsub|<SO><around*|(|T|)>>|)><space|2em>\<forall\>T\<in\><TT><rsub|\<Theta\>>,<space|0.6spc>
    \<forall\>F<rsub|1>,F<rsub|2> \<in\><Rad><around*|(|T|)>\<otimes\><rsup|k>\<Phi\><rsub|<mf|r>><rsup|\<infty\>><rprime|'>.
  </equation*>

  The size associated to local size is given by

  <\equation>
    <label|eq:generated-size:trees><around|\<\|\|\>|F|\<\|\|\>><rsub|<SO>><eqd>sup<rsub|T\<in\><TT><rsub|\<Theta\>>>sup<rsub|W<rsup|->\<in\><TT><rsup|\<cup\>><rsub|\<Theta\>>>
    <around|\<\|\|\>|<1><rsub|<R><rsup|3><rsub|+>\<setminus\>W<rsup|->>F|\<\|\|\>><rsub|<SO><around*|(|T|)>>
  </equation>

  where we identify <math|<1><rsub|<R><rsup|3><rsub|+>\<setminus\>W<rsup|->>F>
  with its restriction to <math|T>. The upper bound over
  <math|W<rsup|->\<in\><TT><rsup|\<cup\>><rsub|\<Theta\>>> guarantees the
  monotonicity property <smart-ref|eq:size-monotonicity>.

  Below we introduce several (local) sizes that, combined, constitute the
  size <math|<SF><rsup|u><rsub|\<Theta\>>\<Phi\><rsub|<gr>><rsup|N>> in
  <smart-ref|eq:non-uniform-embedding-full-size>. The sizes below may depend
  on the datum <math|N>, <math|<gr>>, and <math|\<Theta\>>.

  <\definition>
    <label|def:lebesgue-size><dueto|Lebesgue local size>Fix
    \ <math|<around|(|u,v|)>\<in\><around|[|1,\<infty\>|]><rsup|2>>. We
    define\ 

    <\equation>
      <label|eq:lebesgue-size-scalar><around|\<\|\|\>|F|\<\|\|\>><rsub|<SL|><rsup|<around|(|u,v|)>><rsub|\<Theta\>><around|(|T|)>><eqd>sup<rsub|G><rsub|><around*|\||<frac|1|s<rsub|T><around*|\||\<Theta\>|\|>><big|int><rsub|T>
      F<around*|(|\<eta\>,y,t|)>G<around*|(|\<eta\>,y,t|)><dd>\<eta\><dd>y<dd>t|\|>
    </equation>

    for <math|F\<in\><Rad><around*|(|<R><rsup|3><rsub|+>|)>> and
    <math|T\<in\>\<bbb-T\><rsub|\<Theta\>>>. The the upper bound is taken
    over <math|G\<in\>C<rsup|\<infty\>><rsub|c><around*|(|T|)>> with
    <math|<around*|\<\|\|\>|G\<circ\>\<pi\><rsub|T>|\<\|\|\>><rsub|L<rsup|u<rprime|'>><rsub|\<mathd\>\<theta\>\<mathd\>\<zeta\>*>L<rsup|v<rprime|'>><rsub|<frac|\<mathd\>\<sigma\>|\<sigma\>>>>\<leq\>1>,
    where

    <\equation*>
      <around*|\<\|\|\>|G\<circ\>\<pi\><rsub|T>|\<\|\|\>><rsub|L<rsup|u<rprime|'>><rsub|\<mathd\>\<theta\>\<mathd\>\<zeta\>*>L<rsup|v<rprime|'>><rsub|<frac|\<mathd\>\<sigma\>|\<sigma\>>>>\<assign\><around*|(|<big|int><rsub|<R><rsup|2>><around*|<left|(|-1>|<big|int><rsub|<R><rsub|+>><around*|<left|\||1>|G\<circ\>\<pi\><rsub|T><around*|(|\<theta\>,\<zeta\>,\<sigma\>|)>|<right|\||1>><rsup|v<rprime|'>><frac|\<mathd\>\<sigma\>|\<sigma\>>|<right|)|-1>><rsup|<frac|u<rprime|'>|v<rprime|'>>><frac|\<mathd\>\<theta\>\<mathd\>\<zeta\>|<around*|\||\<Theta\>|\|>>|)><rsup|<frac|1|u<rprime|'>>>.
    </equation*>

    If <math|F\<in\><Rad><around*|(|<R><rsup|3><rsub|+>|)>\<otimes\><rsup|k>\<Phi\><rsup|\<infty\>><rsub|<gr>><rprime|'><rsup|>>
    we define

    <\equation>
      <label|eq:lebesgue-size><around|\<\|\|\>|F|\<\|\|\>><rsub|<SL|><rsup|<around|(|u,v|)>><rsub|\<Theta\>>\<Phi\><rsub|<gr>><rsup|N><around|(|T|)>>\<assign\>sup<rsub|\<phi\><rsub|1>,\<ldots\>,\<phi\><rsub|k>><rsub|><around|\<\|\|\>|F<around*|[|\<phi\><rsub|1>,\<ldots\>,\<phi\><rsub|k>|]>|\<\|\|\>><rsub|<SL|><rsup|<around|(|u,v|)>><rsub|\<Theta\>><around|(|T|)>>
    </equation>

    with the upper bound being taken over all wave packets
    <math|\<phi\><rsub|1>,\<ldots\>,\<phi\><rsub|k>\<in\>\<Phi\><rsub|<gr>><rsup|\<infty\>>>
    with <math|<around*|\<\|\|\>|\<phi\><rsub|j>|\<\|\|\>><rsub|\<Phi\><rsub|<gr>><rsup|N>>\<leq\>1>,
    <math|j\<in\><around*|{|1,\<ldots\>,k|}>>.
  </definition>

  If <math|F\<in\>L<rsup|1><rsub|<loc>>> it can be shown that

  <\equation*>
    <around*|\<\|\|\>|F|\<\|\|\>><rsub|<SL|><rsup|<around|(|u,v|)>><rsub|\<Theta\>>>=<around*|<left|\<\|\|\>|1>|<around*|<left|(|1>|<1><rsub|<mT><rsub|\<Theta\>>>
    F\<circ\>\<pi\><rsub|T>|<right|)|1>><around*|(|\<theta\>,\<zeta\>,\<sigma\>|)>|<right|\<\|\|\>|1>><rsub|L<rsup|u><rsub|\<mathd\>\<theta\>\<mathd\>\<zeta\>*>L<rsup|v><rsub|<frac|\<mathd\>\<sigma\>|\<sigma\>>>>,
  </equation*>

  and if <math|u\<neq\><around*|{|1,\<infty\>|}>> and
  <math|v\<neq\><around*|{|1,\<infty\>|}>> then
  <math|<around*|\<\|\|\>|F|\<\|\|\>><rsub|<SL|><rsup|<around|(|u,v|)>><rsub|\<Theta\>>>\<less\>\<infty\>>
  only if <math|F\<in\>L<rsup|1><rsub|loc>>. However, definition
  <eqref|eq:lebesgue-size-scalar> is formulated via duality testing because
  <math|F> may be a general be a Radon measure. \ Indeed, we will often come
  across functions <math|F> of the form <math|<wide|F|~><around*|(|\<eta\>,y,t|)>t\<delta\><around*|<left|(|1>|t-<mf|b><around*|(|\<eta\>,y|)>|<right|)|1>><dd>\<eta\><dd>y<dd>t>
  for some <math|<wide|F|~>\<in\>L<rsup|\<infty\>><rsub|loc><around*|(|<R><rsup|3><rsub|+>|)>>
  and a continuous function <math|<mf|b>\<of\><R><rsup|2>\<rightarrow\><around*|[|0,+\<infty\>|]>>.
  Integrating a test function <math|G> against such a Radon measure amounts
  to computing the integral

  <\equation*>
    G\<mapsto\><big|int><rsub|<R><rsup|2>><wide|F|~><around*|(|\<eta\>,y,<mf|b><around*|(|\<eta\>,y|)>|)><mf|b><around*|(|\<eta\>,y|)>G<around*|(|\<eta\>,y,<mf|b><around*|(|\<eta\>,y|)>|)><dd>\<eta\><dd>y.
  </equation*>

  <\definition>
    <label|def:lacunary-size><dueto|Lacunary size>Fix
    <math|<around|(|u,v|)>\<in\><around|[|1,\<infty\>|]><rsup|2>>. We define\ 

    <\equation>
      <label|eq:lacunary-size><ltae|<tformat|<table|<row|<cell|<around|\<\|\|\>|F<around*|(|\<eta\>,y,t|)>|\<\|\|\>><rsub|<SL><rsup|><rsub|><rsup|<around*|(|u,v|)>><rsub|\<Theta\>><wpD><rsub|<gr>><rsup|N<rsup|>><around|(|T|)>>\<assign\><around*|<left|\<\|\|\>|2>|<rsub|><wpD><rsub|\<zeta\>><around*|<left|(|1>|\<theta\>|<right|)|1>>F<around*|(|\<eta\>,y,t|)>|<right|\<\|\|\>|2>><rsub|<SL><rsup|><rsub|><rsup|<around*|(|u,v|)>><rsub|
      \<Theta\>>\<Phi\><rsub|<mf|r>><rsup|N><around|(|T|)>><space|2em><text|with
      >\<theta\><eqd>t<around*|(|\<eta\>-\<xi\><rsub|T>|)>,>>>>>
    </equation>

    for any <math|F\<in\><Rad><around|(|<R><rsup|3><rsub|+>|)>\<otimes\>\<Phi\><rsup|\<infty\>><rsub|<gr>><rprime|'><rsup|>>
    and <math|T\<in\>\<bbb-T\><rsub|\<Theta\>>>. We define the operator
    <math|<wpD><rsub|\<zeta\>><around*|(|\<theta\>|)>> on
    <math|F\<in\><Rad><around|(|<R><rsup|3><rsub|+>|)>\<otimes\>\<Phi\><rsub|<gr>><rsup|\<infty\>><around*|(|<R>|)><rprime|'>>
    as

    <\equation>
      <label|eq:space-boost><wpD><rsub|\<zeta\>><around*|(|\<theta\>|)>F<around*|(|\<eta\>,y,t|)><around|[|\<phi\>|]><eqd>F<around*|(|\<eta\>,y,t|)><around*|<left|[|1>|<around*|(|-d<rsub|z>+2
      \<pi\> i\<theta\>|)>\<phi\><around*|(|z|)>|<right|]|1>>
    </equation>

    where <math|z> in <RHS|<eq-ref|eq:space-boost>> plays the role of a dummy
    variable.
  </definition>

  <\definition>
    <label|def:defect-size><dueto|Defect size>Fix
    <math|<around|(|u,v|)>\<in\><around|[|1,\<infty\>|]><rsup|2>>. We define\ 

    <\equation>
      <label|eq:defect-size> <ltae|<tformat|<cwith|2|2|1|1|cell-halign|l>|<cwith|1|1|1|1|cell-halign|l>|<table|<row|<cell|<around|\<\|\|\>|F|\<\|\|\>><rsub|<SL><rsub|\<Theta\>><rsup|<around*|(|u,v|)>><rsub|><dfct><rsup|N><rsub|\<zeta\>,<gr>><around|(|T|)>>\<assign\><around*|<left|\<\|\|\>|3>|<around*|<left|(|2>|<wpD><rsub|\<zeta\>><around*|(|t<around*|(|\<eta\>-\<xi\><rsub|T>|)>|)>-t
      \<mathd\><rsub|y>+2\<pi\>i\<xi\><rsub|T>|<right|)|2>>F<around*|(|\<eta\>,y,t|)><rsub|>|<right|\<\|\|\>|3>><rsub|<SL><rsub|\<Theta\>><rsup|<around*|(|u,v|)>>\<Phi\><rsub|<mf|r>><rsup|N><around|(|T|)><rsub|>>,>>|<row|<cell|<around|\<\|\|\>|F|\<\|\|\>><rsub|<SL><rsup|<around*|(|u,v|)>><rsub|\<Theta\>><dfct><rsup|N><rsub|\<sigma\>,<gr>><around|(|T|)>>\<assign\><around*|<left|\<\|\|\>|2>|<around*|<left|(|1>|<wpD><rsub|\<sigma\>><around*|(|t<around*|(|\<eta\>-\<xi\><rsub|T>|)>|)>-t\<mathd\><rsub|t>+<around*|(|\<eta\>-\<xi\><rsub|T>|)><dd><rsub|\<eta\>>|<right|)|1>>F<around*|(|\<eta\>,y,t|)>|<right|\<\|\|\>|2>><rsub|<SL><rsub|\<Theta\>><rsup|<around*|(|u,v|)>>\<Phi\><rsub|<mf|r>><rsup|N><around|(|T|)>>.>>>>>
    </equation>

    for any <math|F\<in\><Rad><around*|(|<R><rsup|3><rsub|+>|)>\<otimes\>\<Phi\><rsup|\<infty\>><rsub|<gr>><rprime|'><rsup|>>
    and <math|T\<in\>\<bbb-T\><rsub|\<Theta\>>>. The derivatives appearing in
    <eqref|eq:defect-size> are intended in the distributional sense. We
    define the operator <math|<wpD><rsub|\<sigma\>><around*|(|\<theta\>|)>>
    on <math|<Rad><around|(|<R><rsup|3><rsub|+>|)>\<otimes\>\<Phi\><rsub|<gr>><rsup|\<infty\>><rprime|'>>
    as

    <\equation>
      <label|eq:scale-boost><wpD><rsub|\<sigma\>><around*|(|\<theta\>|)>F<around*|(|\<theta\>,\<zeta\>,\<sigma\>|)><around|[|\<phi\>|]>\<assign\>F<around*|(|\<theta\>,\<zeta\>,\<sigma\>|)><around|<left|[|1>|<around*|(|-d<rsub|z>+2
      \<pi\> i \<theta\>|)><around*|(|z\<phi\><around|(|z|)>|)>|<right|]|1>>.
    </equation>

    We combine the two defect sizes above and use the shorthand

    <\equation>
      <label|eq:total-defect-size><SL><rsub|\<Theta\>><rsup|<around*|(|u,v|)>><rsub|><dfct><rsup|N><rsub|<gr>><around|(|T|)><eqd><SL><rsub|\<Theta\>><rsup|<around*|(|u,v|)>><rsub|><dfct><rsup|N><rsub|\<zeta\>,<gr>><around|(|T|)>+<SL><rsub|\<Theta\>><rsup|<around*|(|u,v|)>><rsub|><dfct><rsup|N><rsub|\<sigma\>,<gr>><around|(|T|)>.
    </equation>
  </definition>

  <\definition>
    <label|def:SIO-size><dueto|SIO truncation size>Fix
    <math|u\<in\><around|[|1,\<infty\>|)>>. We define\ 

    <\equation>
      <label|eq:SIO-size><around|\<\|\|\>|F|\<\|\|\>><rsub|<SJ><rsub|\<Theta\>><rsup|u>\<Phi\><rsub|<gr>><rsup|N><around*|(|T|)>><eqd><rsub|>sup<rsub|<tabular*|<tformat|<table|<row|<cell|\<phi\>,G>>>>>><rsub|><around*|\||<frac|1|s<rsub|T><around*|\||\<Theta\>|\|>><big|int><rsub|T><wpD><rsub|\<zeta\>><around*|<left|(|1>|t<around*|(|\<eta\>-\<xi\><rsub|T>|)>|<right|)|1>>F
      <around*|(|\<eta\>,y,t|)> G<around*|(|\<eta\>,y,t|)><dd>\<eta\><dd>y<dd>t|\|>
    </equation>

    for <math|F\<in\><Rad><around*|(|<R><rsup|3><rsub|+>|)>\<otimes\>\<Phi\><rsup|\<infty\>><rsub|<gr>><rprime|'><rsup|>>
    and <math|T\<in\>\<bbb-T\><rsub|\<Theta\>>>. The upper bound is taken
    over all <math|\<phi\>\<in\>\<Phi\><rsub|<gr>><rsup|\<infty\>>> with
    <math|<around*|\<\|\|\>|\<phi\>|\<\|\|\>><rsub|\<Phi\><rsub|<gr>><rsup|N>>\<leq\>1>
    and over all <math|G\<in\>C<rsup|\<infty\>><rsub|c><around*|(|<R><rsup|3><rsub|+>|)>>
    such that

    <\equation*>
      <around*|\<\|\|\>|\<sigma\>d<rsub|\<sigma\>>G\<circ\>\<pi\><rsub|T><around*|(|\<theta\>,\<zeta\>,\<sigma\>|)>|\<\|\|\>><rsub|L<rsup|u<rprime|'>><rsub|<frac|\<mathd\>\<theta\>\<mathd\>\<zeta\>|<around*|\||\<Theta\>|\|>>*>L<rsup|\<infty\>><rsub|<frac|\<mathd\>\<sigma\>|\<sigma\>>>>\<leq\>1.
    </equation*>
  </definition>

  The sizes <math|<SL|><rsup|<around|(|u,v|)>><rsub|\<Theta\>>\<Phi\><rsub|<gr>><rsup|N>>,
  <math|<SL><rsub|\<Theta\>><rsup|<around*|(|u,v|)>><rsub|><dfct><rsup|N><rsub|<gr>>>,
  <math|<SL><rsup|><rsub|><rsup|<around*|(|u,v|)>><rsub|\<Theta\>><wpD><rsub|<gr>><rsup|N<rsup|>>>,
  and <math|<SJ><rsub|\<Theta\>><rsup|u>\<Phi\><rsub|<gr>><rsup|N>> are
  obtained from the corresponding local sizes, defined above, through
  <eqref|eq:generated-size:trees>.

  <subsubsection|Sizes: some technical remarks>

  All the sizes above are regular in the sense of <eqref|eq:size-regularity>.
  This allows us to prove our statements under the assumptions that the
  functions <math|F\<in\><Rad><around*|(|<R><rsup|3><rsub|+>|)>\<otimes\>\<Phi\><rsup|\<infty\>><rsub|<gr>><rprime|'>>
  in play are compactly supported.

  <\remark>
    <label|rem:cpt-sets>There exists two sequences of forests
    <math|W<rsub|n><rsup|+>\<in\><TT><rsub|\<Theta\>><rsup|\<cup\>>> and
    <math|W<rsub|n><rsup|->\<in\><TT><rsub|\<Theta\>><rsup|\<cup\>>> such
    that <math|W<rsup|+><rsub|n>> is increasing, <math|W<rsup|-><rsub|n>> is
    decreasing, and the sets <math|\<bbb-K\><rsub|n><eqd>W<rsup|+><rsub|n>\<setminus\>W<rsup|-><rsub|n>>
    are compact, increasing, and satisfy <math|<big|cup><rsub|n>\<bbb-K\><rsub|n>=<R><rsup|3><rsub|+>>.

    It is sufficient to set

    <\equation*>
      <ltae|<tformat|<table|<row|<cell|<mc|W><rsub|n><rsup|+><eqd><around*|<left|{|1>|<TT><rsub|\<Theta\>><around*|(|\<xi\>,x,s|)><st>\<xi\>\<in\>2<rsup|-n><Z>,x\<in\>2<rsup|-n><Z>,s\<in\><around*|(|2<rsup|1/n>|)><rsup|<Z>>,<around*|\||\<xi\>|\|>+<around*|\||x|\|>+s\<less\>2<rsup|n>|<right|}|1>>,>>|<row|<cell|<mc|W><rsub|n><rsup|-><eqd><around*|<left|{|1>|<TT><rsub|\<Theta\>><around*|(|\<xi\>,x,s|)><st>\<xi\>\<in\><Q>,x\<in\><Q>,s\<in\><Q>\<cap\><R><rsub|+>,s\<less\>2<rsup|-n>|<right|}|1>>,>>>>>
    </equation*>

    and <math|W<rsub|n><rsup|\<pm\>><eqd><big|cup><rsub|T\<in\><mc|W><rsub|n><rsup|\<pm\>>>T>.
  </remark>

  We simplify dealing with the dependence on
  <math|\<phi\>\<in\>\<Phi\><rsup|\<infty\>><rsub|<gr>>> appearing in the
  definition of all sizes above using the following wave packet decomposition
  result.

  <\lemma>
    <label|lem:wave-packet-decomposition> For any
    <math|0\<less\>N<rprime|'>\<less\>N> there exists a sequence of test
    functions <math|<wide|\<phi\>|~><rsub|k>\<in\>\<Phi\><rsub|2<gr>><rsup|N<rprime|'>>>,
    <math|k\<in\><Z>> satisfying <math|<around*|\<\|\|\>|<wide|\<phi\>|~><rsub|k>|\<\|\|\>><rsub|\<Phi\><rsup|N<rprime|'>><rsub|2<gr>>>\<lesssim\>1>
    such that the following decomposition holds. For any
    <math|\<phi\>\<in\>\<Phi\><rsub|<gr>><rsup|N>> there exists a sequence
    <math|a<rsub|k>\<in\><C>> such that\ 

    <\equation*>
      \<phi\><around*|(|z|)>=<big|sum><rsub|k\<in\><Z>>a<rsub|k><wide|\<phi\>|~><rsub|k>,
    </equation*>

    and <math|<around*|\||a<rsub|k>|\|>\<lesssim\><around*|\<langle\>|k|\<rangle\>><rsup|-<around*|(|N-N<rprime|'>|)>><around*|\<\|\|\>|\<phi\>|\<\|\|\>><rsub|\<Phi\><rsub|<gr>><rsup|N>>.>
    In particular, the above sum converges absolutely in
    <math|\<Phi\><rsup|N<rprime|'>><rsub|2<gr>>> if
    <math|N\<gtr\>N<rprime|'>+1>.\ 
  </lemma>

  <\proof>
    The proof is based on the Fourier inversion formula. Fix
    <math|0\<less\>\<varepsilon\>\<less\>1> and set\ 

    <\equation*>
      <FT|<wide|\<phi\>|~>><around*|(|<FT|z>|)><eqd><around*|(|<around*|\||<FT|z>|\|>-2<gr>|)><rsup|<around*|(|N<rprime|'>+\<varepsilon\>|)>><1><rsub|B<rsub|2<gr>>><around*|(|<FT|z>|)>,<space|2em><wide|\<phi\>|~><rsub|k><around*|(|z|)><eqd><around*|\<langle\>|k|\<rangle\>><rsup|-N<rprime|'>><wide|\<phi\>|~><around*|<left|(|-1>|z+<frac|k|4<gr>>|<right|)|-1>>,
    </equation*>

    so that <math|<around*|\<\|\|\>|<wide|\<phi\>|~><rsub|k><around*|(|z|)>|\<\|\|\>><rsub|\<Phi\><rsup|N<rprime|'>><rsub|2<gr>>>\<lesssim\>1>.
    Let

    <\equation*>
      <ltae|<tformat|<table|<row|<cell|a<rsub|k><eqd><frac|<around*|\<langle\>|k|\<rangle\>><rsup|N<rprime|'>>|<around*|(|4<gr>|)><rsup|2>><big|int><rsub|B<rsub|2<gr>>>e<rsup|-2\<pi\>i
      <frac|k|4<gr>><FT|w>><FT|\<phi\>><around*|(|<FT|w>|)>
      <around*|(|<around*|\||<FT|w>|\|>-2<gr>|)><rsup|-<around*|(|N<rprime|'>+\<varepsilon\>|)>><dd><FT|w>.>>>>>
    </equation*>

    Since <math|<FT|\<phi\>>> is supported on <math|B<rsub|<gr>>> it holds
    that <math|<around*|<left|\<\|\|\>|2>|<FT|\<phi\>><around*|(|<FT|w>|)>
    <around*|(|<around*|\||<FT|w>|\|>-2<gr>|)><rsup|-<around*|(|N<rprime|'>+\<varepsilon\>|)>>|<right|\<\|\|\>|2>><rsub|C<rsup|N>>\<approx\><around*|\<\|\|\>|<FT|\<phi\>><around*|(|<FT|w>|)>|\<\|\|\>><rsub|C<rsup|N>>>
    and so <math|<around*|\||a<rsub|k>|\|>\<lesssim\><around*|\<langle\>|k|\<rangle\>><rsup|-<around*|(|N-N<rprime|'>|)>><around*|\<\|\|\>|\<phi\>|\<\|\|\>><rsub|\<Phi\><rsub|<gr>><rsup|N>>>.
    The Fourier inversion formula gives us that\ 

    <\equation*>
      <big|sum><rsub|k\<in\><Z>>a<rsub|k>
      <around*|\<langle\>|k|\<rangle\>><rsup|-N<rprime|'>>e<rsup|2\<pi\>i
      <frac|k|4<gr>><FT|z>>=<FT|\<phi\>><around*|(|<FT|z>|)>
      <around*|(|<around*|\||<FT|z>|\|>-2<gr>|)><rsup|-<around*|(|N<rprime|'>+\<varepsilon\>|)>>
    </equation*>

    with the series converging uniformly. It follows that\ 

    <\equation*>
      <FT|\<phi\>><around*|(|<FT|z>|)>=<big|sum><rsub|k\<in\><Z>>a<rsub|k>
      <around*|\<langle\>|k|\<rangle\>><rsup|-N<rprime|'>>e<rsup|2\<pi\>i
      <frac|k|4<gr>><FT|z>><FT|<wide|\<phi\>|~>><around*|(|<FT|z>|)>
    </equation*>

    i.e.\ 

    <\equation*>
      \<phi\><around*|(|z|)>=<big|sum><rsub|k\<in\><Z>>a<rsub|k><wide|\<phi\>|~><rsub|k><around*|(|z|)>
    </equation*>

    as required.\ 
  </proof>

  As a consequence one can compare <math|F\<in\><Rad><around*|(|<R><rsup|3><rsub|+>|)>\<otimes\>\<Phi\><rsup|\<infty\>><rsub|2<gr>><rprime|'>>
  with scalar functions in the following sense.\ 

  <\corollary>
    <label|cor:wave-packet-decomposition-and-sizes>Let
    <math|<around*|(|\<eta\>,y,t|)>\<mapsto\>\<phi\><rsub|<around*|(|\<eta\>,y,t|)>>\<in\>\<Phi\><rsub|<gr>><rsup|N>>
    be a measurable function with <math|<around*|\<\|\|\>|\<phi\><rsub|<around*|(|\<eta\>,y,t|)>>|\<\|\|\>><rsub|\<Phi\><rsup|N><rsub|<gr>>>\<lesssim\>1>.
    Then <math|<around*|(|\<eta\>,y,t|)>\<mapsto\>F<around*|(|\<eta\>,y,t|)><around*|[|\<phi\><rsub|<around*|(|\<eta\>,y,t|)>>|]>>
    defines an element of <math|<Rad><around*|(|<R><rsup|3><rsub|+>|)>> with

    <\equation>
      <label|eq:scalar-non-scalar-bound-size><around*|<left|\<\|\|\>|2>|F<around*|(|\<eta\>,y,t|)><around*|[|\<phi\><rsub|<around*|(|\<eta\>,y,t|)>>|]>|<right|\<\|\|\>|2>><rsub|<SL><rsup|<around*|(|u,v|)>><rsub|\<Theta\>>>\<lesssim\><around*|\<\|\|\>|F|\<\|\|\>><rsub|<SL><rsup|<around*|(|u,v|)>><rsub|\<Theta\>>\<Phi\><rsup|N<rprime|'>><rsub|2<gr>>>
    </equation>

    as long as <math|<around*|\<\|\|\>|F|\<\|\|\>><rsub|<SL><rsup|<around*|(|u,v|)>><rsub|\<Theta\>>\<Phi\><rsup|N<rprime|'>><rsub|2<gr>>>\<less\>\<infty\>>
    and <math|N\<geq\>N<rprime|'>+4>. As a consequence,\ 

    <\equation>
      <label|eq:scalar-non-scalar-bound-Lp><around*|<left|\<\|\|\>|2>|F<around*|(|\<eta\>,y,t|)><around*|[|\<phi\><rsub|<around*|(|\<eta\>,y,t|)>>|]>|<right|\<\|\|\>|2>><rsub|L<rsup|p><rsub|\<mu\><rsup|<mf|p>><rsub|\<Theta\>>><SL><rsup|<around*|(|u,v|)>><rsub|\<Theta\>>>\<lesssim\><around*|\<\|\|\>|F|\<\|\|\>><rsub|<SL><rsup|<around*|(|u,v|)>><rsub|\<Theta\>>\<Phi\><rsup|N<rprime|'>><rsub|2<gr>>>.
    </equation>

    for any <math|p\<in\><around*|(|0,+\<infty\>|]>> and for some
    <math|C\<gtr\>0> it holds that\ 

    <\equation>
      <label|eq:scalar-non-scalar-bound-spt>\<mu\><rsup|<mf|p>><rsub|\<Theta\>><around|<left|(|2>|<around*|<left|\<\|\|\>|1>|F<around*|(|\<eta\>,y,t|)><around*|[|\<phi\><rsub|<around*|(|\<eta\>,y,t|)>>|]>|<right|\<\|\|\>|1>><rsub|<SL><rsup|<around*|(|u,v|)>><rsub|\<Theta\>>>\<gtr\>\<lambda\>|<right|)|2>>\<leq\>\<mu\><rsup|<mf|p>><rsub|\<Theta\>><around|<left|(|2>|<around*|<left|\<\|\|\>|1>|F|<right|\<\|\|\>|1>><rsub|<SL><rsup|<around*|(|u,v|)>><rsub|\<Theta\>>\<Phi\><rsup|N<rprime|'>><rsub|2<gr>>>\<gtr\>C\<lambda\>|<right|)|2>>.
    </equation>

    Finally, for any <math|p\<geq\>1> it holds that \ 

    <\equation>
      <label|eq:non-scalar-scalar-bound-Lp><around*|<left|\<\|\|\>|1>|F|<right|\<\|\|\>|1>><rsub|L<rsup|p><rsub|\<mu\><rsup|<mf|p>><rsub|\<Theta\>>><SL><rsup|<around*|(|u,v|)>><rsub|\<Theta\>>\<Phi\><rsup|N><rsub|<gr>>>\<lesssim\>sup<rsub|\<phi\>><around*|<left|\<\|\|\>|1>|F<around*|(|\<eta\>,y,t|)><around*|[|\<phi\>|]>|<right|\<\|\|\>|1>><rsub|L<rsup|p><rsub|\<mu\><rsup|<mf|p>><rsub|\<Theta\>>><SL><rsup|<around*|(|u,v|)>><rsub|\<Theta\>>>,
    </equation>

    where the upper bound is taken over all
    <math|\<phi\>\<in\>\<Phi\><rsup|\<infty\>><rsub|2<gr>>> with
    <math|<around*|\<\|\|\>|\<phi\>|\<\|\|\>><rsub|\<Phi\><rsup|N<rprime|'>><rsub|2<gr>>>\<lesssim\>1>,
    as long as <math|N\<geq\>N<rprime|'>+4>.\ 
  </corollary>

  <\proof>
    Bounds <eqref|eq:scalar-non-scalar-bound-size> and
    <math|<eqref|eq:scalar-non-scalar-bound-spt>> follow directly from
    <smart-ref|lem:wave-packet-decomposition> noting that the quasi-triangle
    inequality holds with constant <math|1>. From those two bounds one
    deduces <eqref|eq:scalar-non-scalar-bound-Lp>. For bound
    <eqref|eq:non-scalar-scalar-bound-Lp> note that\ 

    <\equation*>
      <around*|<left|\<\|\|\>|1>|F|<right|\<\|\|\>|1>><rsub|<SL><rsup|<around*|(|u,v|)>><rsub|\<Theta\>>\<Phi\><rsup|N><rsub|<gr>>>\<lesssim\><big|sum><rsub|k\<in\><Z>><around*|\<langle\>|k|\<rangle\>><rsup|-<around*|(|N-N<rprime|'>|)>><around*|<left|\<\|\|\>|1>|F\<circ\>\<Gamma\><around*|[|<wide|\<phi\>|~><rsub|k>|]>|<right|\<\|\|\>|1>><rsub|<SL><rsup|<around*|(|u,v|)>><rsub|\<Theta\>>>
    </equation*>

    with <math|<wide|\<phi\>|~><rsub|k>> given by
    <smart-ref|lem:wave-packet-decomposition>. Thus\ 

    <\equation*>
      \<mu\><rsup|<mf|p>><rsub|\<Theta\>><around*|(|<around*|<left|\<\|\|\>|1>|F|<right|\<\|\|\>|1>><rsub|<SL><rsup|<around*|(|u,v|)>><rsub|\<Theta\>>\<Phi\><rsup|N><rsub|<gr>>>\<gtr\>\<lambda\>|)>\<lesssim\><big|sum><rsub|k\<in\><Z>>\<mu\><rsup|<mf|p>><rsub|\<Theta\>><around*|(|<around*|<left|\<\|\|\>|1>|F<around*|[|<wide|\<phi\>|~><rsub|k>|]>|<right|\<\|\|\>|1>><rsub|<SL><rsup|<around*|(|u,v|)>><rsub|\<Theta\>>>\<gtr\>\<lambda\>C<around*|\<langle\>|k|\<rangle\>><rsup|2>|)>
    </equation*>

    and \ 

    <\equation*>
      <around*|<left|\<\|\|\>|1>|F|<right|\<\|\|\>|1>><rsub|L<rsup|p><rsub|\<mu\><rsup|<mf|p>><rsub|\<Theta\>>><SL><rsup|<around*|(|u,v|)>><rsub|\<Theta\>>\<Phi\><rsup|N><rsub|<gr>>><rsup|p><ltae|<tformat|<cwith|2|2|1|1|cell-halign|r>|<cwith|3|3|1|1|cell-halign|l>|<table|<row|<cell|\<lesssim\><big|sum><rsub|k\<in\><Z>><big|int><rsub|0><rsup|\<infty\>>\<mu\><rsup|<mf|p>><rsub|\<Theta\>><around*|(|<around*|<left|\<\|\|\>|1>|F<around*|[|<wide|\<phi\>|~><rsub|k>|]>|<right|\<\|\|\>|1>><rsub|<SL><rsup|<around*|(|u,v|)>><rsub|\<Theta\>>>\<gtr\>\<lambda\><rsup|<frac|1|p>>C<around*|\<langle\>|k|\<rangle\>><rsup|2>|)><dd>\<lambda\>>>|<row|<cell|\<lesssim\><big|sum><rsub|k\<in\><Z>><around*|\<langle\>|k|\<rangle\>><rsup|-2p><big|int><rsub|0><rsup|\<infty\>>\<mu\><rsup|<mf|p>><rsub|\<Theta\>><around*|(|<around*|<left|\<\|\|\>|1>|F<around*|[|<wide|\<phi\>|~><rsub|k>|]>|<right|\<\|\|\>|1>><rsub|<SL><rsup|<around*|(|u,v|)>><rsub|\<Theta\>>>\<gtr\>\<lambda\><rsup|<frac|1|p>>|)><dd>\<lambda\>>>|<row|<cell|=<big|sum><rsub|k\<in\><Z>><around*|\<langle\>|k|\<rangle\>><rsup|-2p><around*|<left|\<\|\|\>|1>|F<around*|[|<wide|\<phi\><rsub|k>|~>|]>|<right|\<\|\|\>|1>><rsub|<SL><rsup|<around*|(|u,v|)>><rsub|\<Theta\>>><rsup|p>.>>>>>
    </equation*>

    This shows <eqref|eq:non-scalar-scalar-bound-Lp>.
  </proof>

  <subsubsection|Sizes: motivation><label|sec:size-motivation>

  We introduce an additional size that represents the maximal truncation of a
  localized singular integral operator. This size has not been studied in
  prior works that use outer Lebesgue spaces in the context of
  time-scale-frequency analysis. Controlling this size for functions
  <math|F=<Emb><around*|[|f|]>> is one of the main objectives of
  <smart-ref|sec:non-uniform:SIO>.

  We conclude this section by providing motivation for the sizes we
  introduced. As already discussed for the trees themselves, sizes are
  adapted to treating <math|<R><rsup|3><rsub|+>> as a group of symmetries
  <eqref|eq:symmetries>. If <math|<SO><rsub|\<Theta\>>\<Phi\><rsup|N><rsub|<gr>>>
  is any of the sizes <math|<SL><rsup|<around*|(|u,v|)>><rsub|\<Theta\>>\<Phi\><rsup|N><rsub|<gr>>>,
  <math|<SL><rsup|<around*|(|u,v|)>><rsub|\<Theta\>><wpD><rsup|N><rsub|<gr>>>,
  <math|<SL><rsup|<around*|(|u,v|)>><rsub|\<Theta\>><dfct><rsup|N><rsub|<gr>>>,
  or <math|<SJ><rsup|u><rsub|\<Theta\>>\<Phi\><rsup|N><rsub|<gr>>>, then
  setting

  <\equation*>
    <wide|F|~><around*|(|\<eta\>,y,t|)>=e<rsup|2 \<pi\>
    i\<xi\><around*|(|y-x|)>>F<around|<left|(|2>|s<around*|(|\<eta\>-\<xi\>|)>,<frac|y-x|s>,<frac|t|s>|<right|)|2>>
  </equation*>

  it holds that

  <\equation>
    <around*|\<\|\|\>|<wide|F|~>|\<\|\|\>><rsub|<SO><rsub|\<Theta\>>\<Phi\><rsub|<gr>><rsup|N><around*|(|T<rsub|\<Theta\>><around*|(|\<xi\><rprime|'>,x<rprime|'>,s<rprime|'>|)>|)>>=<around*|\<\|\|\>|F|\<\|\|\>><rsub|<SO><rsub|\<Theta\>>\<Phi\><rsub|<gr>><rsup|N><around*|(|T<rsub|\<Theta\>><around*|(|s<around*|(|\<xi\><rprime|'>-\<xi\>|)>,<frac|x<rprime|'>-x|s>,<frac|s<rprime|'>|s>|)>|)>><label|eq:size-symmetry>
  </equation>

  and thus <math|<around*|\<\|\|\>|<wide|F|~>|\<\|\|\>><rsub|<SO><rsub|\<Theta\>>\<Phi\><rsub|<gr>><rsup|N>>=<around*|\<\|\|\>|F|\<\|\|\>><rsub|<SO><rsub|\<Theta\>>\<Phi\><rsub|<gr>><rsup|N>>>.
  Thanks to this fact and identities <eqref|eq:piT-symmetry> and
  <eqref|eq:tree-symmetry>, in our proofs we will often be able to restrict
  our focus to <math|T=T<rsub|\<Theta\>><around*|(|0,0,1|)>>. Let us make
  this assumption also for the discussion below that motivates the sizes we
  introduce and relates them to well-known quantities in harmonic analysis.\ 

  The Lebesgue size <math|<SL|><rsup|<around|(|u,v|)>><rsub|\<Theta\>>> of
  <smart-ref|def:lebesgue-size> controls the magnitude of the coefficients of
  the embedding on a tree. If <math|v=\<infty\>> this is closely related to
  bounding a space and frequency localized version of a Hardy-Littlewood
  maximal function. Let <math|\<phi\>\<in\>\<Phi\><rsup|N><rsub|<gr>>> be
  chosen to maximize <RHS|<eqref|eq:lebesgue-size>> for
  <math|F=<Emb><around*|[|f|]>>. Setting <math|<wide|
  \<phi\>|~><rsub|\<theta\>>=<Mod><rsub|\<theta\>><around*|(|\<phi\><rsup|\<vee\>>|)>>
  we have\ 

  <\equation*>
    <around|<left|\<\|\|\>|1>|<Emb><around*|[|f|]>|<right|\<\|\|\>|1>><rsub|<SL|><rsup|<around|(|u,\<infty\>|)>><rsub|\<Theta\>>\<Phi\><rsub|<gr>><rsup|N><around|(|T|)>><rsup|u>\<approx\><big|int><rsub|\<Theta\>><big|int><rsub|B<rsub|1>>sup<rsub|0\<less\>\<sigma\>\<less\>1-<around*|\||\<zeta\>|\|>><around*|\||f\<ast\><Dil><rsub|\<sigma\>><wide|\<phi\>|~><rsub|\<theta\>><around*|(|\<zeta\>|)>
    |\|><rsup|u><dd>\<zeta\><frac|<dd>\<theta\>|<around*|\||\<Theta\>|\|>>.
  </equation*>

  For every fixed <math|\<theta\>\<in\>\<Theta\>> the inner integrand is a
  Hardy-Littlewood maximal function over scales bounded from above. The
  lacunary size <math|><math|<SL><rsup|<around|(|u,2|)>><rsub|\<Theta\>><wpD><rsub|<gr>><rsup|N<rsup|>>>
  encodes the magnitude of a localized square function. Let
  <math|\<phi\>\<in\>\<Phi\><rsup|N><rsub|<gr>>> be chosen to extremize the
  upper bound in the size <smart-ref|def:lacunary-size>. Setting <math|
  \<psi\><rsub|\<theta\>><around*|(|z|)>=<dd><rsub|z><around*|<left|(|1>|<Mod><rsub|\<theta\>><around*|(|\<phi\><rsup|\<vee\>>|)><around*|(|z|)>|<right|)|1>>>
  we have that\ 

  <\equation*>
    <around|<left|\<\|\|\>|1>|<Emb><around*|[|f|]>|<right|\<\|\|\>|1>><rsub|<SL|><rsup|<around|(|u,2|)>><rsub|\<Theta\>><wpD><rsub|<gr>><rsup|N<rsup|>><around|(|T|)>><rsup|u>\<approx\><big|int><rsub|\<Theta\>><big|int><rsub|B<rsub|1>><around*|(|<big|int><rsub|0><rsup|1-<around*|\||\<zeta\>|\|>><around*|\||f\<ast\><Dil><rsub|\<sigma\>>\<psi\><rsub|\<theta\>><around*|(|\<zeta\>|)>
    |\|><rsup|2><frac|<dd>\<sigma\>|\<sigma\>>|)><rsup|u/2><dd>\<zeta\><frac|<dd>\<theta\>|<around*|\||\<Theta\>|\|>>.
  </equation*>

  For every fixed <math|\<theta\>\<in\>\<Theta\>> the innermost integral is
  the Littlewood-Paley square function. Note that
  <math|\<psi\><rsub|\<theta\>>> satisfies <math|<big|int>
  \<psi\><rsub|\<theta\>><around*|(|z|)><dd>z=0>.

  Next, the <em|defect sizes> quantify by how much a function
  <math|F\<in\><Rad><around|(|<R><rsup|3><rsub|+>|)>\<otimes\>\<Phi\><rsup|\<infty\>><rsub|<gr>><rprime|'>>
  fails to be of the form <math|F=<Emb><around*|[|f|]>>. The differential
  operators <math|t \<mathd\><rsub|y>+2\<pi\>i\<xi\><rsub|T>> and
  <math|t\<mathd\><rsub|t>-<around*|(|\<eta\>-\<xi\><rsub|T>|)><dd><rsub|\<eta\>>><math|>
  appearing in <smart-ref|def:defect-size> are the push forwards of
  <math|\<sigma\><dd><rsub|\<sigma\>>> and
  <math|\<sigma\><dd><rsub|\<zeta\>>> using the map <math|\<pi\><rsub|T>>.
  More explicitly

  <\equation*>
    <ltae|<tformat|<cwith|1|1|1|1|cell-halign|l>|<table|<row|<cell|\<sigma\><dd><rsub|\<zeta\>><around*|(|e<rsup|2
    \<pi\> i\<xi\><rsub|T>s<rsub|T>\<zeta\>>F\<circ\>\<pi\><rsub|T><around*|(|\<theta\>,\<zeta\>,\<sigma\>|)>|)>=e<rsup|2
    \<pi\> i\<xi\><rsub|T>s<rsub|T>\<zeta\>>
    <around*|<left|(|1>|<around*|(|t<dd><rsub|y>+2\<pi\>i\<xi\><rsub|T>|)>F<around*|(|\<eta\>,y,t|)>|<right|)|1>>\<circ\>\<pi\><rsub|T><around*|(|\<theta\>,\<zeta\>,\<sigma\>|)>,>>|<row|<cell|\<sigma\><dd><rsub|\<sigma\>><around*|(|e<rsup|2
    \<pi\> i\<xi\><rsub|T>s<rsub|T>\<zeta\>>F\<circ\>\<pi\><rsub|T><around*|(|\<theta\>,\<zeta\>,\<sigma\>|)>|)>=e<rsup|2
    \<pi\> i\<xi\><rsub|T>s<rsub|T>\<zeta\>><around*|<left|(|1>|<around*|(|t<dd><rsub|t>-<around*|(|\<eta\>-\<xi\><rsub|T>|)><dd><rsub|\<eta\>>|)>F<around*|(|\<eta\>,y,t|)>|<right|)|1>>\<circ\>\<pi\><rsub|T><around*|(|\<theta\>,\<zeta\>,\<sigma\>|)>.>>>>>
  </equation*>

  A direct computation gives that\ 

  <\equation>
    <label|eq:embedded-no-defect><ltae|<tformat|<cwith|1|1|1|1|cell-halign|l>|<table|<row|<cell|\<sigma\><dd><rsub|\<zeta\>><around*|(|e<rsup|2
    \<pi\> i\<xi\><rsub|T>s<rsub|T>\<zeta\>><Emb><around*|[|f|]>\<circ\>\<pi\><rsub|T><around*|(|\<theta\>,\<zeta\>,\<sigma\>|)>|)>=<wpD><rsub|\<zeta\>><around*|(|\<theta\>|)><around*|(|e<rsup|2
    \<pi\> i\<xi\><rsub|T>s<rsub|T>\<zeta\>><Emb><around*|[|f|]>\<circ\>\<pi\><rsub|T><around*|(|\<theta\>,\<zeta\>,\<sigma\>|)>|)>,>>|<row|<cell|\<sigma\><dd><rsub|\<sigma\>><around*|(|e<rsup|2
    \<pi\> i\<xi\><rsub|T>s<rsub|T>\<zeta\>><Emb><around*|[|f|]>\<circ\>\<pi\><rsub|T><around*|(|\<theta\>,\<zeta\>,\<sigma\>|)>|)>=<wpD><rsub|\<sigma\>><around*|(|\<theta\>|)><around*|(|e<rsup|2
    \<pi\> i\<xi\><rsub|T>s<rsub|T>\<zeta\>><Emb><around*|[|f|]>\<circ\>\<pi\><rsub|T><around*|(|\<theta\>,\<zeta\>,\<sigma\>|)>|)>,>>>>>
  </equation>

  for any for any <math|T\<in\><TT><rsub|\<Theta\>>> and any
  <math|f\<in\><Sch><around*|(|<R>|)>>. It follows that

  <\equation*>
    <around*|\<\|\|\>|<Emb><around*|[|f|]>|\<\|\|\>><rsub|L<rsup|<around*|(|u,v|)>><rsub|\<Theta\>><dfct><rsub|\<zeta\>,<gr>><rsup|N>>=<around*|\<\|\|\>|<Emb><around*|[|f|]>|\<\|\|\>><rsub|L<rsup|<around*|(|u,v|)>><rsub|\<Theta\>><dfct><rsub|\<sigma\>,<gr>><rsup|N>>=0.
  </equation*>

  We actually use identity <eqref|eq:embedded-no-defect> to
  <with|font-shape|italic|define> the operators
  <math|<wpD><rsub|\<zeta\>><around*|(|\<theta\>|)>> and
  <math|<wpD><rsub|\<sigma\>><around*|(|\<theta\>|)>> acting on general
  functions <math|><math|F\<in\><Rad><around|(|<R><rsup|3><rsub|+>|)>\<otimes\>\<Phi\><rsup|\<infty\>><rsub|<gr>><rprime|'>>
  not necessarily of the form <math|F=<Emb><around*|[|f|]>>. The defect size
  then encodes and quantifies the local failure of a function
  <math|F\<in\><Rad><around|(|<R><rsup|3><rsub|+>|)>\<otimes\>\<Phi\><rsup|\<infty\>><rsub|<gr>><rprime|'>>
  to be of the form <math|F=<Emb><around*|[|f|]>>.\ 

  We cannot expect the functions <math|F\<in\><Rad><around|(|<R><rsup|3><rsub|+>|)>\<otimes\>\<Phi\><rsup|\<infty\>><rsub|<gr>><rprime|'>>
  in play in the arguments of this paper to always be of the form
  <math|F=<Emb><around*|[|f|]>>. If <math|F=<1><rsub|<R><rsup|3><rsub|+>\<setminus\>W<rsup|->><Emb><around*|[|f|]>>
  with W<math|<rsup|->\<in\><TT><rsup|\<cup\>><rsub|\<Theta\>>> (see e.g.
  <eqref|eq:generated-size:trees>), in <smart-ref|def:defect-size> (recall
  that <math|T=T<rsub|\<Theta\>><around*|(|0,0,1|)>>) we get that\ 

  <\equation*>
    <around*|(|<wpD><rsub|\<zeta\>><around*|(|t\<eta\>|)>-t<dd><rsub|y>|)>F<around*|(|\<eta\>,y,t|)>=-<around*|(|t
    <dd><rsub|y><1><rsub|<R><rsup|3><rsub|+>\<setminus\>W<rsup|->><around*|(|\<eta\>,y,t|)>|)><Emb><around*|[|f|]><around*|(|\<eta\>,y,t|)>.
  </equation*>

  Based on the geometry of the set <math|W<rsup|->>, (see
  <smart-ref|lem:geometry-of-boundary> below), the term <math|<around*|(|t
  <dd><rsub|y><1><rsub|<R><rsup|3><rsub|+>\<setminus\>W<rsup|->><around*|(|\<eta\>,y,t|)>|)>>
  is a Radon measure supported on the boundary of <math|W<rsup|->>. A similar
  discussion can be carried out for the size
  <math|<SL><rsub|\<Theta\>><rsup|<around*|(|u,v|)>><rsub|><dfct><rsup|N><rsub|\<sigma\>,<gr>>>.
  This is going to be a prototypica form of the <em|defect> of a function
  <math|F\<in\><Rad><around|(|<R><rsup|3><rsub|+>|)>\<otimes\>\<Phi\><rsup|\<infty\>><rsub|<gr>><rprime|'>>.

  Finally, the size <math|<SJ><rsub|\<Theta\>><rsup|u>\<Phi\><rsub|<gr>><rsup|N>>
  represents the maximal truncation of a localized singular integral
  operator. To see this chose <math|\<phi\>\<in\>\<Phi\><rsup|N><rsub|<gr>>>
  to extremize the upper bound in <eqref|eq:SIO-size>. Setting <math|
  \<psi\><rsub|\<theta\>><around*|(|z|)>=<dd><rsub|z><around*|<left|(|1>|<Mod><rsub|\<theta\>><around*|(|\<phi\><rsup|\<vee\>>|)><around*|(|z|)>|<right|)|1>>>
  and computing the upper bound over <math|G> we get that\ 

  <\equation*>
    <around|\<\|\|\>|<Emb><around*|[|f|]>|\<\|\|\>><rsub|<SJ><rsub|\<Theta\>><rsup|u>\<Phi\><rsub|<gr>><rsup|N><around*|(|T|)>><rsup|u>\<lesssim\><big|int><rsub|\<Theta\>><big|int><rsub|B<rsub|1>>sup<rsub|\<sigma\>\<less\>1-<around*|\||\<zeta\>|\|><rsub|>><around*|\||<big|int><rsub|0><rsup|\<sigma\>>f\<ast\>
    <Dil><rsub|\<rho\>>\<psi\><rsub|\<theta\>><around*|(|\<zeta\>|)><frac|<dd>\<rho\>|\<rho\>>|\|><rsup|u><dd>\<zeta\><frac|<dd>\<theta\>|<around*|\||\<Theta\>|\|>>.
  </equation*>

  The inner integral is related and can be bound by the Hardy-Littlewood
  maximal function of <math|f\<ast\>K> where the kernel <math|K> is
  Calderón-Zygmund given by\ 

  <\equation*>
    K<around*|(|z|)><eqd><big|int><rsub|0><rsup|\<infty\>>
    <Dil><rsub|\<rho\>>\<psi\><rsub|\<theta\>><around*|(|\<zeta\>|)><frac|<dd>\<rho\>|\<rho\>>.
  </equation*>

  <subsection|Changes of variables and product
  sizes<label|sec:derived-sizes>>

  The sizes introduced in the previous section and thus the combined size
  <math|<SF><rsup|u><rsub|\<Theta\>>\<Phi\><rsub|<gr>><rsup|N>>, are well
  suited to control functions of the form
  <math|F=<Emb><around*|[|f|]>\<in\><Rad><around*|(|<R><rsup|3><rsub|+>|)>\<otimes\>
  \<Phi\><rsub|<gr>><rsup|\<infty\>><rprime|'>>. To control functions
  <math|<Emb><around*|[|f|]>\<circ\>\<Gamma\>> appearing in
  <eqref|eq:embedding-bounds:non-uniform-iterated> and
  <smart-ref|eq:embedding-bounds:uniform-iterated> we pull back the sizes via
  the map <math|\<Gamma\>>. Let <math|\<Gamma\>=\<Gamma\><rsub|<around*|(|\<alpha\>,\<beta\>,\<gamma\>|)>>>
  be a diffeomorphism of <math|<R><rsup|3><rsub|+>> of the form

  <\equation>
    <label|eq:gamma><ltae|<tformat|<cwith|2|2|1|1|cell-halign|r>|<table|<row|<cell|\<Gamma\><rsub|<around*|(|\<alpha\>,\<beta\>,\<gamma\>|)>><around|(|\<eta\>,y,t|)><eqd><around|(|\<alpha\><around*|(|\<eta\>+\<gamma\>t<rsup|-1>|)>,y,\<beta\>t|)>,>>|<row|<cell|\<beta\>\<in\><around*|(|0,1|]>,<space|1em><around*|\||\<alpha\>\<beta\>|\|>\<in\><around*|<left|(|-2>|<frac|1|2>,2|<right|)|-2>>,<space|2em><around*|\||\<gamma\>|\|>\<less\>1;>>>>>
  </equation>

  note that the maps in <smart-ref|eq:gamma:params> satisfy the conditions
  above. We will use the shorthand notation

  <\equation>
    <label|eq:theta-gamma>\<theta\><rsub|\<Gamma\>><eqd>\<alpha\>\<beta\><around*|(|\<theta\>+\<gamma\>|)>,<space|2em>\<Theta\><rsub|\<Gamma\>><eqd><around*|{|\<theta\><rsub|\<Gamma\>>\<suchthat\>\<theta\>\<in\>\<Theta\>|}>;
  </equation>

  <math|><math|\<theta\><rsub|\<Gamma\>> >is an implicit function of
  <math|\<theta\>\<in\><R>>.\ 

  The map <math|\<Gamma\>> acts on trees and forests: we have that
  <math|\<Gamma\><around*|(|T|)>\<subset\>T<rsub|\<Theta\><rsub|\<Gamma\>>><around*|(|\<alpha\>\<xi\><rsub|T>,x<rsub|T>,s<rsub|T>|)>>
  and, in particular, \ 

  <\equation*>
    \<Gamma\>\<circ\>\<pi\><rsub|T><around|(|\<theta\>,\<zeta\>,\<sigma\>|)=>\<pi\><rsub|<around*|(|\<alpha\>\<xi\><rsub|T>,x<rsub|T>,s<rsub|T>|)>><around*|<left|(|1>|\<theta\><rsub|\<Gamma\>>,\<zeta\>,\<beta\>
    \<sigma\>|<right|)|1>>.
  </equation*>

  Furthermore, <math|\<Gamma\><around*|(|W|)>\<in\>\<bbb-T\><rsup|\<cup\>><rsub|\<Theta\><rsub|\<Gamma\>>>>
  for any <math|W\<in\><TT><rsup|\<cup\>><rsub|\<Theta\>>> and
  <math|\<mu\><rsub|\<Theta\>><rsup|<mf|p>><around*|(|W|)>\<geq\>\<mu\><rsub|\<Theta\><rsub|\<Gamma\>>><rsup|<mf|p>><around*|(|\<Gamma\><around*|(|W|)>|)>>
  for <math|<mf|p>\<in\><around*|{|1,\<infty\>|}>>. For any
  <math|f\<in\><Sch><around*|(|<R>|)>> we have that (cfr.
  <eqref|eq:piT-symmetry>)

  <\equation>
    <label|eq:piT-Gamma-symmetry><Emb><around*|[|f|]>\<circ\>\<Gamma\>\<circ\>\<pi\><rsub|T><around*|(|\<theta\>,\<zeta\>,\<sigma\>|)>=e<rsup|2
    \<pi\> i\<alpha\>\<xi\><rsub|T>s<rsub|T>\<zeta\>><Emb><around*|[|s<rsub|T><Dil><rsub|s<rsub|T><rsup|-1>><Mod><rsub|-\<alpha\>\<xi\><rsub|T>><Tr><rsub|-x<rsub|T>>f|]>\<circ\>\<pi\><rsub|<around*|(|0,0,1|)>><around*|(|\<theta\><rsub|\<Gamma\>>,\<zeta\>,\<beta\>\<sigma\>|)>.
  </equation>

  Next, we define pullbacks of the sizes introduced in <smart-ref|sec:sizes>:
  if <math|<SO>> is any of the local sizes defined so far define
  <math|\<Gamma\><rsup|\<ast\>><SO><rsub|<rsub|>\<Theta\>><around*|(|T|)>>
  for <math|T\<in\><TT><rsub|\<Theta\>>> so that for any
  <math|F\<in\><Rad><around*|(|<R><rsup|3><rsub|+>|)>\<otimes\>\<Phi\><rsub|<gr>><rsup|\<infty\>><rprime|'>>
  supported in compactly in <math|\<Gamma\><around*|(|T|)>> we have that

  <\equation*>
    <around*|\<\|\|\>|F\<circ\>\<Gamma\>|\<\|\|\>><rsub|\<Gamma\><rsup|\<ast\>><SO><rsub|<rsub|>\<Theta\>><around*|(|T|)>><rsub|>=<around*|\<\|\|\>|F|\<\|\|\>><rsub|<SO><rsub|\<Theta\><rsub|\<Gamma\>>><around*|(|T<rsub|\<Theta\><rsub|\<Gamma\>><rsub|>><around*|(|\<alpha\>\<xi\><rsub|T>,x<rsub|T>,s<rsub|T>|)>|)>><rsub|>.
  </equation*>

  \ The pullbacks of Lebesgue (local) sizes are then given by

  <\equation>
    <label|eq:gamma-Lebesgue-size><ltae|<tformat|<cwith|1|1|1|1|cell-halign|l>|<table|<row|<cell|<around|\<\|\|\>|F|\<\|\|\>><rsub|\<Gamma\><rsup|\<ast\>><SL|><rsup|<around|(|u,v|)>><rsub|\<Theta\>><around|(|T|)>><eqd><around|\<\|\|\>|F|\<\|\|\>><rsub|<SL|><rsup|<around|(|u,v|)>><rsub|\<Theta\>><around|(|T|)>>;>>>>>
  </equation>

  the pullbacks of the lacunary (local) sizes are given by\ 

  <\equation>
    <label|eq:gamma-lacunary-size><around|\<\|\|\>|F|\<\|\|\>><rsub|\<Gamma\><rsup|\<ast\>><SL><rsup|><rsub|><rsup|<around*|(|u,v|)>><rsub|\<Theta\>><wpD><rsub|<gr>><rsup|N<rsup|>><around|(|T|)>><eqd><around*|<left|\<\|\|\>|2>|<rsub|>\<Gamma\><rsup|\<ast\>><wpD><rsub|\<zeta\>><around*|<left|(|1>|t<around*|(|\<eta\>-\<xi\><rsub|T>|)>|<right|)|1>>
    F<rsub|><rsub|>|<right|\<\|\|\>|2>><rsub|<SL><rsup|><rsub|><rsup|<around*|(|u,v|)>><rsub|
    \<Theta\>>\<Phi\><rsub|<mf|r>><rsup|N><around|(|T|)>>,<space|2em>\<Gamma\><rsup|\<ast\>><wpD><rsub|\<zeta\>><around*|(|\<theta\>|)><eqd><wpD><rsub|\<zeta\>><around*|(|\<theta\><rsub|\<Gamma\>>|)>;
  </equation>

  the pullbacks of the defect (local) sizes are given by\ 

  <\equation>
    <ltae|<tformat|<cwith|1|2|1|1|cell-halign|l>|<cwith|2|3|1|1|cell-halign|l>|<cwith|3|3|1|1|cell-halign|l>|<table|<row|<cell|<around|\<\|\|\>|F|\<\|\|\>><rsub|\<Gamma\><rsup|\<ast\>><SL><rsub|\<Theta\><rsub|>><rsup|<around*|(|u,v|)>><rsub|><dfct><rsub|\<zeta\>,<gr>><rsup|N<rsup|>><around*|(|T|)>>\<assign\><around*|<left|\<\|\|\>|2>|<around*|<left|(|1>|\<Gamma\><rsup|\<ast\>><wpD><rsub|\<zeta\>><around*|<left|(|1>|t<around*|(|\<eta\>-\<xi\><rsub|T>|)>|<right|)|1>>-\<beta\>t\<partial\><rsub|y>+2\<pi\>i\<alpha\>\<xi\><rsub|T>|<right|)|1>>F|<right|\<\|\|\>|2>><rsub|<SL><rsub|\<Theta\>><rsup|<around*|(|u,v|)>>\<Phi\><rsub|<mf|r>><rsup|N><around|(|T|)>><rsub|>,>>|<row|<cell|<around|\<\|\|\>|F|\<\|\|\>><rsub|\<Gamma\><rsup|\<ast\>><SL><rsup|<around*|(|u,v|)>><rsub|\<Theta\><rsub|>><dfct><rsub|\<sigma\>,<gr>><rsup|N<rsup|>><around|(|T|)>>\<assign\><around*|<left|\<\|\|\>|2>|<around*|<left|(|-1>|\<Gamma\><rsup|\<ast\>><wpD><rsub|\<sigma\>><around*|<left|(|1>|t<around*|(|\<eta\>-\<xi\><rsub|T>|)>|<right|)|1>>-t\<partial\><rsub|t>+<around*|(|\<eta\>-\<xi\><rsub|T>|)>\<partial\><rsub|\<eta\>>|<right|)|-1>>F|<right|\<\|\|\>|2>><rsub|<SL><rsub|\<Theta\>><rsup|<around*|(|u,v|)>>\<Phi\><rsub|<mf|r>><rsup|N><around|(|T|)>>,>>|<row|<cell|\<Gamma\><rsup|\<ast\>><wpD><rsub|\<sigma\>><around*|(|\<theta\>|)><eqd><wpD><rsub|\<sigma\>><around*|(|\<theta\><rsub|\<Gamma\>>|)>.>>>>>
    <label|eq:gamma-defect-size>
  </equation>

  and we set <math|\<Gamma\><rsup|\<ast\>><SL><rsup|<around*|(|u,v|)>><rsub|\<Theta\><rsub|>><dfct><rsub|<gr>><rsup|N<rsup|>><around|(|T|)>=\<Gamma\><rsup|\<ast\>><SL><rsup|<around*|(|u,v|)>><rsub|\<Theta\><rsub|>><dfct><rsub|\<sigma\>,<gr>><rsup|N<rsup|>><around|(|T|)>+\<Gamma\><rsup|\<ast\>><SL><rsup|<around*|(|u,v|)>><rsub|\<Theta\><rsub|>><dfct><rsub|\<zeta\>,<gr>><rsup|N<rsup|>><around|(|T|)>>.
  Similarly to the computation <eqref|eq:embedded-no-defect>, using
  <eqref|eq:piT-Gamma-symmetry>, one can see that\ 

  <\equation>
    <label|eq:no-defect-gamma><ltae|<tformat|<cwith|1|1|1|1|cell-halign|l>|<table|<row|<cell|<around*|<left|(|1>|\<Gamma\><rsup|\<ast\>><wpD><rsub|\<zeta\>><around*|<left|(|1>|t<around*|(|\<eta\>-\<xi\><rsub|T>|)>|<right|)|1>>-\<beta\>t\<partial\><rsub|y>+2\<pi\>i\<alpha\>\<xi\><rsub|T>|<right|)|1>><Emb><around*|[|f|]>\<circ\>\<Gamma\>>>|<row|<cell|<space|1em>=<around*|<left|(|-1>|\<Gamma\><rsup|\<ast\>><wpD><rsub|\<sigma\>><around*|<left|(|1>|t<around*|(|\<eta\>-\<xi\><rsub|T>|)>|<right|)|1>>-t\<partial\><rsub|t>+<around*|(|\<eta\>-\<xi\><rsub|T>|)>\<partial\><rsub|\<eta\>>|<right|)|-1>><Emb><around*|[|f|]>\<circ\>\<Gamma\>=0.>>>>>
  </equation>

  We do not make use of the pullback of the local sizes
  <math|<SJ><rsub|\<Theta\><rsub|\<Gamma\>>><rsup|u>\<Phi\><rsub|<gr>><rsup|N><around*|(|T|)>>
  since this size only appear in relation to the term
  <math|<Emb><around*|[|f<rsub|1>|]>\<circ\>\<Gamma\><rsub|1>>, for which
  <math|\<Gamma\><rsub|1>=<Id>>.\ 

  Finally, we introduce frequency restricted variants of all the sizes above.
  Let us fix <math|<wide|\<Theta\>|~>\<subset\>\<Theta\>>; denoting by
  <math|<SO><rsub|\<Theta\>>> any of the (local) sizes above we set\ 

  <\equation>
    <label|eq:in-out-size><around|\<\|\|\>|F|\<\|\|\>><rsub|<SO><rsup|><rsub|<around*|(|\<Theta\>,<wide|\<Theta\>|~>|)>><around|(|T|)>>\<assign\><around|\<\|\|\>|<1><rsub|\<pi\><rsub|T><around*|(|<mT><rsub|<wide|\<Theta\>|~>>|)>>F|\<\|\|\>><rsub|<SO><rsup|><rsub|\<Theta\>><around|(|T|)>>,
  </equation>

  with <math|<mT|><rsub|<wide|\<Theta\>|~>><eqd><around*|<left|{|1>|<around|(|\<theta\>,\<zeta\>,\<sigma\>|)>\<in\><wide|\<Theta\>|~>\<times\>B<rsub|1>\<times\><around|(|0,1|)><st>\<sigma\>\<less\>1-<around|\||\<zeta\>|\|>|<right|}|1>>><math|>.
  Setting <math|<wide|\<Theta\>|~><rsub|\<Gamma\>><eqd><around*|{|\<theta\><rsub|\<Gamma\>>\<suchthat\>\<theta\>\<in\><wide|\<Theta\>|~>|}>>,
  we have that

  <\equation*>
    <around*|\<\|\|\>|F\<circ\>\<Gamma\>|\<\|\|\>><rsub|\<Gamma\><rsup|\<ast\>><SO><rsub|<rsub|><around*|(|\<Theta\>,<wide|\<Theta\>|~>|)>><around*|(|T|)>><rsub|>=<around*|\<\|\|\>|F|\<\|\|\>><rsub|<SO><rsub|<around*|(|\<Theta\><rsub|\<Gamma\>>,<wide|\<Theta\>|~><rsub|\<Gamma\>>|)>><around*|(|T<rsub|\<Theta\><rsub|\<Gamma\>><rsub|>><around*|(|\<alpha\>\<xi\><rsub|T>,x<rsub|T>,s<rsub|T>|)>|)>><rsub|>
  </equation*>

  for any <math|F\<in\><Rad><around*|(|<R><rsup|3><rsub|+>|)>\<otimes\>\<Phi\><rsub|<gr>><rsup|\<infty\>><rprime|'>>
  supported compactly in <math|\<Gamma\><around*|(|T|)>>. This concludes the
  definition of the pullback sizes and provides us with all the elements
  necessary to understand the terms on the
  <RHS|<eqref|eq:uniform-embedding-full-size:linear>> that comprise
  <math|<SU><rsup|u><rsub|\<Gamma\>>\<Phi\><rsub|<mf|r>><rsup|N>>. The single
  summands in <eqref|eq:uniform-embedding-full-size:linear> are related to
  the local sizes above through <eqref|eq:generated-size:trees>.

  To control the product term

  <\equation*>
    <big|prod><rsub|j=1><rsup|3><Emb><around*|[|f<rsub|j>|]>\<circ\>\<Gamma\><rsub|j>
  </equation*>

  appearing on the <RHS|<eqref|eq:RN-domination-BHT>> we introduce the sizes
  <math|<SI><rsub|\<Theta\>><rsup|<around*|(|o|)>>\<Phi\><rsub|<gr>><rsup|N>>
  and <math|<SI><rsub|\<Theta\>><rsup|<around*|(|l|)>>\<Phi\><rsub|<gr>><rsup|N>><math|>.
  These sizes together are large enough to satisfy the hypothesis of
  <smart-ref|prop:outer-RN>, necessary for showing
  <smart-ref|eq:RN-domination-BHT>. On the other hand, to show that
  <smart-ref|eq:iterated-Holder-type-bounds:linear> and
  <smart-ref|eq:iterated-Holder-type-bounds:bilinear>, the size
  <math|<SI><rsub|\<Theta\>><rsup|<around*|(|o|)>>\<Phi\><rsub|<gr>><rsup|N>>
  and <math|<SI><rsub|\<Theta\>><rsup|<around*|(|l|)>>\<Phi\><rsub|<gr>><rsup|N>>
  have to be sufficiently small to be able to control them by the sizes
  <math|<SF><rsup|u><rsub|\<Theta\>>\<Phi\><rsub|<gr>><rsup|N>> of
  <math|<Emb><around*|[|f<rsub|1>|]>>, by the sizes
  <math|<SU><rsup|u<rsub|j>><rsub|\<Gamma\><rsub|j>>\<Phi\><rsub|<gr>><rsup|N>>
  of the functions <math|<Emb><around*|[|f<rsub|j>|]>\<circ\>\<Gamma\><rsub|j>>,
  <math|j\<in\><around*|{|2,3|}>>, and by the size
  <math|<SU><rsup|u<rsub|\<times\>>><rsub|\<Gamma\><rsub|\<times\>>>\<Phi\><rsub|<gr>><rsup|N>>
  of <math|<Emb><around*|[|f<rsub|2>|]>\<circ\>\<Gamma\><rsub|2>
  <Emb><around*|[|f<rsub|3>|]>\<circ\>\<Gamma\><rsub|3>>.\ 

  <\definition>
    <label|def:integral-sizes><dueto|Integral size>Let us fix
    <math|\<omega\>\<in\>\<Phi\><rsub|1><rsup|\<infty\>>> such that
    <math|<FT|\<omega\>><around*|(|<FT|z>|)>=1> for
    <math|<FT|z>\<in\>B<rsub|7/8>>. For any
    <math|\<phi\>\<in\>\<Phi\><rsub|<gr>/2><rsup|\<infty\>>> and
    <math|j\<in\><around*|{|1,2,3|}>> let

    <\equation>
      <label|eq:lac-ov-wp-decomp> \<phi\><rsub|j,\<theta\>><rsup|o><around*|(|z|)><eqd><FT|\<phi\>><rsub|><around*|(|\<theta\><rsub|\<Gamma\><rsub|j>>|)><Dil><rsub|<gr><rsup|-1>>\<omega\><around*|(|z|)>,<space|2em>\<phi\><rsub|j,\<theta\>><rsup|l><around*|(|z|)><eqd>\<phi\><around*|(|z|)>-<FT|\<phi\>><around*|(|\<theta\><rsub|\<Gamma\><rsub|j>>|)><Dil><rsub|<gr><rsup|-1>>\<omega\><around*|(|z|)>.
    </equation>

    For any <math|<around*|(|\<star\><rsub|1>,\<star\><rsub|2>,\<star\><rsub|3>|)>\<in\><around*|{|o,l|}><rsup|3>>,
    \ <math|H\<in\><Rad><around*|(|<R><rsup|3><rsub|+>|)>\<otimes\><rsup|3>\<Phi\><rsub|<gr>><rsup|\<infty\>><rprime|'>>,
    and <math|T\<in\>\<bbb-T\><rsub|\<Theta\>>>, set\ 

    <\equation*>
      <ltae|<tformat|<table|<row|<cell|<around*|\<\|\|\>|H|\<\|\|\>><rsub|<SI><rsup|<around*|(|\<star\><rsub|1>,\<star\><rsub|2>,\<star\><rsub|3>|)>><rsub|\<Theta\>>\<Phi\><rsub|<gr>><rsup|N><around*|(|T|)>><space|2em>>>|<row|<cell|<space|1em><eqd>sup<rsub|<tabular*|<tformat|<table|<row|<cell|\<phi\>>>>>>>
      liminf<rsub|\<epsilon\>\<rightarrow\>0><big|int><rsub|\<Theta\>><around*|\||<big|int><rsub|\<epsilon\>><rsup|\<infty\>><around*|(|<1><rsub|T>H|)>\<circ\>\<pi\><rsub|T><around*|(|\<theta\>,\<zeta\>,\<sigma\>|)><around*|<left|[|1>|\<phi\><rsub|1,\<theta\>><rsup|\<star\><rsub|1>>,\<phi\><rsub|2,\<theta\>><rsup|\<star\><rsub|2>>,\<phi\><rsub|3,\<theta\>><rsup|\<star\><rsub|3>>|<right|]|1>><dd>\<zeta\><frac|<dd>\<sigma\>|\<sigma\>>|\|><frac|<dd>\<theta\>|<around*|\||\<Theta\>|\|>>,>>>>>
    </equation*>

    where the upper bound is taken over <math|\<phi\>\<in\>\<Phi\><rsub|<gr>/2><rsup|\<infty\>>>
    with <math|<around*|\<\|\|\>|\<phi\>|\<\|\|\>><rsub|\<Phi\><rsub|<gr>/2><rsup|N>>\<leq\>1>.
    Set

    <\equation*>
      <around*|\<\|\|\>|H|\<\|\|\>><rsub|<SI><rsup|<around*|(|o|)>><rsub|\<Theta\>>\<Phi\><rsub|<gr>><rsup|N><around*|(|T|)>><eqd><around*|\<\|\|\>|H|\<\|\|\>><rsub|<SI><rsup|<around*|(|l,o,o|)>><rsub|\<Theta\>>\<Phi\><rsub|<gr>><rsup|N><around*|(|T|)>>+<around*|\<\|\|\>|H|\<\|\|\>><rsub|<SI><rsup|<around*|(|o,o,o|)>><rsub|\<Theta\>>\<Phi\><rsub|<gr>><rsup|N><around*|(|T|)>>
    </equation*>

    and

    <\equation*>
      <around*|\<\|\|\>|H|\<\|\|\>><rsub|<SI><rsup|<around*|(|l|)>><rsub|\<Theta\>>\<Phi\><rsub|<gr>><rsup|N><around*|(|T|)>><eqd><big|sum><rsub|<around*|(|\<star\><rsub|1>,\<star\><rsub|2>,\<star\><rsub|3>|)>><around*|\<\|\|\>|H|\<\|\|\>><rsub|<SI><rsup|<around*|(|\<star\><rsub|1>,\<star\><rsub|2>,\<star\><rsub|3>|)>><rsub|\<Theta\>>\<Phi\><rsub|<gr>><rsup|N><around*|(|T|)>>
    </equation*>

    where the sum in the last entry is taken over all combinations of symbols
    <math|<around*|(|\<star\><rsub|1>,\<star\><rsub|2>,\<star\><rsub|3>|)>\<in\><around*|{|o,l|}><rsup|3>>
    except <math|<around*|(|l,o,o|)>> and <math|<around*|(|o,o,o|)>>.
  </definition>

  <subsubsection|Bilinear sizes>

  Bounding the term\ 

  <\equation*>
    <around*|<left|\<\|\|\>|1>|<Emb><around*|[|f<rsub|1>|]>
    <Emb><around*|[|f<rsub|2>|]>\<circ\>\<Gamma\><rsub|2><Emb><around*|[|f<rsub|3>|]>\<circ\>\<Gamma\><rsub|3>|<right|\<\|\|\>|1>><rsub|<SI><rsup|<around*|(|o|)>><rsub|\<Theta\>>\<Phi\><rsub|<gr>><rsup|N>>
  </equation*>

  on <LHS|<eqref|eq:STE:l-o-o>> (<smart-ref|thm:STE>) requires controlling
  quantities encode in the size <math|<SU><rsup|u><rsub|\<Gamma\><rsub|\<times\>>>\<Phi\><rsub|<gr>><rsup|N>>.
  In general, given two function <math|G<rsub|2>,G<rsub|3>\<in\>L<rsup|\<infty\>><rsub|loc><around*|(|<R><rsup|3><rsub|+>|)>\<otimes\>
  \<Phi\><rsub|<gr>><rsup|\<infty\>><rprime|'>> their pointwise product is a
  function in <math|G<rsub|\<times\>>\<in\>L<rsup|\<infty\>><rsub|loc><around*|(|<R><rsup|3><rsub|+>|)>\<otimes\><rsup|2>
  \<Phi\><rsub|<gr>><rsup|\<infty\>><rprime|'>> given by

  <\equation*>
    G<rsub|\<times\>><around*|(|\<eta\>,y,t|)><around*|[|\<phi\><rsub|2>,\<phi\><rsub|3>|]><eqd>G<rsub|2><around*|(|\<eta\>,y,t|)><around*|[|\<phi\><rsub|2>|]>G<rsub|3><around*|(|\<eta\>,y,t|)><around*|[|\<phi\><rsub|3>|]>.
  </equation*>

  This brings us to define the following product (local) sizes indexed by
  <math|T\<in\><TT><rsub|\<Theta\>>> on functions
  <math|H\<in\><Rad><around*|(|<R><rsup|3><rsub|+>|)>\<otimes\><rsup|2>
  \<Phi\><rsub|<gr>><rsup|\<infty\>><rprime|'>>. In our notation, we
  \Premember\Q both diffeomorphisms <math|\<Gamma\><rsub|2>> and
  <math|\<Gamma\><rsub|3>> by including the symbol
  <math|\<Gamma\><rsub|\<times\>><rsup|\<ast\>>>. The product Lebesgue local
  size is given by

  <\equation>
    <label|eq:product-tensor-sizes-Lebesgue><around*|\<\|\|\>|H|\<\|\|\>><rsub|\<Gamma\><rsub|\<times\>><rsup|\<ast\>><SL|><rsup|<around|(|u,v|)>><rsub|\<Theta\>><around*|(|\<Phi\>\<otimes\>\<Phi\>|)><rsub|<gr>><rsup|N><around|(|T|)>><eqd>sup<rsub|<tabular*|<tformat|<table|<row|<cell|\<phi\><rsub|2>,\<phi\><rsub|3>>>>>>><around|\<\|\|\>|H<around*|[|\<phi\><rsub|2>,\<phi\><rsub|3>|]>|\<\|\|\>><rsub|<SL|><rsup|<around|(|u,v|)>><rsub|\<Theta\>><around|(|T|)>>
  </equation>

  where the upper bound is taken over all
  <math|\<phi\><rsub|j>\<in\>\<Phi\><rsub|<gr>><rsup|\<infty\>>> with
  <math|<around*|\<\|\|\>|\<phi\><rsub|j>|\<\|\|\>><rsub|\<Phi\><rsub|<gr>><rsup|N>>\<leq\>1>,
  <math|j\<in\><around*|{|2,3|}>>. The product lacunary local sizes, with
  <math|\<theta\><rsub|\<Gamma\><rsub|j>><eqd>\<alpha\><rsub|j>\<beta\><rsub|j><around*|(|\<theta\>+\<gamma\><rsub|j>|)>>,
  <math|j\<in\><around*|{|2,3|}>>, are given by

  <\equation>
    <label|eq:product-tensor-sizes><ltae|<tformat|<cwith|1|1|1|1|cell-halign|r>|<cwith|2|2|1|1|cell-halign|l>|<cwith|3|3|1|1|cell-halign|l>|<table|<row|<cell|<around|\<\|\|\>|H|\<\|\|\>><rsub|\<Gamma\><rsub|\<times\>><rsup|\<ast\>><SL><rsup|><rsub|><rsup|<around*|(|u,v|)>><rsub|
    \<Theta\>><around*|(|\<Phi\>\<otimes\><wpD>|)><rsub|<gr>><rsup|N<rsup|>><around|(|T|)>><eqd><around*|<left|\<\|\|\>|2>|<rsub|><around*|<left|(|1>|<Id>\<otimes\><rsub|>\<Gamma\><rsup|\<ast\>><rsub|3><wpD><rsub|\<zeta\>><around*|(|t<around*|(|\<eta\>-\<xi\><rsub|T>|)>|)>|<right|)|1>>H|<right|\<\|\|\>|2>><rsub|\<Gamma\><rsub|\<times\>><rsup|\<ast\>><SL|><rsup|<around|(|u,v|)>><rsub|\<Theta\>><around*|(|\<Phi\>\<otimes\>\<Phi\>|)><rsub|<gr>><rsup|N><around|(|T|)>>,>>|<row|<cell|<around|\<\|\|\>|H|\<\|\|\>><rsub|\<Gamma\><rsub|\<times\>><rsup|\<ast\>><SL><rsup|><rsub|><rsup|<around*|(|u,v|)>><rsub|
    \<Theta\>><around*|(|<wpD>\<otimes\>\<Phi\>|)><rsub|<gr>><rsup|N<rsup|>><around|(|T|)>><eqd><around*|<left|\<\|\|\>|2>|<rsub|><around*|<left|(|1>|\<Gamma\><rsup|\<ast\>><rsub|2><wpD><rsub|\<zeta\>><around*|(|t<around*|(|\<eta\>-\<xi\><rsub|T>|)>|)>\<otimes\><Id>|<right|)|1>>H|<right|\<\|\|\>|2>><rsub|\<Gamma\><rsub|\<times\>><rsup|\<ast\>><SL|><rsup|<around|(|u,v|)>><rsub|\<Theta\>><around*|(|\<Phi\>\<otimes\>\<Phi\>|)><rsub|<gr>><rsup|N><around|(|T|)>>,>>|<row|<cell|<ltae|<tformat|<table|<row|<cell|<around|\<\|\|\>|H|\<\|\|\>><rsub|\<Gamma\><rsub|\<times\>><rsup|\<ast\>><SL><rsup|><rsub|><rsup|<around*|(|u,v|)>><rsub|
    \<Theta\>><around*|(|<wpD>\<otimes\><wpD>|)><rsub|<gr>><rsup|N<rsup|>><around|(|T|)>>>>|<row|<cell|<space|1em><eqd><around*|<left|\<\|\|\>|2>|<rsub|><around*|<left|(|2>|\<Gamma\><rsup|\<ast\>><rsub|2><wpD><rsub|\<zeta\>><around*|<left|(|1>|t<around*|(|\<eta\>-\<xi\><rsub|T>|)>|<right|)|1>>\<otimes\>\<Gamma\><rsup|\<ast\>><rsub|3><wpD><rsub|\<zeta\>><around*|<left|(|1>|t<around*|(|\<eta\>-\<xi\><rsub|T>|)>|<right|)|1>>|<right|)|2>>H<rsub|><rsub|>|<right|\<\|\|\>|2>><rsub|\<Gamma\><rsub|\<times\>><rsup|\<ast\>><SL|><rsup|<around|(|u,v|)>><rsub|\<Theta\>><around*|(|\<Phi\>\<otimes\>\<Phi\>|)><rsub|<gr>><rsup|N><around|(|T|)>>.>>>>>>>>>>
  </equation>

  The linear operators <math|<around*|<left|(|1>|<Id>\<otimes\><rsub|>\<Gamma\><rsup|\<ast\>><rsub|3><wpD><rsub|\<zeta\>><around*|(|\<theta\>|)>|<right|)|1>>>,
  <math|<around*|(|\<Gamma\><rsup|\<ast\>><rsub|2><wpD><rsub|\<zeta\>><around*|(|\<theta\>|)>\<otimes\><Id>|)>>,
  and <math|<around*|(|\<Gamma\><rsup|\<ast\>><rsub|2><wpD><rsub|\<zeta\>><around*|(|\<theta\>|)>\<otimes\>\<Gamma\><rsup|\<ast\>><rsub|3><wpD><rsub|\<zeta\>><around*|(|\<theta\>|)>|)>>,
  defined on functions <math|H\<in\><Rad><around|(|<R><rsup|3><rsub|+>|)>\<otimes\><rsup|2>\<Phi\><rsub|<gr>><rsup|\<infty\>><rprime|'>>,
  are given by

  <\equation>
    <label|eq:tensor-boost><ltae|<tformat|<cwith|2|2|1|1|cell-halign|l>|<cwith|1|1|1|1|cell-halign|l>|<cwith|3|3|1|1|cell-halign|l>|<table|<row|<cell|<around*|<left|(|1>|<Id>\<otimes\>\<Gamma\><rsup|\<ast\>><rsub|3><wpD><rsub|\<zeta\>><around*|(|\<theta\>|)>|<right|)|1>>H<around|(|\<theta\>,\<zeta\>,\<sigma\>|)><around|[|\<phi\><rsub|2>,\<phi\><rsub|3>|]><eqd>H<around*|(|\<theta\>,\<zeta\>,\<sigma\>|)><around*|<left|[|1>|\<phi\><rsub|2>,<around*|(|-d<rsub|z>+2
    \<pi\> i\<theta\><rsub|\<Gamma\><rsub|3>>|)>\<phi\><rsub|3><around*|(|z|)>|<right|]|1>>,>>|<row|<cell|<around*|<left|(|1>|\<Gamma\><rsup|\<ast\>><rsub|2><wpD><rsub|\<zeta\>><around*|(|\<theta\>|)>\<otimes\><Id>|<right|)|1>>H<around|(|\<theta\>,\<zeta\>,\<sigma\>|)><around|[|\<phi\><rsub|2>,\<phi\><rsub|3>|]><eqd>H<around*|(|\<theta\>,\<zeta\>,\<sigma\>|)><around*|<left|[|1>|<around*|(|-d<rsub|z>+2
    \<pi\> i\<theta\><rsub|\<Gamma\><rsub|2>>|)>\<phi\><rsub|2><around*|(|z|)>,\<phi\><rsub|3>|<right|]|1>>,>>|<row|<cell|<ltae|<tformat|<cwith|1|1|1|1|cell-halign|l>|<table|<row|<cell|<around*|<left|(|1>|\<Gamma\><rsup|\<ast\>><rsub|2><wpD><rsub|\<zeta\>><around*|(|\<theta\>|)>\<otimes\>\<Gamma\><rsup|\<ast\>><rsub|3><wpD><rsub|\<zeta\>><around*|(|\<theta\>|)>|<right|)|1>>H<around|(|\<theta\>,\<zeta\>,\<sigma\>|)><around|[|\<phi\><rsub|2>,\<phi\><rsub|3>|]>>>|<row|<cell|<space|1em><eqd>H<around*|(|\<theta\>,\<zeta\>,\<sigma\>|)><around*|<left|[|1>|<around*|(|-d<rsub|z>+2
    \<pi\> i\<theta\><rsub|\<Gamma\><rsub|2>>|)>\<phi\><rsub|2><around*|(|z|)>,<around*|(|-d<rsub|z>+2
    \<pi\> i\<theta\><rsub|\<Gamma\><rsub|3>>|)>\<phi\><rsub|2><around*|(|z|)>|<right|]|1>>>>>>>>>>>>
  </equation>

  To define product defect sizes, we also introduce the operators
  <math|<around*|(|<Id>\<otimes\>\<Gamma\><rsup|\<ast\>><rsub|3><wpD><rsub|\<sigma\>><around*|(|\<theta\>|)>|)>>,
  <math|<around*|(|\<Gamma\><rsup|\<ast\>><rsub|2><wpD><rsub|\<sigma\>><around*|(|\<theta\>|)>\<otimes\><Id>|)>>
  and <math|<around*|(|\<Gamma\><rsup|\<ast\>><rsub|2><wpD><rsub|\<sigma\>><around*|(|\<theta\>|)>\<otimes\>\<Gamma\><rsup|\<ast\>><rsub|3><wpD><rsub|\<sigma\>><around*|(|\<theta\>|)>|)>>
  analogously to <eqref|eq:tensor-boost> with <math|<wpD><rsub|\<sigma\>>> in
  place of <math|<wpD><rsub|\<zeta\>>>. We set\ 

  <\equation>
    <label|eq:product-space-defect><ltae|<tformat|<cwith|1|1|1|1|cell-halign|l>|<table|<row|<cell|<around|\<\|\|\>|H|\<\|\|\>><rsub|\<Gamma\><rsup|\<ast\>><rsub|\<times\>><SL><rsub|\<Theta\>><rsup|<around*|(|u,v|)>><rsub|><dfct><rsub|\<zeta\>,<gr><rsub|>><rsup|N<rsup|>><around*|(|T|)>>>>|<row|<cell|<space|1em><eqd><around*|<left|\<\|\|\>|2>|<around*|<left|(|1>|\<Gamma\><rsup|\<ast\>><rsub|2><wpD><rsub|\<zeta\>><around*|(|\<theta\>|)>\<otimes\>Id+Id\<otimes\>\<Gamma\><rsup|\<ast\>><rsub|3><wpD><rsub|\<zeta\>><around*|(|\<theta\>|)>-\<beta\>t\<mathd\><rsub|y>+2\<pi\>i<around*|(|\<alpha\><rsub|2>+\<alpha\><rsub|3>|)>\<xi\><rsub|T>|<right|)|1>>H|<right|\<\|\|\>|2>><rsub|\<Gamma\><rsub|\<times\>><rsup|\<ast\>><SL|><rsup|<around|(|u,v|)>><rsub|\<Theta\>><around*|(|\<Phi\>\<otimes\>\<Phi\>|)><rsub|<gr>><rsup|N><around|(|T|)>>,>>>>>
  </equation>

  <\equation>
    <label|eq:product-scale-defect><ltae|<tformat|<cwith|1|1|1|1|cell-halign|l>|<table|<row|<cell|<around|\<\|\|\>|H|\<\|\|\>><rsub|\<Gamma\><rsup|\<ast\>><rsub|\<times\>><SL><rsub|\<Theta\>><rsup|<around*|(|u,v|)>><rsub|><dfct><rsub|\<sigma\>,<gr><rsub|>><rsup|N<rsup|>><around*|(|T|)>>>>|<row|<cell|<space|1em><eqd><ltae|<tformat|<table|<row|<cell|<around*|<left|\<\|\|\>|3>|<around*|<left|(|1>|\<Gamma\><rsup|\<ast\>><rsub|2><wpD><rsub|\<sigma\>><around*|(|\<theta\><rsub|>|)>\<otimes\>Id+Id\<otimes\>\<Gamma\><rsup|\<ast\>><rsub|3><wpD><rsub|\<sigma\>><around*|(|\<theta\><rsub|>|)>-t<dd><rsub|t>+<around*|(|\<eta\>-\<xi\><rsub|T>|)><dd><rsub|\<eta\>>|<right|)|1>>H|<right|\<\|\|\>|3>><rsub|\<Gamma\><rsub|\<times\>><rsup|\<ast\>><SL|><rsup|<around|(|u,v|)>><rsub|\<Theta\>><around*|(|\<Phi\>\<otimes\>\<Phi\>|)><rsub|<gr>><rsup|N><around|(|T|)>>.>>>>>>>>>>
  </equation>

  <math|\<Gamma\><rsup|\<ast\>><rsub|\<times\>><SL><rsub|\<Theta\>><rsup|<around*|(|u,v|)>><rsub|><dfct><rsub|<gr><rsub|>><rsup|N<rsup|>><around*|(|T|)><eqd>\<Gamma\><rsup|\<ast\>><rsub|\<times\>><SL><rsub|\<Theta\>><rsup|<around*|(|u,v|)>><rsub|><dfct><rsub|\<zeta\>,<gr><rsub|>><rsup|N<rsup|>><around*|(|T|)>+\<Gamma\><rsup|\<ast\>><rsub|\<times\>><SL><rsub|\<Theta\>><rsup|<around*|(|u,v|)>><rsub|><dfct><rsub|\<sigma\>,<gr><rsub|>><rsup|N<rsup|>><around*|(|T|)>>.\ 

  Similarly to the computation <eqref|eq:embedded-no-defect>, using
  <eqref|eq:piT-Gamma-symmetry>, one can see that\ 

  <\equation>
    <label|eq:no-defect-product><around*|<left|(|1>|\<Gamma\><rsup|\<ast\>><rsub|2><wpD><rsub|\<zeta\>><around*|(|\<theta\>|)>\<otimes\>Id+Id\<otimes\>\<Gamma\><rsup|\<ast\>><rsub|3><wpD><rsub|\<zeta\>><around*|(|\<theta\>|)>-\<beta\>t\<mathd\><rsub|y>+2\<pi\>i<around*|(|\<alpha\><rsub|2>+\<alpha\><rsub|3>|)>\<xi\><rsub|T>|<right|)|1>>H=0
  </equation>

  if <math|H=<Emb><around*|[|f<rsub|2>|]>\<circ\>\<Gamma\><rsub|2>
  <Emb><around*|[|f<rsub|3>|]>\<circ\>\<Gamma\><rsub|3>>.

  This concludes the definition of the bilinear sizes and provides us with
  all the elements necessary to understand
  <eqref|eq:uniform-embedding-full-size:bilinear> that defines the size
  <math|<SU><rsup|u><rsub|\<Gamma\><rsub|\<times\>>>\<Phi\><rsub|<gr>><rsup|N>>.
  The single summands in <eqref|eq:uniform-embedding-full-size:bilinear> are
  related to the local sizes above through <eqref|eq:generated-size:trees>.

  The size <math|<around*|\<\|\|\>|F<rsub|2>\<circ\>\<Gamma\><rsub|2>F<rsub|3>\<circ\>\<Gamma\><rsub|3>|\<\|\|\>><rsub|<SU><rsup|u><rsub|\<Gamma\><rsub|\<times\>>>\<Phi\><rsub|<gr>><rsup|N>>>
  in <eqref|eq:uniform-embedding-full-size:bilinear> cannot be bounded
  uniformly by products of sizes \ of the functions
  <math|F<rsub|j>\<circ\>\<Gamma\><rsub|j>>, <math|j\<in\><around*|{|2,3|}>>.
  This is a bilinear feature dependent on the interaction between the two
  functions in play. We believe that our inability to control
  <LHS|<eqref|eq:STE:l-o-o>> by products of sizes of
  <math|<Emb><around*|[|f<rsub|2>|]>\<circ\>\<Gamma\><rsub|2>> and
  <math|<Emb><around*|[|f<rsub|3>|]>\<circ\>\<Gamma\><rsub|3>> is intrinsic
  and not a shortcoming of the current method.\ 

  <subsection|Localized outer Lebesgue spaces<label|sec:localized-outer-lebesgue>>

  In this section we localize the outer Lebesgue quasi-norms
  <math|L<rsup|p><rsub|\<mu\><rsup|<mf|p>><rsub|\<Theta\>>><SO>> to
  distinguished spatial regions. Iterated outer measure spaces have appeared
  in the context of non-uniform bounds in <eqref|eq:BHT-dual-bounds>. In the
  range of exponents <math|><math|p<rsub|j>\<in\><around*|(|2,\<infty\>|]>>,
  <math|j\<in\><around*|{|1,2,3|}>> (triangle <math|c> in
  <smart-ref|fig:triangle>) it is possible avoid this construction (see
  <cite|doTheoryOuterMeasures2015>). Introducing localization is necessary to
  prove <eqref|eq:BHT-dual-bounds> elsewhere since the embedding bounds\ 

  <\equation*>
    <around*|\<\|\|\>|<Emb><around*|[|f<rsub|j>|]>\<circ\>\<Gamma\><rsub|j>|\<\|\|\>><rsub|L<rsup|p<rsub|j>><rsub|\<mu\><rsup|1><rsub|\<Theta\>>><SO><rsub|en,j>>\<lesssim\><around*|\<\|\|\>|f<rsub|j>|\<\|\|\>><rsub|L<rsup|p<rsub|j>><around*|(|<R>|)>>.
  </equation*>

  are known to fail when <math|p<rsub|j>\<less\>2>. Iterated outer Lebesgue
  norms can be thought of as analogues of product Lebesgue norms in the outer
  Lebesgue setting. The symbols <math|<fL><rsup|q,+><rsub|\<mu\><rsub|\<Theta\>><rsup|\<infty\>>,\<nu\><rsub|1>>>,
  <math|<fL><rsup|q<rsub|>,+><rsub|\<mu\><rsub|\<Theta\>><rsup|1>,\<nu\><rsub|\<beta\>>>>,
  and <math|X<rsup|q,r,+><rsub|\<mu\><rsup|1><rsub|\<Theta\>>,\<nu\><rsub|\<beta\>>>>,
  defined below, play the role of sizes on analogues of fibers (in our setup:
  strips). These sizes are themselves outer Lebesgue quasi-norms on said
  fibers. This is in analogy to the classical fact that the product Lebesgue
  norm

  <\equation*>
    <around*|\<\|\|\>|f<around*|(|x,y|)>|\<\|\|\>><rsub|L<rsup|p><rsub|x\<in\><R>>L<rsup|q><rsub|y\<in\><R>>>
  </equation*>

  is obtained by taking the Lebesgue norm <math|L<rsup|p><rsub|x\<in\><R>>>
  of the function <math|x\<mapsto\><around*|\<\|\|\>|f<around*|(|x,y|)>|\<\|\|\>><rsub|L<rsup|q><rsub|y\<in\><R>>>>
  where, effectively, the magnitude of the function on each fiber
  <math|<around*|{|x|}>\<times\><R>> is measured by taking its
  <math|L<rsup|q>> norm. The difficulty in our setup is that different
  fibers, or \Pstrips\Q, are not necessarily disjoint the same way as
  different trees are not necessarily disjoint either. A more complete
  discussion of these analogies is carried out in <cite|DualityOuterMu>.\ 

  \ We begin by introducing a family of distinguished sets:
  <math|\<beta\>>-<with|font-shape|italic|<math|>strips>. Countable unions
  thereof will play the role of a <math|\<sigma\>>-generating collection. The
  geometry of strips depend on the parameter
  <math|\<beta\>\<in\><around*|(|0,1|]>>, that also intervenes in the
  definition of each map <math|\<Gamma\><rsub|j>>, and associated trees and
  sizes (discussed in <smart-ref|sec:derived-sizes>).\ 

  <\definition>
    <dueto|Strips and strip outer measure>Let
    <math|\<beta\>\<in\><around*|(|0,1|]>>. A strip
    <math|D<rsub|\<beta\>><around*|(|x<rsub|D>,s<rsub|D>|)>> with top
    <math|<around*|(|x<rsub|D>,s<rsub|D>|)>\<in\><R><rsup|2><rsub|+>> is the
    subset of <math|<R><rsup|3><rsub|+>> given by\ 

    <\equation*>
      D<rsub|\<beta\><rsup|<rsub|>>><around*|(|x<rsub|D>,s<rsub|D>|)>=<around*|<left|{|2>|<around*|(|\<eta\>,y,t|)>\<over\>\<beta\>t\<less\>\<beta\><around*|(|s<rsub|T>-<around*|\||y-x<rsub|T>|\|>|)>|<right|}|2>>.
    </equation*>

    We denote by <math|\<bbb-D\><rsub|\<beta\><rsup|>>> the collection of all
    strips <math|D<rsub|\<beta\>><around*|(|x<rsub|T>,s<rsub|T>|)>>. The
    outer measure <math|\<nu\><rsub|\<beta\>><around*|(|E|)>> is given by

    <\equation*>
      <ltae|<tformat|<table|<row|<cell|\<nu\><rsub|\<beta\>><around*|(|E|)><eqd>inf
      <around*|<left|{|-2>|<around|\<\|\|\>|N<rsub|<mc|D>><around|(|z|)>|\<\|\|\>><rsub|L<rsup|1><rsub|<dd>z><around|(|<R>|)>><st><mc|D>\<subset\><DD><rsub|\<beta\>>,<space|0.27em>E\<subset\><big|cup><rsub|D\<in\><mc|D>>D|<right|}|-2>>,>>|<row|<cell|<text|where
      >N<rsub|<mc|D>><around|(|z|)><eqd><big|sum><rsub|D\<in\><mc|D>><1><rsub|B<rsub|s<rsub|T>><around|(|x<rsub|T>|)>><around|(|z|)>.>>>>>
    </equation*>
  </definition>

  Countable unions of strips in <math|<DD><rsub|\<beta\>>>, called
  <math|\<beta\>>-sawtooth reguions, are denoted by \ by
  <math|\<bbb-D\><rsub|\<beta\><rsup|>><rsup|\<cup\>>>. They are a generating
  collection of the measure <math|\<nu\><rsub|\<beta\>>>. There is a
  one-to-one correspondence between the datum
  <math|\<beta\>,<around*|(|x<rsub|D>,s<rsub|D>|)>> and a given strip. We
  call <math|B<rsub|s<rsub|D>><around|(|x<rsub|D>|)>> the spatial interval of
  a strip. \ 

  We define two ways to localize the outer Lebesgue quasi-norms
  <math|L<rsup|q><rsub|\<mu\><rsup|<mf|p>><rsub|\<Theta\>>><SO>> to unions of
  strips; here <math|<SO>> can be any size on
  <math|<Rad><around*|(|<R><rsup|3><rsub|+>|)>\<otimes\><rsup|k>\<Phi\><rsub|<gr>><rsup|\<infty\>><rprime|'>>.\ 

  <\definition>
    <label|def:localized-outer-lebesgue><dueto|Localized outer Lebesgue
    quasi-norms> Let <math|\<beta\>\<in\><around*|(|0,1|]>> and let
    <math|<SO>> be a size on <math|<Rad><around*|(|<R><rsup|3><rsub|+>|)>\<otimes\><rsup|k>\<Phi\><rsub|<gr>><rsup|\<infty\>><rprime|'>>.
    For <math|<Rad><around*|(|<R><rsup|3><rsub|+>|)>\<otimes\><rsup|k>\<Phi\><rsub|<gr>><rsup|\<infty\>><rprime|'>>
    and <math|V<rsup|+>\<in\><DD><rsub|\<beta\>><rsup|\<cup\>>> set

    <\equation*>
      <around*|\<\|\|\>|F|\<\|\|\>><rsub|<fL><rsup|q><rsub|\<mu\><rsup|\<infty\>><rsub|\<Theta\>>,\<nu\><rsub|\<beta\>>><SO><around*|(|V<rsup|+>|)>><eqd><around*|\<\|\|\>|<1><rsub|V<rsup|+>>F|\<\|\|\>><rsub|L<rsup|q><rsub|\<mu\><rsup|\<infty\>><rsub|\<Theta\>>><SO>>,<space|2em><around*|\<\|\|\>|F|\<\|\|\>><rsub|<fL><rsup|q,+><rsub|\<mu\><rsup|\<infty\>><rsub|\<Theta\>>,\<nu\><rsub|\<beta\>>><SO><around*|(|V<rsup|+>|)>><eqd>sup<rsub|<wide|q|\<bar\>>\<in\><around*|[|q,\<infty\>|]>><around*|\<\|\|\>|F|\<\|\|\>><rsub|<fL><rsup|<wide|q|\<bar\>>><rsub|\<mu\><rsup|\<infty\>><rsub|\<Theta\>>,\<nu\><rsub|\<beta\>>><SO><around*|(|V<rsup|+>|)>>.
    </equation*>

    Similarly, set\ 

    <\equation*>
      <around*|\<\|\|\>|F|\<\|\|\>><rsub|<fL><rsup|q><rsub|\<mu\><rsup|1><rsub|\<Theta\>>,\<nu\><rsub|\<beta\>>><SO><around*|(|V<rsup|+>|)>><eqd>\<nu\><rsub|\<beta\>><around*|(|V<rsup|+>|)><rsup|-<frac|1|q>><around*|\<\|\|\>|<1><rsub|V<rsup|+>>F|\<\|\|\>><rsub|L<rsup|q><rsub|\<mu\><rsub|\<Theta\>><rsup|1>><SO><around*|(|V<rsup|+>|)>>,<space|2em><around*|\<\|\|\>|F|\<\|\|\>><rsub|<fL><rsup|q,+><rsub|\<mu\><rsup|1><rsub|\<Theta\>>,\<nu\><rsub|\<beta\>>><SO><around*|(|V<rsup|+>|)>><eqd>sup<rsub|<wide|q|\<bar\>>\<in\><around*|[|q,\<infty\>|]>><around*|\<\|\|\>|F|\<\|\|\>><rsub|<fL><rsup|<wide|q|\<bar\>>><rsub|\<mu\><rsup|1><rsub|\<Theta\>>,\<nu\><rsub|\<beta\>>><SO><around*|(|V<rsup|+>|)>>.
    </equation*>

    Analogously to <eqref|eq:generated-size:trees>, the corresponding sizes
    are

    <\equation*>
      <ltae|<tformat|<table|<row|<cell|<around*|\<\|\|\>|F|\<\|\|\>><rsub|<fL><rsup|q><rsub|\<mu\><rsup|\<infty\>><rsub|\<Theta\>>,\<nu\><rsub|\<beta\>>><SO>><eqd>sup<rsub|V<rsup|+>\<in\><DD><rsub|\<beta\>><rsup|\<cup\>>>sup<rsub|V<rsup|->\<in\><DD><rsub|\<beta\>><rsup|\<cup\>>><around*|\<\|\|\>|<1><rsub|<R><rsup|3><rsub|+>\<setminus\>V<rsup|->>F|\<\|\|\>><rsub|<fL><rsup|q><rsub|\<mu\><rsup|\<infty\>><rsub|\<Theta\>>,\<nu\><rsub|\<beta\>>><SO><around*|(|V<rsup|+>|)>>,>>|<row|<cell|<around*|\<\|\|\>|F|\<\|\|\>><rsub|<fL><rsup|q,+><rsub|\<mu\><rsup|\<infty\>><rsub|\<Theta\>>,\<nu\><rsub|\<beta\>>><SO>><eqd>sup<rsub|V<rsup|+>\<in\><DD><rsub|\<beta\>><rsup|\<cup\>>>sup<rsub|V<rsup|->\<in\><DD><rsub|\<beta\>><rsup|\<cup\>>><around*|\<\|\|\>|<1><rsub|<R><rsup|3><rsub|+>\<setminus\>V<rsup|->>F|\<\|\|\>><rsub|<fL><rsup|q,+><rsub|\<mu\><rsup|\<infty\>><rsub|\<Theta\>>,\<nu\><rsub|\<beta\>>><SO><around*|(|V<rsup|+>|)>>,>>|<row|<cell|<around*|\<\|\|\>|F|\<\|\|\>><rsub|<fL><rsup|q><rsub|\<mu\><rsup|1><rsub|\<Theta\>>,\<nu\><rsub|\<beta\>>><SO>><eqd>sup<rsub|V<rsup|+>\<in\><DD><rsub|\<beta\>><rsup|\<cup\>>>sup<rsub|V<rsup|->\<in\><DD><rsub|\<beta\>><rsup|\<cup\>>><around*|\<\|\|\>|<1><rsub|<R><rsup|3><rsub|+>\<setminus\>V<rsup|->>F|\<\|\|\>><rsub|<fL><rsup|q><rsub|\<mu\><rsup|1><rsub|\<Theta\>>,\<nu\><rsub|\<beta\>>><SO><around*|(|V<rsup|+>|)>>,>>|<row|<cell|<around*|\<\|\|\>|F|\<\|\|\>><rsub|<fL><rsup|q,+><rsub|\<mu\><rsup|1><rsub|\<Theta\>>,\<nu\><rsub|\<beta\>>><SO>><eqd>sup<rsub|V<rsup|+>\<in\><DD><rsub|\<beta\>><rsup|\<cup\>>>sup<rsub|V<rsup|->\<in\><DD><rsub|\<beta\>><rsup|\<cup\>>><around*|\<\|\|\>|<1><rsub|<R><rsup|3><rsub|+>\<setminus\>V<rsup|->>F|\<\|\|\>><rsub|<fL><rsup|q,+><rsub|\<mu\><rsup|1><rsub|\<Theta\>>,\<nu\><rsub|\<beta\>>><SO><around*|(|V<rsup|+>|)>>.>>>>>
    </equation*>

    Similarly, for <math|F\<in\><Rad><around*|(|<R><rsup|3><rsub|+>|)>\<otimes\><rsup|k>\<Phi\><rsub|<gr>><rsup|N><rprime|'>>
    and <math|V<rsup|+>\<in\><DD><rsub|\<beta\>><rsup|\<cup\>>> set\ 

    <\equation>
      <label|eq:X-local-size><ltae|<tformat|<cwith|2|2|1|1|cell-halign|l>|<table|<row|<cell|<around*|\<\|\|\>|F|\<\|\|\>><rsub|X<rsup|q,r><rsub|\<mu\><rsup|1><rsub|\<Theta\>>,\<nu\><rsub|\<beta\>>><SO><around*|(|V<rsup|+>|)>><eqd>\<nu\><rsub|\<beta\>><around*|(|V<rsup|+>|)><rsup|-<frac|1|r>>sup<rsub|W<rsup|+>\<in\><TT><rsup|\<cup\>><rsub|\<Theta\>>><around*|(|\<mu\><rsup|\<infty\>><rsub|\<Theta\>><around*|(|W<rsup|+>|)><rsup|<frac|1|q>-<frac|1|r>><around*|\<\|\|\>|<1><rsub|<around*|(|V<rsup|+>\<cap\>W<rsup|+>|)>>F|\<\|\|\>><rsub|L<rsup|r><rsub|\<mu\><rsub|\<Theta\>><rsup|1>><SO>>|)>,>>|<row|<cell|<around*|\<\|\|\>|F|\<\|\|\>><rsub|X<rsup|q,r,+><rsub|\<mu\><rsup|1><rsub|\<Theta\>>,\<nu\><rsub|\<beta\>>><SO><around*|(|V<rsup|+>|)>><eqd>sup<rsub|<wide|r|\<bar\>>\<in\><around*|[|r,q|]>><around*|\<\|\|\>|F|\<\|\|\>><rsub|X<rsup|q,<wide|r|\<bar\>>><rsub|\<mu\><rsup|1><rsub|\<Theta\>>,\<nu\><rsub|\<beta\>>><SO><around*|(|V<rsup|+>|)>>,>>>>>
    </equation>

    so that the corresponding sizes are

    <\equation>
      <label|eq:X-size><ltae|<tformat|<table|<row|<cell|<around*|\<\|\|\>|F|\<\|\|\>><rsub|X<rsup|q,r><rsub|\<mu\><rsup|1><rsub|\<Theta\>>,\<nu\><rsub|\<beta\>>><SO>><eqd>sup<rsub|V<rsup|+>\<in\><DD><rsub|\<beta\>><rsup|\<cup\>>>sup<rsub|V<rsup|->\<in\><DD><rsub|\<beta\>><rsup|\<cup\>>><around*|\<\|\|\>|<1><rsub|<R><rsup|3><rsub|+>\<setminus\>V<rsup|->>F|\<\|\|\>><rsub|X<rsup|q,r><rsub|\<mu\><rsup|1><rsub|\<Theta\>>,\<nu\><rsub|\<beta\>>><SO><around*|(|V<rsup|+>|)>>,>>|<row|<cell|<around*|\<\|\|\>|F|\<\|\|\>><rsub|X<rsup|q,r,+><rsub|\<mu\><rsup|1><rsub|\<Theta\>>,\<nu\><rsub|\<beta\>>><SO>><eqd>sup<rsub|V<rsup|+>\<in\><DD><rsub|\<beta\>><rsup|\<cup\>>>sup<rsub|V<rsup|->\<in\><DD><rsub|\<beta\>><rsup|\<cup\>>><around*|\<\|\|\>|<1><rsub|<R><rsup|3><rsub|+>\<setminus\>V<rsup|->>F|\<\|\|\>><rsub|X<rsup|q,r,+><rsub|\<mu\><rsup|1><rsub|\<Theta\>>,\<nu\><rsub|\<beta\>>><SO><around*|(|V<rsup|+>|)>>.>>>>>
    </equation>
  </definition>

  The sizes <math|<around*|\<\|\|\>|F|\<\|\|\>><rsub|<fL><rsup|q><rsub|\<mu\><rsup|1><rsub|\<Theta\>>,\<nu\><rsub|\<beta\>>><SO>>>
  were first introduced in <cite|uraltsevVariationalCarlesonEmbeddings2016>
  (cfr. <cite-detail|uraltsevVariationalCarlesonEmbeddings2016|(2.14)>)
  albeit their local variants were indexed by strips
  <math|D\<in\><DD><rsub|1>> rather than by countable unions
  <math|V<rsub|+>\<in\><DD><rsub|1><rsup|\<cup\>>> thereof. For the case
  <math|\<beta\>=1> these two approaches are functionally the same while for
  <math|\<beta\>\<ll\>1> they yield non uniformly equivalent sizes.\ 

  Size <math|X<rsup|q,r><rsub|\<mu\><rsup|1><rsub|\<Theta\>>,\<nu\><rsub|\<beta\>>><SO>>
  are weaker variants of the sizes <math|<around*|\<\|\|\>|F|\<\|\|\>><rsub|<fL><rsup|q><rsub|\<mu\><rsup|1><rsub|\<Theta\>>,\<nu\><rsub|\<beta\>>><SO>>>.
  Clearly,

  <\equation*>
    <around*|\<\|\|\>|F|\<\|\|\>><rsub|<around*|<left|(|-1>|X<rsup|q,q><rsub|\<mu\><rsup|1><rsub|\<Theta\>>,\<nu\><rsub|\<beta\><rsup|>>><SO>|<right|)|-1>><around*|(|V<rsup|+>|)>>=\<nu\><rsub|\<beta\><rsup|>><around*|(|V<rsup|+>|)><rsup|-<frac|1|q>><around*|\<\|\|\>|<1><rsub|V<rsup|+>>F|\<\|\|\>><rsub|L<rsup|q><rsub|\<mu\><rsub|\<Theta\>><rsup|1>><SO>>=<around*|\<\|\|\>|<1><rsub|V<rsup|+>>F|\<\|\|\>><rsub|<fL><rsup|q><rsub|\<mu\><rsup|1><rsub|\<Theta\>>,\<nu\><rsub|\<beta\>>><SO><around*|(|V<rsup|+>|)>>
  </equation*>

  for any <math|V<rsup|+>\<in\><DD><rsub|\<beta\>><rsup|\<cup\>>>. On the
  other hand, for <math|r\<leq\>q>, it follows from
  <smart-ref|lem:measure-comparison-1-infty> that

  <\equation*>
    <around*|\<\|\|\>|F|\<\|\|\>><rsub|<around*|<left|(|-1>|X<rsup|q,r><rsub|\<mu\><rsup|1><rsub|\<Theta\>>,\<nu\><rsub|\<beta\><rsup|>>><SO>|<right|)|-1>><around*|(|V<rsup|+>|)>><ltae|<tformat|<table|<row|<cell|=sup<rsub|W<rsup|+>\<in\><TT><rsup|\<cup\>><rsub|\<Theta\>>>\<nu\><rsub|\<beta\>><around*|(|V|)><rsup|-<frac|1|r>>\<mu\><rsup|\<infty\>><rsub|\<Theta\>><around*|(|W|)><rsup|<frac|1|q>-<frac|1|r>><around*|\<\|\|\>|<1><rsub|<around*|(|V<rsup|+>\<cap\>W<rsup|+>|)>>F|\<\|\|\>><rsub|L<rsup|r><rsub|\<mu\><rsub|\<Theta\>><rsup|1>><SO>>>>|<row|<cell|\<lesssim\>sup<rsub|W<rsup|+>\<in\><TT><rsup|\<cup\>><rsub|\<Theta\>>>\<beta\><rsup|-<frac|1|r>>\<mu\><rsup|\<infty\>><rsub|\<Theta\>><around*|(|W<rsup|+>|)><rsup|<frac|1|q>-<frac|1|r>><around*|\<\|\|\>|<1><rsub|<around*|(|V<rsup|+>\<cap\>W<rsup|+>|)>>F|\<\|\|\>><rsub|L<rsup|r><rsub|\<mu\><rsub|\<Theta\>><rsup|\<infty\>>><SO>>\<leq\>\<beta\><rsup|-<frac|1|r>><around*|\<\|\|\>|<1><rsub|V<rsup|+>>F|\<\|\|\>><rsub|L<rsup|q><rsub|\<mu\><rsub|\<Theta\>><rsup|\<infty\>>><SO>>,>>>>>
  </equation*>

  showing that <math|<around*|\<\|\|\>|F|\<\|\|\>><rsub|<around*|<left|(|-1>|X<rsup|q,1,+><rsub|\<mu\><rsup|1><rsub|\<Theta\>>,\<nu\><rsub|\<beta\>>><SO>|<right|)|-1>><around*|(|V<rsup|+>|)>>\<leq\>\<beta\><rsup|-1><around*|\<\|\|\>|F|\<\|\|\>><rsub|<fL><rsup|q><rsub|\<mu\><rsup|\<infty\>><rsub|\<Theta\>>,\<nu\><rsub|\<beta\>>><SO><around*|(|V<rsup|+>|)>>>.
  In practice, this means that the local sizes
  <math|<around*|\<\|\|\>|F|\<\|\|\>><rsub|<around*|<left|(|-1>|X<rsup|q,r,+><rsub|\<mu\><rsup|1><rsub|\<Theta\>>,\<nu\><rsub|\<beta\>>><SO>|<right|)|-1>><around*|(|V<rsup|+>|)>>>
  are weaker than <math|<around*|\<\|\|\>|F|\<\|\|\>><rsub|<fL><rsup|q><rsub|\<mu\><rsup|\<infty\>><rsub|\<Theta\>>,\<nu\><rsub|\<beta\>>><SO><around*|(|V<rsup|+>|)>>>
  for <math|\<beta\>=1> but they may be better behaved when <math|\<beta\>>
  is small.\ 

  <\lemma>
    <label|lem:measure-comparison-1-infty>Given any
    <math|V\<in\><DD><rsub|\<beta\>><rsup|\<cup\>>> and any
    <math|W\<in\><TT><rsup|\<cup\>><rsub|\<Theta\>>> it holds that\ 

    <\equation*>
      \<mu\><rsup|1><rsub|\<Theta\>><around*|(|W\<cap\>V|)>\<leq\>4\<beta\><rsup|-1>\<nu\><rsub|\<beta\>><around*|(|V|)>\<mu\><rsup|\<infty\>><rsub|\<Theta\>><around*|(|W\<cap\>V|)>.
    </equation*>
  </lemma>

  <\proof>
    Given any strip <math|D\<in\>\<bbb-D\><rsub|\<beta\>>> and any tree
    <math|T\<in\>\<bbb-T\><rsub|\<Theta\>>> it holds that

    <\equation*>
      T<around*|(|\<xi\><rsub|T>,x<rsub|D,T>,2\<beta\><rsup|-1>s<rsub|D,T>|)>\<supset\>T\<cap\>D
    </equation*>

    where <math|B<rsub|s<rsub|D,T>><around*|(|x<rsub|D,T>|)><eqd>I<rsub|T>\<cap\>I<rsub|D>>.
    From this it follows that\ 

    <\equation*>
      \<mu\><rsup|1><rsub|\<Theta\>><around*|(|W\<cap\>V|)>\<leq\>2\<beta\><rsup|-1>\<nu\><rsub|><around*|(|V|)>\<mu\><rsup|\<infty\>><rsub|\<Theta\>><around*|(|W\<cap\>V|)>
    </equation*>

    for any <math|V\<in\><DD><rsub|\<beta\>><rsup|\<cup\>>> and any
    <math|W\<in\><TT><rsup|\<cup\>><rsub|\<Theta\>>>. As a matter of fact,
    let <math|<mc|D>\<subset\><DD><rsub|\<beta\>>> be such that
    <math|V\<subset\><big|cup><rsub|D\<in\><mc|D>>D> and
    \ <math|<around|\<\|\|\>|N<rsub|<mc|D>>|\<\|\|\>><rsub|L<rsup|1><rsub|>>\<leq\>2\<nu\><rsub|\<beta\>><around*|(|V|)>>
    and let <math|<mc|T>\<subset\>\<bbb-T\><rsub|\<Theta\>>> be such that\ 

    <\equation*>
      <around*|\<\|\|\>|N<rsub|<mc|T>>|\<\|\|\>><rsub|L<rsup|\<infty\>>>\<leq\>2\<mu\><rsub|\<Theta\>><rsup|\<infty\>><around*|(|W\<cap\>V|)>,<space|2em>W\<cap\>V\<subset\><big|cup><rsub|T\<in\><mc|T>>T.
    </equation*>

    It then holds that\ 

    <\equation*>
      <big|sum><rsub|D\<in\><mc|D>><big|sum><rsub|T\<in\><mc|T>><around*|\||I<rsub|D>\<cap\>I<rsub|T>|\|>=<big|int><rsub|<R>><big|sum><rsub|D\<in\><mc|D>><big|sum><rsub|T\<in\><mc|T>><1><rsub|I<rsub|D>><around*|(|z|)><1><rsub|I<rsub|T>><around*|(|z|)><dd>z\<leq\><around*|\<\|\|\>|N<rsub|<mc|D>>|\<\|\|\>><rsub|L<rsup|1>><around*|\<\|\|\>|N<rsub|<mc|T>>|\<\|\|\>><rsub|L<rsup|\<infty\>>>.
    </equation*>

    Since <math|W\<cap\>V\<subset\><big|cup><rsub|T\<in\><mc|T>><big|cup><rsub|D\<in\><mc|D>><around*|(|D\<cap\>T|)>>
    we have that\ 

    <\equation*>
      W\<cap\>V\<subset\><big|cup><rsub|D\<in\><mc|D>><big|cup><rsub|T\<in\><mc|T>>T<around*|(|\<xi\><rsub|T>,x<rsub|D,T>,2\<beta\><rsup|-1>s<rsub|D,T>|)>,
    </equation*>

    so <math|\<mu\><rsup|1><rsub|\<Theta\>><around*|(|W\<cap\>V|)>\<leq\><big|sum><rsub|D\<in\><mc|D>><big|sum><rsub|T\<in\><mc|T>>4\<beta\><rsup|-1>s<rsub|D,T>=<big|sum><rsub|D\<in\><mc|D>><big|sum><rsub|T\<in\><mc|T>>2\<beta\><rsup|-1>><math|<around*|\||I<rsub|D>\<cap\>I<rsub|T>|\|>>,
    as required
  </proof>

  Note that the sizes <math|<fL><rsup|q,+><rsub|\<mu\><rsup|<mf|p>><rsub|\<Theta\>>,\<nu\><rsub|\<beta\>>><SO>>
  are monotone in <math|q> in the sense that
  <math|<around*|\<\|\|\>|F|\<\|\|\>><rsub|<fL><rsup|q,+><rsub|\<mu\><rsup|<mf|p>><rsub|\<Theta\>>,\<nu\><rsub|\<beta\>>><SO>>\<geq\><around*|\<\|\|\>|F|\<\|\|\>><rsub|<fL><rsup|<wide|q|\<bar\>>,+><rsub|\<mu\><rsup|<mf|p>><rsub|\<Theta\>>,\<nu\><rsub|\<beta\>>><SO>>>
  if <math|q\<less\><wide|q|\<bar\>>>. The sizes
  <math|X<rsup|q,r,+><rsub|\<mu\><rsup|<mf|p>><rsub|\<Theta\>>,\<nu\><rsub|\<beta\>>><SO>>
  are monotone in <math|q> and <math|r> in the sense that
  <math|<around*|\<\|\|\>|F|\<\|\|\>><rsub|X<rsup|q,r,+><rsub|\<mu\><rsup|1><rsub|\<Theta\>>,\<nu\><rsub|\<beta\>>><SO>>\<geq\><around*|\<\|\|\>|F|\<\|\|\>><rsub|<fL><rsup|<wide|q|\<bar\>>,r,+><rsub|\<mu\><rsup|1><rsub|\<Theta\>>,\<nu\><rsub|\<beta\>>><SO>>>
  if <math|q\<less\><wide|q|\<bar\>>> and
  <math|<around*|\<\|\|\>|F|\<\|\|\>><rsub|X<rsup|q,r,+><rsub|\<mu\><rsup|1><rsub|\<Theta\>>,\<nu\><rsub|\<beta\>>><SO>>\<geq\><around*|\<\|\|\>|F|\<\|\|\>><rsub|<fL><rsup|q,<wide|r|\<bar\>>,+><rsub|\<mu\><rsup|1><rsub|\<Theta\>>,\<nu\><rsub|\<beta\>>><SO>>>
  if <math|r\<less\><wide|r|\<bar\>>>.\ 

  When proving iterated bounds of the form
  <smart-ref|eq:embedding-bounds:non-uniform-iterated> and
  <smart-ref|eq:embedding-bounds:uniform-iterated> it is necessary to unwrap
  the sequence of definitions above; since this is going to be a recurrent
  procedure in this work we find it useful to explicitly go through this
  procedure in the following remark.

  <\remark>
    <label|rem:iterated-outer-bounds-explicit> Let us unwrap
    <smart-ref|def:localized-outer-lebesgue> for some size <math|<SO>> on
    <math|<Rad><around*|(|<R><rsup|3><rsub|+>|)>\<otimes\><rsup|k>\<Phi\><rsub|<gr>><rsup|N><rprime|'>>:
    showing that <math|<around*|\<\|\|\>|F|\<\|\|\>><rsub|L<rsup|p><rsub|\<nu\><rsub|\<beta\>>><fL><rsup|q><rsub|\<mu\><rsup|<mf|p>><rsub|\<Theta\>>,\<nu\><rsub|\<beta\>>><SO>>\<lesssim\>1<text|>>
    is tantamount to exhibiting for any <math|\<lambda\>\<in\><around*|(|0,+\<infty\>|)>>
    a set <math|V<rsup|-><rsup|><around*|(|\<lambda\>|)>\<in\><DD><rsup|\<cup\>><rsub|\<beta\>>>
    \ such that\ 

    <\equation>
      <label|eq:iterated-outer-bounds-explicit><big|int><rsub|0><rsup|\<infty\>>
      \<nu\><rsub|\<beta\>><around*|<left|(|1>|V<rsup|-><rsup|><around*|(|\<lambda\><rsup|1/p>|)>|<right|)|1>>\<mathd\>\<lambda\>\<lesssim\>1,<space|2em><around*|\<\|\|\>|<1><rsub|<R><rsup|3><rsub|+>\<setminus\>V<rsup|-><rsup|><around*|(|\<lambda\>|)>>F|\<\|\|\>><rsub|<fL><rsup|q><rsub|\<mu\><rsup|<mf|p>><rsub|\<Theta\>>,\<nu\><rsub|\<beta\>>><SO>>\<lesssim\>\<lambda\>.
    </equation>

    For fixed <math|\<lambda\>> and <math|V<rsup|-><rsup|><around*|(|\<lambda\>|)>>,
    the second condition requires exhibiting for any
    <math|V<rsup|\<pm\>>\<in\><DD><rsub|\<beta\>><rsup|\<cup\>>> and any
    <math|\<tau\>\<in\><around*|(|0,+\<infty\>|)>> a set
    <math|W<rsub|q><around*|(|\<lambda\>,\<tau\>,V<rsup|+>,V<rsup|->|)>\<in\><TT><rsub|\<Theta\>><rsup|\<cup\>>>
    such that\ 

    <\equation>
      <label|eq:iterated-outer-bounds-explicit-full><ltae|<tformat|<table|<row|<cell|<big|int><rsub|0><rsup|\<infty\>>
      \<mu\><rsub|\<Theta\>><rsup|<mf|p>><around*|<left|(|1>|W<rsub|q><around*|(|\<lambda\>,\<tau\><rsup|1/q>,V<rsup|+>,V<rsup|->|)>|<right|)|1>>\<mathd\>\<tau\>\<lesssim\>\<lambda\><rsup|q>\<nu\><rsub|\<beta\>><around*|(|V<rsup|+>|)><rsup|1/<mf|p>>,>>|<row|<cell|<around*|<left|\<\|\|\>|1>|<1><rsub|V<rsup|+>\<setminus\>V<rsup|->><1><rsub|<R><rsup|3><rsub|+>\<setminus\>W<rsub|q><around*|(|\<lambda\>,\<tau\>,V<rsup|+>,V<rsup|->|)>><1><rsub|<R><rsup|3><rsub|+>\<setminus\>V<rsup|-><around*|(|\<lambda\>|)>>F|<right|\<\|\|\>|1>><rsub|<SO>>\<lesssim\>\<tau\>.>>>>>
    </equation>

    When showing <math|<around*|\<\|\|\>|F|\<\|\|\>><rsub|L<rsup|p><rsub|\<nu\><rsub|\<beta\>>><fL><rsup|q,+><rsub|\<mu\><rsup|<mf|p>><rsub|\<Theta\>>,\<nu\><rsub|\<beta\>>><SO>>\<lesssim\>1>,
    by log convexity of outer Lebesgue quasi-norms
    (<eqref|eq:outer-log-convexity> in <smart-ref|prop:outer-properties>),
    one needs to show that <eqref|eq:iterated-outer-bounds-explicit> holds
    with <math|<wide|q|\<bar\>>\<in\><around*|{|q,+\<infty\>|}>> in place of
    <math|q><math|>. All the implicit constants above cannot depend on any of
    the variable quantities <math|\<lambda\>,\<tau\>,V<rsup|\<pm\>>>.\ 

    Similarly, showing that <math|<around*|\<\|\|\>|F|\<\|\|\>><rsub|L<rsup|p><rsub|\<nu\><rsub|\<beta\>>>X<rsup|q,r,+><rsub|\<mu\><rsup|1><rsub|\<Theta\>>,\<nu\><rsub|\<beta\>>><SO>>\<lesssim\>1>
    requires exhibiting sets <math|><math|V<rsup|-><rsup|><around*|(|\<lambda\>|)>\<in\><DD><rsup|\<cup\>><rsub|\<beta\>>>
    such that\ 

    <\equation*>
      <big|int><rsub|0><rsup|\<infty\>> \<nu\><rsub|\<beta\>><around*|<left|(|1>|V<rsup|-><rsup|><around*|(|\<lambda\><rsup|1/p>|)>|<right|)|1>>\<mathd\>\<lambda\>\<lesssim\>1,<space|2em><around*|\<\|\|\>|<1><rsub|<R><rsup|3><rsub|+>\<setminus\>V<rsup|-><rsup|><around*|(|\<lambda\>|)>>F|\<\|\|\>><rsub|X<rsup|q,r,+><rsub|\<mu\><rsup|1><rsub|\<Theta\>>,\<nu\><rsub|\<beta\>>><SO>>\<lesssim\>\<lambda\>.
    </equation*>

    The second bound, according to <smart-ref|eq:X-size>, amounts to showing
    that for any <math|V<rsup|\<pm\>>\<in\><DD><rsub|\<beta\>><rsup|\<cup\>>>,
    <math|W<rsup|+>\<in\><TT><rsup|\<cup\>><rsub|\<Theta\>>>, it holds that\ 

    <\equation>
      <label|eq:iterated-outer-bounds-explicit-X><around*|\<\|\|\>|<1><rsub|<around*|(|V<rsup|+>\<cap\>W<rsup|+>|)>\<setminus\><around*|(|V<rsup|->\<cup\>V<rsup|-><around*|(|\<lambda\>|)>|)>>F|\<\|\|\>><rsub|L<rsup|<wide|r|\<bar\>>><rsub|\<mu\><rsub|\<Theta\>><rsup|1>><SO>>\<lesssim\>\<lambda\>\<nu\><rsub|\<beta\>><around*|(|V<rsup|+>|)><rsup|<frac|1|<wide|r|\<bar\>>>>\<mu\><rsup|\<infty\>><rsub|\<Theta\>><around*|(|W<rsup|+>|)><rsup|<frac|1|<wide|r|\<bar\>>>-<frac|1|q>>
    </equation>

    with <math|<wide|r|\<bar\>>\<in\><around*|{|r,q|}>>.
  </remark>

  We conclude this section discussing the shape of the boundary of sets
  <math|V\<in\><DD><rsub|\<beta\>><rsup|\<cup\>>> and
  <math|W\<in\><TT><rsub|\<Theta\>><rsup|\<cup\>>>. This is important because
  we argued in <smart-ref|sec:size-motivation> that the defect size of a
  function of the form\ 

  <\equation*>
    <1><rsub|<around*|(|V<rsup|+>\<cap\>W<rsup|+>|)>\<setminus\><around*|(|V<rsup|->\<cup\>W<rsup|->|)>><Emb><around*|[|f|]>\<circ\>\<Gamma\>
  </equation*>

  is going to be the norm of a singular measure supported on the boundary of
  <math|<around*|(|V<rsup|+>\<cap\>W<rsup|+>|)>\<setminus\><around*|(|V<rsup|->\<cup\>W<rsup|->|)>>.

  <\lemma>
    <label|lem:geometry-of-boundary><dueto|Geometry of the boundary of
    generating sets>Let <math|V\<in\><DD><rsub|\<beta\>><rsup|\<cup\>>>,
    <math|W<rsub|1>,\<ldots\>,W<rsub|n>\<in\><TT><rsub|\<Theta\>><rsup|\<cup\>>>
    and let <math|E=V\<cap\> <around*|(|<big|cap><rsub|l=1><rsup|k>W<rsub|l>|)>>
    or <math|E=V\<cup\><around*|(|<big|cup><rsub|l=1><rsup|k>W<rsub|l>|)>>.
    The boundary of <math|E> is the graph of a function
    <math|<mf|b><rsub|E><rsup|>\<of\><R><rsup|2>\<rightarrow\><around*|[|0,\<infty\>|]>>
    i.e.

    <\equation*>
      E<rsup|><rsup|>=<around*|<left|{|2>|<around*|(|\<eta\>,y,t|)>\<in\><R><rsup|3><rsub|+><st>t\<in\><around*|(|0,<mf|b><rsub|E><rsup|><around*|(|\<eta\>,y|)>|)>|<right|}|2>>.
    </equation*>

    The function <math|<mf|><mf|b><rsub|E><rsup|>> is locally Lipschitz and
    satisfies

    <\equation>
      <label|eq:boundary-regularity><around*|\||\<partial\><rsub|y><mf|b><rsub|E><rsup|><around*|(|\<eta\>,y|)>|\|>\<leq\>\<beta\><rsup|-1>,<space|2em>-<around*|\||\<theta\><rsub|+><rsup|>|\|><rsup|-1>\<leq\><frac|\<partial\><rsub|\<eta\>><mf|b><rsub|E><rsup|><around*|(|\<eta\>,y|)>|<mf|b><rsub|E><rsup|><around*|(|\<eta\>,y|)><rsup|2>>\<leq\><around*|\||\<theta\><rsub|->|\|><rsup|-1>,
    </equation>

    where <math|<around*|(|\<theta\><rsub|->,\<theta\><rsub|+>|)>=\<Theta\>>.
    The distributional derivative <math|t<dd><rsub|t><1><rsub|E><around*|(|\<eta\>,y,t|)>>
    is given by measure <math|t\<delta\><around*|(|t-<mf|b><rsub|E><rsup|><around*|(|\<eta\>,y|)>|)>>.
    In particular, we recall that if <math|<mf|b>\<of\><R><rsup|2>\<rightarrow\><around*|[|0,\<infty\>|]>>
    satisfies <eqref|eq:boundary-regularity> then it holds that\ 

    <\equation>
      <label|eq:boundary-singular-size><ltae|<tformat|<cwith|1|1|1|1|cell-halign|l>|<cwith|2|2|1|1|cell-halign|l>|<table|<row|<cell|<around*|<left|\<\|\|\>|2>|F<around*|(|\<eta\>,y,t|)>t\<delta\><around*|(|t-<mf|b><around*|(|\<eta\>,y|)>|)>|<right|\<\|\|\>|2>><rsub|<SL><rsup|<around*|(|u,1|)>><rsub|<around*|(|\<Theta\>,<wide|\<Theta\>|~>|)>><around*|(|T|)>>>>|<row|<cell|<space|1em>\<approx\><around*|(|<frac|1|s<rsub|T><around*|\||\<Theta\>|\|>><big|int><rsub|<R><rsup|2>><1><rsub|\<pi\><rsub|T><around*|(|<mT><rsub|<wide|\<Theta\>|~>>|)>><around*|(|\<eta\>,y,<mf|b><rsup|><around*|(|\<eta\>,y|)>|)><around*|<left|\||2>|F<around*|<left|(|1>|\<eta\>,y,<mf|b><rsup|><around*|(|\<eta\>,y|)>|<right|)|1>>|<right|\||2>><rsup|u><mf|b><rsup|><around*|(|\<eta\>,y|)><dd>\<eta\><dd>y|)><rsup|<frac|1|u>>>>>>>
    </equation>

    for any <math|F\<in\>L<rsup|\<infty\>><rsub|loc><around*|(|<R><rsup|3><rsub|+>|)>>.
    All implicit constants are uniformly bounded from above and away from
    <math|0> as long as <math|\<Theta\>> is bounded and
    <math|<dist><around*|(|<wide|\<Theta\>|~>,<R>\<setminus\>\<Theta\>|)>> is
    bounded away from <math|0>.\ 
  </lemma>

  The statement above has an analogue in local coordinates
  <math|\<pi\><rsub|T>> of a tree <math|T\<in\><TT><rsub|\<Theta\>>>.

  <\lemma>
    <label|lem:geometry-of-boundary-local> Let
    <math|T\<in\><TT><rsub|\<Theta\>>> and let
    <math|<mf|b>\<of\><R><rsup|2>\<rightarrow\><around*|[|0,\<infty\>|]>> be
    a locally Lipschitz function that satisfies
    <math|<eqref|eq:boundary-regularity>>. Then there exists a function
    <math|<mf|b><rsup|\<ast\>>:\<Theta\>\<times\>B<rsub|1>\<rightarrow\><around*|[|0,+\<infty\>|)>>
    such that\ 

    <\equation>
      <label|eq:boundary-pullback-condition>\<pi\><rsub|T><around*|<left|(|2>|<around*|<left|{|1>|<around*|(|\<theta\>,\<zeta\>,\<sigma\>|)>\<in\><mT><rsub|\<Theta\>>:\<sigma\>\<leq\><mf|b><rsup|\<ast\>><around*|(|\<theta\>,\<zeta\>|)><rsup|>|<right|}|1>>|<right|)|2>>=<around*|<left|{|2>|<around*|(|\<eta\>,y,t|)>\<in\>T:t\<less\><mf|b><around*|(|\<eta\>,y|)>|<right|}|2>>.
    </equation>

    This function <math|<mf|b><rsup|\<ast\>>> satisfies

    <\equation>
      <label|eq:boundary-regularity-local><around*|\||\<partial\><rsub|\<zeta\>><mf|b><rsup|\<ast\>><around*|(|\<theta\>,\<zeta\>|)>|\|>\<leq\>\<beta\><rsup|-1>,<space|2em>-<around*|\||\<theta\><rsub|+>-\<theta\>|\|><rsup|-1>\<leq\><frac|\<partial\><rsub|\<theta\>><mf|b><rsup|\<ast\>><around*|(|\<theta\>,\<zeta\>|)>|<mf|b><rsup|\<ast\>><around*|(|\<theta\>,\<zeta\>|)>>\<leq\><around*|\||\<theta\>-\<theta\><rsub|->|\|><rsup|-1>.
    </equation>

    It holds that (cfr. <eqref|eq:boundary-singular-size>)\ 

    \;

    <\equation>
      <label|eq:boundary-singular-size-local><ltae|<tformat|<cwith|1|1|1|1|cell-halign|l>|<table|<row|<cell|<around*|<left|\<\|\|\>|2>|F<around*|(|\<eta\>,y,t|)>t\<delta\><around*|(|t-<mf|b><around*|(|\<eta\>,y|)>|)>|<right|\<\|\|\>|2>><rsub|<SL><rsup|<around*|(|u,1|)>><rsub|<around*|(|\<Theta\>,<wide|\<Theta\>|~>|)>><around*|(|T|)>>\<approx\><around*|(|<big|int><rsub|<wide|\<Theta\>|~>\<times\>B<rsub|1>><around*|<left|\||2>|<1><rsub|<mT><rsub|<wide|\<Theta\>|~>>><around*|(|F\<circ\>\<pi\><rsub|T>|)><around*|<left|(|1>|\<theta\>,\<zeta\>,<mf|b><rsup|\<ast\>><around*|(|\<theta\>,\<zeta\>|)>|<right|)|1>>|<right|\||2>><rsup|u><frac|<dd>\<theta\><dd>\<zeta\>|<around*|\||\<Theta\>|\|>>|)><rsup|<frac|1|u>>.>>>>>
    </equation>

    for any <math|F\<in\>L<rsup|\<infty\>><rsub|loc><around*|(|<R><rsup|3><rsub|+>|)>>.
    All implicit constants are uniformly bounded from above and away from
    <math|0> as long as <math|\<Theta\>> is bounded and
    <math|<dist><around*|(|<wide|\<Theta\>|~>,<R>\<setminus\>\<Theta\>|)>> is
    bounded away from <math|0>.
  </lemma>

  <\render-proof|Proof of <smart-ref|lem:geometry-of-boundary>>
    For <math|E=D<rsub|\<beta\>><around*|(|x,s|)>> and
    <math|E=T<rsub|\<Theta\>><around*|(|\<xi\>,x,s|)>> we have, explicitly,
    that

    <\equation*>
      <ltae|<tformat|<cwith|1|1|1|1|cell-halign|l>|<table|<row|<cell|<mf|b><rsub|D<rsub|\<beta\>><around*|(|x,s|)>><around*|(|\<eta\>,y|)>=max<around*|(|\<beta\><rsup|-1><around*|(|s-<around*|\||y-x|\|>|)>,0|)>,>>|<row|<cell|<mf|b><rsub|T<rsub|\<Theta\>><around*|(|\<xi\>,x,s|)>><around*|(|\<eta\>,y|)>=min<around*|<left|(|-2>|<mf|b><rsub|D<rsub|1><around*|(|x,s|)>><around*|(|\<eta\>,y|)>,<cases|<tformat|<table|<row|<cell|<frac|\<theta\><rsub|+>|<around*|\||\<eta\>-\<xi\>|\|>>>|<cell|<text|if
      >\<eta\>\<gtr\>0,>>|<row|<cell|<frac|\<theta\><rsub|->|<around*|\||\<eta\>-\<xi\>|\|>>>|<cell|<text|if
      >\<eta\>\<less\>0.>>>>>|<right|)|-2>>>>>>>
    </equation*>

    The bounds <eqref|eq:boundary-regularity> follow by direct verification
    in the above cases. The complete statement of bounds
    <eqref|eq:boundary-regularity> follows since for any collection
    <math|E<rsub|i>> it holds that\ 

    <\equation*>
      <mf|b><rsub|<big|cup><rsub|i>E<rsub|i>><around*|(|\<eta\>,y|)>=sup<rsub|i>
      <mf|b><rsub|E<rsub|i>><around*|(|\<eta\>,y|)>,<space|2em>
      <mf|b><rsub|<big|cap><rsub|i>E<rsub|i>><around*|(|\<eta\>,y|)>=inf<rsub|i>
      <mf|b><rsub|E<rsub|i>><around*|(|\<eta\>,y|)>,
    </equation*>

    and the conditions <smart-ref|eq:boundary-regularity> are stable with
    respect to the operations above. We obtain
    <eqref|eq:boundary-singular-size> in the proof of
    <smart-ref|lem:geometry-of-boundary-local>, below.\ 
  </render-proof>

  <\render-proof|Proof of <smart-ref|lem:geometry-of-boundary-local>>
    To show <eqref|eq:boundary-pullback-condition>, given
    <math|<mf|b>\<suchthat\><R><rsup|2>\<rightarrow\><around*|[|0,\<infty\>|]>>
    let us construct <math|><math|<mf|b><rsup|\<ast\>>:\<Theta\>\<times\>B<rsub|1>\<rightarrow\><around*|[|0,+\<infty\>|)>>.
    We define

    <\equation*>
      <mf|b><rsup|\<ast\>><around*|(|\<theta\>,\<zeta\>|)><eqd>sup<around*|<left|{|1>|\<sigma\>:s<rsub|T>\<sigma\>\<leq\><mf|b><around*|(|\<xi\><rsub|T>+\<theta\><around*|(|s<rsub|T>\<sigma\>|)><rsup|-1>,x<rsub|T>+s<rsub|T>\<zeta\>|)>|<right|}|1>>
    </equation*>

    that gives <math|><math|<mf|b><rsup|\<ast\>><around*|(|\<theta\>,\<zeta\>|)>\<geq\>0>
    since <math|<mf|b><around*|(|\<eta\>,y|)>\<geq\>0>. Note that the
    function

    <\equation*>
      \<sigma\>\<mapsto\>s<rsub|T>\<sigma\>-<mf|b><rsub|E><around*|(|\<xi\><rsub|T>+\<theta\><around*|(|s<rsub|T>\<sigma\>|)><rsup|-1>,x<rsub|T>+s<rsub|T>\<zeta\>|)>
    </equation*>

    is continuous and for any <math|\<theta\>\<in\>\<Theta\>> and
    <math|\<zeta\>\<in\><R>> it holds that\ 

    <\equation*>
      <frac|<dd><rsub|\<sigma\>>|s<rsub|T>><around*|<left|(|1>|s<rsub|T>\<sigma\>-<mf|b><rsub|E><around*|(|\<xi\><rsub|T>+\<theta\><around*|(|s<rsub|T>\<sigma\>|)><rsup|-1>,x<rsub|T>+s<rsub|T>\<zeta\>|)>|<right|)|1>>=1+\<theta\><frac|\<partial\><rsub|\<eta\>><mf|b><rsub|E><around*|(|\<xi\><rsub|T>+\<theta\><around*|(|s<rsub|T>\<sigma\>|)><rsup|-1>,x<rsub|T>+s<rsub|T>\<zeta\>|)>|s<rsub|T>\<sigma\><rsup|2>>.
    </equation*>

    Thus if <math|s<rsub|T>\<sigma\>-<mf|b><rsub|E><around*|(|\<xi\><rsub|T>+\<theta\><around*|(|s<rsub|T>\<sigma\>|)><rsup|-1>,x<rsub|T>+s<rsub|T>\<zeta\>|)>>
    is in a small neighborhood of <math|0> and
    <math|\<theta\>\<in\>\<Theta\>=<around*|(|\<theta\><rsub|->,\<theta\><rsub|+>|)>>
    it holds, thank to <eqref|eq:boundary-regularity>, that\ 

    <\equation*>
      <frac|<dd><rsub|\<sigma\>>|s<rsub|T>><around*|<left|(|1>|s<rsub|T>\<sigma\>-<mf|b><around*|(|\<xi\><rsub|T>+\<theta\><around*|(|s<rsub|T>\<sigma\>|)><rsup|-1>,x<rsub|T>+s<rsub|T>\<zeta\>|)>|<right|)|1>>\<gtr\>0.
    </equation*>

    It follows that <math|s<rsub|T>\<sigma\>-<mf|b><rsub|E><around*|(|\<xi\><rsub|T>+\<theta\><around*|(|s<rsub|T>\<sigma\>|)><rsup|-1>,x<rsub|T>+s<rsub|T>\<zeta\>|)>>
    can change sign only once and from <math|\<less\>0> to <math|\<gtr\>0>.
    This shows <eqref|eq:boundary-pullback-condition>. We can now
    differentiate the identities

    <\equation*>
      <ltae|<tformat|<table|<row|<cell|<mf|b><around*|(|\<eta\>,y|)>=s<rsub|T><mf|b><rsup|\<ast\>><around*|(|\<theta\>,\<zeta\>|)>,<space|2em><mf|b><around*|(|\<eta\>,y|)><around*|(|\<eta\>-\<xi\><rsub|T>|)>=\<theta\>,<space|2em>y=x<rsub|T>+s<rsub|T>\<zeta\>,>>>>>
    </equation*>

    to obtain

    <\equation*>
      <around*|\||\<partial\><rsub|\<zeta\>><mf|b><rsup|\<ast\>><around*|(|\<theta\>,\<zeta\>|)>|\|>\<leq\>\<beta\><rsup|-1>
    </equation*>

    and\ 

    <\equation*>
      \<partial\><rsub|\<eta\>><mf|b><around*|(|\<eta\>,y|)>=s<rsub|T>\<partial\><rsub|\<theta\>><mf|b><rsup|\<ast\>><around*|(|\<theta\>,\<zeta\>|)><around*|(|\<partial\><rsub|\<eta\>><mf|b><around*|(|\<eta\>,y|)><around*|(|\<eta\>-\<xi\><rsub|T>|)>+<mf|b><around*|(|\<eta\>,y|)>|)>,
    </equation*>

    giving that\ 

    <\equation*>
      <frac|\<partial\><rsub|\<theta\>><mf|b><rsup|\<ast\>><around*|(|\<theta\>,\<zeta\>|)>|<mf|b><rsup|\<ast\>><around*|(|\<theta\>,\<zeta\>|)>>=<frac|\<partial\><rsub|\<eta\>><mf|b><around*|(|\<eta\>,y|)>|<mf|b><around*|(|\<eta\>,y|)><rsup|2>><around*|(|<frac|\<partial\><rsub|\<eta\>><mf|b><around*|(|\<eta\>,y|)>|<mf|b><around*|(|\<eta\>,y|)><rsup|2>>\<theta\>+1|)><rsup|-1>
    </equation*>

    and thus the required bound <eqref|eq:boundary-regularity-local>.

    Finally, by definition of the local size
    <math|<SL><rsup|<around*|(|u,1|)>><rsub|\<Theta\>><around*|(|T|)>> we
    dualize with <math|G\<in\>C<rsup|\<infty\>><rsub|c><around*|(|T|)>> and
    obtain that\ 

    <\equation>
      <label|eq:boundary-singular-size-local-duality><ltae|<tformat|<cwith|1|1|1|1|cell-halign|l>|<table|<row|<cell|<big|int><rsub|<R><rsup|3><rsub|+>>F<around*|(|\<eta\>,y,t|)>G<around*|(|\<eta\>,y,t|)>t\<delta\><around*|(|t-<mf|b><rsub|E><rsup|><around*|(|\<eta\>,y|)>|)><dd>\<eta\><dd>y<dd>t>>|<row|<cell|<space|1em>=<big|int><rsub|<R><rsup|3><rsub|+>>F<around*|(|\<eta\>,y,<mf|b><rsup|><around*|(|\<eta\>,y|)>|)>G<around*|(|\<eta\>,y,<mf|b><rsub|E><rsup|><rsup|><around*|(|\<eta\>,y|)>|)><mf|b><rsub|E><rsup|><around*|(|\<eta\>,y|)><dd>\<eta\><dd>y.>>>>>
    </equation>

    We change of variables and set <math|\<theta\>=<mf|b><rsub|E><rsup|><around*|(|\<eta\>,y|)><around*|(|\<eta\>-\<xi\><rsub|T>|)>>,
    <math|\<zeta\>=<frac|y-x<rsub|T>|s<rsub|T>>>. The Jacobian is given by\ 

    <\equation*>
      J<around*|(|\<eta\>,y|)>=<mf|b><rsub|E><rsup|><around*|(|\<eta\>,y|)><around*|(|1+<around*|(|\<eta\>-\<xi\><rsub|T>|)><frac|\<partial\><rsub|\<eta\>><mf|b><rsub|E><rsup|><around*|(|\<eta\>,y|)>|<mf|b><rsub|E><rsup|><around*|(|\<eta\>,y|)>>|)>.
    </equation*>

    From bound <eqref|eq:boundary-regularity> we obtain that when
    <math|<around*|(|\<eta\>,y,t|)>\<in\>T> and, in particular, when
    <math|t<around*|(|\<eta\>-\<xi\><rsub|T>|)>\<in\>\<Theta\>>, it holds
    that\ 

    <\equation*>
      0\<less\>J<around*|(|\<eta\>,y|)>\<lesssim\>1
    </equation*>

    so the change of variables is valid. We set
    <math|J<rsup|\<ast\>><around*|(|\<theta\>,\<zeta\>|)><eqd>J<around*|<left|(|1>|\<eta\><around*|(|\<theta\>|)>,y<around*|(|\<zeta\>|)>|<right|)|1>>>
    and from bound <eqref|eq:boundary-regularity> we obtain that\ 

    <\equation*>
      <dist><around*|(|\<theta\>,<R>\<setminus\>\<Theta\>|)>\<lesssim\>J<rsup|\<ast\>><around*|(|\<theta\>,\<zeta\>|)>\<lesssim\>1.
    </equation*>

    Rewriting <eqref|eq:boundary-singular-size-local-duality> in new
    coordinates we get

    <\equation*>
      <ltae|<tformat|<cwith|1|1|1|1|cell-halign|l>|<table|<row|<cell|<big|int><rsub|<R><rsup|3><rsub|+>>F<around*|(|\<eta\>,y,<mf|b><rsup|><around*|(|\<eta\>,y|)>|)>G<around*|(|\<eta\>,y,<mf|b><rsup|><around*|(|\<eta\>,y|)>|)><mf|b><around*|(|\<eta\>,y|)><dd>\<eta\><dd>y>>|<row|<cell|<space|1em>=<big|int><rsub|<R><rsup|3><rsub|+>>F\<circ\>\<pi\><rsub|T><around*|<left|(|1>|\<theta\>,\<zeta\>,<mf|b><rsub|E><rsup|\<ast\>><around*|(|\<sigma\>,\<zeta\>|)>|<right|)|1>>G<around*|(|\<theta\>,\<zeta\>,<mf|b><rsub|E><rsup|\<ast\>><around*|(|\<sigma\>,\<zeta\>|)>|)><frac|1|J<rsup|\<ast\>><around*|(|\<theta\>,\<zeta\>|)>><frac|\<mathd\>\<theta\>\<mathd\>\<zeta\>|<around*|\||\<Theta\>|\|>>.>>>>>
    </equation*>

    Taking the upper bound over <math|G> with
    <math|<around*|\<\|\|\>|G\<circ\>\<pi\><rsub|T>|\<\|\|\>><rsub|L<rsup|u<rprime|'>><rsub|<frac|\<mathd\>\<theta\>\<mathd\>\<zeta\>|<around*|\||\<Theta\>|\|>>*>L<rsup|\<infty\>><rsub|<frac|\<mathd\>\<sigma\>|\<sigma\>>>>\<leq\>1>
    we get that\ 

    <\equation*>
      <around*|<left|\<\|\|\>|2>|F<around*|(|\<eta\>,y,t|)>t<dd><rsub|t><1><rsub|E><around*|(|\<eta\>,y,t|)>|<right|\<\|\|\>|2>><rsub|<SL><rsup|<around*|(|u,1|)>><rsub|<around*|(|\<Theta\>,<wide|\<Theta\>|~>|)>><around*|(|T|)>><rsup|u>=<big|int><rsub|<R><rsup|3><rsub|+>><around*|<left|\||2>|<1><rsub|<mT><rsub|<wide|\<Theta\>|~>>><around*|(|F\<circ\>\<pi\><rsub|T>|)><around*|<left|(|1>|\<theta\>,\<zeta\>,<mf|b><rsub|E><rsup|\<ast\>><around*|(|\<sigma\>,\<zeta\>|)>|<right|)|1>>|<right|\||2>><rsup|u>J<rsup|\<ast\>><around*|(|\<theta\>,\<zeta\>|)><rsup|-u><frac|\<mathd\>\<theta\>\<mathd\>\<zeta\>|<around*|\||\<Theta\>|\|>>,
    </equation*>

    that shows <eqref|eq:boundary-singular-size-local>. Finally, using the
    inverse change of variables <math|<around*|(|\<eta\>,y|)>=<around*|(|\<xi\><rsub|T>+\<theta\><around*|(|s<rsub|T><mf|b><rsub|E><rsup|\<ast\>><around*|(|\<theta\>,\<zeta\>|)>|)><rsup|-1>,x<rsub|T>+s<rsub|T>\<zeta\>|)>>
    we get\ 

    <\equation*>
      <around*|<left|\<\|\|\>|2>|F<around*|(|\<eta\>,y,t|)>t<dd><rsub|t><1><rsub|E><around*|(|\<eta\>,y,t|)>|<right|\<\|\|\>|2>><rsub|<SL><rsup|<around*|(|u,1|)>><rsub|<around*|(|\<Theta\>,<wide|\<Theta\>|~>|)>><around*|(|T|)>><rsup|u>=<frac|1|<around*|\||\<Theta\>|\|>s<rsub|T>><big|int><rsub|<R><rsup|2>><tabular*|<tformat|<twith|table-valign|T>|<cwith|1|1|1|1|cell-halign|l>|<cwith|2|2|1|1|cell-halign|l>|<table|<row|<cell|<1><rsub|\<pi\><rsub|T><around*|(|<mT><rsub|<wide|\<Theta\>|~>>|)>><around*|(|\<eta\>,y,<mf|b><rsub|E><rsup|><around*|(|\<eta\>,y|)>|)><around*|<left|\||2>|F<around*|<left|(|1>|\<eta\>,y,<mf|b><rsub|E><rsup|><around*|(|\<eta\>,y|)>|<right|)|1>>|<right|\||2>><rsup|u>>>|<row|<cell|<space|2em>\<times\>J<around*|(|\<eta\>,y|)><rsup|1-u>
      <mf|b><rsub|E><rsup|><around*|(|\<eta\>,y|)><dd>\<eta\><dd>y.>>>>>
    </equation*>

    This shows <eqref|eq:boundary-singular-size>, concluding the proof.
  </render-proof>

  <section|The single tree estimate<label|sec:single-tree>>

  In this section we prove bounds <eqref|eq:STE:l-l-o> and
  <eqref|eq:STE:l-o-o>. These bounds correspond to the
  <math|L<rsup|\<infty\>>> endpoint of <smart-ref|prop:outer-restricted-interpolation>
  since, tautologically, <math|L<rsub|\<mu\>><rsup|\<infty\>><SO>\<equiv\><SO>>.
  The conditions below are satisfied for <math|<around*|(|\<alpha\><rsub|j>,\<beta\><rsub|j>,\<gamma\><rsub|j>|)>>
  described in <smart-ref|eq:gamma:params>.

  <\theorem>
    <dueto|Single tree estimates><label|thm:STE> Let
    <math|B<rsub|8>\<subset\>\<Theta\>>, <math|<gr>\<less\>2<rsup|-4>>,
    <math|N\<in\><N>> be sufficiently large, and suppose

    <\itemize>
      <item><math|\<Gamma\><rsub|j>=\<Gamma\><rsub|<around*|(|\<alpha\><rsub|j>,\<beta\><rsub|j>,\<gamma\><rsub|j>|)>>>,
      <math|j\<in\><around*|{|1,2,3|}>>, with
      <math|<around*|(|\<alpha\><rsub|j>,\<beta\><rsub|j>,\<gamma\><rsub|j>|)>>
      satisfy the conditions of <eqref|eq:gamma>,

      <item><math|\<beta\><rsub|1>\<gtr\><frac|1|2>>,

      <item><math|\<alpha\><rsub|1>+\<alpha\><rsub|2>+\<alpha\><rsub|3>=0>,

      <item><math|<around*|\||\<theta\><rsub|\<Gamma\><rsub|j>>|\|>\<gtr\>3<gr>>
      when <math|\<theta\><rsub|\<Gamma\><rsub|1>>=0> (recall that
      <math|\<theta\><rsub|\<Gamma\><rsub|j>>=\<alpha\><rsub|j>\<beta\><rsub|j><around*|(|\<theta\>+\<gamma\><rsub|j>|)>>
      as in <eqref|eq:theta-gamma>).
    </itemize>

    The bound <eqref|eq:STE:l-l-o> holds for any three functions
    <math|F<rsub|j>\<in\><Rad><around*|(|<R><rsup|3><rsub|+>|)>\<otimes\>\<Phi\><rsub|4<gr>><rsup|\<infty\>><rprime|'>>,
    <math|j\<in\><around*|{|1,2,3|}>>, \ as long as
    <math|<around*|(|u<rsub|1>,u<rsub|2>,u<rsub|3>|)>\<in\><around*|[|1,\<infty\>|]><rsup|3>>
    with <math|<big|sum><rsub|j=1><rsup|3>u<rsub|j><rsup|-1>\<leq\>1>.\ 

    The bound <eqref|eq:STE:l-o-o> holds for any three functions
    <math|F<rsub|j>\<in\><Rad><around*|(|<R><rsup|3><rsub|+>|)>\<otimes\>\<Phi\><rsub|4<gr>><rsup|\<infty\>><rprime|'>>,
    <math|j\<in\><around*|{|1,2,3|}>> as long as
    <math|<around*|(|u<rsub|1>,u<rsub|\<times\>>|)>\<in\><around*|[|1,\<infty\>|]><rsup|2>>
    with <math|u<rsub|1><rsup|-1>+u<rsub|\<times\>><rsup|-1>\<leq\>1>.
  </theorem>

  Thanks to identity <smart-ref|eq:generated-size:trees>, to prove we fix an
  arbitrary <math|T\<in\><TT><rsub|\<Theta\>>> and show that bounds

  <\equation*>
    <around*|\<\|\|\>|F<rsub|1>F<rsub|2>F<rsub|3>|\<\|\|\>><rsub|<SI><rsup|<around*|(|l|)>><rsub|\<Theta\>>\<Phi\><rsub|<gr>><rsup|N><around*|(|T|)>>\<lesssim\><rsub|><around*|\<\|\|\>|F<rsub|1>|\<\|\|\>><rsub|<SF><rsub|\<Gamma\><rsub|1>><rsup|u<rsub|1>>\<Phi\><rsub|4<gr>><rsup|N-3><around*|(|T|)>><around*|\<\|\|\>|F<rsub|2>|\<\|\|\>><rsub|<mbb|U><rsub|\<Gamma\><rsub|2>><rsup|u<rsub|2>>\<Phi\><rsub|4<gr>><rsup|N-5><around*|(|T|)>><around*|\<\|\|\>|F<rsub|3>|\<\|\|\>><rsub|<SU><rsub|\<Gamma\><rsub|3>><rsup|u<rsub|3>>\<Phi\><rsub|4<gr>><rsup|N-5><around*|(|T|)>>
  </equation*>

  and

  <\equation*>
    <around*|\<\|\|\>|F<rsub|1>F<rsub|2>F<rsub|3>|\<\|\|\>><rsub|<SI><rsup|<around*|(|o|)>><rsub|\<Theta\>>\<Phi\><rsub|<gr>><rsup|N><around*|(|T|)>>\<lesssim\><around*|\<\|\|\>|F<rsub|1>|\<\|\|\>><rsub|<SF><rsub|\<Gamma\><rsub|1>><rsup|u<rsub|1>>\<Phi\><rsub|4<gr>><rsup|N-5><around*|(|T|)>><around*|\<\|\|\>|F<rsub|2>F<rsub|3>|\<\|\|\>><rsub|<SU><rsub|\<Gamma\><rsub|\<times\>>><rsup|u<rsub|\<times\>>><around*|(|\<Phi\>\<otimes\>\<Phi\>|)><rsub|4<gr>><rsup|N-5><around*|(|T|)>>
  </equation*>

  hold for all <math|F<rsub|j>\<in\>C<rsup|\<infty\>><rsub|c><around*|(|T|)>\<otimes\>\<Phi\><rsub|4<gr>><rsup|\<infty\>><rprime|'>>,
  hence the name \Psingle tree estimates\Q. First of all, we show that under
  the geometric assumptions of <smart-ref|thm:STE> it holds that

  <\equation>
    <label|eq:vanishing-size><around*|\<\|\|\>|F<rsub|1>F<rsub|2>F<rsub|3>|\<\|\|\>><rsub|<SI><rsup|<around*|(|o,\<star\><rsub|2>,\<star\><rsub|3>|)>><rsub|\<Theta\>>\<Phi\><rsub|<gr>><rsup|N><around*|(|T|)>>=0
  </equation>

  when <math|o\<in\><around*|{|\<star\><rsub|2>,\<star\><rsub|3>|}>>. Thus,
  to show the former bound it is sufficient to discuss the bound

  <\equation>
    <label|eq:STE:o-l-l:tree><ltae|<tformat|<cwith|1|1|1|1|cell-halign|l>|<table|<row|<cell|<around*|\<\|\|\>|F<rsub|1>F<rsub|2>F<rsub|3>|\<\|\|\>><rsub|<around*|(|<SI><rsup|<around*|(|o,l,l|)>><rsub|\<Theta\>>\<Phi\><rsub|<gr>><rsup|N>+<SI><rsup|<around*|(|l,l,l|)>><rsub|\<Theta\>>\<Phi\><rsub|<gr>><rsup|N>|)><around*|(|T|)>>>>|<row|<cell|<space|1em>\<lesssim\><around*|\<\|\|\>|F<rsub|1>|\<\|\|\>><rsub|<SF><rsub|\<Gamma\><rsub|1>><rsup|u<rsub|1>>\<Phi\><rsub|4<gr>><rsup|N-5><around*|(|T|)>><around*|\<\|\|\>|F<rsub|2>|\<\|\|\>><rsub|<SU><rsub|\<Gamma\><rsub|2>><rsup|u<rsub|2>>\<Phi\><rsub|4<gr>><rsup|N-5><around*|(|T|)>><around*|\<\|\|\>|F<rsub|3>|\<\|\|\>><rsub|<SU><rsub|\<Gamma\><rsub|3>><rsup|u<rsub|3>>\<Phi\><rsub|4<gr>><rsup|N-5><around*|(|T|)>>>>>>>
  </equation>

  (when <math|\<star\><rsub|2>=\<star\><rsub|3>=l>) and the bound

  <\equation>
    <label|eq:STE:l-l-o:tree><ltae|<tformat|<cwith|1|1|1|1|cell-halign|l>|<table|<row|<cell|<around*|\<\|\|\>|F<rsub|1>F<rsub|2>F<rsub|3>|\<\|\|\>><rsub|<around*|(|<SI><rsup|<around*|(|l,l,o|)>><rsub|\<Theta\>>\<Phi\><rsub|<gr>><rsup|N>+<SI><rsup|<around*|(|l,o,l|)>><rsub|\<Theta\>>\<Phi\><rsub|<gr>><rsup|N>|)><around*|(|T|)>>>>|<row|<cell|<space|1em>\<lesssim\><around*|\<\|\|\>|F<rsub|1>|\<\|\|\>><rsub|<SF><rsub|\<Gamma\><rsub|1>><rsup|u<rsub|1>>\<Phi\><rsub|4<gr>><rsup|N-5><around*|(|T|)>><around*|\<\|\|\>|F<rsub|2>|\<\|\|\>><rsub|<SU><rsub|\<Gamma\><rsub|2>><rsup|u<rsub|2>>\<Phi\><rsub|4<gr>><rsup|N-5><around*|(|T|)>><around*|\<\|\|\>|F<rsub|3>|\<\|\|\>><rsub|<SU><rsub|\<Gamma\><rsub|3>><rsup|u<rsub|3>>\<Phi\><rsub|4<gr>><rsup|N-5><around*|(|T|)>>>>>>>
  </equation>

  (when <math|o\<in\><around*|{|\<star\><rsub|2>,\<star\><rsub|3>|}>>). On
  the other hand, showing the bound with <math|<SI><rsup|<around*|(|o|)>><rsub|\<Theta\>>\<Phi\><rsub|<gr>><rsup|N><around*|(|T|)>>
  reduces to showing the bound

  <\equation>
    <label|eq:STE:l-o-o:tree><around*|\<\|\|\>|F<rsub|1>F<rsub|2>F<rsub|3>|\<\|\|\>><rsub|<SI><rsup|<around*|(|l,o,o|)>><rsub|\<Theta\>>\<Phi\><rsub|<gr>><rsup|N><around*|(|T|)>>\<lesssim\><around*|\<\|\|\>|F<rsub|1>|\<\|\|\>><rsub|<SF><rsub|\<Gamma\><rsub|1>><rsup|u<rsub|1>>\<Phi\><rsub|4<gr>><rsup|N-5><around*|(|T|)>><around*|\<\|\|\>|F<rsub|2>F<rsub|3>|\<\|\|\>><rsub|<SU><rsub|\<Gamma\><rsub|\<times\>>><rsup|u<rsub|\<times\>>><around*|(|\<Phi\>\<otimes\>\<Phi\>|)><rsub|4<gr>><rsup|N-5><around*|(|T|)>>.
  </equation>

  These bounds generalize to functions <math|F\<in\><Rad><around*|(|<R><rsup|3><rsub|+>|)>\<otimes\>\<Phi\><rsub|4<gr>><rsup|\<infty\>><rprime|'>>
  allowing us to conclude that bounds <eqref|eq:STE:l-l-o> and
  <eqref|eq:STE:l-o-o> hold.

  <\remark>
    A standard mollification argument allows us to extend bounds
    <eqref|eq:STE:o-l-l:tree>, <eqref|eq:STE:l-l-o:tree>, and
    <eqref|eq:STE:l-o-o:tree> from the case of
    <math|F<rsub|j>\<in\>C<rsup|\<infty\>><rsub|c><around*|(|T|)>\<otimes\>\<Phi\><rsub|4<gr>><rsup|\<infty\>><rprime|'>>
    to all functions <math|F<rsub|j>\<in\><Rad><around*|(|T|)>\<otimes\>\<Phi\><rsub|4<gr>><rsup|\<infty\>><rprime|'>>
    that are compactly supported in the interior of <math|T>. As a matter of
    fact all the local sizes in play are continuous with respect to
    mollification with a compactly supported approximate identity.\ 

    To remove the compactness assumption on the support we set

    <\equation*>
      \<bbb-K\><rsub|n>=<ltae|<tformat|<table|<row|<cell|<around*|<left|(|2>|T\<cap\>T<rsub|\<Theta\>><around*|(|\<xi\><rsub|T>+2<rsup|-n>,x<rsub|T>,<around*|(|1-2<rsup|-n>|)>s<rsub|T>|)>\<cap\>T<rsub|\<Theta\>><around*|(|\<xi\><rsub|T>+2<rsup|-n>,x<rsub|T>,<around*|(|1-2<rsup|-n>|)>s<rsub|T>|)>|<right|)|2>>>>|<row|<cell|\<setminus\><around*|<left|{|1>|<around*|(|\<eta\>,y,t|)>,t\<gtr\>2<rsup|-n>|<right|}|1>>>>>>><ltae|<tformat|<cwith|1|1|1|1|cell-halign|r>|<table|<row|<cell|>>>>>
    </equation*>

    so that <math|<1><rsub|\<bbb-K\><rsub|n>>F<rsub|j>> are compactly
    supported in the interior of <math|T>. \ Per
    <smart-ref|def:integral-sizes> of the local sizes
    <math|<SI><rsub|\<Theta\>><rsup|<around*|(|\<star\><rsub|1>,\<star\><rsub|2>,\<star\><rsub|3>|)>>\<Phi\><rsub|4<gr>><rsup|N>>,
    <math|<around*|(|\<star\><rsub|1>,\<star\><rsub|2>,\<star\><rsub|3>|)>\<in\><around*|{|o,l|}><rsup|3>>,
    we have that

    <\equation*>
      <around*|\<\|\|\>|F<rsub|1>F<rsub|2>F<rsub|3>|\<\|\|\>><rsub|<SI><rsub|\<Theta\>><rsup|<around*|(|\<star\><rsub|1>,\<star\><rsub|2>,\<star\><rsub|3>|)>>\<Phi\><rsub|<gr>><rsup|N><around*|(|T|)>>\<leq\>liminf<rsub|n><around*|\<\|\|\>|<1><rsub|\<bbb-K\><rsub|n>>F<rsub|1>F<rsub|2>F<rsub|3>|\<\|\|\>><rsub|<SI><rsub|\<Theta\>><rsup|<around*|(|\<star\><rsub|1>,\<star\><rsub|2>,\<star\><rsub|3>|)>>\<Phi\><rsub|<gr>><rsup|N><around*|(|T|)>>.
    </equation*>

    On the other hand, according to <smart-ref|eq:generated-size:trees>, the
    terms on <RHS|><eqref|eq:STE:l-l-o> and <RHS|<eqref|eq:STE:l-o-o>>
    increase at most by a fixed factor when replacing <math|F<rsub|j>> by
    <math|<1><rsub|W<rsup|+>>F<rsub|j><rsub|>> or by
    <math|<1><rsub|<R><rsup|3><rsub|+>\<setminus\>W<rsup|->>F<rsub|j>> with
    <math|W<rsup|\<pm\>>\<in\><TT><rsub|\<Theta\>><rsup|\<cup\>>>; the
    transformation <math|F<rsub|j>\<mapsto\><1><rsub|\<bbb-K\><rsub|n>>F<rsub|j>>
    can be expressed as at most <math|4> such steps. This concludes the
    reduction and shows that bounds <eqref|eq:STE:o-l-l:tree>,
    <eqref|eq:STE:l-l-o:tree>, and <eqref|eq:STE:l-o-o:tree> hold for all
    <math|F\<in\><Rad><around*|(|<R><rsup|3><rsub|+>|)>\<otimes\>\<Phi\><rsub|4<gr>><rsup|\<infty\>><rprime|'>>.
  </remark>

  <\remark>
    We offer some suggestions for a first reading of the proof of bounds
    <eqref|eq:STE:o-l-l:tree>, <eqref|eq:STE:l-l-o:tree>, and
    <eqref|eq:STE:l-o-o:tree> .\ 

    One can suppose that <math|T=T<rsub|\<Theta\>><around*|(|0,0,1|)>>. At
    the end of <smart-ref|sec:time-frequency-outer-lebesgue> we discussed how
    our notation is naturally keeps track of symmetries when dealing with
    general trees <math|T\<in\><TT><rsub|\<Theta\>>>.

    One can suppose that <math|\<beta\><rsub|1>=1>,
    <math|\<beta\><rsub|2>=\<beta\><rsub|3>=\<beta\>>,
    <math|\<alpha\><rsub|1>=1>, <math|\<alpha\><rsub|2>=\<alpha\><rsub|3>=\<beta\><rsup|-1>,>
    and <math|\<gamma\><rsub|1>=0>, <math|\<gamma\><rsub|2>=\<gamma\><rsub|3>=<frac|1|2>>.
    The second assumption is formally not allowed since we require that
    <math|\<alpha\><rsub|1>+\<alpha\><rsub|2>+\<alpha\><rsub|3>=0>. However,
    this fact is used only in the initial reduction following
    <eqref|eq:local-F> and is irrelevant in the case when
    <math|\<xi\><rsub|T>=0> (e.g. when <math|T=T<rsub|\<Theta\>><around*|(|0,0,1|)>>).

    In the proof of <smart-ref|eq:STE:o-l-l:tree> one can assume that
    <math|\<theta\><rsub|\<Gamma\><rsub|1>>=0> is fixed instead of
    integrating over <math|\<theta\>\<in\>\<Theta\>>; in the proof of
    <eqref|eq:STE:l-l-o:tree> and of <eqref|eq:STE:l-o-o:tree> one can assume
    that <math|\<theta\><rsub|\<Gamma\><rsub|1>>=-<frac|1|2>> so that
    <math|\<theta\><rsub|\<Gamma\><rsub|j>>=0> for
    <math|j\<in\><around*|{|2,3|}>>.

    Next, one can suppose that <math|F<rsub|j>=<Emb><around*|[|f<rsub|j>|]>>.
    This guarantees that \ 

    <\equation*>
      <ltae|<tformat|<table|<row|<cell|F<rsub|j><rsup|\<ast\>><around*|(|\<theta\>,\<zeta\>,\<sigma\>|)><around*|[|\<phi\>|]><eqd>f<rsub|j>\<ast\><Dil><rsub|\<beta\><rsub|j>\<sigma\>>Mod<rsub|\<theta\><rsub|\<Gamma\><rsub|j>>>\<phi\><rsup|\<vee\>>,>>>>>
    </equation*>

    where \ <math|F<rsub|j><rsup|\<ast\>>=F<rsub|j>\<circ\>\<Gamma\><rsub|j>\<circ\>\<pi\><rsub|T>>.
    In particular, it holds that\ 

    <\equation*>
      <ltae|<tformat|<cwith|1|1|1|1|cell-halign|l>|<table|<row|<cell|<wpD><rsub|\<sigma\>><around*|(|\<theta\><rsub|\<Gamma\><rsub|j>>|)>F<rsub|j><rsup|\<ast\>><around*|(|\<theta\>,\<zeta\>,\<sigma\>|)><around*|[|\<phi\>|]>-\<sigma\><dd><rsub|\<sigma\>><around*|(|f<rsub|j>\<ast\><Dil><rsub|\<beta\><rsub|j>\<sigma\>>Mod<rsub|\<theta\><rsub|\<Gamma\><rsub|j>>>\<phi\><rsup|\<vee\>>|)>=0,>>|<row|<cell|<wpD><rsub|\<zeta\>><around*|(|\<theta\><rsub|\<Gamma\><rsub|j>>|)>F<rsub|j><rsup|\<ast\>><around*|(|\<theta\>,\<zeta\>,\<sigma\>|)><around*|[|\<phi\>|]>-\<beta\><rsub|j>\<sigma\><dd><rsub|\<zeta\>><around*|(|f<rsub|j>\<ast\><Dil><rsub|\<beta\><rsub|j>\<sigma\>>Mod<rsub|\<theta\><rsub|\<Gamma\><rsub|j>>>\<phi\><rsup|\<vee\>>|)>=0.>>>>>
    </equation*>

    When <math|F<rsub|j>> is a more general function, the defect sizes
    included in <math|<SF><rsub|\<Gamma\><rsub|1>><rsup|u<rsub|1>>\<Phi\><rsup|N><rsub|<gr>>>,
    <math|<SU><rsub|\<Gamma\><rsub|j>><rsup|u<rsub|j>>\<Phi\><rsup|N><rsub|<gr>>>,
    and <math|<SU><rsub|\<Gamma\><rsub|\<times\>>><rsup|u<rsub|\<times\>>><around*|(|\<Phi\>\<otimes\>\<Phi\>|)><rsup|N><rsub|<gr>>>
    are used to control the magnitude of the terms above. One may disregard
    these terms as well as boundary terms appearing when integrating by
    parts: they too are controlled by the defect sizes.
  </remark>

  We begin with preliminaries used in the proofs of all three of the bounds
  <eqref|eq:STE:o-l-l:tree>, <eqref|eq:STE:l-l-o:tree>, and
  <eqref|eq:STE:l-o-o:tree>. Per <smart-ref|def:integral-sizes>, we need to
  bound

  <\equation*>
    <big|int><rsub|\<Theta\>><around*|<left|\||-1>|<big|int><rsub|0><rsup|\<infty\>><around*|<left|(|-3>|<big|prod><rsub|j=1><rsup|3>F<rsub|j>|<right|)|-3>>\<circ\>\<pi\><rsub|T><around*|(|\<theta\>,\<zeta\>,\<sigma\>|)><around*|<left|[|1>|\<phi\><rsub|1,\<theta\>><rsup|\<star\><rsub|1>>,\<phi\><rsub|2,\<theta\>><rsup|\<star\><rsub|2>>,\<phi\><rsub|3,\<theta\>><rsup|\<star\><rsub|3>>|<right|]|1>><dd>\<zeta\><frac|<dd>\<sigma\>|\<sigma\>>|<right|\||-1>><frac|<dd>\<theta\>|<around*|\||\<Theta\>|\|>>,
  </equation*>

  for <math|<around*|(|\<star\><rsub|1>,\<star\><rsub|2>,\<star\><rsub|3>|)>\<in\><around*|{|o,l|}><rsup|3>>,
  for an arbitrary wave packet <math|\<phi\>\<in\>\<Phi\><rsup|\<infty\>><rsub|<gr>/2>>,
  and with <math|\<phi\><rsub|j,\<theta\>><rsup|\<star\><rsub|j>>> defined by
  <eqref|eq:lac-ov-wp-decomp>. Since <math|\<alpha\><rsub|1>+\<alpha\><rsub|2>+\<alpha\><rsub|3>=0>
  it holds that\ 

  <\equation>
    <label|eq:local-F><ltae|<tformat|<table|<row|<cell|<around*|<left|(|-3>|<big|prod><rsub|j=1><rsup|3>F<rsub|j>|<right|)|-3>>\<circ\>\<pi\><rsub|T><around*|(|\<theta\>,\<zeta\>,\<sigma\>|)>=<big|prod><rsub|j=1><rsup|3>F<rsub|j><rsup|\<ast\>><around*|(|\<theta\>,\<zeta\>,\<sigma\>|)>,>>|<row|<cell|F<rsub|j><rsup|\<ast\>><around*|(|\<theta\>,\<zeta\>,\<sigma\>|)>\<assign\>e<rsup|-2
    \<pi\>i\<alpha\><rsub|j>\<xi\><rsub|T>s<rsub|T>\<zeta\>>F<rsub|j>\<circ\>\<pi\><rsub|T><around*|(|\<theta\>,\<zeta\>,\<sigma\>|)>,<space|1em>j\<in\><around*|{|1,2,3|}>.>>>>>
  </equation>

  Thus, we must bound the quantity

  <\equation*>
    <big|int><rsub|\<Theta\>><around*|<left|\||-2>|<big|int><rsub|<R><rsup|2><rsub|+>><around*|<left|(|-3>|<big|prod><rsub|j=1><rsup|3>F<rsub|j><rsup|\<ast\>><around*|(|\<theta\>,\<zeta\>,\<sigma\>|)><around*|[|\<phi\><rsub|j,\<theta\>><rsup|\<star\><rsub|j>>|]>|<right|)|-3>><dd>\<zeta\><frac|<dd>\<sigma\>|\<sigma\>>|<right|\||-2>><frac|<dd>\<theta\>|<around*|\||\<Theta\>|\|>>.
  </equation*>

  Next, we define the wave packets <math|<wide|\<phi\>|~><rsub|j,\<theta\>><rsup|l><around*|(|z|)>>
  and <math|<wide|\<phi\>|~><rsub|j,\<theta\>><rsup|o><around*|(|z|)>> to
  satisfy\ 

  <\equation*>
    <around*|(|-d<rsub|z>+2\<pi\>i\<theta\><rsub|\<Gamma\><rsub|j>>|)><wide|\<phi\>|~><rsub|j,\<theta\>><rsup|l><around*|(|z|)>=\<phi\><rsub|j,\<theta\>><rsup|l><around*|(|z|)>,<space|2em><around*|(|-d<rsub|z>+2
    \<pi\> i\<theta\><rsub|\<Gamma\><rsub|j>>|)><wide|\<phi\>|~><rsub|j,\<theta\>><rsup|o><around*|(|z|)>=z
    \<phi\><rsub|j,\<theta\>><rsup|o><around*|(|z|)>,
  </equation*>

  We do this by setting\ 

  <\equation>
    <label|eq:tilde-phi-lac><FT|<wide|\<phi\>|~><rsub|j,\<theta\>><rsup|l>><around*|(|<FT|z>|)><eqd><frac|<FT|\<phi\><rsub|j,\<theta\>><rsup|l>><around*|(|<FT|z>|)>|-2\<pi\>i<around*|(|<FT|z>-\<theta\><rsub|\<Gamma\><rsub|j>>|)>>,<space|2em><FT|<wide|\<phi\>|~><rsub|j,\<theta\>><rsup|o>><around*|(|<FT|z>|)><eqd>-<frac|\<partial\>
    <FT|\<phi\><rsub|j,\<theta\>><rsup|o>><around*|(|<FT|z>|)>|4\<pi\><rsup|2><around*|(|<FT|z>-\<theta\><rsub|\<Gamma\><rsub|j>>|)>>.
  </equation>

  These expressions are well defined since the wave packets
  <math|\<phi\><rsub|j,\<theta\>><rsup|l>> and
  <math|\<phi\><rsub|j,\<theta\>><rsup|o>> are smooth and
  <math|<FT|\<phi\><rsub|j,\<theta\>><rsup|l>><around*|(|\<theta\><rsub|\<Gamma\><rsub|j>>|)>=<around*|<left|(|1>|\<partial\><FT|\<phi\><rsub|j,\<theta\>><rsup|o>>|<right|)|1>><around*|(|\<theta\><rsub|\<Gamma\><rsub|j>>|)>=0>.
  As a matter of fact, recall that <math|<FT|\<phi\><rsub|j,\<theta\>><rsup|l>><around*|(|<FT|z>|)>=<FT|\<phi\><rsub|j>><around*|(|<FT|z>|)>-<FT|\<phi\><rsub|j>><around*|(|\<theta\><rsub|\<Gamma\><rsub|j>>|)><FT|\<omega\>><around*|(|<frac|<FT|z>|<gr>>|)>>
  and <math|<around*|(|\<partial\><FT|\<phi\><rsub|j,\<theta\>><rsup|o>>|)><around*|(|<FT|z>|)>=<FT|\<phi\>><rsub|j><around*|(|\<theta\><rsub|\<Gamma\><rsub|j>>|)><gr><rsup|-1><around*|(|\<partial\><FT|\<omega\>>|)><around*|(|<frac|<FT|z>|<gr>>|)>>.
  If <math|\<theta\><rsub|\<Gamma\><rsub|j>>\<notin\>B<rsub|<gr>/2>> both
  wave packets vanish since then <math|<FT|\<phi\><rsub|j>><around*|(|\<theta\><rsub|\<Gamma\><rsub|j>>|)>=0>.
  On the other hand, if <math|\<theta\><rsub|\<Gamma\><rsub|j>>\<in\>B<rsub|<gr>/2>>
  then <math|<FT|\<omega\>><around*|(|<frac|\<theta\><rsub|\<Gamma\><rsub|j>>|<gr>>|)>=1>
  and <math|<around*|(|\<partial\><FT|\<omega\>>|)><around*|(|<frac|\<theta\><rsub|\<Gamma\><rsub|j>>|<gr>>|)>=0>
  by construction of <math|\<omega\>> (see <smart-ref|def:integral-sizes>).
  One can also check that the wave packets
  <math|<wide|\<phi\>|~><rsub|j,\<theta\>><rsup|l>,<wide|\<phi\>|~><rsub|j,\<theta\>><rsup|o>\<in\>\<Phi\><rsup|\<infty\>><rsub|<gr>>>
  satisfy

  <\equation*>
    <around*|\<\|\|\>|<wide|\<phi\>|~><rsub|j,\<theta\>><rsup|o>|\<\|\|\>><rsub|\<Phi\><rsub|<gr>><rsup|N-1>>+<around*|\<\|\|\>|<wide|\<phi\>|~><rsub|j,\<theta\>><rsup|l>|\<\|\|\>><rsub|\<Phi\><rsub|<gr>><rsup|N-1>>\<lesssim\><around*|\<\|\|\>|\<phi\><rsub|j,\<theta\>><rsup|o>|\<\|\|\>><rsub|\<Phi\><rsub|<gr>><rsup|N>>+<around*|\<\|\|\>|\<phi\><rsub|j,\<theta\>><rsup|l>|\<\|\|\>><rsub|\<Phi\><rsub|<gr>><rsup|N>><around*|\<\|\|\>|\<phi\><rsub|j>|\<\|\|\>><rsub|\<Phi\><rsub|<gr>/2><rsup|N>>.
  </equation*>

  <\render-proof|Proof of claim <eqref|eq:vanishing-size>>
    If <math|\<theta\><rsub|\<Gamma\><rsub|1>>\<notin\>B<rsub|<gr>/2>> and
    then <math|\<phi\><rsub|1,\<theta\>><rsup|o>=0> according to
    <smart-ref|def:integral-sizes> and there is nothing to show. On the other
    hand, if <math|\<theta\><rsub|\<Gamma\><rsub|1>>\<in\>B<rsub|<gr>/2>>
    then <math|\<theta\>+\<gamma\><rsub|1>\<in\>B<rsub|<gr>>> since
    <math|<frac|1|2>\<less\><around*|\||\<alpha\><rsub|1>\<beta\><rsub|1>|\|>>.
    It follows that <math|\<theta\><rsub|\<Gamma\><rsub|2>>\<notin\>B<rsub|<gr>/2>>.
    This is because <math|\<theta\><rsub|\<Gamma\><rsub|2>>=\<alpha\><rsub|2>\<beta\><rsub|2><around*|(|\<theta\>+\<gamma\><rsub|2>|)>=\<alpha\><rsub|2>\<beta\><rsub|2><around*|(|\<theta\>+\<gamma\><rsub|1>|)>+\<alpha\><rsub|2>\<beta\><rsub|2><around*|(|\<gamma\><rsub|2>-\<gamma\><rsub|1>|)>>;
    it holds that <math|\<alpha\><rsub|2>\<beta\><rsub|2><around*|(|\<theta\>+\<gamma\><rsub|1>|)>\<in\>B<rsub|2<gr>>>
    since <math|><math|<around*|\||\<alpha\><rsub|1>\<beta\><rsub|1>|\|>\<less\>2>
    and <math|<around*|\||\<alpha\><rsub|2>\<beta\><rsub|2><around*|(|\<gamma\><rsub|2>-\<gamma\><rsub|1>|)>|\|>\<gtr\>3<gr>>
    by the assumption of <smart-ref|thm:STE>, since
    <math|\<alpha\><rsub|2>\<beta\><rsub|2><around*|(|\<gamma\><rsub|2>-\<gamma\><rsub|1>|)>>
    is the value of <math|\<theta\><rsub|\<Gamma\><rsub|2>>> when
    <math|\<theta\><rsub|\<Gamma\><rsub|1>>=0>. But since
    <math|\<theta\><rsub|\<Gamma\><rsub|2>>\<notin\>B<rsub|<gr>/2>> it holds
    that <math|\<phi\><rsub|2,\<theta\>><rsup|o>=0>. A similar argument
    applies to <math|\<theta\><rsub|\<Gamma\><rsub|3>>> when
    <math|\<theta\><rsub|\<Gamma\><rsub|1>>\<in\>B<rsub|<gr>/2>>, proving the
    claim.
  </render-proof>

  <\render-proof|Proof of bound <smart-ref|eq:STE:o-l-l:tree>>
    We deal only with the size <math|<SI><rsup|<around*|(|o,l,l|)>><rsub|\<Theta\>>\<Phi\><rsub|<gr>><rsup|N>>
    appearing on <LHS|<eqref|eq:STE:o-l-l:tree>>; the term
    <math|<SI><rsup|<around*|(|l,l,l|)>><rsub|\<Theta\>>\<Phi\><rsub|<gr>><rsup|N>><math|>
    is dealt with in the same way. We need to show that\ 

    <\equation*>
      <big|int><rsub|\<Theta\>><around*|<left|\||-2>|<big|int><rsub|<R><rsup|2><rsub|+>><around*|<left|(|-3>|<big|prod><rsub|j=1><rsup|3>F<rsub|j><rsup|\<ast\>><around*|(|\<theta\>,\<zeta\>,\<sigma\>|)>|<right|)|-3>><around*|<left|[|1>|\<phi\><rsub|1,\<theta\>><rsup|o<rsub|>>,\<phi\><rsub|2,\<theta\>><rsup|l>,\<phi\><rsub|3,\<theta\>><rsup|l>|<right|]|1>><dd>\<zeta\><frac|<dd>\<sigma\>|\<sigma\>>|<right|\||-2>><frac|<dd>\<theta\>|<around*|\||\<Theta\>|\|>>\<lesssim\><RHS|<eqref|eq:STE:o-l-l:tree>>.
    </equation*>

    It holds that\ 

    <\equation*>
      <ltae|<tformat|<cwith|1|1|1|1|cell-halign|l>|<cwith|2|2|1|1|cell-halign|l>|<table|<row|<cell|<big|int><rsub|\<Theta\>><around*|<left|\||-2>|<big|int><rsub|<R><rsup|2><rsub|+>><around*|<left|(|-3>|<big|prod><rsub|j=1><rsup|3>F<rsub|j><rsup|\<ast\>><around*|(|\<theta\>,\<zeta\>,\<sigma\>|)>|<right|)|-3>><around*|<left|[|1>|\<phi\><rsub|1,\<theta\>><rsup|o<rsub|>>,\<phi\><rsub|2,\<theta\>><rsup|l>,\<phi\><rsub|3,\<theta\>><rsup|l>|<right|]|1>><dd>\<zeta\><frac|<dd>\<sigma\>|\<sigma\>>|<right|\||-2>><frac|<dd>\<theta\>|<around*|\||\<Theta\>|\|>>>>|<row|<cell|<space|1em><ltae|<tformat|<table|<row|<cell|\<leq\><big|int><rsub|<R><rsup|3><rsub|+>><around*|<left|\||2>|F<rsub|1><rsup|\<ast\>><around*|(|\<theta\>,\<zeta\>,\<sigma\>|)><around*|[|\<phi\><rsub|1,\<theta\>><rsup|o<rsub|>>|]>|<right|\||2>><ltae|<tformat|<cwith|1|1|1|1|cell-halign|l>|<cwith|2|2|1|1|cell-halign|l>|<table|<row|<cell|<around*|<left|\||1>|<wpD><rsub|\<zeta\>><around*|(|\<theta\><rsub|\<Gamma\><rsub|2>>|)>F<rsub|2><rsup|\<ast\>><around*|(|\<theta\>,\<zeta\>,\<sigma\>|)><around*|[|<wide|\<phi\>|~><rsub|2,\<theta\>><rsup|l>|]>|<right|\||1>>>>|<row|<cell|<space|1em>\<times\><around*|<left|\||1>|<wpD><rsub|\<zeta\>><around*|(|\<theta\><rsub|\<Gamma\><rsub|3>>|)>F<rsub|3><rsup|\<ast\>><around*|(|\<theta\>,\<zeta\>,\<sigma\>|)><around*|[|<wide|\<phi\>|~><rsub|2,\<theta\>><rsup|l>|]>|<right|\||1>><frac|<dd>\<theta\><dd>\<zeta\>|<around*|\||\<Theta\>|\|>><frac|<dd>\<sigma\>|\<sigma\>>>>>>>>>|<row|<cell|\<lesssim\>sup<rsub|\<phi\><rsub|j>><big|int><rsub|<R><rsup|3><rsub|+>><around*|<left|\||2>|F<rsub|1><rsup|\<ast\>><around*|(|\<theta\>,\<zeta\>,\<sigma\>|)><around*|[|\<phi\><rsub|1>|]>|<right|\||2>><ltae|<tformat|<cwith|1|1|1|1|cell-halign|l>|<cwith|2|2|1|1|cell-halign|l>|<table|<row|<cell|<around*|<left|\||2>|<space|0.6spc><wpD><rsub|\<zeta\>><around*|(|\<theta\><rsub|\<Gamma\><rsub|2>>|)>F<rsub|2><rsup|\<ast\>><around*|(|\<theta\>,\<zeta\>,\<sigma\>|)><around*|<left|[|1>|\<phi\><rsub|2>|<right|]|1>>|<right|\||2>>>>|<row|<cell|<space|1em>\<times\><around*|<left|\||2>|<wpD><rsub|\<zeta\>><around*|(|\<theta\><rsub|\<Gamma\><rsub|3>>|)>F<rsub|3><rsup|\<ast\>><around*|(|\<theta\>,\<zeta\>,\<sigma\>|)><around*|<left|[|1>|\<phi\><rsub|3>|<right|]|1>>|<right|\||2>><frac|<dd>\<theta\><dd>\<zeta\>|<around*|\||\<Theta\>|\|>><frac|<dd>\<sigma\>|\<sigma\>>.>>>>>>>>>>>>>>>
    </equation*>

    with the upper bound being taken over wave packets
    <math|\<phi\><rsub|j><rsub|>\<in\>\<Phi\><rsup|\<infty\>><rsub|2<gr>>>
    with <math|<around*|\<\|\|\>|\<phi\><rsub|j><rsub|>|\<\|\|\>><rsub|\<Phi\><rsub|2<gr>><rsup|N-3>>\<leq\>1>,
    <math|j\<in\><around*|{|1,2,3|}>>. The second inequality follows from
    <smart-ref|lem:wave-packet-decomposition>, according to which we can
    decompose each of the wave packets <math|<wide|\<phi\>|~><rsub|1,\<theta\>><rsup|o>,<wide|\<phi\>|~><rsub|2,\<theta\>><rsup|l>,<wide|\<phi\>|~><rsub|3,\<theta\>><rsup|l>>
    into an absolutely convergent series e.g.\ 

    <\equation*>
      <wide|\<phi\>|~><rsub|1,\<theta\>><rsup|l><eqd><big|sum><rsub|k><wide|a|~><rsup|l><rsub|1,k><around*|(|\<theta\>|)><wide|<wide|\<phi\>|~>|~><rsub|k>
    </equation*>

    with <math|<around*|\<\|\|\>|<wide|<wide|\<phi\>|~>|~><rsub|k>|\<\|\|\>><rsub|\<Phi\><rsub|2<gr>><rsup|N-3>>\<lesssim\><around*|\<\|\|\>|<wide|\<phi\>|~><rsub|1,\<theta\>><rsup|l>|\<\|\|\>><rsub|\<Phi\><rsub|<gr>><rsup|N-1>>\<lesssim\>1>.
    We bound the <RHS|> of the chain of inequalities above using
    Cauchy-Schwarz to obtain

    <\equation*>
      <ltae|<tformat|<cwith|2|2|1|1|cell-valign|c>|<cwith|1|1|1|1|cell-halign|l>|<table|<row|<cell|<big|int><rsub|<R><rsup|3><rsub|+>><around*|<left|\||2>|F<rsub|1><rsup|\<ast\>><around*|(|\<theta\>,\<zeta\>,\<sigma\>|)><around*|[|\<phi\><rsub|1>|]>|<right|\||2>><around*|<left|\||2>|<space|0.6spc><wpD><rsub|\<zeta\>><around*|(|\<theta\><rsub|\<Gamma\><rsub|2>>|)>F<rsub|2><rsup|\<ast\>><around*|(|\<theta\>,\<zeta\>,\<sigma\>|)><around*|<left|[|1>|\<phi\><rsub|2>|<right|]|1>>|<right|\||2>><around*|<left|\||2>|<wpD><rsub|\<zeta\>><around*|(|\<theta\><rsub|\<Gamma\><rsub|3>>|)>F<rsub|3><rsup|\<ast\>><around*|(|\<theta\>,\<zeta\>,\<sigma\>|)><around*|<left|[|1>|\<phi\><rsub|3>|<right|]|1>>|<right|\||2>><frac|<dd>\<theta\><dd>\<zeta\>|<around*|\||\<Theta\>|\|>><frac|<dd>\<sigma\>|\<sigma\>>>>|<row|<cell|<space|1em><ltae|<tformat|<table|<row|<cell|\<lesssim\><around*|<left|\<\|\|\>|2>|F<rsub|1><rsup|\<ast\>><around*|(|\<theta\>,\<zeta\>,\<sigma\>|)><around*|[|\<phi\><rsub|1>|]>|<right|\<\|\|\>|2>><rsub|L<rsup|u<rsub|1>><rsub|<frac|\<mathd\>\<theta\>\<mathd\>\<zeta\>|<around*|\||\<Theta\>|\|>>>L<rsup|\<infty\>><rsub|<frac|\<mathd\>\<sigma\>|\<sigma\>>>><around*|<left|\<\|\|\>|2>|<wpD><rsub|\<zeta\>><around*|(|\<theta\><rsub|\<Gamma\><rsub|2>>|)><rsub|>F<rsub|2><rsup|\<ast\>><around*|(|\<theta\>,\<zeta\>,\<sigma\>|)><around*|[|\<phi\><rsub|2>|]>|<right|\<\|\|\>|2>><rsub|L<rsup|u<rsub|2>><rsub|<frac|\<mathd\>\<theta\>\<mathd\>\<zeta\>|<around*|\||\<Theta\>|\|>>>L<rsup|2><rsub|<frac|\<mathd\>\<sigma\>|\<sigma\>>>><around*|<left|\<\|\|\>|2>|<wpD><rsub|\<zeta\>><around*|(|\<theta\><rsub|\<Gamma\><rsub|3>>|)>F<rsup|\<ast\>><rsub|3><around|(|\<theta\>,\<zeta\>,\<rho\>|)><around|[|\<phi\><rsub|3>|]>|<right|\<\|\|\>|2>><rsub|L<rsub|<frac|\<mathd\>\<theta\>\<mathd\>\<zeta\>*|<around*|\||\<Theta\>|\|>>><rsup|u<rsub|3>>L<rsub|<frac|\<mathd\>\<rho\>|\<rho\>>><rsup|2>>>>|<row|<cell|\<lesssim\><around*|\<\|\|\>|F<rsub|1>|\<\|\|\>><rsub|<SL><rsub|\<Theta\><rsub|>><rsup|<around*|(|u<rsub|1>,\<infty\>|)>>\<Phi\><rsub|2<gr>><rsup|N-2><around*|(|T|)>><around*|\<\|\|\>|F<rsub|2>|\<\|\|\>><rsub|<SL><rsub|\<Theta\><rsub|>><rsup|<around*|(|u<rsub|2>,2|)>>\<Gamma\><rsub|2><rsup|\<ast\>><wpD><rsub|2<gr>><rsup|N-3><around*|(|T|)>><around*|\<\|\|\>|F<rsub|3>|\<\|\|\>><rsub|<SL><rsub|\<Theta\><rsub|>><rsup|<around*|(|u<rsub|3>,2|)>>\<Gamma\><rsub|3><rsup|\<ast\>><wpD><rsub|2<gr>><rsup|N-3><around*|(|T|)>>,>>>>>>>>>>
    </equation*>

    as required.
  </render-proof>

  <\render-proof|Proof of bound <eqref|eq:STE:l-l-o:tree>>
    We deal only with the size <math|<SI><rsup|<around*|(|l,l,o|)>><rsub|\<Theta\>>\<Phi\><rsub|<gr>><rsup|N>>
    appearing on <LHS|<eqref|eq:STE:l-l-o:tree>>; the term with
    <math|<SI><rsup|<around*|(|l,o,l|)>><rsub|\<Theta\>>\<Phi\><rsub|<gr>><rsup|N>><math|>
    is dealt with analogously, by exchanging the role of the indexes
    <math|j=2> and <math|j=3>. We need to show that\ 

    <\equation*>
      <big|int><rsub|\<Theta\>><around*|<left|\||-2>|<big|int><rsub|<R><rsup|2><rsub|+>><around*|<left|(|-3>|<big|prod><rsub|j=1><rsup|3>F<rsub|j><rsup|\<ast\>><around*|(|\<theta\>,\<zeta\>,\<sigma\>|)>|<right|)|-3>><around*|<left|[|1>|\<phi\><rsub|1,\<theta\>><rsup|o<rsub|>>,\<phi\><rsub|2,\<theta\>><rsup|l>,\<phi\><rsub|3,\<theta\>><rsup|l>|<right|]|1>><dd>\<zeta\><frac|<dd>\<sigma\>|\<sigma\>>|<right|\||-2>><frac|<dd>\<theta\>|<around*|\||\<Theta\>|\|>>\<lesssim\><RHS|<eqref|eq:STE:l-l-o:tree>>
    </equation*>

    that becomes\ 

    \;

    <\equation>
      <label|eq:l-l-o-quantity><ltae|<tformat|<table|<row|<cell|<big|int><rsub|\<Theta\>><around*|\||<big|int><rsub|<R><rsup|2><rsub|+>><wpD><rsub|\<zeta\>><around*|(|\<theta\><rsub|\<Gamma\><rsub|1>>|)>F<rsub|1><rsup|\<ast\>><around*|(|\<theta\>,\<zeta\>,\<sigma\>|)><around*|[|<wide|\<phi\>|~><rsub|1,\<theta\>><rsup|l>|]><wpD><rsub|\<zeta\>><around*|(|\<theta\><rsub|\<Gamma\><rsub|2>>|)>F<rsub|2><rsup|\<ast\>><around*|(|\<theta\>,\<zeta\>,\<sigma\>|)><around*|[|<wide|\<phi\>|~><rsub|2,\<theta\>><rsup|l>|]>F<rsub|3><rsup|\<ast\>><around*|(|\<theta\>,\<zeta\>,\<sigma\>|)><around*|[|\<phi\><rsub|3,\<theta\>><rsup|o>|]><dd>\<zeta\><frac|<dd>\<sigma\>|\<sigma\>>|\|><frac|<dd>\<theta\>|<around*|\||\<Theta\>|\|>>>>|<row|<cell|<space|1em>\<lesssim\><RHS|<eqref|eq:STE:l-l-o:tree>>>>>>>
    </equation>

    We claim that

    <\equation>
      <label|eq:single-tree:l-l-o:decomp><LHS|<eqref|eq:l-l-o-quantity>><ltae|<tformat|<table|<row|<cell|\<leq\><big|int><rsub|\<Theta\>><tabular*|<tformat|<cwith|1|1|1|1|cell-halign|l>|<twith|table-valign|T>|<table|<row|<cell|<ltae|<tformat|<table|<row|<cell|<ltae|<tformat|<table|<row|<cell|<around*|<left|(|2>|<around*|\||<math-up|M1><around*|(|\<theta\>|)><around*|[|<wide|\<phi\>|~><rsub|1,\<theta\>><rsup|l>,<wide|\<phi\>|~><rsub|2,\<theta\>><rsup|l>,<wide|\<phi\>|~><rsub|3,\<theta\>><rsup|o>|]>|\|>+<around*|\||<math-up|M2><around*|(|\<theta\>|)><around*|[|<wide|\<phi\>|~><rsub|1,\<theta\>><rsup|l>,<wide|\<phi\>|~><rsub|2,\<theta\>><rsup|l>,<wide|\<phi\>|~><rsub|3,\<theta\>><rsup|o>|]>|\|>|<right|.>>>>>>>>>|<row|<cell|<space|1em>+<around*|\||<math-up|B1><around*|(|\<theta\>|)><around*|[|<wide|\<phi\>|~><rsub|1,\<theta\>><rsup|l>,<wide|\<phi\>|~><rsub|2,\<theta\>><rsup|l>,\<phi\><rsub|3,\<theta\>><rsup|o>|]>|\|>+<around*|\||<math-up|B2><around*|(|\<theta\>|)><around*|[|<wide|\<phi\>|~><rsub|1,\<theta\>><rsup|l>,<wide|\<phi\>|~><rsub|2,\<theta\>><rsup|l>,<wide|\<phi\>|~><rsub|3,\<theta\>><rsup|o>|]>|\|>>>|<row|<cell|<around*|<left|\<nobracket\>|2>|<space|1em>+<around*|\||<text|B3><around*|(|\<theta\>|)><around*|[|<wide|\<phi\>|~><rsub|1,\<theta\>><rsup|l>,<wide|\<phi\>|~><rsub|2,\<theta\>><rsup|l>,<wide|\<phi\>|~><rsub|3,\<theta\>><rsup|o>|]>|\|>+<around*|\||<compound|math-up|B4><around*|(|\<theta\>|)><around*|[|<wide|\<phi\>|~><rsub|1,\<theta\>><rsup|l>,<wide|\<phi\>|~><rsub|2,\<theta\>><rsup|l>,<wide|\<phi\>|~><rsub|3,\<theta\>><rsup|o>|]>|\|>|<right|)|2>><frac|\<mathd\>\<theta\>|<around*|\||\<Theta\>|\|>>>>>>>>>>>>>>|<row|<cell|\<lesssim\>sup<rsub|\<phi\><rsub|j>><big|int><rsub|\<Theta\>><ltae|<tformat|<table|<row|<cell|<around*|<left|(|2>|<around*|\||<math-up|M1><around*|(|\<theta\>|)><around*|[|\<phi\><rsub|1><rsup|>,\<phi\><rsub|2><rsup|>,\<phi\><rsub|3><rsup|>|]>|\|>+<around*|\||<math-up|M2<math|<around*|(|\<theta\>|)><around*|[|\<phi\><rsub|1><rsup|>,\<phi\><rsub|2><rsup|>,\<phi\><rsub|3><rsup|>|]>>>|\|>+<around*|\||<math-up|B1><around*|(|\<theta\>|)><around*|[|\<phi\><rsub|1><rsup|>,\<phi\><rsub|2><rsup|>,\<phi\><rsub|3><rsup|>|]>|\|>|<right|.>>>>|<row|<cell|<around*|<left|\<nobracket\>|2>|<space|1em>+<around*|\||<math-up|B2><around*|(|\<theta\>|)><around*|[|\<phi\><rsub|1><rsup|>,\<phi\><rsub|2><rsup|>,\<phi\><rsub|3><rsup|>|]>|\|>+<around*|\||<text|B3><around*|(|\<theta\>|)><around*|[|\<phi\><rsub|1><rsup|>,\<phi\><rsub|2><rsup|>,\<phi\><rsub|3><rsup|>|]>|\|>+<around*|\||<compound|math-up|B4><around*|(|\<theta\>|)><around*|[|\<phi\><rsub|1><rsup|>,\<phi\><rsub|2><rsup|>,\<phi\><rsub|3><rsup|>|]>|\|>|<right|)|2>><frac|\<mathd\>\<theta\>|<around*|\||\<Theta\>|\|>>>>>>>>>>>>
    </equation>

    where the upper bound is taken over wave packets satisfying
    <math|<around*|\<\|\|\>|\<phi\><rsub|j><rsub|>|\<\|\|\>><rsub|\<Phi\><rsub|2<gr>><rsup|N-3>>\<leq\>1>,
    <math|j\<in\><around*|{|1,2,3|}>>, and where\ 

    <\equation*>
      \;
    </equation*>

    <\equation*>
      <math-up|M1><around*|(|\<theta\>|)><around*|[|\<phi\><rsub|1><rsup|>,\<phi\><rsub|2><rsup|>,\<phi\><rsub|3><rsup|>|]>\<assign\><big|int><rsub|<R><rsup|2><rsub|+>><ltae|<tformat|<table|<row|<cell|<wpD><rsub|\<zeta\>><around*|(|\<theta\><rsub|\<Gamma\><rsub|1>>|)>F<rsub|1><rsup|\<ast\>><around*|(|\<theta\>,\<zeta\>,\<sigma\>|)><around*|[|\<phi\><rsub|1><rsup|>|]><wpD><rsub|\<zeta\>><around*|(|\<theta\><rsub|\<Gamma\><rsub|2>>|)><rsub|><rsup|2>F<rsub|2><rsup|\<ast\>><around*|(|\<theta\>,\<zeta\>,\<sigma\>|)><around*|[|\<phi\><rsub|2><rsup|>|]>>>|<row|<cell|<space|1em>\<times\><around*|(|<big|int><rsub|0><rsup|\<sigma\>><frac|\<rho\>|\<sigma\>><wpD><rsub|\<zeta\>><around*|(|\<theta\><rsub|\<Gamma\><rsub|3>>|)><rsub|><rsup|><rsup|>F<rsub|3><rsup|\<ast\>><around*|(|\<theta\>,\<zeta\>,\<rho\>|)><around|[|\<phi\><rsub|3><rsup|>|]><frac|\<mathd\>\<rho\>|\<rho\>>|)><frac|\<mathd\>\<sigma\>|\<sigma\>>\<mathd\>\<zeta\>,>>>>>
    </equation*>

    <\equation*>
      <math-up|M2><around*|(|\<theta\>|)><around*|[|\<phi\><rsub|1><rsup|>,\<phi\><rsub|2><rsup|>,\<phi\><rsub|3><rsup|>|]>\<assign\>\<beta\><big|int><rsub|<R><rsup|2><rsub|+>><ltae|<tformat|<table|<row|<cell|<wpD><rsub|\<zeta\>><around*|(|\<theta\><rsub|\<Gamma\><rsub|1>>|)><rsup|><rsup|2>F<rsub|1><rsup|\<ast\>><around*|(|\<theta\>,\<zeta\>,\<sigma\>|)><around*|[|\<phi\><rsub|1><rsup|>|]><wpD><rsub|\<zeta\>><around*|(|\<theta\><rsub|\<Gamma\><rsub|2>>|)><rsup|>F<rsub|2><rsup|\<ast\>><around*|(|\<theta\>,\<zeta\>,\<sigma\>|)><around*|[|\<phi\><rsub|2><rsup|>|]>>>|<row|<cell|<space|1em>\<times\><around*|(|<big|int><rsub|0><rsup|\<sigma\>><frac|\<rho\>|\<sigma\>><wpD><rsub|\<zeta\>><around*|(|\<theta\><rsub|\<Gamma\><rsub|3>>|)><rsup|><rsup|>F<rsub|3><rsup|\<ast\>><around*|(|\<theta\>,\<zeta\>,\<rho\>|)><around|[|\<phi\><rsub|3><rsup|>|]><frac|\<mathd\>\<rho\>|\<rho\>>|)><frac|\<mathd\>\<sigma\>|\<sigma\>>\<mathd\>\<zeta\>,>>>>>
    </equation*>

    and

    <\equation*>
      <ltae|<tformat|<twith|table-valign|T>|<twith|table-width|1par>|<twith|table-hmode|exact>|<cwith|1|1|1|1|cell-halign|c>|<table|<row|<cell|<math-up|B1><around*|(|\<theta\>|)><around*|[|\<phi\><rsub|1><rsup|>,\<phi\><rsub|2><rsup|>,\<phi\><rsub|3><rsup|>|]>\<assign\><big|int><rsub|<R><rsup|2><rsub|+>><ltae|<tformat|<cwith|1|1|1|1|cell-halign|l>|<table|<row|<cell|<wpD><rsub|\<zeta\>><around*|(|\<theta\><rsub|\<Gamma\><rsub|1>>|)>F<rsub|1><rsup|\<ast\>><around*|(|\<theta\>,\<zeta\>,\<sigma\>|)><around*|[|\<phi\><rsub|1><rsup|>|]><space|0.17em><wpD><rsub|\<zeta\>><around*|(|\<theta\><rsub|\<Gamma\><rsub|2>>|)><rsub|>F<rsub|2><rsup|\<ast\>><around*|(|\<theta\>,\<zeta\>,\<sigma\>|)><around*|[|\<phi\><rsub|2><rsup|>|]>>>|<row|<cell|<space|1em>\<times\><around*|(|<big|int><rsub|0><rsup|\<sigma\>><around*|(|<wpD><rsub|\<sigma\>><around*|(|\<theta\><rsub|\<Gamma\><rsub|3>>|)>-\<rho\>\<mathd\><rsub|\<rho\>>|)>F<rsub|3><rsup|\<ast\>><around|(|\<theta\>,\<zeta\>,\<rho\>|)><around|[|\<phi\><rsub|3><rsup|>|]><frac|\<mathd\>\<rho\>|\<rho\>>|)><frac|\<mathd\>\<sigma\>|\<sigma\>>\<mathd\>\<zeta\>,>>>>>>>>>>
    </equation*>

    <\equation*>
      <ltae|<tformat|<twith|table-valign|T>|<twith|table-width|1par>|<twith|table-hmode|exact>|<cwith|1|1|1|1|cell-halign|c>|<table|<row|<cell|<math-up|B2><around*|(|\<theta\>|)><around*|[|\<phi\><rsub|1><rsup|>,\<phi\><rsub|2><rsup|>,\<phi\><rsub|3><rsup|>|]>\<assign\><big|int><rsub|<R><rsup|2><rsub|+>><ltae|<tformat|<cwith|1|1|1|1|cell-halign|l>|<table|<row|<cell|<wpD><rsub|\<zeta\>><around*|(|\<theta\><rsub|\<Gamma\><rsub|1>>|)>F<rsub|1><rsup|\<ast\>><around*|(|\<theta\>,\<zeta\>,\<sigma\>|)><around*|[|\<phi\><rsub|1><rsup|>|]><space|0.17em><wpD><rsub|\<zeta\>><around*|(|\<theta\><rsub|\<Gamma\><rsub|2>>|)><rsub|>F<rsub|2><rsup|\<ast\>><around*|(|\<theta\>,\<zeta\>,\<sigma\>|)><around*|[|\<phi\><rsub|2><rsup|>|]>>>|<row|<cell|<space|1em>\<times\><around*|(|<big|int><rsub|0><rsup|\<sigma\>><around*|(|<wpD><rsub|\<zeta\><rsub|>><around*|(|\<theta\><rsub|\<Gamma\><rsub|3>>|)>-\<beta\>\<rho\><dd><rsub|\<zeta\>>|)><wpD><rsub|\<zeta\>><around*|(|\<theta\><rsub|\<Gamma\><rsub|3>>|)>F<rsup|\<ast\>><rsub|3><around|(|\<theta\>,\<zeta\>,\<rho\>|)><around|[|\<phi\><rsub|3><rsup|>|]><frac|\<mathd\>\<rho\>|\<rho\>>|)><frac|\<mathd\>\<sigma\>|\<sigma\>>\<mathd\>\<zeta\>,>>>>>>>>>>
    </equation*>

    <\equation*>
      <math-up|B3><around*|(|\<theta\>|)><around*|[|\<phi\><rsub|1><rsup|>,\<phi\><rsub|2><rsup|>,\<phi\><rsub|3><rsup|>|]>\<assign\><big|int><rsub|<R><rsup|2><rsub|+>><ltae|<tformat|<cwith|1|1|1|1|cell-halign|l>|<table|<row|<cell|<wpD><rsub|\<zeta\>><around*|(|\<theta\><rsub|\<Gamma\><rsub|1>>|)>F<rsub|1><rsup|\<ast\>><around*|(|\<theta\>,\<zeta\>,\<sigma\>|)><around*|[|\<phi\><rsub|1><rsup|>|]><around*|<left|(|1>|<wpD><rsub|\<zeta\>><around*|(|\<theta\><rsub|\<Gamma\><rsub|2>>|)>-\<beta\>\<sigma\>\<mathd\><rsub|\<zeta\>>|<right|)|1>><wpD><rsub|\<zeta\>><around*|(|\<theta\><rsub|\<Gamma\><rsub|2>>|)><rsub|>F<rsub|2><rsup|\<ast\>><around*|(|\<theta\>,\<zeta\>,\<sigma\>|)><around*|[|\<phi\><rsub|2><rsup|>|]>>>|<row|<cell|<space|1em>\<times\><around*|(|<big|int><rsub|0><rsup|\<sigma\>><frac|\<rho\>|\<sigma\>><wpD><rsub|\<zeta\>><around*|(|\<theta\><rsub|\<Gamma\><rsub|3>>|)><rsup|><rsup|>F<rsub|3><rsup|\<ast\>><around*|(|\<theta\>,\<zeta\>,\<rho\>|)><around|[|\<phi\><rsub|3><rsup|>|]><frac|\<mathd\>\<rho\>|\<rho\>>|)><frac|\<mathd\>\<sigma\>|\<sigma\>>\<mathd\>\<zeta\>,>>>>>
    </equation*>

    <\equation*>
      <math-up|B4><around*|(|\<theta\>|)><around*|[|\<phi\><rsub|1><rsup|>,\<phi\><rsub|2><rsup|>,\<phi\><rsub|3><rsup|>|]>\<assign\>\<beta\><big|int><rsub|<R><rsup|2><rsub|+>><ltae|<tformat|<table|<row|<cell|<around*|<left|(|1>|<wpD><rsub|\<zeta\>><around*|(|\<theta\><rsub|\<Gamma\><rsub|1>>|)>-\<sigma\>\<mathd\><rsub|\<zeta\>>|<right|)|1>><wpD><rsub|\<zeta\>><around*|(|\<theta\>|)>F<rsub|1><rsup|\<ast\>><around*|(|\<theta\>,\<zeta\>,\<sigma\>|)><around*|[|\<phi\><rsub|1><rsup|>|]><wpD><rsub|\<zeta\>><around*|(|\<theta\><rsub|\<Gamma\><rsub|2>>|)><rsub|>F<rsub|2><rsup|\<ast\>><around*|(|\<theta\>,\<zeta\>,\<sigma\>|)><around*|[|\<phi\><rsub|2><rsup|>|]>>>|<row|<cell|<space|1em>\<times\><around*|(|<big|int><rsub|0><rsup|\<sigma\>><frac|\<rho\>|\<sigma\>><wpD><rsub|\<zeta\>><around*|(|\<theta\><rsub|\<Gamma\><rsub|3>>|)><rsup|><rsup|>F<rsub|3><rsup|\<ast\>><around*|(|\<theta\>,\<zeta\>,\<rho\>|)><around|[|\<phi\><rsub|3><rsup|>|]><frac|\<mathd\>\<rho\>|\<rho\>>|)><frac|\<mathd\>\<sigma\>|\<sigma\>>\<mathd\>\<zeta\>.>>>>>
    </equation*>

    \;

    The second inequality in <eqref|eq:single-tree:l-l-o:decomp> follows from
    <smart-ref|lem:wave-packet-decomposition>, as in the proof Proof of bound
    <smart-ref|eq:STE:o-l-l:tree>. We postpone the proof the first inequality
    of <eqref|eq:single-tree:l-l-o:decomp>, while now we show that each of
    the 6 terms in <RHS|<eqref|eq:single-tree:l-l-o:decomp>> contributes a
    quantity bounded by <math|<RHS|<eqref|eq:STE:l-l-o:tree>>>. We record
    Young's convolution inequality: for any
    <math|q\<in\><around|[|1,\<infty\>|]>> and any
    <math|h\<in\>L<rsup|q><rsub|\<mathd\>
    \<rho\>/\<rho\>><around|(|<R><rsub|+>|)>> it holds that

    <\equation>
      <around*|\<\|\|\>|<big|int><rsub|0><rsup|\<sigma\>><frac|\<rho\>|\<sigma\>>h<around|(|\<rho\>|)><frac|\<mathd\>\<rho\>|\<rho\>>|\<\|\|\>><rsub|L<rsup|q><rsub|<frac|\<mathd\>\<rho\>|\<rho\>>><around*|(|<R><rsub|+>|)>+L<rsup|\<infty\>><rsub|<frac|\<mathd\>\<rho\>|\<rho\>>><around*|(|<R><rsub|+>|)>>\<lesssim\><around|\<\|\|\>|h|\<\|\|\>><rsub|L<rsup|q><rsub|<frac|\<mathd\>\<rho\>|\<rho\>>><around*|(|<R><rsub|+>|)>>.<label|eq:young-multiplicative>
    </equation>

    since\ 

    <\equation>
      <around|<left|\<\|\|\>|1>|\<rho\><1><rsub|\<rho\>\<less\>1>|<right|\<\|\|\>|1>><rsub|L<rsup|1><rsub|<frac|\<mathd\>\<rho\>|\<rho\>>><around*|(|<R><rsub|+>|)>>+<around|<left|\<\|\|\>|1>|\<rho\><1><rsub|\<rho\>\<less\>1>|<right|\<\|\|\>|1>><rsub|L<rsup|\<infty\>><rsub|<frac|\<mathd\>\<rho\>|\<rho\>>><around*|(|<R><rsub|+>|)>>\<lesssim\>1.<label|eq:young-kernel-estimate>
    </equation>

    The integral on <LHS|<eqref|eq:young-multiplicative>> is a convolution
    with respect to the multiplicative Haar measure
    <math|<frac|\<mathd\>\<rho\>|\<rho\>>>. The following bounds hold:

    <\equation*>
      <big|int><rsub|\<Theta\>><around*|\||<math-up|M1><around*|(|\<theta\>|)><around*|[|\<phi\><rsub|1><rsup|>,\<phi\><rsub|2><rsup|>,\<phi\><rsub|3><rsup|>|]>|\|>\<mathd\>\<theta\><ltae|<tformat|<table|<row|<cell|\<lesssim\><ltae|<tformat|<table|<row|<cell|<around*|<left|\<\|\|\>|2>|<wpD><rsub|\<zeta\>><around*|(|\<theta\><rsub|\<Gamma\><rsub|1>>|)><rsub|>F<rsub|1><rsup|\<ast\>><around*|(|\<theta\>,\<zeta\>,\<sigma\>|)><around*|[|\<phi\><rsub|1>|]>|<right|\<\|\|\>|2>><rsub|L<rsup|u<rsub|1>><rsub|<frac|\<mathd\>\<theta\>\<mathd\>\<zeta\>|<around*|\||\<Theta\>|\|>>>L<rsup|\<infty\>><rsub|<frac|\<mathd\>\<sigma\>|\<sigma\>>>><around*|<left|\<\|\|\>|2>|<wpD><rsub|\<zeta\>><around*|(|\<theta\><rsub|\<Gamma\><rsub|2>>|)><rsup|2>F<rsub|2><rsup|\<ast\>><around*|(|\<theta\>,\<zeta\>,\<sigma\>|)><around|[|\<phi\><rsub|2>|]>|<right|\<\|\|\>|2>><rsub|L<rsup|u<rsub|2>><rsub|<frac|\<mathd\>\<theta\>\<mathd\>\<zeta\>|<around*|\||\<Theta\>|\|>>>L<rsup|2><rsub|<frac|\<mathd\>\<sigma\>|\<sigma\>>>>>>|<row|<cell|<space|1em>\<times\><around*|<left|\<\|\|\>|2>|<wpD><rsub|\<zeta\>><around*|(|\<theta\><rsub|\<Gamma\><rsub|3>>|)>F<rsub|3><rsup|\<ast\>><around*|(|\<theta\>,\<zeta\>,\<rho\>|)><around|[|\<phi\><rsub|3>|]>|<right|\<\|\|\>|2>><rsub|L<rsub|<frac|*\<mathd\>\<theta\>\<mathd\>\<zeta\>|<around*|\||\<Theta\>|\|>>><rsup|u<rsub|3>>L<rsub|<frac|\<mathd\>\<sigma\>|\<sigma\>>><rsup|2>>>>>>>>>|<row|<cell|\<lesssim\><around*|\<\|\|\>|F<rsub|1>|\<\|\|\>><rsub|\<Gamma\><rsub|1><rsup|\<ast\>><SL><rsub|\<Theta\><rsub|>><rsup|<around*|(|u<rsub|1>,\<infty\>|)>>\<Phi\><rsub|2<gr>><rsup|N-3><around*|(|T|)>><around*|\<\|\|\>|F<rsub|2>|\<\|\|\>><rsub|\<Gamma\><rsub|2><rsup|\<ast\>><SL><rsub|\<Theta\><rsub|>><rsup|<around*|(|u<rsub|2>,2|)>><wpD><rsub|2<gr>><rsup|N-3><around*|(|T|)>><around*|\<\|\|\>|F<rsub|3>|\<\|\|\>><rsub|\<Gamma\><rsub|3><rsup|\<ast\>><SL><rsub|\<Theta\><rsub|>><rsup|<around*|(|u<rsub|3>,2|)>><wpD><rsub|2<gr>><rsup|N-3><around*|(|T|)>>,>>>>>
    </equation*>

    and

    <\equation*>
      <big|int><rsub|\<Theta\>><around*|\||<math-up|M2><around*|(|\<theta\>|)><around*|[|\<phi\><rsub|1><rsup|>,\<phi\><rsub|2><rsup|>,\<phi\><rsub|3><rsup|>|]>|\|>\<mathd\>\<theta\><ltae|<tformat|<table|<row|<cell|\<lesssim\><ltae|<tformat|<cwith|1|1|1|1|cell-halign|l>|<table|<row|<cell|\<beta\><around*|<left|\<\|\|\>|2>|<wpD><rsub|\<zeta\>><around*|(|\<theta\><rsub|\<Gamma\><rsub|1>>|)><rsub|><rsup|2>F<rsub|1><rsup|\<ast\>><around*|(|\<theta\>,\<zeta\>,\<sigma\>|)><around*|[|\<phi\><rsub|1>|]>|<right|\<\|\|\>|2>><rsub|L<rsup|u<rsub|1>><rsub|<frac|\<mathd\>\<theta\>\<mathd\>\<zeta\>|<around*|\||\<Theta\>|\|>>>L<rsup|\<infty\>><rsub|<frac|\<mathd\>\<sigma\>|\<sigma\>>>><around*|<left|\<\|\|\>|2>|<wpD><rsub|\<zeta\>><around*|(|\<theta\><rsub|\<Gamma\><rsub|2>>|)>F<rsub|2><rsup|\<ast\>><around*|(|\<theta\>,\<zeta\>,\<sigma\>|)><around|[|\<phi\><rsub|2>|]>|<right|\<\|\|\>|2>><rsub|L<rsup|u<rsub|2>><rsub|<frac|\<mathd\>\<theta\>\<mathd\>\<zeta\>|<around*|\||\<Theta\>|\|>>>L<rsup|2><rsub|<frac|\<mathd\>\<sigma\>|\<sigma\>>>>>>|<row|<cell|<space|1em>\<times\><around*|<left|\<\|\|\>|2>|<wpD><rsub|\<zeta\>><around*|(|\<theta\><rsub|\<Gamma\><rsub|3>>|)>F<rsub|3><rsup|\<ast\>><around*|(|\<theta\>,\<zeta\>,\<rho\>|)><around|[|\<phi\><rsub|3>|]>|<right|\<\|\|\>|2>><rsub|L<rsub|<frac|*\<mathd\>\<theta\>\<mathd\>\<zeta\>|<around*|\||\<Theta\>|\|>>><rsup|u<rsub|3>>L<rsub|<frac|\<mathd\>\<sigma\>|\<sigma\>>><rsup|2>>>>>>>>>|<row|<cell|\<lesssim\>\<beta\><around*|\<\|\|\>|F<rsub|1>|\<\|\|\>><rsub|\<Gamma\><rsub|1><rsup|\<ast\>><SL><rsub|\<Theta\><rsub|>><rsup|<around*|(|u<rsub|1>,\<infty\>|)>>\<Phi\><rsub|2<gr>><rsup|N-3><around*|(|T|)>><around*|\<\|\|\>|F<rsub|2>|\<\|\|\>><rsub|\<Gamma\><rsub|2><rsup|\<ast\>><SL><rsub|\<Theta\><rsub|>><rsup|<around*|(|u<rsub|2>,2|)>><wpD><rsub|2<gr>><rsup|N-3><around*|(|T|)>><around*|\<\|\|\>|F<rsub|3>|\<\|\|\>><rsub|\<Gamma\><rsub|3><rsup|\<ast\>><SL><rsub|\<Theta\><rsub|>><rsup|<around*|(|u<rsub|3>,2|)>><wpD><rsub|2<gr>><rsup|N-3><around*|(|T|)>>.>>>>>
    </equation*>

    The boundary terms <math|<math-up|B1>>, <math|<math-up|B2>>,
    <math|<math-up|B3>>, and <math|<math-up|B4>> require the use of defect
    sizes:

    <\equation*>
      <big|int><rsub|\<Theta\>><around*|\||<math-up|B1><around*|(|\<theta\>|)><around*|[|\<phi\><rsub|1><rsup|>,\<phi\><rsub|2><rsup|>,\<phi\><rsub|3><rsup|>|]>|\|>\<mathd\>\<theta\><ltae|<tformat|<table|<row|<cell|\<lesssim\><ltae|<tformat|<table|<row|<cell|<around*|<left|\<\|\|\>|2>|<wpD><rsub|\<zeta\>><around*|(|\<theta\><rsub|\<Gamma\><rsub|1>>|)>F<rsub|1><rsup|\<ast\>><around*|(|\<theta\>,\<zeta\>,\<sigma\>|)><around*|[|\<phi\><rsub|1><rsup|>|]>|<right|\<\|\|\>|2>><rsub|L<rsup|u<rsub|1>><rsub|<frac|\<mathd\>\<theta\>\<mathd\>\<zeta\>|<around*|\||\<Theta\>|\|>>>L<rsup|2><rsub|<frac|\<mathd\>\<sigma\>|\<sigma\>>>><around*|<left|\<\|\|\>|2>|<wpD><rsub|\<zeta\>><around*|(|\<theta\><rsub|\<Gamma\><rsub|2>>|)><rsub|>F<rsub|2><rsup|\<ast\>><around*|(|\<theta\>,\<zeta\>,\<sigma\>|)><around*|[|\<phi\><rsub|2>|]>|<right|\<\|\|\>|2>><rsub|L<rsup|u<rsub|2>><rsub|<frac|\<mathd\>\<theta\>\<mathd\>\<zeta\>|<around*|\||\<Theta\>|\|>>>L<rsup|2><rsub|<frac|\<mathd\>\<sigma\>|\<sigma\>>>>>>|<row|<cell|<space|1em>\<times\><around*|<left|\<\|\|\>|2>|<around*|(|<wpD><rsub|\<sigma\>><around*|(|\<theta\><rsub|\<Gamma\><rsub|3>>|)>-\<rho\>\<mathd\><rsub|\<rho\>>|)><rsup|>F<rsub|3><rsup|\<ast\>><around|(|\<theta\>,\<zeta\>,\<rho\>|)><around|[|\<phi\><rsub|3><rsup|>|]>|<right|\<\|\|\>|2>><rsub|L<rsub|<frac|\<mathd\>\<theta\>\<mathd\>\<zeta\>|<around*|\||\<Theta\>|\|>>><rsup|u<rsub|3>>L<rsub|<frac|\<mathd\>\<rho\>|\<rho\>>><rsup|1>>>>>>>>>|<row|<cell|\<lesssim\><around*|\<\|\|\>|F<rsub|1>|\<\|\|\>><rsub|\<Gamma\><rsub|1><rsup|\<ast\>><SL><rsub|\<Theta\><rsub|>><rsup|<around*|(|u<rsub|1>,\<infty\>|)>><wpD><rsub|2<gr>><rsup|N-3><around*|(|T|)>><around*|\<\|\|\>|F<rsub|2>|\<\|\|\>><rsub|\<Gamma\><rsub|2><rsup|\<ast\>><SL><rsub|\<Theta\><rsub|>><rsup|<around*|(|u<rsub|2>,2|)>><wpD><rsub|2<gr>><rsup|N-3><around*|(|T|)>><around*|\<\|\|\>|F<rsub|3>|\<\|\|\>><rsub|\<Gamma\><rsub|3><rsup|\<ast\>><SL><rsub|\<Theta\><rsub|>><rsup|<around*|(|u<rsub|3>,1|)>><dfct><rsub|><rsub|2<gr>><rsup|N-3><around*|(|T|)>>,>>>>>
    </equation*>

    <\equation*>
      <big|int><rsub|\<Theta\>><around*|<left|\||1>|<math-up|B2<math|>><around*|(|\<theta\>|)><around*|[|\<phi\><rsub|1><rsup|>,\<phi\><rsub|2><rsup|>,\<phi\><rsub|3><rsup|>|]>|<right|\||1>>\<mathd\>\<theta\><ltae|<tformat|<table|<row|<cell|\<lesssim\><ltae|<tformat|<table|<row|<cell|<around*|<left|\<\|\|\>|2>|<wpD><rsub|\<zeta\>><around*|(|\<theta\><rsub|\<Gamma\><rsub|1>>|)>F<rsub|1><rsup|\<ast\>><around*|(|\<theta\>,\<zeta\>,\<sigma\>|)><around*|[|\<phi\><rsub|1><rsup|>|]>|<right|\<\|\|\>|2>><rsub|L<rsup|u<rsub|1>><rsub|<frac|\<mathd\>\<zeta\>\<mathd\>\<theta\>|<around*|\||\<Theta\>|\|>>>L<rsup|2><rsub|<frac|\<mathd\>\<sigma\>|\<sigma\>>>><around*|<left|\<\|\|\>|2>|<wpD><rsub|\<zeta\>><around*|(|\<theta\><rsub|\<Gamma\><rsub|2>>|)><rsub|>F<rsub|2><rsup|\<ast\>><around*|(|\<theta\>,\<zeta\>,\<sigma\>|)><around*|[|\<phi\><rsub|2>|]>|<right|\<\|\|\>|2>><rsub|L<rsup|u<rsub|2>><rsub|<frac|\<mathd\>\<theta\>\<mathd\>\<zeta\>|<around*|\||\<Theta\>|\|>>>L<rsup|2><rsub|<frac|\<mathd\>\<sigma\>|\<sigma\>>>>>>|<row|<cell|<space|1em>\<times\><around*|<left|\<\|\|\>|2>|<around*|(|<wpD><rsub|\<zeta\>><around*|(|\<theta\><rsub|\<Gamma\><rsub|3>>|)>-\<beta\>\<rho\><dd><rsub|\<zeta\>>|)><wpD><rsub|\<zeta\>><around*|(|\<theta\><rsub|\<Gamma\><rsub|3>>|)>F<rsup|\<ast\>><rsub|3><around|(|\<theta\>,\<zeta\>,\<rho\>|)><around|[|\<phi\><rsub|3><rsup|>|]>|<right|\<\|\|\>|2>><rsub|L<rsub|<frac|\<mathd\>\<theta\>\<mathd\>\<zeta\>|<around*|\||\<Theta\>|\|>>><rsup|u<rsub|3>>L<rsub|<frac|\<mathd\>\<rho\>|\<rho\>>><rsup|1>>>>>>>>>|<row|<cell|\<lesssim\><around*|\<\|\|\>|F<rsub|1>|\<\|\|\>><rsub|\<Gamma\><rsub|1><rsup|\<ast\>><SL><rsub|\<Theta\><rsub|>><rsup|<around*|(|u<rsub|1>,\<infty\>|)>><wpD><rsub|2<gr>><rsup|N-3><around*|(|T|)>><around*|\<\|\|\>|F<rsub|2>|\<\|\|\>><rsub|\<Gamma\><rsub|2><rsup|\<ast\>><SL><rsub|\<Theta\><rsub|>><rsup|<around*|(|u<rsub|2>,2|)>><wpD><rsub|2<gr>><rsup|N-3><around*|(|T|)>><around*|\<\|\|\>|F<rsub|3>|\<\|\|\>><rsub|<SL><rsub|\<Theta\><rsub|>><rsup|<around*|(|u<rsub|3>,1|)>>\<Gamma\><rsub|3><rsup|\<ast\>><dfct><rsub|2<gr>><rsup|N-3><around*|(|T|)>>,>>>>>
    </equation*>

    \;

    <\equation*>
      <big|int><rsub|\<Theta\>><around*|\||<math-up|B3><around*|(|\<theta\>|)><around*|[|\<phi\><rsub|1><rsup|>,\<phi\><rsub|2><rsup|>,\<phi\><rsub|3><rsup|>|]>|\|>\<mathd\>\<theta\><ltae|<tformat|<table|<row|<cell|\<lesssim\><ltae|<tformat|<table|<row|<cell|<around*|<left|\<\|\|\>|2>|<wpD><rsub|\<zeta\>><around*|(|\<theta\><rsub|\<Gamma\><rsub|1>>|)>F<rsub|1><rsup|\<ast\>><around*|(|\<theta\>,\<zeta\>,\<sigma\>|)><around*|[|\<phi\><rsub|1><rsup|>|]>|<right|\<\|\|\>|2>><rsub|L<rsup|u<rsub|1>><rsub|<frac|\<mathd\>\<theta\>\<mathd\>\<zeta\>|<around*|\||\<Theta\>|\|>>>L<rsup|\<infty\>><rsub|<frac|\<mathd\>\<sigma\>|\<sigma\>>>>>>|<row|<cell|<space|1em>\<times\><around*|<left|\<\|\|\>|2>|<around*|<left|(|1>|<wpD><rsub|\<zeta\>><around*|(|\<theta\><rsub|\<Gamma\><rsub|2>>|)>-\<beta\>\<sigma\>\<mathd\><rsub|\<zeta\>>|<right|)|1>><wpD><rsub|\<zeta\>><around*|(|\<theta\><rsub|\<Gamma\><rsub|2>>|)><rsub|>F<rsub|2><rsup|\<ast\>><around*|(|\<theta\>,\<zeta\>,\<sigma\>|)><around*|[|\<phi\><rsub|2>|]>|<right|\<\|\|\>|2>><rsub|L<rsup|u<rsub|2>><rsub|<frac|\<mathd\>\<theta\>\<mathd\>\<zeta\>|<around*|\||\<Theta\>|\|>>>L<rsup|1><rsub|<frac|\<mathd\>\<sigma\>|\<sigma\>>>>>>|<row|<cell|<space|1em>\<times\><around*|<left|\<\|\|\>|2>|<wpD><rsub|\<zeta\><rsub|>><around*|(|\<theta\><rsub|\<Gamma\><rsub|3>>|)>F<rsup|\<ast\>><rsub|3><around|(|\<theta\>,\<zeta\>,\<rho\>|)><around|[|\<phi\><rsub|3><rsup|>|]>|<right|\<\|\|\>|2>><rsub|L<rsub|<frac|\<mathd\>\<theta\>\<mathd\>\<zeta\>|<around*|\||\<Theta\>|\|>>><rsup|u<rsub|3>>L<rsub|<frac|\<mathd\>\<rho\>|\<rho\>>><rsup|2>>>>>>>>>|<row|<cell|\<lesssim\><around*|\<\|\|\>|F<rsub|1>|\<\|\|\>><rsub|\<Gamma\><rsub|1><rsup|\<ast\>><SL><rsub|\<Theta\><rsub|>><rsup|<around*|(|u<rsub|1>,\<infty\>|)>>\<Phi\><rsub|<gr>><rsup|N><around*|(|T|)>><around*|\<\|\|\>|F<rsub|2>|\<\|\|\>><rsub|\<Gamma\><rsub|2><rsup|\<ast\>><SL><rsub|\<Theta\><rsub|>><rsup|<around*|(|u<rsub|2>,1|)>><dfct><rsub|<gr>><rsup|N><around*|(|T|)>><around*|\<\|\|\>|F<rsub|3>|\<\|\|\>><rsub|\<Gamma\><rsub|3><rsup|\<ast\>><SL><rsub|\<Theta\><rsub|>><rsup|<around*|(|u<rsub|3>,2|)>><wpD><rsub|<gr>><rsup|N><around*|(|T|)>>,>>>>>
    </equation*>

    \;

    <\equation*>
      <big|int><rsub|\<Theta\>><around*|\||<math-up|B4<math|>><around*|(|\<theta\>|)><around*|[|\<phi\><rsub|1><rsup|>,\<phi\><rsub|2><rsup|>,\<phi\><rsub|3><rsup|>|]>|\|>\<mathd\>\<theta\><ltae|<tformat|<table|<row|<cell|\<lesssim\><ltae|<tformat|<cwith|1|1|1|1|cell-halign|l>|<cwith|1|1|1|1|cell-valign|T>|<table|<row|<cell|\<beta\><around*|<left|\<\|\|\>|2>|<around*|<left|(|1>|<wpD><rsub|\<zeta\>><around*|(|\<theta\><rsub|\<Gamma\><rsub|1>>|)>-\<sigma\>\<mathd\><rsub|\<zeta\>>|<right|)|1>><wpD><rsub|\<zeta\>><around*|(|\<theta\>|)>F<rsub|1><rsup|\<ast\>><around*|(|\<theta\>,\<zeta\>,\<sigma\>|)>|<right|\<\|\|\>|2>><rsub|L<rsup|u<rsub|1>><rsub|<frac|\<mathd\>\<theta\>\<mathd\>\<zeta\>|<around*|\||\<Theta\>|\|>>>L<rsup|1><rsub|<frac|\<mathd\>\<sigma\>|\<sigma\>>>>>>|<row|<cell|<space|1em>\<times\><around*|<left|\<\|\|\>|2>|<wpD><rsub|\<zeta\>><around*|(|\<theta\><rsub|\<Gamma\><rsub|2>>|)><rsub|>F<rsub|2><rsup|\<ast\>><around*|(|\<theta\>,\<zeta\>,\<sigma\>|)><around*|[|\<phi\><rsub|2>|]>|<right|\<\|\|\>|2>><rsub|L<rsup|u<rsub|2>><rsub|<frac|\<mathd\>\<theta\>\<mathd\>\<zeta\>|<around*|\||\<Theta\>|\|>>>L<rsup|\<infty\>><rsub|<frac|\<mathd\>\<sigma\>|\<sigma\>>>><around*|<left|\<\|\|\>|2>|<wpD><rsub|\<zeta\><rsub|>><around*|(|\<theta\><rsub|\<Gamma\><rsub|3>>|)>F<rsup|\<ast\>><rsub|3><around|(|\<theta\>,\<zeta\>,\<rho\>|)><around|[|\<phi\><rsub|3><rsup|>|]>|<right|\<\|\|\>|2>><rsub|L<rsub|<frac|\<mathd\>\<theta\>\<mathd\>\<zeta\>|<around*|\||\<Theta\>|\|>>><rsup|u<rsub|3>>L<rsub|<frac|\<mathd\>\<rho\>|\<rho\>>><rsup|2>>>>>>>>>|<row|<cell|\<lesssim\>???>>>>>
    </equation*>

    \;

    We conclude the proof by showing that <eqref|eq:single-tree:l-l-o:decomp>
    holds. Our manipulations rely on \ using the fundamental theorem of
    calculus in the scale parameter on <math|F<rsub|3><rsup|\<ast\>>>. To
    exploit certain cancellations we need to integrate by parts in the
    spatial variable. Every integration causes \Pdefect\Q terms to appear
    that have to be accounted for; they are grouped into the terms
    <math|<math-up|B1>-<math-up|B4>>.

    We rely on the following algebraic identity that follows directly from
    definitions <eqref|eq:space-boost> and <eqref|eq:scale-boost>:

    <\equation>
      <label|eq:useful-boost-identities><wpD><rsub|\<sigma\>><around*|(|\<theta\><rsub|\<Gamma\><rsub|j>>|)>F<rsup|\<ast\>><rsub|j><around*|(|\<theta\>,\<zeta\>,\<sigma\>|)><around*|[|\<phi\>|]>=<wpD><rsub|\<zeta\>><around*|(|\<theta\><rsub|\<Gamma\><rsub|j>>|)>F<rsup|\<ast\>><rsub|j><around*|(|\<theta\>,\<zeta\>,\<sigma\>|)><around*|[|z\<phi\><around*|(|z|)>|]>.
    </equation>

    In what follows we drop <math|\<theta\>> from the notation and keep the
    dependence on this variable implicit: we write
    <math|<wpD><rsub|\<zeta\><rsub|j>>> in place of
    <math|<wpD><rsub|\<zeta\>><around*|(|\<theta\><rsub|\<Gamma\><rsub|j>>|)>>,
    <math|<wpD><rsub|\<sigma\><rsub|j>>> in place of
    <math|<wpD><rsub|\<sigma\>><around*|(|\<theta\><rsub|\<Gamma\><rsub|j>>|)>>
    , <math|F<rsup|\<ast\>><rsub|j><around*|(|\<zeta\>,\<sigma\>|)>> in place
    of <math|F<rsup|\<ast\>><rsub|j><around*|(|\<theta\>,\<zeta\>,\<sigma\>|)>><math|>,
    <math|<wide|\<phi\>|~><rsub|j><rsup|l/o>> in place of
    <math|<wide|\<phi\>|~><rsub|j,\<theta\>><rsup|l/o>>, and so on.

    It holds that (using \ the convention of keeping <math|\<theta\>>
    implicit)

    <\equation>
      <label|eq:scale-derivative-gain-of-cancellation>\<rho\>\<mathd\><rsub|\<rho\>>F<rsup|\<ast\>><rsub|3><around|(|\<zeta\>,\<rho\>|)><around|[|\<phi\><rsub|3><rsup|o>|]><ltae|<tformat|<twith|table-valign|T>|<cwith|1|-1|1|1|cell-halign|l>|<twith|table-hmode|auto>|<cwith|1|2|1|1|cell-halign|l>|<table|<row|<cell|=<wpD><rsub|\<sigma\><rsub|3>>F<rsup|\<ast\>><rsub|3><around|(|\<zeta\>,\<rho\>|)><around|[|\<phi\><rsub|3><rsup|o>|]>-<around*|(|<wpD><rsub|\<sigma\><rsub|3>>-\<rho\>\<mathd\><rsub|\<rho\>>|)>F<rsup|\<ast\>><rsub|3><around|(|\<zeta\>,\<rho\>|)><around|[|\<phi\><rsub|3><rsup|o>|]>>>|<row|<cell|=<wpD><rsub|\<zeta\><rsub|3>><rsup|2>F<rsup|\<ast\>><rsub|3><around|(|\<zeta\>,\<rho\>|)><around|[|<wide|\<phi\>|~><rsub|3><rsup|o>|]>-<around*|(|<wpD><rsub|\<sigma\><rsub|3>>-\<rho\>\<mathd\><rsub|\<rho\>>|)>F<rsup|\<ast\>><rsub|3><around|(|\<zeta\>,\<rho\>|)><around|[|\<phi\><rsub|3><rsup|o>|]>>>|<row|<cell|=<ltae|<tformat|<table|<row|<cell|\<beta\>\<rho\>d<rsub|\<zeta\>><wpD><rsub|\<zeta\><rsub|3>>F<rsup|\<ast\>><rsub|3><around|(|\<zeta\>,\<rho\>|)><around|[|<wide|\<phi\>|~><rsub|3><rsup|o>|]>+<around*|(|<wpD><rsub|\<zeta\><rsub|3>>-\<beta\>\<rho\>d<rsub|\<zeta\>>|)><wpD><rsub|\<zeta\><rsub|3>>F<rsup|\<ast\>><rsub|3><around|(|\<zeta\>,\<rho\>|)><around|[|<wide|\<phi\>|~><rsub|3><rsup|o>|]>>>|<row|<cell|<space|1em>-<around*|(|<wpD><rsub|\<sigma\><rsub|3>>-\<rho\>\<mathd\><rsub|\<rho\>>|)>F<rsup|\<ast\>><rsub|3><around|(|\<zeta\>,\<rho\>|)><around|[|\<phi\><rsub|3><rsup|o>|]>>>>>>>>>>>
    </equation>

    We now concentrate on the inner <math|<R><rsup|2><rsub|+>> integral in
    <LHS|<eqref|eq:single-tree:l-l-o:decomp>>. Applying the fundamental
    theorem of calculus in the scale variable to term
    <math|F<rsup|\<ast\>><rsub|3><around|(|\<zeta\>,\<sigma\>|)><around|[|\<phi\><rsub|3><rsup|o>|]>>
    and using identity <eqref|eq:scale-derivative-gain-of-cancellation> we
    get

    <\equation*>
      <ltae|<tformat|<cwith|1|3|1|1|cell-halign|l>|<cwith|1|1|1|1|cell-width|>|<cwith|1|1|1|1|cell-hmode|auto>|<cwith|2|2|1|1|cell-halign|l>|<cwith|2|2|1|1|cell-halign|l>|<table|<row|<cell|<big|int><rsub|<R><rsup|2><rsub|+>><wpD><rsub|\<zeta\><rsub|1>><rsub|>F<rsub|1><rsup|\<ast\>><around*|(|\<zeta\>,\<sigma\>|)><around*|[|<wide|\<phi\>|~><rsub|1><rsup|l>|]><wpD><rsub|\<zeta\><rsub|2>>F<rsub|2><rsup|\<ast\>><around*|(|\<zeta\>,\<sigma\>|)><around*|[|<wide|\<phi\>|~><rsub|2><rsup|l>|]>F<rsub|3><rsup|\<ast\>><around*|(|\<theta\>,\<zeta\>,\<sigma\>|)><around*|[|\<phi\><rsub|2><rsup|o>|]>\<mathd\>\<zeta\><frac|\<mathd\>\<sigma\>|\<sigma\>>>>|<row|<cell|<space|1em><ltae|<tformat|<table|<row|<cell|=<big|int><rsub|<R><rsup|2><rsub|+>><wpD><rsub|\<zeta\><rsub|1>><rsub|>F<rsup|\<ast\>><rsub|1><around|(|\<zeta\>,\<sigma\>|)><around|[|<wide|\<phi\>|~><rsub|1><rsup|l>|]><space|0.17em><wpD><rsub|\<zeta\><rsub|2>>F<rsup|\<ast\>><rsub|2><around|(|\<zeta\>,\<sigma\>|)><around|[|<wide|\<phi\>|~><rsub|2><rsup|l>|]><around*|(|<big|int><rsub|0><rsup|\<sigma\>>\<rho\>\<mathd\><rsub|\<rho\>>F<rsup|\<ast\>><rsub|3><around|(|\<zeta\>,\<rho\>|)><around|[|\<phi\><rsub|3><rsup|o>|]><frac|\<mathd\>\<rho\>|\<rho\>>|)>\<mathd\>\<zeta\><frac|\<mathd\>\<sigma\>|\<sigma\>>>>|<row|<cell|=<ltae|<tformat|<table|<row|<cell|<big|int><rsub|<R><rsup|2><rsub|+>><wpD><rsub|\<zeta\><rsub|1>>F<rsup|\<ast\>><rsub|1><around|(|\<zeta\>,\<sigma\>|)><around|[|<wide|\<phi\>|~><rsub|1><rsup|l>|]><wpD><rsub|\<zeta\><rsub|2>>F<rsup|\<ast\>><rsub|2><around|(|\<zeta\>,\<sigma\>|)><around|[|<wide|\<phi\>|~><rsub|2><rsup|l>|]><around*|(|<big|int><rsub|0><rsup|\<sigma\>>\<beta\>\<rho\>\<mathd\><rsub|\<zeta\>><wpD><rsub|\<zeta\><rsub|3>>F<rsup|\<ast\>><rsub|3><around|(|\<zeta\>,\<rho\>|)><around|[|<wide|\<phi\>|~><rsub|3><rsup|o>|]><frac|\<mathd\>\<rho\>|\<rho\>>|)>\<mathd\>\<zeta\><frac|\<mathd\>\<sigma\>|\<sigma\>>>>|<row|<cell|<space|1em>-<math-up|B1><around*|[|<wide|\<phi\>|~><rsub|1><rsup|l>,<wide|\<phi\>|~><rsub|2><rsup|l>,\<phi\><rsub|3><rsup|o>|]>+<math-up|B2><around*|[|<wide|\<phi\>|~><rsub|1><rsup|l>,<wide|\<phi\>|~><rsub|2><rsup|l>,<wide|\<phi\>|~><rsub|3><rsup|o>|]>.>>>>>>>>>>>>>>>
    </equation*>

    Integrating the first summand on the <math|<RHS|>> by parts in
    <math|\<zeta\>> gives

    <\equation*>
      <tabular|<tformat|<cwith|1|2|1|1|cell-halign|l>|<cwith|1|1|1|1|cell-halign|l>|<table|<row|<cell|<big|int><rsub|<R><rsup|2><rsub|+>><wpD><rsub|\<zeta\><rsub|1>>F<rsup|\<ast\>><rsub|1><around|(|\<zeta\>,\<sigma\>|)><around|[|<wide|\<phi\>|~><rsub|1><rsup|l>|]><wpD><rsub|\<zeta\><rsub|2>>F<rsup|\<ast\>><rsub|2><around|(|\<zeta\>,\<sigma\>|)><around|[|<wide|\<phi\>|~><rsub|2><rsup|l>|]><around*|(|<big|int><rsub|0><rsup|\<sigma\>>\<beta\>\<rho\>\<mathd\><rsub|\<zeta\>><wpD><rsub|\<zeta\><rsub|3>>F<rsup|\<ast\>><rsub|3><around|(|\<zeta\>,\<rho\>|)><around|[|<wide|\<phi\>|~><rsub|3><rsup|o>|]><frac|\<mathd\>\<rho\>|\<rho\>>|)>\<mathd\>\<zeta\><frac|\<mathd\>\<sigma\>|\<sigma\>>>>|<row|<cell|<space|1em><ltae|<tformat|<table|<row|<cell|=<ltae|<tformat|<cwith|1|1|1|1|cell-halign|l>|<table|<row|<cell|<big|int><rsub|<R><rsup|2><rsub|+>><wpD><rsub|\<zeta\><rsub|1>>F<rsup|\<ast\>><rsub|1><around|(|\<zeta\>,\<sigma\>|)><around|[|<wide|\<phi\>|~><rsub|1><rsup|l>|]><space|0.17em>\<beta\>\<sigma\>\<mathd\><rsub|\<zeta\>><wpD><rsub|\<zeta\><rsub|2>>F<rsup|\<ast\>><rsub|2><around|(|\<zeta\>,\<sigma\>|)><around|[|<wide|\<phi\>|~><rsub|2><rsup|l>|]><around*|(|<big|int><rsub|0><rsup|\<sigma\>><frac|\<rho\>|\<sigma\>><wpD><rsub|\<zeta\><rsub|3>>F<rsup|\<ast\>><rsub|3><around|(|\<zeta\>,\<rho\>|)><around|[|<wide|\<phi\>|~><rsub|3><rsup|o>|]><frac|\<mathd\>\<rho\>|\<rho\>>|)><frac|\<mathd\>\<sigma\>|\<sigma\>>\<mathd\>\<zeta\>>>|<row|<cell|<space|1em>+\<beta\><big|int><rsub|<R><rsup|2><rsub|+>>\<sigma\>\<mathd\><rsub|\<zeta\>><wpD><rsub|\<zeta\><rsub|1>>F<rsup|\<ast\>><rsub|1><around|(|\<zeta\>,\<sigma\>|)><around|[|<wide|\<phi\>|~><rsub|1><rsup|l>|]><wpD><rsub|\<zeta\><rsub|2>>F<rsup|\<ast\>><rsub|2><around|(|\<zeta\>,\<sigma\>|)><around|[|<wide|\<phi\>|~><rsub|2><rsup|l>|]><around*|(|<big|int><rsub|0><rsup|\<sigma\>><frac|\<rho\>|\<sigma\>><wpD><rsub|\<zeta\><rsub|3>>F<rsup|\<ast\>><rsub|3><around|(|\<zeta\>,\<rho\>|)><around|[|<wide|\<phi\>|~><rsub|3><rsup|o>|]><frac|\<mathd\>\<rho\>|\<rho\>>|)><frac|\<mathd\>\<sigma\>|\<sigma\>>\<mathd\>\<zeta\>>>>>>>>|<row|<cell|=<math-up|M1><around*|[|<wide|\<phi\>|~><rsub|1><rsup|l>,<wide|\<phi\>|~><rsub|2><rsup|l>,<wide|\<phi\>|~><rsub|3><rsup|o>|]>+<math-up|B3><around*|[|<wide|\<phi\>|~><rsub|1><rsup|l>,<wide|\<phi\>|~><rsub|2><rsup|l>,<wide|\<phi\>|~><rsub|3><rsup|o>|]>+<math-up|M2><around*|[|<wide|\<phi\>|~><rsub|1><rsup|l>,<wide|\<phi\>|~><rsub|2><rsup|l>,<wide|\<phi\>|~><rsub|3><rsup|o>|]>+<math-up|B4><around*|[|<wide|\<phi\>|~><rsub|1><rsup|l>,<wide|\<phi\>|~><rsub|2><rsup|l>,<wide|\<phi\>|~><rsub|3><rsup|o>|]>.>>>>>>>>>>
    </equation*>

    This concludes the proof of the decomposition
    <eqref|eq:single-tree:l-l-o:decomp>.
  </render-proof>

  <\render-proof|Proof of bound <smart-ref|eq:STE:l-o-o:tree>>
    We need to show that

    <\equation*>
      <big|int><rsub|\<Theta\>><around*|<left|\||-2>|<big|int><rsub|<R><rsup|2><rsub|+>><around*|<left|(|-3>|<big|prod><rsub|j=1><rsup|3>F<rsub|j><rsup|\<ast\>><around*|(|\<theta\>,\<zeta\>,\<sigma\>|)>|<right|)|-3>><around*|<left|[|1>|\<phi\><rsub|1,\<theta\>><rsup|l<rsub|>>,\<phi\><rsub|2,\<theta\>><rsup|o>,\<phi\><rsub|3,\<theta\>><rsup|o>|<right|]|1>><dd>\<zeta\><frac|<dd>\<sigma\>|\<sigma\>>|<right|\||-2>><frac|<dd>\<theta\>|<around*|\||\<Theta\>|\|>>\<lesssim\><RHS|<eqref|eq:STE:l-o-o:tree>>
    </equation*>

    that is tantamount to\ 

    <\equation>
      <label|eq:l-o-o-quantity><big|int><rsub|\<Theta\>><around*|\||<big|int><rsub|<R><rsup|2><rsub|+>><wpD><rsub|\<zeta\>><around*|(|\<theta\><rsub|\<Gamma\><rsub|1>>|)>F<rsub|1><rsup|\<ast\>><around*|(|\<theta\>,\<zeta\>,\<sigma\>|)><around*|[|<wide|\<phi\>|~><rsub|1,\<theta\>><rsup|l>|]>F<rsub|\<times\><rsup|>><rsup|\<ast\>><around*|(|\<theta\>,\<zeta\>,\<rho\>|)><around*|[|\<phi\><rsub|2,\<theta\>><rsup|o>,\<phi\><rsub|3,\<theta\>><rsup|o>|]><dd>\<zeta\><frac|<dd>\<sigma\>|\<sigma\>>|\|><frac|<dd>\<theta\>|<around*|\||\<Theta\>|\|>>\<lesssim\><RHS|<eqref|eq:STE:l-o-o:tree>>
    </equation>

    where <math|F<rsub|\<times\><rsup|>><rsup|\<ast\>><around*|(|\<theta\>,\<zeta\>,\<rho\>|)><eqd><big|prod><rsub|j=2><rsup|3>F<rsub|j><rsup|\<ast\>><around*|(|\<theta\>,\<zeta\>,\<sigma\>|)>>.
    We claim that

    <\equation>
      <label|eq:single-tree:l-o-o:decomp><LHS|<eqref|eq:l-o-o-quantity>><ltae|<tformat|<cwith|1|1|1|1|cell-halign|l>|<cwith|2|2|1|1|cell-halign|l>|<cwith|1|1|1|1|cell-valign|T>|<table|<row|<cell|\<leq\><big|int><rsub|\<Theta\>><ltae|<tformat|<cwith|1|1|1|1|cell-halign|l>|<cwith|5|5|1|1|cell-valign|c>|<cwith|2|2|1|1|cell-halign|l>|<cwith|3|3|1|1|cell-halign|l>|<cwith|5|5|1|1|cell-halign|l>|<table|<row|<cell|<around*|<left|(|2>|<around*|\||<math-up|M1><around*|(|\<theta\>|)><around*|[|<wide|\<phi\>|~><rsub|1,\<theta\>><rsup|l>,<wide|\<phi\>|~><rsub|2,\<theta\>><rsup|o>,\<phi\><rsub|3,\<theta\>><rsup|o>|]>|\|>+<around*|\||<math-up|M1><around*|(|\<theta\>|)><around*|[|<wide|\<phi\>|~><rsub|1,\<theta\>><rsup|l>,\<phi\><rsub|2,\<theta\>><rsup|o>,<wide|\<phi\>|~><rsub|3><rsup|o>|]>|\|>|<right|.>>>>|<row|<cell|+<around*|\||<math-up|M2><rsub|<around*|(|<wpD><rsub|\<zeta\>>\<otimes\><Id>|)>><around*|[|<wide|\<phi\>|~><rsub|1,\<theta\>><rsup|l>,<wide|\<phi\>|~><rsub|2,\<theta\>><rsup|o>,\<phi\><rsub|3,\<theta\>><rsup|o>|]>|\|>+<around*|\||<math-up|M2><rsub|<around*|(|<Id>\<otimes\><wpD><rsub|\<zeta\>>|)>><around*|[|<wide|\<phi\>|~><rsub|1,\<theta\>><rsup|l>,\<phi\><rsub|2,\<theta\>><rsup|o>,<wide|\<phi\>|~><rsub|3,\<theta\>><rsup|o>|]>|\|>>>|<row|<cell|+<around*|\||<math-up|B1><around*|(|\<theta\>|)><around*|[|<wide|\<phi\>|~><rsub|1,\<theta\>><rsup|l>,\<phi\><rsub|2,\<theta\>><rsup|o>,\<phi\><rsub|3,\<theta\>><rsup|o>|]>|\|>+<around*|\||<math-up|B2><rsub|<around*|(|<wpD><rsub|\<zeta\>>\<otimes\><Id>|)>><around*|(|\<theta\>|)><around*|[|<wide|\<phi\>|~><rsub|1,\<theta\>><rsup|l>,<wide|\<phi\>|~><rsub|2,\<theta\>><rsup|o>,\<phi\><rsub|3,\<theta\>><rsup|o>|]>|\|>>>|<row|<cell|+<around*|\||<math-up|B2><rsub|<around*|(|<Id>\<otimes\><wpD><rsub|\<zeta\>>|)>><around*|(|\<theta\>|)><around*|[|<wide|\<phi\>|~><rsub|1,\<theta\>><rsup|l>,\<phi\><rsub|2,\<theta\>><rsup|o>,<wide|\<phi\>|~><rsub|3,\<theta\>><rsup|o>|]>|\|>+<around*|\||<math-up|B3><rsub|<around*|(|<wpD><rsub|\<zeta\>>\<otimes\><Id>|)>><around*|(|\<theta\>|)><around*|[|<wide|\<phi\>|~><rsub|1,\<theta\>><rsup|l>,<wide|\<phi\>|~><rsub|2,\<theta\>><rsup|o>,\<phi\><rsub|3,\<theta\>><rsup|o>|]>|\|>>>|<row|<cell|<around*|<left|.>|+<around*|\||<math-up|B3><rsub|<around*|(|<Id>\<otimes\><wpD><rsub|\<zeta\>>|)>><around*|(|\<theta\>|)><around*|[|<wide|\<phi\>|~><rsub|1,\<theta\>><rsup|l>,\<phi\><rsub|2,\<theta\>><rsup|o>,<wide|\<phi\>|~><rsub|3,\<theta\>><rsup|o>|]>|\|>|<right|)|2>><frac|\<mathd\>\<theta\>|<around*|\||\<Theta\>|\|>>>>>>>>>|<row|<cell|\<lesssim\>sup<rsub|\<phi\><rsub|j>><big|int><rsub|\<Theta\>><ltae|<tformat|<cwith|1|1|1|1|cell-halign|l>|<table|<row|<cell|<around*|<left|(|2>|<around*|\||<math-up|M1><around*|(|\<theta\>|)><around*|[|\<phi\><rsub|1><rsup|>,\<phi\><rsub|2><rsup|>,\<phi\><rsub|3><rsup|>|]>|\|>+<around*|\||<math-up|M2><rsub|<around*|(|<wpD><rsub|\<zeta\>>\<otimes\><Id>|)>><around*|[|\<phi\><rsub|1><rsup|>,\<phi\><rsub|2><rsup|>,\<phi\><rsub|3><rsup|>|]>|\|>|<right|.>>>>|<row|<cell|+<around*|\||<math-up|M2><rsub|<around*|(|<Id>\<otimes\><wpD><rsub|\<zeta\>>|)>><around*|[|\<phi\><rsub|1><rsup|>,\<phi\><rsub|2><rsup|>,\<phi\><rsub|3><rsup|>|]>|\|>+<around*|\||<math-up|B1><around*|(|\<theta\>|)><around*|[|\<phi\><rsub|1><rsup|>,\<phi\><rsub|2><rsup|>,\<phi\><rsub|3><rsup|>|]>|\|>>>|<row|<cell|+<around*|\||<math-up|B2><rsub|<around*|(|<wpD><rsub|\<zeta\>>\<otimes\><Id>|)>><around*|(|\<theta\>|)><around*|[|\<phi\><rsub|1><rsup|>,\<phi\><rsub|2><rsup|>,\<phi\><rsub|3><rsup|>|]>|\|>+<around*|\||<math-up|B2><rsub|<around*|(|<Id>\<otimes\><wpD><rsub|\<zeta\>>|)>><around*|(|\<theta\>|)><around*|[|\<phi\><rsub|1><rsup|>,\<phi\><rsub|2><rsup|>,\<phi\><rsub|3><rsup|>|]>|\|>>>|<row|<cell|<around*|<left|.>|+<around*|\||<math-up|B3><rsub|<around*|(|<wpD><rsub|\<zeta\>>\<otimes\><Id>|)>><around*|(|\<theta\>|)><around*|[|\<phi\><rsub|1><rsup|>,\<phi\><rsub|2><rsup|>,\<phi\><rsub|3><rsup|>|]>|\|>+<around*|\||<math-up|B3><rsub|<around*|(|<Id>\<otimes\><wpD><rsub|\<zeta\>>|)>><around*|(|\<theta\>|)><around*|[|\<phi\><rsub|1><rsup|>,\<phi\><rsub|2><rsup|>,\<phi\><rsub|3><rsup|>|]>|\|>|<right|)|2>><frac|\<mathd\>\<theta\>|<around*|\||\<Theta\>|\|>>>>>>>>>>>>
    </equation>

    where the upper bound is taken over wave packets satisfying
    <math|<around*|\<\|\|\>|\<phi\><rsub|j><rsub|>|\<\|\|\>><rsub|\<Phi\><rsub|2<gr>><rsup|N-3>>\<leq\>1>,
    <math|j\<in\><around*|{|1,2,3|}>>, and where\ 

    <\equation*>
      <math-up|M1><around*|(|\<theta\>|)><around*|[|\<phi\><rsub|1><rsup|>,\<phi\><rsub|2><rsup|>,\<phi\><rsub|3><rsup|>|]>\<assign\><ltae|<tformat|<cwith|1|1|1|1|cell-halign|l>|<table|<row|<cell|<big|int><rsub|<R><rsup|2><rsub|+>><wpD><rsub|\<zeta\>><around*|(|\<theta\><rsub|\<Gamma\><rsub|1>>|)>F<rsub|1><rsup|\<ast\>><around*|(|\<theta\>,\<zeta\>,\<sigma\>|)><around*|[|\<phi\><rsub|1><rsup|>|]>>>|<row|<cell|<space|1em>\<times\><around*|(|<big|int><rsub|0><rsup|\<sigma\>><around*|(|<wpD><rsub|\<zeta\><rsub|>><around*|(|\<theta\><rsub|\<Gamma\><rsub|2>>|)>\<otimes\><wpD><rsub|\<zeta\><rsub|>><around*|(|\<theta\><rsub|\<Gamma\><rsub|3>>|)>|)>F<rsub|\<times\><rsup|>><rsup|\<ast\>><around*|(|\<theta\>,\<zeta\>,\<sigma\>|)><around|[|\<phi\><rsub|2>,\<phi\><rsub|3>|]><frac|\<mathd\>\<rho\>|\<rho\>>|)>\<mathd\>\<zeta\><frac|\<mathd\>\<sigma\>|\<sigma\>>,>>>>>
    </equation*>

    <\equation*>
      <math-up|<math|<math-up|M2><rsub|<around*|(|<wpD><rsub|\<zeta\>>\<otimes\><Id>|)>>>><around*|(|\<theta\>|)><around*|[|\<phi\><rsub|1><rsup|>,\<phi\><rsub|2><rsup|>,\<phi\><rsub|3><rsup|>|]>\<assign\><ltae|<tformat|<cwith|2|2|1|1|cell-halign|r>|<cwith|1|1|1|1|cell-halign|l>|<table|<row|<cell|\<beta\><big|int><rsub|<R><rsup|2><rsub|+>><wpD><rsub|\<zeta\>><around*|(|\<theta\><rsub|\<Gamma\><rsub|1>>|)><rsup|2>F<rsub|1><rsup|\<ast\>><around*|(|\<theta\>,\<zeta\>,\<sigma\>|)><around*|[|\<phi\><rsub|1><rsup|>|]><space|2em>>>|<row|<cell|<space|1em>\<times\><around*|(|<big|int><rsub|0><rsup|\<sigma\>><frac|\<rho\>|\<sigma\>><around*|(|<wpD><rsub|\<zeta\><rsub|>><around*|(|\<theta\><rsub|\<Gamma\><rsub|2>>|)>\<otimes\>Id|)>F<rsub|\<times\><rsup|>><rsup|\<ast\>><around*|(|\<theta\>,\<zeta\>,\<sigma\>|)><around|[|\<phi\><rsub|2>,\<phi\><rsub|3>|]><frac|\<mathd\>\<rho\>|\<rho\>>|)>\<mathd\>\<zeta\><frac|\<mathd\>\<sigma\>|\<sigma\>>,>>>>>
    </equation*>

    <\equation*>
      <math-up|<math|<math-up|M2><rsub|<around*|(|<Id>\<otimes\><wpD><rsub|\<zeta\>>|)>>>><around*|(|\<theta\>|)><around*|[|\<phi\><rsub|1><rsup|>,\<phi\><rsub|2><rsup|>,\<phi\><rsub|3><rsup|>|]>\<assign\><ltae|<tformat|<cwith|2|2|1|1|cell-halign|r>|<cwith|1|1|1|1|cell-halign|l>|<table|<row|<cell|\<beta\><big|int><rsub|<R><rsup|2><rsub|+>><wpD><rsub|\<zeta\>><around*|(|\<theta\><rsub|\<Gamma\><rsub|1>>|)><rsup|2>F<rsub|1><rsup|\<ast\>><around*|(|\<theta\>,\<zeta\>,\<sigma\>|)><around*|[|\<phi\><rsub|1><rsup|>|]><space|2em>>>|<row|<cell|<space|1em>\<times\><around*|(|<big|int><rsub|0><rsup|\<sigma\>><frac|\<rho\>|\<sigma\>><around*|(|Id\<otimes\><wpD><rsub|\<zeta\><rsub|>><around*|(|\<theta\><rsub|\<Gamma\><rsub|3>>|)>|)>F<rsub|\<times\><rsup|>><rsup|\<ast\>><around*|(|\<theta\>,\<zeta\>,\<sigma\>|)><around|[|\<phi\><rsub|2>,\<phi\><rsub|3>|]><frac|\<mathd\>\<rho\>|\<rho\>>|)>\<mathd\>\<zeta\><frac|\<mathd\>\<sigma\>|\<sigma\>>,>>>>>
    </equation*>

    and

    <\equation*>
      <ltae|<tformat|<cwith|1|1|1|1|cell-halign|l>|<table|<row|<cell|<math-up|B1><around*|(|\<theta\>|)><around*|[|\<phi\><rsub|1><rsup|>,\<phi\><rsub|2><rsup|>,\<phi\><rsub|3><rsup|>|]>\<assign\><big|int><rsub|<R><rsup|2><rsub|+>><wpD><rsub|\<zeta\>><around*|(|\<theta\><rsub|\<Gamma\><rsub|1>>|)>F<rsub|1><rsup|\<ast\>><around*|(|\<theta\>,\<zeta\>,\<sigma\>|)><around*|[|\<phi\><rsub|1><rsup|>|]>>>|<row|<cell|<space|1em>\<times\><around*|(|<big|int><rsub|0><rsup|\<sigma\>><around*|(|<wpD><rsub|\<sigma\>><around*|(|\<theta\><rsub|\<Gamma\><rsub|2>>|)>\<otimes\><Id>+<Id>\<otimes\><wpD><rsub|\<sigma\><rsub|>><around*|(|\<theta\><rsub|\<Gamma\><rsub|3>>|)>-\<rho\>\<mathd\><rsub|\<rho\>>|)>F<rsub|\<times\><rsup|>><rsup|\<ast\>><around*|(|\<theta\>,\<zeta\>,\<rho\>|)><around|[|\<phi\><rsub|2>,\<phi\><rsub|3>|]><frac|\<mathd\>\<rho\>|\<rho\>>|)><space|0.6spc>\<mathd\>\<zeta\><frac|\<mathd\>\<sigma\>|\<sigma\>>,>>>>>
    </equation*>

    <\equation*>
      <ltae|<tformat|<cwith|2|2|1|1|cell-halign|l>|<table|<row|<cell|<math-up|B2><rsub|<around*|(|<wpD><rsub|\<zeta\>>\<otimes\><Id>|)>><around*|[|\<phi\><rsub|1><rsup|>,\<phi\><rsub|2><rsup|>,\<phi\><rsub|3><rsup|>|]>\<assign\><big|int><rsub|<R><rsup|2><rsub|+>><wpD><rsub|\<zeta\>><around*|(|\<theta\><rsub|\<Gamma\><rsub|1>>|)>F<rsub|1><rsup|\<ast\>><around*|(|\<theta\>,\<zeta\>,\<sigma\>|)><around*|[|\<phi\><rsub|1><rsup|>|]>>>|<row|<cell|<space|1em>\<times\><around*|(|<big|int><rsub|0><rsup|\<sigma\>><around*|(|<wpD><rsub|\<zeta\>><around*|(|\<theta\><rsub|\<Gamma\><rsub|2>>|)>\<otimes\><Id>+<Id>\<otimes\><wpD><rsub|\<zeta\><rsub|>><around*|(|\<theta\><rsub|\<Gamma\><rsub|3>>|)>-\<beta\>\<rho\>\<mathd\><rsub|\<zeta\>>|)><around*|(|<wpD><rsub|\<zeta\>><around*|(|\<theta\><rsub|\<Gamma\><rsub|2>>|)>\<otimes\><Id>|)>F<rsub|\<times\><rsup|>><rsup|\<ast\>><around*|(|\<theta\>,\<zeta\>,\<rho\>|)><around|[|\<phi\><rsub|2>,\<phi\><rsub|3>|]><frac|\<mathd\>\<rho\>|\<rho\>>|)>\<mathd\>\<zeta\><frac|\<mathd\>\<sigma\>|\<sigma\>>>>>>>
    </equation*>

    <\equation*>
      <ltae|<tformat|<cwith|1|1|1|1|cell-halign|l>|<cwith|2|2|1|1|cell-halign|l>|<table|<row|<cell|<math-up|B2><rsub|<around*|(|<Id>\<otimes\><wpD><rsub|\<zeta\>>|)>><around*|[|\<phi\><rsub|1><rsup|>,\<phi\><rsub|2><rsup|>,\<phi\><rsub|3><rsup|>|]>\<assign\><big|int><rsub|<R><rsup|2><rsub|+>><wpD><rsub|\<zeta\>><around*|(|\<theta\><rsub|\<Gamma\><rsub|1>>|)>F<rsub|1><rsup|\<ast\>><around*|(|\<theta\>,\<zeta\>,\<sigma\>|)><around*|[|\<phi\><rsub|1><rsup|>|]>>>|<row|<cell|<space|1em>\<times\><around*|(|<big|int><rsub|0><rsup|\<sigma\>><around*|(|<wpD><rsub|\<zeta\>><around*|(|\<theta\><rsub|\<Gamma\><rsub|2>>|)>\<otimes\><Id>+<Id>\<otimes\><wpD><rsub|\<zeta\><rsub|>><around*|(|\<theta\><rsub|\<Gamma\><rsub|3>>|)>-\<beta\>\<rho\>\<mathd\><rsub|\<zeta\>>|)><around*|(|<Id>\<otimes\><wpD><rsub|\<zeta\><rsub|>><around*|(|\<theta\><rsub|\<Gamma\><rsub|3>>|)>|)>F<rsub|\<times\><rsup|>><rsup|\<ast\>><around*|(|\<theta\>,\<zeta\>,\<rho\>|)><around|[|\<phi\><rsub|2>,\<phi\><rsub|3>|]><frac|\<mathd\>\<rho\>|\<rho\>>|)><frac|\<mathd\>\<sigma\>|\<sigma\>>\<mathd\>\<zeta\>,>>>>>
    </equation*>

    <\equation*>
      <math-up|B3><rsub|<around*|(|<wpD><rsub|\<zeta\>>\<otimes\><Id>|)>><around*|[|\<phi\><rsub|1><rsup|>,\<phi\><rsub|2><rsup|>,\<phi\><rsub|3><rsup|>|]>\<assign\><ltae|<tformat|<cwith|1|1|1|1|cell-halign|l>|<table|<row|<cell|\<beta\><big|int><rsub|<R><rsup|2><rsub|+>><around*|(|<wpD><rsub|\<zeta\>><around*|(|\<theta\><rsub|\<Gamma\><rsub|1>>|)>-\<sigma\>d<rsub|\<zeta\>>|)>F<rsub|1><rsup|\<ast\>><around*|(|\<theta\>,\<zeta\>,\<sigma\>|)><around*|[|\<phi\><rsub|1><rsup|>|]>>>|<row|<cell|<space|1em>\<times\><around*|(|<big|int><rsub|0><rsup|\<sigma\>><frac|\<rho\>|\<sigma\>><around*|(|<wpD><rsub|\<zeta\>><around*|(|\<theta\><rsub|\<Gamma\><rsub|2>>|)>\<otimes\><Id>|)>F<rsub|\<times\><rsup|>><rsup|\<ast\>><around*|(|\<theta\>,\<zeta\>,\<rho\>|)><around|[|\<phi\><rsub|2>,\<phi\><rsub|3>|]><frac|\<mathd\>\<rho\>|\<rho\>>|)><frac|\<mathd\>\<sigma\>|\<sigma\>>\<mathd\>\<zeta\>,>>>>>
    </equation*>

    <\equation*>
      <math-up|B3><rsub|<around*|(|<Id>\<otimes\><wpD><rsub|\<zeta\>>|)>><around*|[|\<phi\><rsub|1><rsup|>,\<phi\><rsub|2><rsup|>,\<phi\><rsub|3><rsup|>|]>\<assign\><ltae|<tformat|<cwith|1|1|1|1|cell-halign|l>|<table|<row|<cell|\<beta\><big|int><rsub|<R><rsup|2><rsub|+>><around*|(|<wpD><rsub|\<zeta\>><around*|(|\<theta\><rsub|\<Gamma\><rsub|1>>|)>-\<sigma\>d<rsub|\<zeta\>>|)>F<rsub|1><rsup|\<ast\>><around*|(|\<theta\>,\<zeta\>,\<sigma\>|)><around*|[|\<phi\><rsub|1><rsup|>|]>>>|<row|<cell|<space|1em>\<times\><around*|(|<big|int><rsub|0><rsup|\<sigma\>><frac|\<rho\>|\<sigma\>><around*|(|<Id>\<otimes\><wpD><rsub|\<zeta\><rsub|>><around*|(|\<theta\><rsub|\<Gamma\><rsub|3>>|)>|)>F<rsub|\<times\><rsup|>><rsup|\<ast\>><around*|(|\<theta\>,\<zeta\>,\<rho\>|)><around|[|\<phi\><rsub|2>,\<phi\><rsub|3>|]><frac|\<mathd\>\<rho\>|\<rho\>>|)><frac|\<mathd\>\<sigma\>|\<sigma\>>\<mathd\>\<zeta\>.>>>>>
    </equation*>

    \;

    The second inequality in <eqref|eq:single-tree:l-o-o:decomp> follows from
    <smart-ref|lem:wave-packet-decomposition>, as in the proof Proof of bound
    <smart-ref|eq:STE:o-l-l:tree>. We postpone the proof of the first
    inequality of <eqref|eq:single-tree:l-o-o:decomp>, while us now show that
    each of the 8 terms in <RHS|<eqref|eq:single-tree:l-o-o:decomp>>
    contributes a quantity bounded by <math|><RHS|<eqref|eq:STE:l-o-o>>. We
    have\ 

    <\equation*>
      <ltae|<tformat|<cwith|1|1|1|1|cell-halign|l>|<cwith|2|3|1|1|cell-halign|l>|<cwith|2|2|1|1|cell-halign|c>|<table|<row|<cell|<big|int><rsub|\<Theta\>><around*|\||<math-up|M1><around*|(|\<theta\>|)><around*|[|\<phi\><rsub|1><rsup|>,\<phi\><rsub|2><rsup|>,\<phi\><rsub|3><rsup|>|]>|\|>\<mathd\>\<theta\>>>|<row|<cell|<space|1em><ltae|<tformat|<table|<row|<cell|\<lesssim\><tabular*|<tformat|<twith|table-valign|T>|<cwith|1|1|1|1|cell-halign|l>|<table|<row|<cell|<around*|<left|\<\|\|\>|2>|<wpD><rsub|\<zeta\>><around*|(|\<theta\><rsub|\<Gamma\><rsub|1>>|)>F<rsub|1><rsup|\<ast\>><around*|(|\<theta\>,\<zeta\>,\<sigma\>|)><around*|[|\<phi\><rsub|1>|]>|<right|\<\|\|\>|2>><rsub|L<rsup|u<rsub|1>><rsub|<frac|\<mathd\>\<zeta\>\<mathd\>\<theta\>|<around*|\||\<Theta\>|\|>>>L<rsup|\<infty\>><rsub|<frac|\<mathd\>\<sigma\>|\<sigma\>>>><around*|<left|\<\|\|\>|2>|<around*|(|<wpD><rsub|\<zeta\><rsub|>><around*|(|\<theta\><rsub|\<Gamma\><rsub|2>>|)>\<otimes\><wpD><rsub|\<zeta\><rsub|>><around*|(|\<theta\><rsub|\<Gamma\><rsub|3>>|)>|)>F<rsub|\<times\><rsup|>><rsup|\<ast\>><around*|(|\<theta\>,\<zeta\>,\<sigma\>|)><around|[|\<phi\><rsub|2>,\<phi\><rsub|3>|]>|<right|\<\|\|\>|2>><rsub|L<rsup|u<rsub|\<times\>>><rsub|<frac|\<mathd\>\<zeta\>\<mathd\>\<theta\>|<around*|\||\<Theta\>|\|>>>L<rsup|1><rsub|<frac|\<mathd\>\<sigma\>|\<sigma\>>>>>>>>><rsub|>>>|<row|<cell|\<lesssim\><around*|\<\|\|\>|F<rsub|1>|\<\|\|\>><rsub|\<Gamma\><rsub|1><rsup|\<ast\>><SL><rsub|\<Theta\><rsub|>><rsup|<around*|(|u<rsub|1>,\<infty\>|)>>\<Phi\><rsub|2<gr>><rsup|N-3><around*|(|T|)>><around*|\<\|\|\>|F<rsub|2>F<rsub|3>|\<\|\|\>><rsub|\<Gamma\><rsub|\<times\>><rsup|\<ast\>><SL><rsub|\<Theta\><rsub|>><rsup|<around*|(|u<rsub|\<times\>>,1|)>><around*|(|<wpD>\<otimes\><wpD>|)><rsub|2<gr>><rsup|N-3><around*|(|T|)>>,>>>>>>>>>>
    </equation*>

    <\equation*>
      <ltae|<tformat|<cwith|1|1|1|1|cell-halign|l>|<cwith|2|3|1|1|cell-halign|l>|<cwith|2|2|1|1|cell-halign|c>|<table|<row|<cell|<big|int><rsub|\<Theta\>><around*|\||<math-up|M2><rsub|<around*|(|<wpD><rsub|\<zeta\>>\<otimes\><Id>|)>><around*|(|\<theta\>|)><around*|[|\<phi\><rsub|1><rsup|>,\<phi\><rsub|2><rsup|>,\<phi\><rsub|3><rsup|>|]>|\|>\<mathd\>\<theta\>>>|<row|<cell|<space|1em><ltae|<tformat|<table|<row|<cell|\<lesssim\><tabular*|<tformat|<twith|table-valign|T>|<cwith|1|1|1|1|cell-halign|l>|<table|<row|<cell|\<beta\><around*|<left|\<\|\|\>|2>|<wpD><rsub|\<zeta\>><around*|(|\<theta\><rsub|\<Gamma\><rsub|1>>|)><rsub|><rsup|2>F<rsub|1><rsup|\<ast\>><around*|(|\<theta\>,\<zeta\>,\<sigma\>|)><around*|[|\<phi\><rsub|1>|]>|<right|\<\|\|\>|2>><rsub|L<rsup|u<rsub|1>><rsub|<frac|\<mathd\>\<zeta\>\<mathd\>\<theta\>|<around*|\||\<Theta\>|\|>>>L<rsup|2><rsub|<frac|\<mathd\>\<sigma\>|\<sigma\>>>><around*|<left|\<\|\|\>|2>|<around*|(|<wpD><rsub|\<zeta\><rsub|>><around*|(|\<theta\><rsub|\<Gamma\><rsub|2>>|)>\<otimes\><Id>|)>F<rsub|\<times\><rsup|>><rsup|\<ast\>><around*|(|\<theta\>,\<zeta\>,\<sigma\>|)><around|[|\<phi\><rsub|2>,\<phi\><rsub|3>|]>|<right|\<\|\|\>|2>><rsub|L<rsup|u<rsub|\<times\>>><rsub|<frac|\<mathd\>\<zeta\>\<mathd\>\<theta\>|<around*|\||\<Theta\>|\|>>>L<rsup|2><rsub|<frac|\<mathd\>\<sigma\>|\<sigma\>>>>>>>>><rsub|>>>|<row|<cell|\<lesssim\>\<beta\><around*|\<\|\|\>|F<rsub|1>|\<\|\|\>><rsub|\<Gamma\><rsub|1><rsup|\<ast\>><SL><rsub|\<Theta\><rsub|>><rsup|<around*|(|u<rsub|1>,2|)>><wpD><rsub|2<gr>><rsup|N-3><around*|(|T|)>><around*|\<\|\|\>|F<rsub|2>F<rsub|3>|\<\|\|\>><rsub|\<Gamma\><rsub|\<times\>><rsup|\<ast\>><SL><rsub|\<Theta\><rsub|>><rsup|<around*|(|u<rsub|\<times\>>,2|)>><around*|(|<wpD>\<otimes\><Id>|)><rsub|2<gr>><rsup|N-3><around*|(|T|)>>,>>>>>>>>>>
    </equation*>

    and, similarly,

    <\equation*>
      <big|int><rsub|\<Theta\>><around*|\||<math-up|M2><rsub|<around*|(|<Id>\<otimes\><wpD><rsub|\<zeta\>>|)>><around*|(|\<theta\>|)><around*|[|\<phi\><rsub|1><rsup|>,\<phi\><rsub|2><rsup|>,\<phi\><rsub|3><rsup|>|]>|\|>\<mathd\>\<theta\>\<lesssim\>\<beta\><around*|\<\|\|\>|F<rsub|1>|\<\|\|\>><rsub|\<Gamma\><rsub|1><rsup|\<ast\>><SL><rsub|\<Theta\><rsub|>><rsup|<around*|(|u<rsub|1>,2|)>><wpD><rsub|2<gr>><rsup|N-3><around*|(|T|)>><around*|\<\|\|\>|F<rsub|2>F<rsub|3>|\<\|\|\>><rsub|\<Gamma\><rsub|\<times\>><rsup|\<ast\>><SL><rsub|\<Theta\><rsub|>><rsup|<around*|(|u<rsub|\<times\>>,2|)>><around*|(|<Id>\<otimes\><wpD>|)><rsub|2<gr>><rsup|N-3><around*|(|T|)>>.
    </equation*>

    Bounding the boundary terms <math|<math-up|B1>>, <math|<math-up|B2>>, and
    <math|<math-up|B3>>, requires the use of defect sizes:

    <\equation*>
      <big|int><rsub|\<Theta\>><around*|\||<math-up|B1><around*|(|\<theta\>|)><around*|[|\<phi\><rsub|1><rsup|>,\<phi\><rsub|2><rsup|>,\<phi\><rsub|3><rsup|>|]>|\|>\<mathd\>\<theta\><ltae|<tformat|<cwith|2|2|1|1|cell-halign|l>|<table|<row|<cell|<ltae|<tformat|<table|<row|<cell|\<lesssim\><ltae|<tformat|<cwith|1|1|1|1|cell-halign|l>|<table|<row|<cell|<around*|\<\|\|\>|<big|int><rsub|\<rho\>><rsup|+\<infty\>><wpD><rsub|\<zeta\>><around*|(|\<theta\><rsub|\<Gamma\><rsub|1>>|)><rsub|>F<rsub|1><rsup|\<ast\>><around*|(|\<theta\>,\<zeta\>,\<sigma\>|)><around*|[|\<phi\><rsub|1>|]><frac|<dd>\<sigma\>|\<sigma\>>|\<\|\|\>><rsub|L<rsup|u<rsub|1>><rsub|<frac|\<mathd\>\<zeta\>\<mathd\>\<theta\>|<around*|\||\<Theta\>|\|>>>L<rsup|\<infty\>><rsub|<frac|\<mathd\>\<rho\>|\<rho\>>>>>>|<row|<cell|<space|1em>\<times\><around*|<left|\<\|\|\>|3>|<around*|(|<wpD><rsub|\<sigma\>><around*|(|\<theta\><rsub|\<Gamma\><rsub|2>>|)>\<otimes\><Id>+<Id>\<otimes\><wpD><rsub|\<sigma\><rsub|>><around*|(|\<theta\><rsub|\<Gamma\><rsub|3>>|)>-\<rho\>\<mathd\><rsub|\<rho\>>|)>F<rsub|\<times\><rsup|>><rsup|\<ast\>><around*|(|\<theta\>,\<zeta\>,\<rho\>|)><around|[|\<phi\><rsub|2>,\<phi\><rsub|3>|]>|<right|\<\|\|\>|3>><rsub|L<rsup|u<rsub|\<times\>>><rsub|<frac|\<mathd\>\<zeta\>\<mathd\>\<theta\>|<around*|\||\<Theta\>|\|>>>L<rsup|1><rsub|<frac|\<mathd\>\<rho\>|\<rho\>>>>>>>>>>>|<row|<cell|\<lesssim\><around*|\<\|\|\>|F<rsub|1>|\<\|\|\>><rsub|\<Gamma\><rsub|1><rsup|\<ast\>><SJ><rsup|<around*|(|u<rsub|1>,\<infty\>|)>><rsub|\<Theta\>>\<Phi\><rsub|<gr>><rsup|N><around*|(|T|)>><around*|\<\|\|\>|F<rsub|2>F<rsub|3>|\<\|\|\>><rsub|\<Gamma\><rsub|\<times\>><rsup|\<ast\>><SL><rsub|\<Theta\><rsub|>><rsup|<around*|(|u<rsub|\<times\>>,1|)>><dfct><rsub|<gr>><rsup|N<rsup|>><around*|(|T|)>>,>>>>>>>>>>
    </equation*>

    and

    <\equation*>
      <big|int><rsub|\<Theta\>><around*|<left|\||2>|<math-up|B2><rsub|<around*|(|<wpD><rsub|\<zeta\><rsub|2>>\<otimes\><Id>|)>><around*|[|\<phi\><rsub|1><rsup|>,\<phi\><rsub|2><rsup|>,\<phi\><rsub|3><rsup|>|]>|<right|\||2>>\<mathd\>\<theta\><ltae|<tformat|<table|<row|<cell|\<lesssim\><ltae|<tformat|<cwith|1|1|1|1|cell-halign|l>|<table|<row|<cell|<around*|\<\|\|\>|<wpD><rsub|\<zeta\>><around*|(|\<theta\>|)><rsub|>F<rsub|1><rsup|\<ast\>><around*|(|\<theta\>,\<zeta\>,\<sigma\>|)><around*|[|\<phi\><rsub|1>|]><frac|<dd>\<sigma\>|\<sigma\>>|\<\|\|\>><rsub|L<rsup|u<rsub|1>><rsub|<frac|\<mathd\>\<zeta\>\<mathd\>\<theta\>|<around*|\||\<Theta\>|\|>>>L<rsup|2><rsub|<frac|\<mathd\>\<sigma\>|\<sigma\>>>>>>|<row|<cell|<space|1em>\<times\><ltae|<tformat|<cwith|1|1|1|1|cell-halign|l>|<table|<row|<cell|<around*|<left|\<\|\|\>|3>|<around*|(|<wpD><rsub|\<zeta\>><around*|(|\<theta\><rsub|\<Gamma\><rsub|2>>|)>\<otimes\><Id>+<Id>\<otimes\><wpD><rsub|\<zeta\><rsub|>><around*|(|\<theta\><rsub|\<Gamma\><rsub|3>>|)>-\<beta\>\<rho\>\<mathd\><rsub|\<zeta\>>|)>|<right|\<nobracket\>|3>>>>|<row|<cell|<space|1em><around*|<left|.>|<around*|(|<wpD><rsub|\<zeta\>><around*|(|\<theta\><rsub|\<Gamma\><rsub|2>>|)>\<otimes\><Id>|)>F<rsub|\<times\><rsup|>><rsup|\<ast\>><around*|(|\<theta\>,\<zeta\>,\<rho\>|)><around|[|\<phi\><rsub|2>,\<phi\><rsub|3>|]>|<right|\<\|\|\>|3>><rsub|L<rsup|u<rsub|\<times\>>><rsub|<frac|\<mathd\>\<zeta\>\<mathd\>\<theta\>|<around*|\||\<Theta\>|\|>>>L<rsup|1><rsub|<frac|\<mathd\>\<rho\>|\<rho\>>>>>>>>>>>>>>>>|<row|<cell|\<lesssim\><around*|\<\|\|\>|F<rsub|1>|\<\|\|\>><rsub|<SL><rsup|<around*|(|u<rsub|1>,2|)>><rsub|\<Theta\>><wpD><rsub|<gr>><rsup|N><around*|(|T|)>><around*|\<\|\|\>|F<rsub|2>F<rsub|3>|\<\|\|\>><rsub|\<Gamma\><rsub|\<times\>><rsup|\<ast\>><SL><rsub|<around*|(|\<Theta\><rsub|>,\<Theta\><rsup|in>|)>><rsup|<around*|(|u<rsub|\<times\>>,1|)>><dfct><rsub|<gr>><rsup|N<rsup|>><around*|(|T|)>>.>>>>><rsub|>
    </equation*>

    <tmtodo|Continue checking from here>Similarly

    <\equation*>
      <big|int><rsub|\<Theta\>><around*|<left|\||2>|<math-up|B2><rsub|<around*|(|<wpD><rsub|\<zeta\><rsub|2>>\<otimes\><Id>|)>><around*|[|\<phi\><rsub|1><rsup|>,\<phi\><rsub|2><rsup|>,\<phi\><rsub|3><rsup|>|]>|<right|\||2>>\<mathd\>\<theta\>\<lesssim\><around*|\<\|\|\>|F<rsub|1>|\<\|\|\>><rsub|<SL><rsup|<around*|(|u<rsub|1>,2|)>><rsub|\<Theta\>><wpD><rsub|<gr>><rsup|N><rprime|'><around*|(|T|)>><around*|\<\|\|\>|F<rsub|2>F<rsub|3>|\<\|\|\>><rsub|\<Gamma\><rsub|\<times\>><rsup|\<ast\>><SL><rsub|<around*|(|\<Theta\><rsub|>,\<Theta\><rsup|in>|)><rsub|>><rsup|<around*|(|u<rsub|\<times\>>,1|)>><dfct><rsub|<gr>><rsup|N<rsup|>><around*|(|T|)>>,
    </equation*>

    <\equation*>
      <big|int><rsub|\<Theta\>><around*|<left|\||2>|<math-up|B3><rsub|<around*|(|<wpD><rsub|\<zeta\><rsub|2>>\<otimes\><Id>|)>><around*|[|\<phi\><rsub|1><rsup|>,\<phi\><rsub|2><rsup|>,\<phi\><rsub|3><rsup|>|]>|<right|\||2>>\<mathd\>\<theta\><ltae|<tformat|<cwith|2|2|1|1|cell-halign|l>|<table|<row|<cell|\<lesssim\>\<beta\><ltae|<tformat|<cwith|1|1|1|1|cell-halign|l>|<table|<row|<cell|<around*|\<\|\|\>|<around*|(|<wpD><rsub|\<zeta\>><around*|(|\<theta\>|)>-\<sigma\>d<rsub|\<zeta\>>|)><rsub|>F<rsub|1><rsup|\<ast\>><around*|(|\<theta\>,\<zeta\>,\<sigma\>|)><around*|[|\<phi\><rsub|1>|]><frac|<dd>\<sigma\>|\<sigma\>>|\<\|\|\>><rsub|L<rsup|u<rsub|1>><rsub|<frac|\<mathd\>\<zeta\>\<mathd\>\<theta\>|<around*|\||\<Theta\>|\|>>>L<rsup|1><rsub|<frac|\<mathd\>\<sigma\>|\<sigma\>>>>>>|<row|<cell|<space|1em>\<times\><around*|<left|\<\|\|\>|2>|<around*|(|<wpD><rsub|\<zeta\>><around*|(|\<theta\><rsub|\<Gamma\><rsub|2>>|)>\<otimes\><Id>|)>F<rsub|\<times\><rsup|>><rsup|\<ast\>><around*|(|\<theta\>,\<zeta\>,\<rho\>|)><around|[|\<phi\><rsub|2>,\<phi\><rsub|3>|]>|<right|\<\|\|\>|2>><rsub|L<rsup|u<rsub|\<times\>>><rsub|<frac|\<mathd\>\<zeta\>\<mathd\>\<theta\>|<around*|\||\<Theta\>|\|>>>L<rsup|2><rsub|<frac|\<mathd\>\<rho\>|\<rho\>>>>>>>>>>>|<row|<cell|\<lesssim\>\<beta\><around*|\<\|\|\>|F<rsub|1>|\<\|\|\>><rsub|<SL><rsup|<around*|(|u<rsub|1>,1|)>><rsub|\<Theta\>><dfct><rsub|<gr>><rsup|N<rsup|>><around*|(|T|)>><around*|\<\|\|\>|F<rsub|2>F<rsub|3>|\<\|\|\>><rsub|\<Gamma\><rsub|\<times\>><rsup|\<ast\>><SL><rsub|\<Theta\><rsub|>><rsup|<around*|(|u<rsub|\<times\>>,1|)>><around*|(|<wpD>\<otimes\><Id>|)><rsub|><rsub|<gr>><rsup|N<rsup|>><around*|(|T|)>>,>>>>><rsub|>
    </equation*>

    and\ 

    <\equation*>
      <ltae|<tformat|<table|<row|<cell|<big|int><rsub|\<Theta\>><around*|<left|\||2>|<math-up|B3><rsub|<around*|(|<Id>\<otimes\><wpD><rsub|\<zeta\><rsub|3>>|)>><around*|[|\<phi\><rsub|1><rsup|>,\<phi\><rsub|2><rsup|>,\<phi\><rsub|3><rsup|>|]>|<right|\||2>>\<mathd\>\<theta\><ltae|<tformat|<table|<row|<cell|\<lesssim\>\<beta\><ltae|<tformat|<cwith|1|1|1|1|cell-halign|l>|<table|<row|<cell|<around*|\<\|\|\>|<around*|(|<wpD><rsub|\<zeta\>><around*|(|\<theta\>|)>-\<sigma\>d<rsub|\<zeta\>>|)><rsub|>F<rsub|1><rsup|\<ast\>><around*|(|\<theta\>,\<zeta\>,\<sigma\>|)><around*|[|\<phi\><rsub|1>|]><frac|<dd>\<sigma\>|\<sigma\>>|\<\|\|\>><rsub|L<rsup|u<rsub|1>><rsub|<frac|\<mathd\>\<zeta\>\<mathd\>\<theta\>|<around*|\||\<Theta\>|\|>>>L<rsup|1><rsub|<frac|\<mathd\>\<sigma\>|\<sigma\>>>>>>|<row|<cell|<space|1em>\<times\><around*|<left|\<\|\|\>|2>|<around*|(|<Id>\<otimes\><wpD><rsub|\<zeta\><rsub|>><around*|(|\<theta\><rsub|\<Gamma\><rsub|3>>|)>|)>F<rsub|\<times\><rsup|>><rsup|\<ast\>><around*|(|\<theta\>,\<zeta\>,\<rho\>|)><around|[|\<phi\><rsub|2>,\<phi\><rsub|3>|]>|<right|\<\|\|\>|2>><rsub|L<rsup|u<rsub|\<times\>>><rsub|<frac|\<mathd\>\<zeta\>\<mathd\>\<theta\>|<around*|\||\<Theta\>|\|>>>L<rsup|2><rsub|<frac|\<mathd\>\<rho\>|\<rho\>>>>>>>>>>>|<row|<cell|\<lesssim\>\<beta\><around*|\<\|\|\>|F<rsub|1>|\<\|\|\>><rsub|<SL><rsup|<around*|(|u<rsub|1>,1|)>><rsub|\<Theta\>><dfct><rsub|<gr>><rsup|N<rsup|>><around*|(|T|)>><around*|\<\|\|\>|F<rsub|2>F<rsub|3>|\<\|\|\>><rsub|\<Gamma\><rsub|\<times\>><rsup|\<ast\>><SL><rsub|\<Theta\><rsub|>><rsup|<around*|(|u<rsub|\<times\>>,1|)>><around*|(|<Id>\<otimes\><wpD>|)><rsub|><rsub|<gr>><rsup|N<rsup|>><around*|(|T|)>>.>>>>>>>>>><tabular|<tformat|<cwith|1|2|1|1|cell-halign|l>|<cwith|1|1|1|1|cell-halign|c>|<table|<row|<cell|<rsub|>>>>>>
    </equation*>

    \;

    We conclude the proof by showing that <eqref|eq:single-tree:l-o-o:decomp>
    holds. Our manipulations rely on \ using the fundamental theorem of
    calculus in the scale parameter on the product
    <math|F<rsub|2><rsup|\<ast\>>F<rsub|3><rsup|\<ast\>>>. To exploit certain
    cancellations we need to integrate by parts in the spatial variable.
    Every integration causes \Pdefect\Q terms to appear that have to be
    accounted for; they are grouped into the terms
    <math|<math-up|B1>-<math-up|B3>>.

    In what follows we drop <math|\<theta\>> from the notation and keep the
    dependence on this variable implicit: we write
    <math|<wpD><rsub|\<zeta\><rsub|j>>> in place of
    <math|<wpD><rsub|\<zeta\>><around*|(|\<theta\><rsub|\<Gamma\><rsub|j>>|)>>,
    <math|<wpD><rsub|\<sigma\><rsub|j>>> in place of
    <math|<wpD><rsub|\<sigma\>><around*|(|\<theta\><rsub|\<Gamma\><rsub|j>>|)>>,
    <math|<wide|\<phi\>|~><rsub|j><rsup|l/o>> in place of
    <math|<wide|\<phi\>|~><rsub|j,\<theta\>><rsup|l/o>>, and so on. For
    conciseness, we also write <math|F<rsub|\<times\><rsup|>><rsup|\<ast\>><around*|(|\<zeta\>,\<rho\>|)>>
    for <math|F<rsup|\<ast\>><rsub|2><around|(|\<zeta\>,\<rho\>|)>F<rsup|\<ast\>><rsub|3><around|(|\<zeta\>,\<rho\>|)>>.
    It holds that (using \ the convention of keeping <math|\<theta\>>
    implicit)

    <\equation>
      <label|eq:scale-derivative-gain-of-cancellation:prod><ltae|<tformat|<twith|table-valign|T>|<cwith|1|-1|1|1|cell-halign|l>|<twith|table-hmode|auto>|<cwith|3|3|1|1|cell-halign|l>|<table|<row|<cell|\<rho\>\<mathd\><rsub|\<rho\>><around*|(|F<rsup|\<ast\>><rsub|2><around|(|\<zeta\>,\<rho\>|)><around|[|\<phi\><rsub|2><rsup|o>|]>F<rsup|\<ast\>><rsub|3><around|(|\<zeta\>,\<rho\>|)><around|[|\<phi\><rsub|3><rsup|o>|]>|)>=\<rho\>\<mathd\><rsub|\<rho\>>F<rsub|\<times\><rsup|>><rsup|\<ast\>><around*|(|\<zeta\>,\<rho\>|)><around*|[|\<phi\><rsub|2><rsup|o>,\<phi\><rsub|3><rsup|o>|]>>>|<row|<cell|<space|1em><ltae|<tformat|<cwith|2|4|1|1|cell-halign|l>|<cwith|4|4|1|1|cell-halign|l>|<table|<row|<cell|=<ltae|<tformat|<cwith|1|2|1|1|cell-halign|l>|<table|<row|<cell|+<around*|(|<wpD><rsub|\<sigma\><rsub|2>>\<otimes\><Id>+<Id>\<otimes\><wpD><rsub|\<sigma\><rsub|3>>|)>F<rsub|\<times\><rsup|>><rsup|\<ast\>><around*|(|\<zeta\>,\<rho\>|)><around*|[|\<phi\><rsub|2><rsup|o>,\<phi\><rsub|3><rsup|o>|]>>>|<row|<cell|-<around*|(|<wpD><rsub|\<sigma\><rsub|2>>\<otimes\><Id>+<Id>\<otimes\><wpD><rsub|\<sigma\><rsub|3>>-\<rho\>\<mathd\><rsub|\<rho\>>|)>F<rsub|\<times\><rsup|>><rsup|\<ast\>><around*|(|\<zeta\>,\<rho\>|)><around*|[|\<phi\><rsub|2><rsup|o>,\<phi\><rsub|3><rsup|o>|]>>>>>>>>|<row|<cell|=<ltae|<tformat|<cwith|1|2|1|1|cell-halign|l>|<table|<row|<cell|+<around*|(|<wpD><rsub|\<zeta\><rsub|2>>\<otimes\><Id>|)><rsup|2>F<rsub|\<times\><rsup|>><rsup|\<ast\>><around*|(|\<zeta\>,\<rho\>|)><around|[|<wide|\<phi\>|~><rsub|2><rsup|o>,\<phi\><rsub|3><rsup|o>|]>+<around*|(|<Id>\<otimes\><wpD><rsub|\<zeta\><rsub|3>>|)><rsup|2>F<rsub|\<times\><rsup|>><rsup|\<ast\>><around*|(|\<zeta\>,\<rho\>|)><around|[|\<phi\><rsub|2><rsup|o>,<wide|\<phi\>|~><rsub|3><rsup|o>|]>>>|<row|<cell|-<around*|(|<wpD><rsub|\<sigma\><rsub|2>>\<otimes\><Id>+<Id>\<otimes\><wpD><rsub|\<sigma\><rsub|3>>-\<rho\>\<mathd\><rsub|\<rho\>>|)>F<rsub|\<times\><rsup|>><rsup|\<ast\>><around*|(|\<zeta\>,\<rho\>|)><around*|[|\<phi\><rsub|2><rsup|o>,\<phi\><rsub|3><rsup|o>|]>>>>>>>>|<row|<cell|=<ltae|<tformat|<cwith|1|4|1|1|cell-halign|l>|<cwith|1|4|1|1|cell-halign|l>|<table|<row|<cell|+<around*|(|<wpD><rsub|\<zeta\><rsub|2>>\<otimes\><Id>+<Id>\<otimes\><wpD><rsub|\<zeta\><rsub|3>>|)><around*|(|<wpD><rsub|\<zeta\><rsub|2>>\<otimes\><Id>|)><rsup|>F<rsub|\<times\><rsup|>><rsup|\<ast\>><around*|(|\<zeta\>,\<rho\>|)><around|[|<wide|\<phi\>|~><rsub|2><rsup|o>,\<phi\><rsub|3><rsup|o>|]>>>|<row|<cell|+<around*|(|<wpD><rsub|\<zeta\><rsub|2>>\<otimes\><Id>+<Id>\<otimes\><wpD><rsub|\<zeta\><rsub|3>>|)><around*|(|<Id>\<otimes\><wpD><rsub|\<zeta\><rsub|3>>|)>F<rsup|\<ast\>><rsub|\<times\>><around|(|\<zeta\>,\<rho\>|)><around|[|\<phi\><rsub|2><rsup|o>,<wide|\<phi\>|~><rsub|3><rsup|o>|]>>>|<row|<cell|-<around*|(|<wpD><rsub|\<zeta\><rsub|2>>\<otimes\><wpD><rsub|\<zeta\><rsub|3>>|)>F<rsub|\<times\><rsup|>><rsup|\<ast\>><around*|(|\<zeta\>,\<rho\>|)><around|[|<wide|\<phi\>|~><rsub|2><rsup|o>,\<phi\><rsub|3><rsup|o>|]>-<around*|(|<wpD><rsub|\<zeta\><rsub|2>>\<otimes\><wpD><rsub|\<zeta\><rsub|3>>|)><rsup|>F<rsub|\<times\><rsup|>><rsup|\<ast\>><around*|(|\<zeta\>,\<rho\>|)><around|[|\<phi\><rsub|2><rsup|o>,<wide|\<phi\>|~><rsub|3><rsup|o>|]>>>|<row|<cell|-<around*|(|<wpD><rsub|\<sigma\><rsub|2>>\<otimes\><Id>+<Id>\<otimes\><wpD><rsub|\<sigma\><rsub|3>>-\<rho\>\<mathd\><rsub|\<rho\>>|)>F<rsub|\<times\><rsup|>><rsup|\<ast\>><around*|(|\<zeta\>,\<rho\>|)><around*|[|\<phi\><rsub|2><rsup|o>,\<phi\><rsub|3><rsup|o>|]>>>>>>>>|<row|<cell|=<ltae|<tformat|<cwith|1|6|1|1|cell-halign|l>|<cwith|1|6|1|1|cell-halign|l>|<cwith|3|6|1|1|cell-halign|l>|<cwith|3|6|1|1|cell-halign|l>|<table|<row|<cell|+\<beta\>\<rho\>d<rsub|\<zeta\>><around*|(|<wpD><rsub|\<zeta\><rsub|2>>\<otimes\><Id>|)><rsup|>F<rsub|\<times\><rsup|>><rsup|\<ast\>><around*|(|\<zeta\>,\<rho\>|)><around|[|<wide|\<phi\>|~><rsub|2><rsup|o>,\<phi\><rsub|3><rsup|o>|]>>>|<row|<cell|+\<beta\>\<rho\>d<rsub|\<zeta\>><around*|(|<Id>\<otimes\><wpD><rsub|\<zeta\><rsub|3>>|)>F<rsub|\<times\><rsup|>><rsup|\<ast\>><around*|(|\<zeta\>,\<rho\>|)><around|[|\<phi\><rsub|2><rsup|o>,<wide|\<phi\>|~><rsub|3><rsup|o>|]>>>|<row|<cell|+<around*|(|<wpD><rsub|\<zeta\><rsub|2>>\<otimes\><Id>+<Id>\<otimes\><wpD><rsub|\<zeta\><rsub|3>>-\<beta\>\<rho\>d<rsub|\<zeta\>>|)><around*|(|<wpD><rsub|\<zeta\><rsub|2>>\<otimes\><Id>|)><rsup|>F<rsub|\<times\><rsup|>><rsup|\<ast\>><around*|(|\<zeta\>,\<rho\>|)><around|[|<wide|\<phi\>|~><rsub|2><rsup|o>,\<phi\><rsub|3><rsup|o>|]>>>|<row|<cell|+<around*|(|<wpD><rsub|\<zeta\><rsub|2>>\<otimes\><Id>+<Id>\<otimes\><wpD><rsub|\<zeta\><rsub|3>>-\<beta\>\<rho\>d<rsub|\<zeta\>>|)><around*|(|<Id>\<otimes\><wpD><rsub|\<zeta\><rsub|3>>|)>F<rsup|\<ast\>><rsub|\<times\>><around|(|\<zeta\>,\<rho\>|)><around|[|\<phi\><rsub|2><rsup|o>,<wide|\<phi\>|~><rsub|3><rsup|o>|]>>>|<row|<cell|-<around*|(|<wpD><rsub|\<zeta\><rsub|2>>\<otimes\><wpD><rsub|\<zeta\><rsub|3>>|)>F<rsub|\<times\><rsup|>><rsup|\<ast\>><around*|(|\<zeta\>,\<rho\>|)><around|[|<wide|\<phi\>|~><rsub|2><rsup|o>,\<phi\><rsub|3><rsup|o>|]>-<around*|(|<wpD><rsub|\<zeta\><rsub|2>>\<otimes\><wpD><rsub|\<zeta\><rsub|3>>|)><rsup|>F<rsub|\<times\><rsup|>><rsup|\<ast\>><around*|(|\<zeta\>,\<rho\>|)><around|[|\<phi\><rsub|2><rsup|o>,<wide|\<phi\>|~><rsub|3><rsup|o>|]>>>|<row|<cell|-<around*|(|<wpD><rsub|\<sigma\><rsub|2>>\<otimes\><Id>+<Id>\<otimes\><wpD><rsub|\<sigma\><rsub|3>>-\<rho\>\<mathd\><rsub|\<rho\>>|)>F<rsub|\<times\><rsup|>><rsup|\<ast\>><around*|(|\<zeta\>,\<rho\>|)><around*|[|\<phi\><rsub|2><rsup|o>,\<phi\><rsub|3><rsup|o>|]>.>>>>>>>>>>>>>>>
    </equation>

    We now concentrate on the inner <math|<R><rsup|2><rsub|+>> integral in
    <math|<LHS|<eqref|eq:single-tree:l-o-o:decomp>>>. Applying the
    fundamental theorem Differentiating and integrating back in scale the
    term <math|F<rsup|\<ast\>><rsub|3><around|(|\<zeta\>,\<sigma\>|)><around|[|\<phi\><rsub|3><rsup|o>|]>>
    in the first summand gives and using identity
    <eqref|eq:scale-derivative-gain-of-cancellation:prod> we get

    <\equation*>
      <ltae|<tformat|<cwith|1|1|1|1|cell-halign|l>|<cwith|2|2|1|1|cell-halign|l>|<table|<row|<cell|<big|int><rsub|<R><rsup|2><rsub|+>><wpD><rsub|\<zeta\>>F<rsub|1><rsup|\<ast\>><around*|(|\<zeta\>,\<sigma\>|)><around*|[|<wide|\<phi\>|~><rsub|1><rsup|l>|]>F<rsub|2><rsup|\<ast\>><around*|(|\<zeta\>,\<sigma\>|)><around*|[|\<phi\><rsub|2><rsup|o>|]>F<rsub|3><rsup|\<ast\>><around*|(|\<zeta\>,\<sigma\>|)><around*|[|\<phi\><rsub|3><rsup|o>|]><dd>\<zeta\><frac|<dd>\<sigma\>|\<sigma\>>>>|<row|<cell|<space|1em><ltae|<tformat|<table|<row|<cell|=<big|int><rsub|<R><rsup|2><rsub|+>><wpD><rsub|\<zeta\>>F<rsub|1><rsup|\<ast\>><around*|(|\<zeta\>,\<sigma\>|)><around*|[|<wide|\<phi\>|~><rsub|1><rsup|l>|]><big|int><rsub|0><rsup|\<sigma\>>\<rho\>\<mathd\><rsub|\<rho\>>F<rsub|\<times\><rsup|>><rsup|\<ast\>><around*|(|\<zeta\>,\<rho\>|)><around*|[|\<phi\><rsub|2><rsup|o>,\<phi\><rsub|3><rsup|o>|]><frac|\<mathd\>\<rho\>|\<rho\>>\<mathd\>\<zeta\><frac|\<mathd\>\<sigma\>|\<sigma\>>>>|<row|<cell|=<ltae|<tformat|<cwith|3|3|1|1|cell-halign|l>|<cwith|4|4|1|1|cell-halign|l>|<table|<row|<cell|<big|int><rsub|<R><rsup|2><rsub|+>><wpD><rsub|\<zeta\>>F<rsub|1><rsup|\<ast\>><around*|(|\<zeta\>,\<sigma\>|)><around*|[|<wide|\<phi\>|~><rsub|1><rsup|l>|]><big|int><rsub|0><rsup|\<sigma\>>\<beta\>\<rho\>d<rsub|\<zeta\>><around*|(|<wpD><rsub|\<zeta\><rsub|2>>\<otimes\><Id>|)><rsup|>F<rsub|\<times\><rsup|>><rsup|\<ast\>><around*|(|\<zeta\>,\<rho\>|)><around|[|<wide|\<phi\>|~><rsub|2><rsup|o>,\<phi\><rsub|3><rsup|o>|]><frac|\<mathd\>\<rho\>|\<rho\>>\<mathd\>\<zeta\><frac|\<mathd\>\<sigma\>|\<sigma\>>>>|<row|<cell|+<big|int><rsub|<R><rsup|2><rsub|+>><wpD><rsub|\<zeta\>>F<rsub|1><rsup|\<ast\>><around*|(|\<zeta\>,\<sigma\>|)><around*|[|<wide|\<phi\>|~><rsub|1><rsup|l>|]><big|int><rsub|0><rsup|\<sigma\>>\<beta\>\<rho\>d<rsub|\<zeta\>><rsup|><around*|(|<Id>\<otimes\><wpD><rsub|\<zeta\><rsub|3>>|)>F<rsub|\<times\><rsup|>><rsup|\<ast\>><around*|(|\<zeta\>,\<rho\>|)><around|[|\<phi\><rsub|2><rsup|o>,<wide|\<phi\>|~><rsub|3><rsup|o>|]><frac|\<mathd\>\<rho\>|\<rho\>>\<mathd\>\<zeta\><frac|\<mathd\>\<sigma\>|\<sigma\>>>>|<row|<cell|-<math-up|B1><around*|[|<wide|\<phi\>|~><rsub|1><rsup|l>,\<phi\><rsub|2><rsup|o>,\<phi\><rsub|3><rsup|o>|]>-<math-up|M1><around|[|<wide|\<phi\>|~><rsub|1><rsup|l>,<wide|\<phi\>|~><rsub|2><rsup|o>,\<phi\><rsub|3><rsup|o>|]>-<math-up|M1><around|[|<wide|\<phi\>|~><rsub|1><rsup|l>,\<phi\><rsub|2><rsup|o>,<wide|\<phi\>|~><rsub|3><rsup|o>|]>>>|<row|<cell|+<math-up|B2><rsub|<around*|(|<wpD><rsub|\<zeta\><rsub|>>\<otimes\><Id>|)>><around|[|<wide|\<phi\>|~><rsub|1><rsup|l>,<wide|\<phi\>|~><rsub|2><rsup|o>,\<phi\><rsub|3><rsup|o>|]>+<math-up|B2><rsub|<around*|(|<Id>\<otimes\><wpD><rsub|\<zeta\><rsub|>>|)>><around|[|<wide|\<phi\>|~><rsub|1><rsup|l>,\<phi\><rsub|2><rsup|o>,<wide|\<phi\>|~><rsub|3><rsup|o>|]>.>>>>>>>>>>>>>>>
    </equation*>

    Integrating the first two summands on the <math|<RHS|>> by parts in
    <math|\<zeta\>> gives

    <\equation*>
      <ltae|<tformat|<cwith|1|1|1|1|cell-halign|l>|<cwith|2|2|1|1|cell-halign|l>|<table|<row|<cell|<big|int><rsub|<R><rsup|2><rsub|+>><wpD><rsub|\<zeta\>>F<rsub|1><rsup|\<ast\>><around*|(|\<zeta\>,\<sigma\>|)><around*|[|<wide|\<phi\>|~><rsub|1><rsup|l>|]><big|int><rsub|0><rsup|\<sigma\>>\<beta\>\<rho\>d<rsub|\<zeta\>><around*|(|<wpD><rsub|\<zeta\><rsub|2>>\<otimes\><Id>|)><rsup|>F<rsub|\<times\><rsup|>><rsup|\<ast\>><around*|(|\<zeta\>,\<rho\>|)><around|[|<wide|\<phi\>|~><rsub|2><rsup|o>,\<phi\><rsub|3><rsup|o>|]><frac|\<mathd\>\<rho\>|\<rho\>>\<mathd\>\<zeta\><frac|\<mathd\>\<sigma\>|\<sigma\>>>>|<row|<cell|<space|1em><ltae|<tformat|<cwith|2|2|1|1|cell-halign|l>|<table|<row|<cell|=-\<beta\><big|int><rsub|<R><rsup|2><rsub|+>>\<sigma\>d<rsub|\<zeta\>><wpD><rsub|\<zeta\>>F<rsub|1><rsup|\<ast\>><around*|(|\<zeta\>,\<sigma\>|)><around*|[|<wide|\<phi\>|~><rsub|1><rsup|l>|]><big|int><rsub|0><rsup|\<sigma\>><frac|\<rho\>|\<sigma\>><around*|(|<wpD><rsub|\<zeta\><rsub|2>>\<otimes\><Id>|)><rsup|>F<rsub|\<times\><rsup|>><rsup|\<ast\>><around*|(|\<zeta\>,\<rho\>|)><around|[|<wide|\<phi\>|~><rsub|2><rsup|o>,\<phi\><rsub|3><rsup|o>|]><frac|\<mathd\>\<rho\>|\<rho\>>\<mathd\>\<zeta\><frac|\<mathd\>\<sigma\>|\<sigma\>>>>|<row|<cell|=<ltae|<tformat|<table|<row|<cell|-\<beta\><big|int><rsub|<R><rsup|2><rsub|+>><wpD><rsub|\<zeta\>><rsup|2>F<rsub|1><rsup|\<ast\>><around*|(|\<zeta\>,\<sigma\>|)><around*|[|<wide|\<phi\>|~><rsub|1><rsup|l>|]><big|int><rsub|0><rsup|\<sigma\>><frac|\<rho\>|\<sigma\>><around*|(|<wpD><rsub|\<zeta\><rsub|2>>\<otimes\><Id>|)><rsup|>F<rsub|\<times\><rsup|>><rsup|\<ast\>><around*|(|\<zeta\>,\<rho\>|)><around|[|<wide|\<phi\>|~><rsub|2><rsup|o>,\<phi\><rsub|3><rsup|o>|]><frac|\<mathd\>\<rho\>|\<rho\>>\<mathd\>\<zeta\><frac|\<mathd\>\<sigma\>|\<sigma\>>>>|<row|<cell|+\<beta\><big|int><rsub|<R><rsup|2><rsub|+>><around*|(|<wpD><rsub|\<zeta\>>-\<sigma\>d<rsub|\<zeta\>>|)><wpD><rsub|\<zeta\>>F<rsub|1><rsup|\<ast\>><around*|(|\<zeta\>,\<sigma\>|)><around*|[|<wide|\<phi\>|~><rsub|1><rsup|l>|]><big|int><rsub|0><rsup|\<sigma\>><frac|\<rho\>|\<sigma\>><around*|(|<wpD><rsub|\<zeta\><rsub|2>>\<otimes\><Id>|)><rsup|>F<rsub|\<times\><rsup|>><rsup|\<ast\>><around*|(|\<zeta\>,\<rho\>|)><around|[|<wide|\<phi\>|~><rsub|2><rsup|o>,\<phi\><rsub|3><rsup|o>|]><frac|\<mathd\>\<rho\>|\<rho\>>\<mathd\>\<zeta\><frac|\<mathd\>\<sigma\>|\<sigma\>>>>>>>>>|<row|<cell|=-<math-up|M2><rsub|<around*|(|<wpD><rsub|\<zeta\><rsub|2>>\<otimes\><Id>|)>><around*|[|<wide|\<phi\>|~><rsub|1><rsup|l>,<wide|\<phi\>|~><rsub|2><rsup|o>,\<phi\><rsub|3><rsup|o>|]>+<math-up|B3><rsub|<around*|(|<wpD><rsub|\<zeta\><rsub|2>>\<otimes\><Id>|)><rsup|>><around*|[|<wide|\<phi\>|~><rsub|1><rsup|l>,<wide|\<phi\>|~><rsub|2><rsup|o>,\<phi\><rsub|3><rsup|o>|]>>>>>>>>>>>
    </equation*>

    and

    <\equation*>
      <ltae|<tformat|<table|<row|<cell|<big|int><rsub|<R><rsup|2><rsub|+>><wpD><rsub|\<zeta\>>F<rsub|1><rsup|\<ast\>><around*|(|\<zeta\>,\<sigma\>|)><around*|[|<wide|\<phi\>|~><rsub|1><rsup|l>|]><big|int><rsub|0><rsup|\<sigma\>>\<beta\>\<rho\>d<rsub|\<zeta\>><around*|(|<wpD><rsub|\<zeta\><rsub|2>>\<otimes\><Id>|)><rsup|>F<rsub|\<times\><rsup|>><rsup|\<ast\>><around*|(|\<zeta\>,\<rho\>|)><around|[|<wide|\<phi\>|~><rsub|2><rsup|o>,\<phi\><rsub|3><rsup|o>|]><frac|\<mathd\>\<rho\>|\<rho\>>\<mathd\>\<zeta\><frac|\<mathd\>\<sigma\>|\<sigma\>>>>|<row|<cell|<space|1em>=-<math-up|M2><rsub|<around*|(|<Id>\<otimes\><wpD><rsub|\<zeta\><rsub|>>|)>><around*|[|<wide|\<phi\>|~><rsub|1><rsup|l>,\<phi\><rsub|2><rsup|o>,<wide|\<phi\>|~><rsub|3><rsup|o>|]>+<math-up|B3><rsub|<around*|(|<Id>\<otimes\><wpD><rsub|\<zeta\><rsub|>>|)><rsup|>><around*|[|<wide|\<phi\>|~><rsub|1><rsup|l>,\<phi\><rsub|2><rsup|o>,<wide|\<phi\>|~><rsub|3><rsup|o>|]>.>>>>>
    </equation*>

    This concludes the proof of the decomposition
    <eqref|eq:single-tree:l-o-o:decomp>.
  </render-proof>

  <section|Forest estimates<label|sec:forest>>

  In this section we prove bounds <smart-ref|eq:RN-domination-BHT>,
  <eqref|eq:iterated-Holder-type-bounds:linear>, and
  <eqref|eq:iterated-Holder-type-bounds:bilinear>. These bounds are proven
  for general functions <math|F<rsub|j>\<in\>L<rsup|\<infty\>><around*|(|<R><rsup|3><rsub|+>|)>\<otimes\>\<Phi\><rsup|\<infty\>><rsub|<gr>>>
  in place of <math|<Emb><around*|[|f<rsub|j>|]><around*|(|\<eta\>,y,t|)>>
  specifically. The results are generally obtained using interpolation using
  geometric considerations on the support of the functions <math|F<rsub|j>>
  and on properties of the outer Lebesgue norms in play. The single tree
  estimates of <smart-ref|sec:single-tree> serve as the
  <math|L<rsup|\<infty\>>> endpoint when proving bounds
  <eqref|eq:iterated-Holder-type-bounds:linear>, and
  <eqref|eq:iterated-Holder-type-bounds:bilinear>. Bound
  <smart-ref|eq:RN-domination-BHT>, on the other hand relies on the
  correctness of <smart-ref|def:integral-sizes> of the size
  <math|<SI><rsup|><rsub|\<Theta\>>>.

  We begin this section by showing in <smart-ref|prop:TF-RN> that
  <smart-ref|eq:RN-domination-BHT> holds. The role of this estimate allows us
  to pass from trying to bound the trilinear form on
  <LHS|<eqref|eq:BHT-dual-bounds>> directly to bounding appropriate outer
  Lebesgue norms of the integrand

  <\equation*>
    <Emb><around*|[|f<rsub|1>|]><around*|(|\<eta\>,y,t|)><around*|[|\<phi\><rsub|0>|]><big|prod><rsub|j=2><rsup|3><Emb><around*|[|f<rsub|j>|]>\<circ\>\<Gamma\><rsub|j><around*|(|\<eta\>,y,t|)><around*|[|\<phi\><rsub|0>|]>.
  </equation*>

  Subsequently, our goal is to prove bounds
  <eqref|eq:iterated-Holder-type-bounds:linear> and
  <eqref|eq:iterated-Holder-type-bounds:bilinear> that we do in
  <smart-ref|prop:holder-bound-trilinear>. This relies first on proving a
  non-iterated version of these bounds in <smart-ref|lem:forest-estimate>.
  This is just a straight-forward application of the outer Hölder inequality.
  Then we deducing an atomic estimate for iterated outer Lebesgue spaces in
  <smart-ref|lem:atomic>. This is the more involved procedure and involves.
  Then <smart-ref|prop:holder-bound-trilinear> follows by interpolation as a
  corollary of <smart-ref|lem:atomic>. \ 

  <\proposition>
    <label|prop:TF-RN>Given any <math|\<phi\><rsub|0>\<in\>\<Phi\><rsup|N><rsub|<gr>>>,
    the bound

    <\equation>
      <label|eq:TF-RN><around*|<left|\||-1>|<big|int><rsub|<R><rsup|3><rsub|+>>H<around*|(|\<eta\>,y,t|)><around*|[|\<phi\><rsub|0>,\<phi\><rsub|0>,\<phi\><rsub|0>|]><dd>\<eta\><dd>y<dd>t|<right|\||-1>>\<lesssim\><around*|\<\|\|\>|\<phi\><rsub|0>|\<\|\|\>><rsub|\<Phi\><rsup|N><rsub|<gr>>><rsup|3><around*|<left|\<\|\|\>|2>|H<around*|(|\<eta\>,y,t|)>|<right|\<\|\|\>|2>><rsub|L<rsup|1><rsub|\<nu\><rsub|1>><fL><rsup|1><rsub|\<mu\><rsup|1><rsub|\<Theta\>>,\<nu\><rsub|1>><SI><rsup|><rsub|\<Theta\>>\<Phi\><rsub|<gr>><rsup|N>>
    </equation>

    holds for any compactly supported <math|H\<in\>L<rsup|\<infty\>><around*|(|<R><rsup|3><rsub|+>|)>\<otimes\><rsup|3>\<Phi\><rsup|\<infty\>><rsub|<gr>><rprime|'>>.
    As a consequence, the bound <smart-ref|eq:RN-domination-BHT> holds for
    all functions <math|f<rsub|j>\<in\><Sch><around*|(|<R>|)>,j\<in\><around*|{|1,2,3|}>>.
  </proposition>

  <\proof>
    Bound <smart-ref|eq:RN-domination-BHT> follows from <eqref|eq:TF-RN> by
    applying it to <math|H=<1><rsub|\<bbb-K\><rsub|n>><big|prod><rsub|j=1><rsup|3><Emb><around*|[|f<rsub|j>|]>\<circ\>\<Gamma\><rsub|j>>
    where <math|\<bbb-K\><rsub|n>\<subset\><R><rsup|3><rsub|+>> are compact
    subsets as specified in <smart-ref|rem:cpt-sets>. Convergence follows by
    <smart-ref|prop:wave-packet-represetion>: the integral on the
    <LHS|<eqref|eq:RN-domination-BHT>> is absolutely convergent.\ 

    The bound <eqref|eq:TF-RN> follows by a two-fold application of
    <smart-ref|prop:outer-RN>. At the first level we obtain that\ 

    <\equation>
      <around*|\||<big|int><rsub|>H<around*|(|\<eta\>,y,t|)><around*|[|\<phi\><rsub|0>,\<phi\><rsub|0>,\<phi\><rsub|0>|]><dd>\<eta\><dd>y<dd>t|\|>\<lesssim\><around*|\<\|\|\>|H<around*|(|\<eta\>,y,t|)>|\<\|\|\>><rsub|L<rsup|1><rsub|\<mu\><rsup|1><rsub|\<Theta\>>><SI><rsup|><rsub|\<Theta\>>\<Phi\><rsub|<gr>><rsup|N>><label|eq:RN-domination-BHT:non-iter>
    </equation>

    as long as for any fixed tree <math|T\<in\><TT><rsub|\<Theta\>>> one has

    <\equation*>
      <around*|\||<big|int><rsub|T>H<around*|(|\<eta\>,y,t|)><around*|[|\<phi\><rsub|0>,\<phi\><rsub|0>,\<phi\><rsub|0>|]><dd>\<eta\><dd>y<dd>t|\|>\<lesssim\><rsub|N>\<mu\><rsub|\<Theta\>><rsup|1><around*|(|T|)><around*|\<\|\|\>|H<around*|(|\<eta\>,y,t|)>|\<\|\|\>><rsub|<SI><rsup|><rsub|\<Theta\>>\<Phi\><rsub|<gr>><rsup|N>>.
    </equation*>

    To show the latter bound it is sufficient to decompose each
    <math|\<phi\><rsub|j>=\<phi\><rsub|0>> into
    <math|\<phi\><rsub|j>=\<phi\><rsub|j,\<theta\>><rsup|o>+\<phi\><rsub|j,\<theta\>><rsup|l>>
    as described in <eqref|eq:lac-ov-wp-decomp> to obtain that \ 

    <\equation*>
      H<around*|(|\<eta\>,y,t|)><around*|[|\<phi\><rsub|0>,\<phi\><rsub|0>,\<phi\><rsub|0>|]>=<big|sum><rsub|<around*|(|\<star\><rsub|1>,\<star\><rsub|2>,\<star\><rsub|3>|)>\<in\><around*|{|l,o|}><rsup|3>>H<around*|(|\<eta\>,y,t|)><around*|[|\<phi\><rsub|1,\<theta\>><rsup|\<star\><rsub|1>>,\<phi\><rsub|2,\<theta\>><rsup|\<star\><rsub|2>>,\<phi\><rsub|3,\<theta\>><rsup|\<star\><rsub|3>>|]>.
    </equation*>

    The terms with <math|><math|<around*|(|\<star\><rsub|1>,\<star\><rsub|2>,\<star\><rsub|3>|)>=<around*|(|o,o,l|)>>
    and <math|<around*|(|\<star\><rsub|1>,\<star\><rsub|2>,\<star\><rsub|3>|)>=<around*|(|o,l,o|)>>
    vanish because if <math|<FT|\<phi\><rsub|0>><rsub|><around*|(|\<theta\><rsub|\<Gamma\><rsub|1>>|)>\<neq\>0>
    then <math|\<phi\><rsub|j,\<theta\>><rsup|o><around*|(|z|)>=0> for
    <math|j\<in\><around*|{|2,3|}>>. This is because if
    <math|\<theta\><rsub|\<Gamma\><rsub|1>>=\<theta\>\<in\>B<rsub|<gr>>> then
    <math|\<theta\><rsub|\<Gamma\><rsub|2>>\<in\>\<alpha\><rsub|2>\<beta\><rsub|2><around*|(|B<rsub|<gr>>+\<gamma\><rsub|2>|)>=B<rsub|<gr>>-1>
    and <math|\<theta\><rsub|\<Gamma\><rsub|3>>\<in\>\<alpha\><rsub|3>\<beta\><rsub|3><around*|(|B<rsub|<gr>>+\<gamma\><rsub|3>|)>\<in\>B<rsub|<around*|(|1+\<beta\>|)><gr>>+1>;
    in particular <math|\<theta\><rsub|\<Gamma\><rsub|2>>\<notin\>B<rsub|<gr>>>
    and <math|\<theta\><rsub|\<Gamma\><rsub|3>>\<notin\>B<rsub|<gr>>>. The
    claim then follows by directly integrating each term and recalling
    <smart-ref|def:integral-sizes> of <math|<SI><rsup|><rsub|\<Theta\>>\<Phi\><rsub|<gr>><rsup|N>>.

    From <eqref|eq:RN-domination-BHT:non-iter> it follows that that for any
    <math|V<rsup|+>\<in\><DD><rsup|\<cup\>>> it holds that\ 

    <\equation*>
      <ltae|<tformat|<cwith|2|2|1|1|cell-halign|r>|<table|<row|<cell|<around*|\||<big|int><rsub|><1><rsub|V<rsup|+>>H<around*|(|\<eta\>,y,t|)><around*|[|\<phi\><rsub|0>,\<phi\><rsub|0>,\<phi\><rsub|0>|]><dd>\<eta\><dd>y<dd>t|\|>\<lesssim\><around*|<left|\<\|\|\>|1>|<1><rsub|V<rsup|+>>H<around*|(|\<eta\>,y,t|)>|<right|\<\|\|\>|1>><rsub|L<rsup|1><rsub|\<mu\><rsup|1><rsub|\<Theta\>>,\<nu\><rsub|1>><SI><rsup|><rsub|\<Theta\>>\<Phi\><rsub|<gr>><rsup|N>>>>|<row|<cell|\<lesssim\>\<nu\><rsub|1><around*|(|V<rsup|+>|)><around*|<left|\<\|\|\>|1>|<1><rsub|V<rsup|+>>H<around*|(|\<eta\>,y,t|)>|<right|\<\|\|\>|1>><rsub|<fL><rsup|1><rsub|\<mu\><rsup|1><rsub|\<Theta\>>,\<nu\><rsub|1>><SI><rsup|><rsub|\<Theta\>>\<Phi\><rsub|<gr>><rsup|N>>.>>>>>
    </equation*>

    This allows us to apply <smart-ref|prop:outer-RN> again and obtain bound
    <eqref|eq:TF-RN>.
  </proof>

  <\lemma>
    <label|lem:forest-estimate> The bound

    <\equation*>
      <ltae|<tformat|<cwith|1|1|1|1|cell-halign|l>|<cwith|2|2|1|1|cell-halign|l>|<table|<row|<cell|<around*|\<\|\|\>|F<rsub|1>F<rsub|2>F<rsub|3>|\<\|\|\>><rsub|L<rsup|q><rsub|\<mu\><rsup|1><rsub|\<Theta\>>><around*|(|<SI><rsup|<around*|(|l,l,l|)>><rsub|\<Theta\>>\<Phi\><rsub|<gr>><rsup|N>+<SI><rsup|<around*|(|o,l,l|)>><rsub|\<Theta\>>\<Phi\><rsub|<gr>><rsup|N>+<SI><rsup|<around*|(|l,l,o|)>><rsub|\<Theta\>>\<Phi\><rsub|<gr>><rsup|N>+<SI><rsup|<around*|(|l,o,l|)>><rsub|\<Theta\>>\<Phi\><rsub|<gr>><rsup|N>|)>>>>|<row|<cell|<space|1em>\<lesssim\><around*|\<\|\|\>|F<rsub|1>|\<\|\|\>><rsub|L<rsup|q<rsub|1>><rsub|\<mu\><rsup|1><rsub|\<Theta\>>><SF><rsub|\<Theta\>><rsup|u<rsub|1>>\<Phi\><rsub|4<gr>><rsup|N-3>><around*|\<\|\|\>|F<rsub|2>|\<\|\|\>><rsub|L<rsup|q<rsub|2>><rsub|\<mu\><rsup|1><rsub|\<Theta\>>><SU><rsub|\<Gamma\><rsub|2>><rsup|u<rsub|2>>\<Phi\><rsub|4<gr>><rsup|N-3>><around*|\<\|\|\>|F<rsub|3>|\<\|\|\>><rsub|L<rsup|q<rsub|3>><rsub|\<mu\><rsup|1><rsub|\<Theta\>>><SU><rsub|\<Gamma\><rsub|3>><rsup|u<rsub|3>>\<Phi\><rsub|4<gr>><rsup|N-3>>>>>>>
    </equation*>

    holds for any three functions <math|F<rsub|1>,F<rsub|2>,F<rsub|3>\<in\>L<rsup|\<infty\>><rsub|loc><around*|(|<R><rsup|3><rsub|+>|)>\<otimes\>\<Phi\><rsub|4<gr>><rsup|\<infty\>><rprime|'>>
    as long as\ 

    <\itemize>
      <item><math|<around|(|q<rsub|1>,q<rsub|2>,q<rsub|3>|)>\<in\><around|[|1,\<infty\>|]><rsup|3>>
      with <math|<big|sum><rsub|j=1><rsup|3>q<rsub|j><rsup|-1>=q<rsup|-1>>,

      <item><math|<around|(|u<rsub|1>,u<rsub|2>,u<rsub|3>|)>\<in\><around|[|1,\<infty\>|]><rsup|3>>
      with <math|<big|sum><rsub|j=1><rsup|3>u<rsub|j><rsup|-1>\<leq\>1>.
    </itemize>

    Similarly, it holds that\ 

    <\equation*>
      <around*|\<\|\|\>|F<rsub|1>F<rsub|2>F<rsub|3>|\<\|\|\>><rsub|L<rsup|q><rsub|\<mu\><rsup|1><rsub|\<Theta\>>><SI><rsup|<around*|(|l,o,o|)>><rsub|\<Theta\>>\<Phi\><rsub|<gr>><rsup|N>>\<lesssim\><around*|\<\|\|\>|F<rsub|1>|\<\|\|\>><rsub|L<rsup|q<rsub|1>><rsub|\<mu\><rsup|1><rsub|\<Theta\>>><SF><rsub|\<Theta\>><rsup|u<rsub|1>>\<Phi\><rsub|4<gr>><rsup|N-5>><around*|\<\|\|\>|F<rsub|2>F<rsub|3>|\<\|\|\>><rsub|<SU><rsub|\<Gamma\><rsub|\<times\>>><rsup|u<rsub|\<times\>>><around*|(|\<Phi\>\<otimes\>\<Phi\>|)><rsub|4<gr>><rsup|N-5>>
    </equation*>

    as long as\ 

    <\itemize>
      <item><math|<around|(|q<rsub|1>,q<rsub|\<times\>>|)>\<in\><around|[|1,\<infty\>|]><rsup|2>>
      with <math|q<rsub|1><rsup|-1>+q<rsub|\<times\>><rsup|-1>=q<rsup|-1>>,

      <item><math|<around|(|u<rsub|1>,u<rsub|\<times\>>|)>\<in\><around|[|1,\<infty\>|]><rsup|2>>
      with <math|u<rsub|1><rsup|-1>+u<rsub|\<times\>><rsup|-1>\<leq\>1>.
    </itemize>

    The implicit constants in the above bounds are independent of
    <math|F<rsub|1>,F<rsub|2>,F<rsub|3>>.
  </lemma>

  <\proof>
    The claim follows from <smart-ref|thm:STE> by the outer Hölder inequality
    (<smart-ref|cor:outer-holder-classical>). To apply the outer Hölder
    notice that the bound <eqref|eq:abstract-size-holder> corresponds to the
    bounds <eqref|eq:STE:l-l-o> and <eqref|eq:STE:l-o-o> of
    <smart-ref|thm:STE>. Bound <eqref|eq:abstract-measure-holder>, on the
    other hand, follows from the fact that
    \ <math|F<rsub|1>F<rsub|2>F<rsub|3>> is a point-wise product: if
    <math|W<rsub|j>\<in\>\<bbb-T\><rsup|\<cup\>><rsub|\<Theta\>>> are such
    that

    <\equation*>
      <1><rsub|<R><rsup|3><rsub|+>\<setminus\>W<rsub|j>>F<rsub|j>=0
    </equation*>

    then\ 

    <\equation*>
      <1><rsub|<R><rsup|3><rsub|+>\<setminus\>W<rsub|\<cap\>>>F<rsub|1>F<rsub|2>F<rsub|3>=0
    </equation*>

    where <math|W<rsub|\<cap\>>=W<rsub|j<rsub|0>>> for <math|j<rsub|0>> such
    that <math|\<mu\><rsup|1><rsub|\<Theta\>><around*|(|W<rsub|j<rsub|0>>|)>=min<rsub|j\<in\><around*|{|1,2,3|}>><around*|<left|(|1>|\<mu\><rsup|1><rsub|\<Theta\>><around*|(|W<rsub|j<rsub|>>|)>|<right|)|1>>>.
  </proof>

  <\lemma>
    <label|lem:atomic> The bound

    <\equation>
      <label|eq:atomic-trilinear><ltae|<tformat|<cwith|1|1|1|1|cell-halign|l>|<table|<row|<cell|<around*|<left|\<\|\|\>|-2>|F<rsub|1>F<rsub|2>F<rsub|3>|<right|\<\|\|\>|-2>><rsub|L<rsup|p><rsub|\<mu\><rsub|\<Theta\>><rsup|1>><around*|(|<SI><rsup|<around*|(|l,l,l|)>><rsub|\<Theta\>>\<Phi\><rsub|<gr>><rsup|N>+<SI><rsup|<around*|(|o,l,l|)>><rsub|\<Theta\>>\<Phi\><rsub|<gr>><rsup|N>+<SI><rsup|<around*|(|l,l,o|)>><rsub|\<Theta\>>\<Phi\><rsub|<gr>><rsup|N>+<SI><rsup|<around*|(|l,o,l|)>><rsub|\<Theta\>>\<Phi\><rsub|<gr>><rsup|N>|)>>>>|<row|<cell|<space|1em>\<lesssim\><ltae|<tformat|<cwith|1|1|1|1|cell-halign|r>|<cwith|2|2|1|1|cell-halign|l>|<table|<row|<cell|\<nu\><rsub|1><rsup|><around*|<left|(|-1>|<around*|\<\|\|\>|F<rsub|1>|\<\|\|\>><rsub|<SF><rsub|\<Theta\>><rsup|u<rsub|1>>\<Phi\><rsub|4<gr>><rsup|N-3>>\<gtr\>0|<right|)|-1>><rsup|<frac|1|p<rsub|1>>>min<rsub|j\<in\><around*|{|2,3|}>><around*|<left|(|1>|\<nu\><rsub|\<beta\>><rsup|><around*|(|<around*|\<\|\|\>|F<rsub|j><rsub|>|\<\|\|\>><rsub|<SU><rsub|\<Gamma\><rsub|j>><rsup|u<rsub|j>>\<Phi\><rsub|4<gr>><rsup|N-3>>\<gtr\>0|)>|<right|)|1>><rsup|<frac|1|p<rsub|2>>+<frac|1|p<rsub|3>>>>>|<row|<cell|<space|1em>\<times\><around*|\<\|\|\>|F<rsub|1>|\<\|\|\>><rsub|<fL><rsup|q<rsub|1>,+><rsub|\<mu\><rsub|\<Theta\>><rsup|\<infty\>>,\<nu\><rsub|1>><SF><rsub|\<Theta\>><rsup|u<rsub|1>>\<Phi\><rsub|4<gr>><rsup|N-3>><around*|<left|(|-3>|<big|prod><rsub|j=2><rsup|3><around*|\<\|\|\>|F<rsub|j>|\<\|\|\>><rsub|X<rsub|\<mu\><rsub|\<Theta\>><rsup|1>,\<nu\><rsub|\<beta\>>><rsup|q<rsub|j>,r<rsub|j>,+><SU><rsub|\<Gamma\><rsub|j>><rsup|u<rsub|j>>\<Phi\><rsub|4<gr>><rsup|N-3>>|<right|)|-3>>>>>>>>>>>>
    </equation>

    where <math|p=<big|sum><rsub|j=1><rsup|3>p<rsub|j><rsup|-1>> holds for
    any <math|F<rsub|j>\<in\>L<rsup|\<infty\>><rsub|loc><around*|(|<R><rsup|3><rsub|+>|)>\<otimes\>\<Phi\><rsub|4<gr>><rsup|\<infty\>>>
    as long as

    <\itemize>
      <item><math|<around*|(|p<rsub|1>,p<rsub|2>,p<rsub|3>|)>\<in\><around*|[|1,+\<infty\>|]><rsup|3><rsup|>>,

      <item><math|<around*|(|q<rsub|1>,q<rsub|2>,q<rsub|3>|)>\<in\><around*|[|1,\<infty\>|]><rsup|3>>
      with <math|<big|sum><rsub|j=1><rsup|3>q<rsub|j><rsup|-1>\<gtr\><big|sum><rsub|j=1><rsup|3>p<rsub|j><rsup|-1>\<gtr\>q<rsub|2><rsup|-1>+q<rsub|3><rsup|-1>>,

      <item><math|r<rsub|j>\<in\><around*|[|1,q<rsub|j>|]>>,
      <math|j\<in\><around*|{|2,3|}>>, with
      <math|r<rsub|2><rsup|-1>+r<rsub|3><rsup|-1>\<gtr\>p<rsub|2><rsup|-1>+p<rsub|3><rsup|-1>>,

      <item><math|<around*|(|u<rsub|1>,u<rsub|2>,u<rsub|3>|)>\<in\><around*|[|1,\<infty\>|]><rsup|3>>
      with <math|<big|sum><rsub|j=1><rsup|3>u<rsub|j><rsup|-1>\<leq\>1>.
    </itemize>

    Note that the above bound does not depend on the specific values of
    <math|p<rsub|2>,p<rsub|3>> but only on
    <math|p<rsub|2><rsup|-1>+p<rsub|3><rsup|-1>>.

    Similarly, the bound

    <\equation>
      <ltae|<tformat|<table|<row|<cell|<around*|<left|\<\|\|\>|-2>|F<rsub|1>F<rsub|2>F<rsub|3>|<right|\<\|\|\>|-2>><rsub|L<rsup|p><rsub|\<mu\><rsub|\<Theta\>><rsup|1>><SI><rsup|<around*|(|l,o,o|)>><rsub|\<Theta\>>\<Phi\><rsup|N><rsub|<gr>>>\<lesssim\><ltae|<tformat|<cwith|1|1|1|1|cell-halign|l>|<cwith|2|2|1|1|cell-halign|l>|<table|<row|<cell|\<nu\><rsub|1><rsup|><around*|(|<around*|\<\|\|\>|F<rsub|1>|\<\|\|\>><rsub|<SF><rsub|\<Gamma\><rsub|1>><rsup|u<rsub|1>>\<Phi\><rsub|4<gr>><rsup|<around*|(|N-5|)>>>\<gtr\>0|)><rsup|<frac|1|p<rsub|1>>>\<nu\><rsub|\<beta\>><around*|(|<around*|\<\|\|\>|F<rsub|2>F<rsub|3>|\<\|\|\>><rsub|<SU><rsup|u<rsub|\<times\>>><rsub|\<Gamma\><rsub|2>\<times\>\<Gamma\><rsub|3>>\<Phi\><rsub|4<mf|r>><rsup|N-5>>\<gtr\>0|)><rsup|<frac|1|p<rsub|\<times\>>>>>>|<row|<cell|<space|1.0em>\<times\><around*|\<\|\|\>|F<rsub|1>|\<\|\|\>><rsub|<fL><rsup|q<rsub|1>><rsub|\<mu\><rsub|\<Theta\>><rsup|\<infty\>>,\<nu\><rsub|1>><SF><rsub|\<Theta\>><rsup|u<rsub|1>>\<Phi\><rsub|4<gr>><rsup|N-5>><around*|\<\|\|\>|F<rsub|2>F<rsub|3>|\<\|\|\>><rsub|X<rsub|\<mu\><rsub|\<Theta\>><rsup|1>,\<nu\><rsub|\<beta\><rsup|>>><rsup|q<rsub|\<times\>>,r<rsub|\<times\>>><SU><rsup|u<rsub|\<times\>>><rsub|\<Gamma\><rsub|2>\<times\>\<Gamma\><rsub|3>>\<Phi\><rsub|4<mf|r>><rsup|N-5>>>>>>>>>>>><label|eq:atomic-bilinear>
    </equation>

    where <math|p=p<rsub|1><rsup|-1>+p<rsub|\<times\>><rsup|-1>> holds for
    any <math|F<rsub|j>\<in\>L<rsup|\<infty\>><rsub|loc><around*|(|<R><rsup|3><rsub|+>|)>\<otimes\>\<Phi\><rsub|4<gr>><rsup|\<infty\>>>
    as long as

    <\itemize>
      <item><math|<around*|(|p<rsub|1>,p<rsub|\<times\>>|)>\<in\><around*|[|1,+\<infty\>|]><rsup|3><rsup|>>,

      <item><math|<around*|(|q<rsub|1>,q<rsub|\<times\>>|)>\<in\><around*|[|1,\<infty\>|]><rsup|2>>
      with <math|q<rsub|1><rsup|-1>+q<rsub|\<times\>><rsup|-1>\<gtr\>p<rsub|1><rsup|-1>+p<rsub|\<times\>><rsup|-1>\<gtr\>q<rsub|\<times\>><rsup|-1>>,

      <item><math|r<rsub|\<times\>>\<in\><around*|(|0,q<rsub|\<times\>>|]>>
      with <math|r<rsub|\<times\>><rsup|-1>\<gtr\>p<rsub|\<times\>><rsup|-1>>,

      <item><math|<around*|(|u<rsub|1>,u<rsub|\<times\>>|)>\<in\><around*|[|1,\<infty\>|]><rsup|3>>
      with <math|u<rsub|1><rsup|-1>+u<rsub|\<times\>><rsup|-1>\<leq\>1>.
    </itemize>
  </lemma>

  <\render-proof|Proof of <smart-ref|lem:atomic>>
    We first prove bound <smart-ref|eq:atomic-trilinear>. We may assume that
    all terms on <RHS|<eqref|eq:atomic-trilinear>> are finite; otherwise
    there is nothing to prove.

    The condition <math|r<rsub|j>\<leq\>q<rsub|j>> for
    <math|j\<in\><around*|{|2,3|}>> is required for the sizes
    <math|X<rsub|\<mu\><rsub|\<Theta\>><rsup|1>,\<nu\><rsub|\<beta\>>><rsup|q<rsub|j>,r<rsub|j>,+><SU><rsub|\<Gamma\><rsub|j>><rsup|u<rsub|j>>\<Phi\><rsub|4<gr>><rsup|N-3>>
    to be defined. \ Let <math|V<rsub|1>\<in\>\<bbb-D\><rsup|\<cup\>><rsub|1>>
    and <math|V<rsub|\<times\>>\<in\><DD><rsup|\<cup\>><rsub|\<beta\><rsup|>>>
    be such that <math|<1><rsub|<R><rsup|3><rsub|+>\<setminus\>V<rsub|1>>F<rsub|1>=0>,
    <math|<1><rsub|<R><rsup|3><rsub|+>\<setminus\>V<rsub|\<times\>>>F<rsub|2>F<rsub|3>=0>,
    and

    <\equation*>
      <ltae|<tformat|<cwith|1|1|1|1|cell-halign|l>|<table|<row|<cell|\<nu\><rsub|1><around*|(|V<rsub|1>|)>\<leq\>2
      \<nu\><rsub|1><rsup|><around*|(|<around*|\<\|\|\>|F<rsub|1><rsub|<rsup|<rsub|>>>|\<\|\|\>><rsub|<SF><rsub|\<Theta\>><rsup|u<rsub|1>>\<Phi\><rsub|4<gr>><rsup|N-3>>\<gtr\>0|)>,>>|<row|<cell|\<nu\><rsub|\<beta\><rsup|>><around*|(|V<rsub|\<times\>>|)>\<leq\>2
      min<rsub|j\<in\><around*|{|2,3|}>>\<nu\><rsub|\<beta\><rsup|>><rsup|><around*|(|<around*|\<\|\|\>|F<rsub|j>|\<\|\|\>><rsub|<SU><rsub|\<Gamma\><rsub|j>><rsup|u<rsub|j>>\<Phi\><rsub|4<gr>><rsup|N-3>>\<gtr\>0|)>.>>>>>
    </equation*>

    We first discuss the case <math|q<rsub|2><rsup|-1>+q<rsub|3><rsup|-1>\<leq\>p<rsub|2><rsup|-1>+p<rsub|3><rsup|-1>>.
    Since <math|p<rsub|2><rsup|-1>+p<rsub|3><rsup|-1>\<less\>r<rsub|2><rsup|-1>+r<rsub|3><rsup|-1>>
    by assumption we may suppose that <math|p<rsub|2>\<in\><around*|(|r<rsub|2>,q<rsub|2>|]>>
    and <math|p<rsub|3>\<in\><around*|(|r<rsub|3>,q<rsub|2>|]>>.

    By homogeneity, we may assume that <math|<around*|\<\|\|\>|F<rsub|1>|\<\|\|\>><rsub|<fL><rsup|q<rsub|1>,+><rsub|\<mu\><rsub|\<Theta\>><rsup|\<infty\>>><SF><rsub|\<Theta\>><rsup|u<rsub|1>>\<Phi\><rsub|4<gr>><rsup|N-3>>=1>
    and <math|<around*|\<\|\|\>|F<rsub|j>|\<\|\|\>><rsub|X<rsub|\<mu\><rsub|\<Theta\>><rsup|1>,\<nu\><rsub|\<beta\>>><rsup|q<rsub|j>,r<rsub|j>,+><SU><rsub|\<Gamma\><rsub|j>><rsup|u<rsub|j>>\<Phi\><rsub|4<gr>><rsup|N-3>>=1>
    for <math|j\<in\><around*|{|2,3|}>>. Let us enact the atomic
    decomposition (<smart-ref|prop:atomic-decomposition>) of <math|F<rsub|1>>
    to obtain a sequence of sets <math|W<rsub|k>\<in\><TT><rsub|\<Theta\>><rsup|\<cup\>>>
    so that

    <\equation*>
      <tabular|<tformat|<cwith|1|2|1|1|cell-halign|l>|<cwith|1|1|1|1|cell-halign|l>|<table|<row|<cell|<around*|<left|\<\|\|\>|1>|<1><rsub|\<Delta\>W<rsub|k>>F<rsub|1>|<right|\<\|\|\>|1>><rsub|<SF><rsub|\<Theta\>><rsup|u<rsub|1>>\<Phi\><rsub|4<gr>><rsup|N-3>>\<lesssim\>2<rsup|<frac|k|q<rsub|1>>>,<space|2em>\<mu\><rsub|\<Theta\>><rsup|\<infty\>><around*|(|\<Delta\>W<rsub|k>|)>\<lesssim\>2<rsup|-k>,<space|2em>\<Delta\>W<rsub|k>=W<rsub|k-1>\<setminus\>W<rsub|k>.>>>>>
    </equation*>

    Since <math|<around*|<left|\<\|\|\>|1>|F<rsub|1>|<right|\<\|\|\>|1>><rsub|<SF><rsub|\<Theta\>><rsup|u<rsub|1>>\<Phi\><rsub|4<gr>><rsup|N-3>>=<around*|<left|\<\|\|\>|1>|F<rsub|1>|<right|\<\|\|\>|1>><rsub|L<rsup|\<infty\>><rsub|\<mu\><rsup|\<infty\>><rsub|\<Theta\>>><SF><rsub|\<Theta\>><rsup|u<rsub|1>>\<Phi\><rsub|4<gr>><rsup|N-3>>\<lesssim\><around*|\<\|\|\>|F<rsub|1>|\<\|\|\>><rsub|<fL><rsup|q<rsub|1>,+><rsub|\<mu\><rsub|\<Theta\>><rsup|\<infty\>>,\<nu\><rsub|1>><SF><rsub|\<Theta\>><rsup|u<rsub|1>>\<Phi\><rsub|4<gr>><rsup|N-3>>>
    it holds that <math|W<rsub|k>=\<emptyset\>> for <math|k\<geq\>1>. As a
    consequence we will only be concerned with <math|k\<leq\>1>. Turning our
    attention to <math|F<rsub|j>>, according to the definition of the size
    <math|<around*|\<\|\|\>|\<cdot\>|\<\|\|\>><rsub|X<rsub|\<mu\><rsub|\<Theta\>><rsup|1>,\<nu\><rsub|\<beta\>>><rsup|q<rsub|j>,r<rsub|j>,+><SU><rsub|\<Gamma\><rsub|j>><rsup|u<rsub|j>>\<Phi\><rsub|4<gr>><rsup|N-3>>>
    (given in <eqref|eq:X-size>) since <math|p<rsub|j>\<in\><around*|[|r<rsub|j>,q<rsub|j>|]>>
    we have that

    <\equation*>
      <around*|\<\|\|\>|<1><rsub|V<rsub|\<times\>>><1><rsub|\<Delta\>W<rsub|k>>F<rsub|j>|\<\|\|\>><rsub|L<rsup|p<rsub|j>><rsub|\<mu\><rsup|1><rsub|\<Theta\>>><SU><rsub|\<Gamma\><rsub|j>><rsup|u<rsub|j>>\<Phi\><rsub|4<gr>><rsup|N-3>>\<lesssim\>\<nu\><rsub|\<beta\><rsup|>><around*|(|V<rsub|\<times\>>|)><rsup|<frac|1|p<rsub|j>>>\<mu\><rsup|\<infty\>><rsub|\<Theta\><rsub|j>><around*|(|\<Delta\>W<rsub|k>|)><rsup|<frac|1|p<rsub|j>>-<frac|1|q<rsub|j>>>.
    </equation*>

    Using <smart-ref|lem:forest-estimate> we get that\ 

    <\equation*>
      <ltae|<tformat|<cwith|1|1|1|1|cell-halign|l>|<cwith|2|2|1|1|cell-halign|l>|<table|<row|<cell|<around*|<left|\<\|\|\>|-2>|<1><rsub|V<rsub|1>><1><rsub|V<rsub|\<times\>>><1><rsub|\<Delta\>W<rsub|k>><big|prod><rsub|j=1><rsup|3>F<rsub|j>|<right|\<\|\|\>|-2>>
      <rsub|L<rsup|p><rsub|\<mu\><rsub|\<Theta\>><rsup|1>><around*|<left|(|1>|<SI><rsup|<around*|(|l,l,l|)>><rsub|\<Theta\>>\<Phi\><rsub|<gr>><rsup|N>+<SI><rsup|<around*|(|o,l,l|)>><rsub|\<Theta\>>\<Phi\><rsub|<gr>><rsup|N>+<SI><rsup|<around*|(|l,l,o|)>><rsub|\<Theta\>>\<Phi\><rsub|<gr>><rsup|N>+<SI><rsup|<around*|(|l,o,l|)>><rsub|\<Theta\>>\<Phi\><rsub|<gr>><rsup|N>|<right|)|1>>><rsub|>>>|<row|<cell|<space|1em><ltae|<tformat|<cwith|3|3|1|1|cell-halign|l>|<cwith|2|2|1|1|cell-halign|l>|<table|<row|<cell|\<lesssim\><around*|\<\|\|\>|<1><rsub|V<rsub|1>><1><rsub|\<Delta\>W<rsub|k>>F<rsub|1>|\<\|\|\>><rsub|L<rsup|p<rsub|1>><rsub|\<mu\><rsup|1><rsub|\<Theta\>>><SF><rsub|\<Theta\>><rsup|u<rsub|1>>\<Phi\><rsub|4<gr>><rsup|N-3>><big|prod><rsub|j=1><rsup|3><around*|\<\|\|\>|<1><rsub|V<rsub|\<times\>>><1><rsub|\<Delta\>W<rsub|k>>F<rsub|j>|\<\|\|\>><rsub|L<rsup|p<rsub|j>><rsub|\<mu\><rsup|1><rsub|\<Theta\>>><SU><rsub|\<Gamma\><rsub|j>><rsup|u<rsub|j>>\<Phi\><rsub|4<gr>><rsup|N-3>>>>|<row|<cell|\<lesssim\>\<nu\><rsub|1><around*|(|V<rsub|1>|)><rsup|<frac|1|p<rsub|1>>>\<mu\><rsub|\<Theta\>><rsup|\<infty\>><around*|(|\<Delta\>W<rsub|k>|)><rsup|<frac|1|p<rsub|1>>><around*|\<\|\|\>|<1><rsub|\<Delta\>W<rsub|k>>F<rsub|1>|\<\|\|\>><rsub|<SF><rsub|\<Theta\>><rsup|u<rsub|1>>\<Phi\><rsub|4<gr>><rsup|N-3>><big|prod><rsub|j=2><rsup|3>\<nu\><rsub|1><around*|(|V<rsub|\<times\>>|)><rsup|<frac|1|p<rsub|j>>>\<mu\><rsup|\<infty\>><rsub|\<Theta\><rsub|j>><around*|(|\<Delta\>W<rsub|k+1>|)><rsup|<frac|1|p<rsub|j>>-<frac|1|q<rsub|j>>>>>|<row|<cell|\<lesssim\>\<nu\><rsub|1><around*|(|V<rsub|1>|)><rsup|<frac|1|p<rsub|1>>>\<nu\><rsub|\<beta\>><around*|(|V<rsub|\<times\>>|)><rsup|<frac|1|p<rsub|2>>+<frac|1|p<rsub|3>>>2<rsup|k<big|sum><rsub|j=1><rsup|3><around*|<left|(|-1>|q<rsub|j><rsup|-1>-p<rsub|j><rsup|-1>|<right|)|-1>>>=\<nu\><rsub|1><around*|(|V<rsub|1>|)><rsup|<frac|1|p<rsub|1>>>\<nu\><rsub|\<beta\>><around*|(|V<rsub|\<times\>>|)><rsup|<frac|1|p<rsub|2>>+<frac|1|p<rsub|3>>>2<rsup|k<around*|(|<frac|1|q>-<frac|1|p>|)>>.>>>>>>>>>>
    </equation*>

    Using the triangle inequality <eqref|eq:multi-triangle> we get that\ 

    <\equation*>
      <ltae|<tformat|<cwith|1|1|1|1|cell-halign|l>|<table|<row|<cell|<around*|<left|\<\|\|\>|-3>|<big|prod><rsub|j=1><rsup|3>F<rsub|j>|<right|\<\|\|\>|-3>><rsub|L<rsup|p><rsub|\<mu\><rsub|\<Theta\>><rsup|1>><around*|<left|(|1>|<SI><rsup|<around*|(|l,l,l|)>><rsub|\<Theta\>>\<Phi\><rsub|<gr>><rsup|N>+<SI><rsup|<around*|(|o,l,l|)>><rsub|\<Theta\>>\<Phi\><rsub|<gr>><rsup|N>+<SI><rsup|<around*|(|l,l,o|)>><rsub|\<Theta\>>\<Phi\><rsub|<gr>><rsup|N>+<SI><rsup|<around*|(|l,o,l|)>><rsub|\<Theta\>>\<Phi\><rsub|<gr>><rsup|N>|<right|)|1>>><rsub|>>>|<row|<cell|<space|1em>\<lesssim\>\<nu\><rsub|1><around*|(|V<rsub|1>|)><rsup|<frac|1|p<rsub|1>>>\<nu\><rsub|\<beta\>><around*|(|V<rsub|\<times\>>|)><rsup|<frac|1|p<rsub|2>>+<frac|1|p<rsub|3>>><big|sum><rsub|k=-\<infty\>><rsup|1>k<rsup|C<rsub|<around*|\<\|\|\>|\<cdot\>|\<\|\|\>>>>2<rsup|k<around*|(|<big|sum><rsub|j=1><rsup|3>q<rsub|j><rsup|-1>-p<rsup|-1>|)>>\<lesssim\>\<nu\><rsub|1><around*|(|V<rsub|1>|)><rsup|<frac|1|p<rsub|1>>>\<nu\><rsub|\<beta\>><around*|(|V<rsub|\<times\>>|)><rsup|<frac|1|p<rsub|2>>+<frac|1|p<rsub|3>>>,>>>>>
    </equation*>

    as required. The sum is convergent because
    <math|<big|sum><rsub|j=1><rsup|3>q<rsub|j><rsup|-1>\<gtr\>p<rsup|-1>>.

    Now let us discuss the case <math|q<rsub|2><rsup|-1>+q<rsub|3><rsup|-1>\<gtr\>p<rsub|2><rsup|-1>+p<rsub|3><rsup|-1>>.
    Let <math|p> be fixed; we apply the result in the case above with
    <math|q<rsub|j>> in place of <math|p<rsub|j>>,
    <math|j\<in\><around*|{|2,3|}>>, and with any
    <math|<wide|p|~><rsub|1><eqd><around*|(|p<rsup|-1>-q<rsub|2><rsup|-1>-q<rsub|3><rsup|-1>|)><rsup|-1>>
    in place of <math|p<rsub|1>>. This gives us\ 

    <\equation*>
      <ltae|<tformat|<cwith|1|1|1|1|cell-halign|l>|<table|<row|<cell|<around*|<left|\<\|\|\>|-2>|F<rsub|1>F<rsub|2>F<rsub|3>|<right|\<\|\|\>|-2>><rsub|L<rsup|p><rsub|\<mu\><rsub|\<Theta\>><rsup|1>><around*|(|<SI><rsup|<around*|(|l,l,l|)>><rsub|\<Theta\>>\<Phi\><rsub|<gr>><rsup|N>+<SI><rsup|<around*|(|o,l,l|)>><rsub|\<Theta\>>\<Phi\><rsub|<gr>><rsup|N>+<SI><rsup|<around*|(|l,l,o|)>><rsub|\<Theta\>>\<Phi\><rsub|<gr>><rsup|N>+<SI><rsup|<around*|(|l,o,l|)>><rsub|\<Theta\>>\<Phi\><rsub|<gr>><rsup|N>|)>>>>|<row|<cell|<space|1em><ltae|<tformat|<cwith|1|1|1|1|cell-halign|l>|<table|<row|<cell|=<around*|<left|\<\|\|\>|-2>|<1><rsub|V<rsub|1>\<cap\>V<rsub|\<times\>>>F<rsub|1>F<rsub|2>F<rsub|3>|<right|\<\|\|\>|-2>><rsub|L<rsup|p><rsub|\<mu\><rsub|\<Theta\>><rsup|1>><around*|(|<SI><rsup|<around*|(|l,l,l|)>><rsub|\<Theta\>>\<Phi\><rsub|<gr>><rsup|N>+<SI><rsup|<around*|(|o,l,l|)>><rsub|\<Theta\>>\<Phi\><rsub|<gr>><rsup|N>+<SI><rsup|<around*|(|l,l,o|)>><rsub|\<Theta\>>\<Phi\><rsub|<gr>><rsup|N>+<SI><rsup|<around*|(|l,o,l|)>><rsub|\<Theta\>>\<Phi\><rsub|<gr>><rsup|N>|)>>>>|<row|<cell|\<lesssim\>\<nu\><rsub|1><around*|(|V<rsub|1>|)><rsup|<frac|1|p>><around*|(|<frac|\<nu\><rsub|\<beta\>><around*|(|V<rsub|\<times\>>|)>|\<nu\><rsub|1><around*|(|V<rsub|1>|)>>|)><rsup|<frac|1|q<rsub|2>>+<frac|1|q<rsub|3>>><around*|\<\|\|\>|F<rsub|1>|\<\|\|\>><rsub|<fL><rsup|q<rsub|1>,+><rsub|\<mu\><rsub|\<Theta\>><rsup|\<infty\>>,\<nu\><rsub|1>><SF><rsub|\<Theta\>><rsup|u<rsub|1>>\<Phi\><rsub|4<gr>><rsup|N-3>><around*|<left|(|-3>|<big|prod><rsub|j=2><rsup|3><around*|\<\|\|\>|F<rsub|j>|\<\|\|\>><rsub|X<rsub|\<mu\><rsub|\<Theta\>><rsup|1>,\<nu\><rsub|\<beta\>>><rsup|q<rsub|j>,q<rsub|j>,+><SU><rsub|\<Gamma\><rsub|j>><rsup|u<rsub|j>>\<Phi\><rsub|4<gr>><rsup|N-3>>|<right|)|-3>>.>>>>>>>>>>
    </equation*>

    We may assume that <math|V<rsub|\<times\>>\<subseteq\>V<rsub|1>> by
    carrying out the proof with <math|V<rsub|\<times\>>\<cap\>V<rsub|1>\<in\><DD><rsub|\<beta\>><rsup|\<cup\>>>
    in place of <math|V<rsub|\<times\>>> giving us that\ 

    <\equation*>
      <ltae|<tformat|<cwith|1|1|1|1|cell-halign|l>|<table|<row|<cell|<around*|<left|\<\|\|\>|-2>|F<rsub|1>F<rsub|2>F<rsub|3>|<right|\<\|\|\>|-2>><rsub|L<rsup|p><rsub|\<mu\><rsub|\<Theta\>><rsup|1>><around*|(|<SI><rsup|<around*|(|l,l,l|)>><rsub|\<Theta\>>\<Phi\><rsub|<gr>><rsup|N>+<SI><rsup|<around*|(|o,l,l|)>><rsub|\<Theta\>>\<Phi\><rsub|<gr>><rsup|N>+<SI><rsup|<around*|(|l,l,o|)>><rsub|\<Theta\>>\<Phi\><rsub|<gr>><rsup|N>+<SI><rsup|<around*|(|l,o,l|)>><rsub|\<Theta\>>\<Phi\><rsub|<gr>><rsup|N>|)>>>>|<row|<cell|<space|1em><ltae|<tformat|<table|<row|<cell|\<lesssim\>\<nu\><rsub|1><around*|(|V<rsub|1>|)><rsup|<frac|1|p>><around*|(|<frac|\<nu\><rsub|\<beta\>><around*|(|V<rsub|\<times\>>\<cap\>V<rsub|1>|)>|\<nu\><rsub|1><around*|(|V<rsub|1>|)>>|)><rsup|<frac|1|q<rsub|2>>+<frac|1|q<rsub|3>>><around*|\<\|\|\>|F<rsub|1>|\<\|\|\>><rsub|<fL><rsup|q<rsub|1>,+><rsub|\<mu\><rsub|\<Theta\>><rsup|\<infty\>>,\<nu\><rsub|1>><SF><rsub|\<Theta\>><rsup|u<rsub|1>>\<Phi\><rsub|4<gr>><rsup|N-3>><around*|<left|(|-3>|<big|prod><rsub|j=2><rsup|3><around*|\<\|\|\>|F<rsub|j>|\<\|\|\>><rsub|X<rsub|\<mu\><rsub|\<Theta\>><rsup|1>,\<nu\><rsub|\<beta\>>><rsup|q<rsub|j>,q<rsub|j>,+><SU><rsub|\<Gamma\><rsub|j>><rsup|u<rsub|j>>\<Phi\><rsub|4<gr>><rsup|N-3>>|<right|)|-3>>>>|<row|<cell|\<lesssim\>\<nu\><rsub|1><around*|(|V<rsub|1>|)><rsup|<frac|1|p>><around*|(|<frac|\<nu\><rsub|\<beta\>><around*|(|V<rsub|\<times\>>\<cap\>V<rsub|1>|)>|\<nu\><rsub|1><around*|(|V<rsub|1>|)>>|)><rsup|<frac|1|p<rsub|2>>+<frac|1|p<rsub|3>>><around*|\<\|\|\>|F<rsub|1>|\<\|\|\>><rsub|<fL><rsup|q<rsub|1>,+><rsub|\<mu\><rsub|\<Theta\>><rsup|\<infty\>>,\<nu\><rsub|1>><SF><rsub|\<Theta\>><rsup|u<rsub|1>>\<Phi\><rsub|4<gr>><rsup|N-3>><around*|<left|(|-3>|<big|prod><rsub|j=2><rsup|3><around*|\<\|\|\>|F<rsub|j>|\<\|\|\>><rsub|X<rsub|\<mu\><rsub|\<Theta\>><rsup|1>,\<nu\><rsub|\<beta\>>><rsup|q<rsub|j>,q<rsub|j>,+><SU><rsub|\<Gamma\><rsub|j>><rsup|u<rsub|j>>\<Phi\><rsub|4<gr>><rsup|N-3>>|<right|)|-3>>>>>>>>>>>>
    </equation*>

    where the last bound holds because <math|\<nu\><rsub|\<beta\>><around*|(|V<rsub|\<times\>>\<cap\>V<rsub|1>|)>\<leq\>\<nu\><rsub|\<beta\>><around*|(|V<rsub|1>|)>\<leq\>\<nu\><rsub|1><around*|(|V<rsub|1>|)>>
    and <math|q<rsub|2><rsup|-1>+q<rsub|3><rsup|-1>\<geq\>p<rsub|2><rsup|-1>+p<rsub|3><rsup|-1>>.
    This concludes the proof of bound <smart-ref|eq:atomic-trilinear>.

    Bound <smart-ref|eq:atomic-bilinear> is proved analogously with the
    following natural modifications. We require
    <math|r<rsub|\<times\>>\<leq\>q<rsub|\<times\>>> for the size
    <math|<SU><rsup|u<rsub|\<times\>>><rsub|\<Gamma\><rsub|2>\<times\>\<Gamma\><rsub|3>>\<Phi\><rsub|4<mf|r>><rsup|N-5>>
    to be defined. By homogeneity we assume that
    <math|<around*|\<\|\|\>|F<rsub|2>F<rsub|3>|\<\|\|\>><rsub|X<rsub|\<mu\><rsub|\<Theta\>><rsup|1>,\<nu\><rsub|\<beta\>>><rsup|q<rsub|\<times\>>,r<rsub|\<times\>>,+><SU><rsup|u<rsub|\<times\>>><rsub|\<Gamma\><rsub|2>\<times\>\<Gamma\><rsub|3>>\<Phi\><rsub|4<mf|r>><rsup|N-5>>=1>.
    Assuming <math|q<rsub|\<times\>><rsup|-1>\<leq\>p<rsub|\<times\>><rsup|-1>>
    and taking the sets <math|\<Delta\>W<rsub|k>> to be the same as before,
    we obtain that\ 

    <\equation*>
      <around*|\<\|\|\>|<1><rsub|V<rsub|\<times\>>><1><rsub|\<Delta\>W<rsub|k>>F<rsub|2>F<rsub|3>|\<\|\|\>><rsub|L<rsup|p<rsub|\<times\>>><rsub|\<mu\><rsup|1><rsub|\<Theta\>>><SU><rsub|\<Gamma\><rsub|2>\<times\>\<Gamma\><rsub|3>><rsup|u<rsub|\<times\>>>>\<lesssim\>\<nu\><rsub|\<beta\><rsup|>><around*|(|V<rsub|\<times\>>|)><rsup|<frac|1|p<rsub|\<times\>>>>\<mu\><rsup|\<infty\>><rsub|\<Theta\><rsub|j>><around*|(|\<Delta\>W<rsub|k>|)><rsup|<frac|1|p<rsub|\<times\>>>-<frac|1|q<rsub|\<times\>>>>
    </equation*>

    and we conclude that\ 

    <\equation*>
      <around*|<left|\<\|\|\>|-2>|<1><rsub|V<rsub|1>><1><rsub|V<rsub|\<times\>>><1><rsub|\<Delta\>W<rsub|k>>F<rsub|1>F<rsub|2>F<rsub|3><rsub|j>|<right|\<\|\|\>|-2>><rsub|L<rsup|p><rsub|\<mu\><rsub|\<Theta\>><rsup|1>><SI><rsup|<around*|(|l,o,o|)>><rsub|\<Theta\>>\<Phi\><rsup|N><rsub|<gr>>><rsub|>\<lesssim\>\<nu\><rsub|1><around*|(|V<rsub|1>|)><rsup|<frac|1|p<rsub|1>>>\<nu\><rsub|\<beta\>><around*|(|V<rsub|\<times\>>|)><rsup|<frac|1|p<rsub|\<times\>>>>2<rsup|k<around*|(|q<rsub|1><rsup|-1>+q<rsub|\<times\>><rsup|-1>-p<rsup|-1>|)>>.
    </equation*>

    Summing up in <math|k\<in\><Z>,k\<leq\>1> yields the claim. To address
    the case <math|p<rsub|\<times\>>\<gtr\>q<rsub|\<times\>>> the procedure
    is the same as above and relies on noticing that one may assume
    <math|\<nu\><rsub|\<beta\>><around*|(|V<rsub|\<times\>>|)>\<leq\>\<nu\><rsub|\<beta\>><around*|(|V<rsub|1>|)>\<leq\>\<nu\><rsub|1><around*|(|V<rsub|1>|)>>.
  </render-proof>

  <\proposition>
    <label|prop:holder-bound-trilinear>The bounds\ 

    <\equation>
      <ltae|<tformat|<cwith|2|2|1|1|cell-halign|r>|<cwith|1|1|1|1|cell-halign|l>|<table|<row|<cell|<around*|\<\|\|\>|F<rsub|1>F<rsub|2>F<rsub|3>|\<\|\|\>><rsub|L<rsup|1><rsub|\<mu\><rsub|\<Theta\>><rsup|1>><around*|(|<SI><rsup|<around*|(|l,l,l|)>><rsub|\<Theta\>>\<Phi\><rsub|<gr>><rsup|N>+<SI><rsup|<around*|(|o,l,l|)>><rsub|\<Theta\>>\<Phi\><rsub|<gr>><rsup|N>+<SI><rsup|<around*|(|l,l,o|)>><rsub|\<Theta\>>\<Phi\><rsub|<gr>><rsup|N>+<SI><rsup|<around*|(|l,o,l|)>><rsub|\<Theta\>>\<Phi\><rsub|<gr>><rsup|N>|)>><space|2em>>>|<row|<cell|<space|2em>\<lesssim\><around*|\<\|\|\>|F<rsub|1>|\<\|\|\>><rsub|L<rsup|p<rsub|1>><rsub|\<nu\><rsub|1>><fL><rsup|q<rsub|1>,+><rsub|\<mu\><rsub|\<Theta\>><rsup|\<infty\>>,\<nu\><rsub|1>><SF><rsub|\<Gamma\><rsub|1>><rsup|u<rsub|1>>\<Phi\><rsub|4<gr>><rsup|N-3>><around*|<left|(|-2>|<big|prod><rsub|j=2><rsup|3><around*|\<\|\|\>|F<rsub|j>|\<\|\|\>><rsub|L<rsup|p<rsub|j>><rsub|\<nu\><rsub|\<beta\><rsup|>>>X<rsub|\<mu\><rsub|\<Theta\>><rsup|1>,\<nu\><rsub|\<beta\><rsup|>>><rsup|q<rsub|j>,r<rsub|j>,+><SU><rsub|\<Gamma\><rsub|j>><rsup|u<rsub|j>>\<Phi\><rsub|4<gr>><rsup|N-3>>|<right|)|-2>>>>>>><label|eq:holder-bound-trilinear>
    </equation>

    holds for any <math|F<rsub|j>\<in\>L<rsup|\<infty\>><rsub|loc><around*|(|<R><rsup|3><rsub|+>|)>\<otimes\>\<Phi\><rsub|4<gr>><rsup|\<infty\>>>
    as long as\ 

    <\itemize>
      <item><math|<around*|(|p<rsub|1>,p<rsub|2>,p<rsub|3>|)>\<in\><around*|[|1,\<infty\>|]><rsup|3>>
      with <math|<big|sum><rsub|j=1><rsup|3>p<rsub|j><rsup|-1>=1>,

      <item><math|<around*|(|q<rsub|1>,q<rsub|2>,q<rsub|3>|)>\<in\><around*|[|1,\<infty\>|]><rsup|3>>
      with <math|<big|sum><rsub|j=1><rsup|3>q<rsub|j><rsup|-1>\<gtr\>1\<gtr\>q<rsub|2><rsup|-1>+q<rsub|3><rsup|-1>>,

      <item><math|r<rsub|j>\<in\><around*|[|1,q<rsub|j>|]>>,
      <math|j\<in\><around*|{|2,3|}>>, with
      <math|r<rsub|2><rsup|-1>+r<rsub|3><rsup|-1>\<gtr\>p<rsub|2><rsup|-1>+p<rsub|3><rsup|-1>>.

      <item><math|<around*|(|u<rsub|1>,u<rsub|2>,u<rsub|3>|)>\<in\><around*|[|1,\<infty\>|]><rsup|3>>
      with <math|<big|sum><rsub|j=1><rsup|3>u<rsub|j><rsup|-1>\<leq\>1>.
    </itemize>

    In particular, bound <eqref|eq:iterated-Holder-type-bounds:linear> holds
    under the above assumptions on the exponents.\ 

    Similarly, the bound

    <\equation>
      <tabular|<tformat|<cwith|1|1|1|1|cell-halign|r>|<table|<row|<cell|<around*|\<\|\|\>|F<rsub|1>F<rsub|2>F<rsub|3>|\<\|\|\>><rsub|L<rsup|1><rsub|\<mu\><rsub|\<Theta\>><rsup|1>><SI><rsup|<around*|(|l,o,o|)>><rsub|\<Theta\>>\<Phi\><rsup|N><rsub|<gr>>>\<lesssim\><around*|\<\|\|\>|F<rsub|1>|\<\|\|\>><rsub|L<rsup|p<rsub|1>><rsub|\<nu\><rsub|1>><fL><rsup|q<rsub|1>,+><rsub|\<mu\><rsub|\<Theta\>><rsup|\<infty\>>,\<nu\><rsub|1>><SF><rsub|\<Theta\>><rsup|u<rsub|1>>\<Phi\><rsub|4<mf|r>><rsup|N-3>><around*|<left|\<\|\|\>|-3>|F<rsub|2>F<rsub|3>|<right|\<\|\|\>|-3>><rsub|L<rsup|p<rsub|\<times\>>><rsub|\<nu\><rsub|\<beta\><rsup|>>>X<rsub|\<mu\><rsub|\<Theta\>><rsup|1>,\<nu\><rsub|\<beta\><rsup|>>><rsup|q<rsub|\<times\>>,r<rsub|\<times\>>,+><SU><rsup|u<rsub|\<times\>>><rsub|\<Gamma\><rsub|2>\<times\>\<Gamma\><rsub|3>>\<Phi\><rsub|4<mf|r>><rsup|N-3>>>>>>
      <label|eq:holder-bound-bilinear>>
    </equation>

    holds for any <math|F<rsub|j>\<in\>L<rsup|\<infty\>><rsub|loc><around*|(|<R><rsup|3><rsub|+>|)>\<otimes\>\<Phi\><rsub|4<gr>><rsup|\<infty\>>>
    as long as\ 

    <\itemize>
      <item><math|<around*|(|p<rsub|1>,p<rsub|\<times\>>|)>\<in\><around*|[|1,\<infty\>|]><rsup|2>>
      with <math|p<rsub|1><rsup|-1>+p<rsub|\<times\>><rsup|-1>=1>,

      <item><math|><math|<around*|(|q<rsub|1>,q<rsub|\<times\>>|)>\<in\><around*|[|1,\<infty\>|]><rsup|2>>
      with <math|q<rsub|1><rsup|-1>+q<rsub|\<times\>><rsup|-1>\<gtr\>1\<gtr\>q<rsub|\<times\>><rsup|-1>>,

      <item><math|r<rsub|\<times\>>\<in\><around*|(|0,q<rsub|\<times\>>|]>>
      with \ <math|r<rsub|\<times\>><rsup|-1>\<gtr\>p<rsub|\<times\>><rsup|-1>>,

      <item><math|<around*|(|u<rsub|1>,u<rsub|\<times\>>|)>\<in\><around*|[|1,\<infty\>|]><rsup|2>>
      with \ <math|u<rsub|1><rsup|-1>+u<rsub|\<times\>><rsup|-1>\<leq\>1>.

      \;
    </itemize>

    In particular, bound <eqref|eq:iterated-Holder-type-bounds:bilinear>
    holds under the above assumptions on the exponents.\ 
  </proposition>

  <\proof>
    <smart-ref|prop:outer-restricted-interpolation> can be applied to the
    bounds <eqref|eq:atomic-trilinear> to yield bound
    <eqref|eq:holder-bound-trilinear>. As a matter of fact the conditions of
    <smart-ref|lem:atomic> on <math|<around*|(|p<rsub|1>,p<rsub|2>,p<rsub|3>|)>>
    for fixed <math|<around*|(|<math|q><rsub|1>,q<rsub|2>,q<rsub|3>|)>> and
    <math|<around*|(|r<rsub|2>,r<rsub|3>|)>>.

    Similarly <smart-ref|prop:outer-restricted-interpolation> can be applied
    to the bounds <eqref|eq:atomic-bilinear> to obtain bounds
    <eqref|eq:holder-bound-bilinear>.\ 
  </proof>

  <section|Non-uniform embedding bounds<label|sec:non-uniform>>

  In this section we prove the non-uniform embedding bound
  <smart-ref|eq:embedding-bounds:non-uniform-iterated>, which follow from the
  following Theorem.

  <\theorem>
    <dueto|Non-uniform embedding bounds><label|thm:non-uniform-embedding-bounds>Let
    <math|\<Theta\>> be a bounded open real interval with
    <math|B<rsub|1>\<subset\>\<Theta\>>, let <math|<gr><rsub|0>\<gtr\>0> be
    sufficiently small (e.g. <math|<gr><rsub|0>=2<rsup|-10>>), let
    <math|N<rsub|0>\<in\><N>> be sufficiently large, let
    <math|\<Gamma\>=\<Gamma\><rsub|<around*|(|\<alpha\>,\<beta\>,\<gamma\>|)>>>
    satisfy the conditions of <eqref|eq:gamma>, let
    <math|p\<in\><around*|(|1,\<infty\>|)>>,
    <math|q\<in\><around*|(|max<around*|(|p<rprime|'>,2|)>,\<infty\>|)>>, and
    <math|u\<in\><around*|(|1,\<infty\>|)>>, and let the size
    <math|<SF><rsup|u><rsub|\<Gamma\>>\<Phi\><rsub|<gr>><rsup|N>> be given by\ 

    <\equation>
      <label|eq:non-uniform-embedding-full-size><SF><rsup|u><rsub|\<Gamma\>>\<Phi\><rsub|<gr>><rsup|N><eqd>\<Gamma\><rsup|\<ast\>><SL><rsup|<around|(|\<infty\>,\<infty\>|)>><rsub|\<Theta\>>\<Phi\><rsub|<gr>><rsup|N>+\<Gamma\><rsup|\<ast\>><SL><rsup|<around|(|u,2|)>><rsub|\<Theta\>><wpD><rsub|<gr>><rsup|N>+\<Gamma\><rsup|\<ast\>><SL><rsup|<around|(|u,1|)>><rsub|\<Theta\>><dfct><rsup|N><rsub|<gr>>+\<Gamma\><rsup|\<ast\>><SJ><rsub|\<Theta\>><rsup|u>\<Phi\><rsub|<gr>><rsup|N>,
    </equation>

    with each of the summands defined in <smart-ref|sec:time-frequency-outer-lebesgue>
    and <smart-ref|sec:derived-sizes>. There exists
    <math|N<rprime|'>\<gtr\>0> such that for any<math|>
    <math|<gr>\<in\><around*|(|0,<gr><rsub|0>|)>>, for any
    <math|N\<gtr\>N<rsub|0>\<in\><N>>, and for all
    <math|f\<in\><Sch><around*|(|<R>|)>> the bound\ 

    <\equation>
      <label|eq:embedding-bounds:non-uniform-iterated:complete><around*|\<\|\|\>|<Emb><around*|[|f|]>\<circ\>\<Gamma\>|\<\|\|\>><rsub|L<rsup|p<rsub|1>><rsub|\<nu\><rsub|\<beta\>>><fL><rsup|q<rsub|1>,+><rsub|\<mu\><rsub|\<Theta\>><rsup|\<infty\>>,\<nu\><rsub|\<beta\>>><SF><rsup|u><rsub|\<Gamma\>>\<Phi\><rsub|<mf|r>><rsup|N>>\<lesssim\><rsub|\<beta\>><around*|\<\|\|\>|f|\<\|\|\>><rsub|L<rsup|p><around*|(|<R>|)>>,
    </equation>

    holds. The implicit constant in the bound may depend on all parameters,
    including <math|\<beta\>\<gtr\>0>.
  </theorem>

  For comparison, the embedding bound shown in
  <cite|amentaBilinearHilbertTransform2020> (with notation adapted to the
  present paper) can be reformulated with inessential modifications as
  follows; we do not repeat the proof here.

  <\theorem*>
    <dueto|<cite-detail|amentaBilinearHilbertTransform2020|Theorem 1.3>>
    Under the assumpitons of <smart-ref|thm:non-uniform-embedding-bounds> on
    the parameters, the bound

    <\equation>
      <label|eq:AU-non-uniform-embedding-bounds><around*|<left|\<\|\|\>|1>|<Emb><around*|[|f|]>\<circ\>\<Gamma\>|<right|\<\|\|\>|1>><rsub|L<rsup|p<rsub|>><rsub|\<nu\><rsub|1>><fL><rsup|q,+><rsub|\<mu\><rsub|\<Theta\>><rsup|1>,\<nu\><rsub|1>><around*|(|\<Gamma\><rsup|\<ast\>><SL><rsup|\<infty\>,\<infty\>><rsub|\<Theta\>>\<Phi\><rsub|<gr>><rsup|N>+\<Gamma\><rsup|\<ast\>><SL><rsup|u,2><rsub|\<Theta\>><wpD><rsub|<gr>><rsup|N<rsup|>>+\<Gamma\><rsup|\<ast\>><SL><rsub|\<Theta\>><rsup|<around*|(|u,1|)>><rsub|><dfct><rsub|<gr>><rsup|N>|)>>\<lesssim\><around*|\<\|\|\>|f|\<\|\|\>><rsub|L<rsup|p><around*|(|<R>|)>>
    </equation>

    holds.
  </theorem*>

  The statement <cite-detail|amentaBilinearHilbertTransform2020|Theorem 1.3>
  covers embeddings for functions valued in Banach spaces. We deal with
  scalar-valued functions, that corresponds to setting <math|r=2> \ in the
  statement of <cite-detail|amentaBilinearHilbertTransform2020|Theorem 1.3>
  to consider functions valued in Hilbert spaces.

  <smart-ref|thm:non-uniform-embedding-bounds> improves on the non-uniform
  bounds in <cite-detail|amentaBilinearHilbertTransform2020|Theorem 1.3> to
  account for the additional term <math|\<Gamma\><rsup|\<ast\>><SJ><rsub|\<Theta\>><rsup|u>\<Phi\><rsub|<gr>><rsup|N>>
  in the size <math|<SF><rsub|\<Gamma\>><rsup|u>> and for a larger outer
  measure <math|\<mu\><rsup|\<infty\>><rsub|\<Theta\>>> in the localized
  outer Lebesgue norm <math|<fL><rsup|q,+><rsub|\<mu\><rsub|\<Theta\>><rsup|\<infty\>>,\<nu\><rsub|1>>>
  in place of <math|<fL><rsup|q,+><rsub|\<mu\><rsub|\<Theta\>><rsup|1>,\<nu\><rsub|1>>>.

  <smart-ref|sec:non-uniform:SIO> is dedicated to showing the bound

  <\equation>
    <label|eq:embedding-bounds:non-uniform-iterated:mu1><around*|\<\|\|\>|<Emb><around*|[|f|]>\<circ\>\<Gamma\>|\<\|\|\>><rsub|L<rsup|p><rsub|\<nu\><rsub|\<beta\>>><fL><rsup|q,+><rsub|\<mu\><rsub|\<Theta\>><rsup|1>,\<nu\><rsub|\<beta\>>><SF><rsub|\<Gamma\>><rsup|u>\<Phi\><rsub|<mf|r>><rsup|N>>\<lesssim\><around*|\<\|\|\>|f|\<\|\|\>><rsub|L<rsup|p><around*|(|<R>|)>>
  </equation>

  by using the sizes already present in <math|<LHS|<eqref|eq:AU-non-uniform-embedding-bounds>>>
  to control the <math|\<Gamma\><rsup|\<ast\>><SJ><rsub|\<Theta\>><rsup|u>\<Phi\><rsub|<gr>><rsup|N<rsup|>>>
  size, which represents a maximal truncation of a Calderón-Zygmund singular
  integral operator. We are not aware of any prior use of the size
  <math|\<Gamma\><rsup|\<ast\>><SJ><rsub|\<Theta\>><rsup|u>\<Phi\><rsub|<gr>><rsup|N<rsup|>>>.\ 

  <smart-ref|sec:non-unif:counting-function-improvement> is dedicated to
  deducing bound <eqref|eq:embedding-bounds:non-uniform-iterated:complete>
  from bound <eqref|eq:embedding-bounds:non-uniform-iterated:mu1> by
  replacing <math|<fL><rsup|q,+><rsub|\<mu\><rsub|\<Theta\>><rsup|1>,\<nu\><rsub|1>>>
  with <math|<fL><rsup|q,+><rsub|\<mu\><rsub|\<Theta\>><rsup|\<infty\>>,\<nu\><rsub|1>>>.
  For <math|\<beta\>\<gtrsim\>1> bound <eqref|eq:embedding-bounds:non-uniform-iterated:complete>
  is formally stronger than bound <eqref|eq:embedding-bounds:non-uniform-iterated:mu1>
  because, according to <smart-ref|lem:measure-comparison-1-infty> and
  property <eqref|eq:outer-measure-Lp-comparison> of
  <smart-ref|prop:outer-properties>, \ we have that

  <\equation*>
    \<nu\><rsub|\<beta\>><around*|(|V|)><rsup|-<frac|1|q>><around*|\<\|\|\>|<1><rsub|V>F|\<\|\|\>><rsub|L<rsup|q><rsub|\<mu\><rsup|1><rsub|\<Theta\>>><SO>>\<lesssim\>\<beta\><rsup|-<frac|1|q>><around*|\<\|\|\>|<1><rsub|V>F|\<\|\|\>><rsub|L<rsup|q><rsub|\<mu\><rsup|\<infty\>><rsub|\<Theta\>>><SO>>,
  </equation*>

  and thus

  <\equation*>
    <around*|\<\|\|\>|F|\<\|\|\>><rsub|<fL><rsup|q,+><rsub|\<mu\><rsub|\<Theta\>><rsup|1>,\<nu\><rsub|\<beta\>>><SF><rsup|u><rsub|\<Theta\>>\<Phi\><rsup|N><rsub|<gr>>>\<lesssim\>\<beta\><rsup|-<frac|1|q>><around*|\<\|\|\>|<1><rsub|V>F|\<\|\|\>><rsub|L<rsup|q,+><rsub|\<mu\><rsup|\<infty\>><rsub|\<Theta\>>,\<nu\><rsub|\<beta\>>><SF><rsup|u><rsub|\<Theta\>>\<Phi\><rsup|N><rsub|<gr>>>
  </equation*>

  for any <math|F\<in\><Rad><around*|(|<R><rsup|3><rsub|+>|)>\<otimes\>\<Phi\><rsup|\<infty\>><rsub|<gr>>>.
  This improvement has precedent in literature; we codify it using the outer
  Lebesgue framework. It is interesting that this improvement costs us the
  <math|p=\<infty\>> endpoint for the embedding.

  For ease of notation, we carry out all proofs leading to
  <smart-ref|thm:non-uniform-embedding-bounds> for
  <math|<around*|(|\<alpha\>,\<beta\>,\<gamma\>|)>=<around*|(|1,1,0|)>>. The
  full statement follows by a straight-forward modification of the arguments;
  furthermore, according to <eqref|eq:gamma:params> showing
  <smart-ref|thm:non-uniform-embedding-bounds> for
  <math|<around*|(|\<alpha\>,\<beta\>,\<gamma\>|)>\<neq\><around*|(|1,1,0|)>>
  is not necessary to prove bound <smart-ref|eq:embedding-bounds:non-uniform-iterated>
  and thus <smart-ref|thm:main-1>. All implicit constants are allowed to
  depend on <math|\<beta\>\<in\><around*|(|0,1|]>>.

  <subsection|SIO truncation size control<label|sec:non-uniform:SIO>>

  The main goal of this section is the following Proposition, which implies
  bound <eqref|eq:embedding-bounds:non-uniform-iterated:mu1>.

  <\proposition>
    <label|prop:SIO-size-domination>Under the assumpitons of
    <smart-ref|thm:non-uniform-embedding-bounds> on the parameters, let
    <math|V<rsup|+>,V<rsup|->\<in\><DD><rsub|\<beta\><rsup|>><rsup|\<cup\>>>,
    and <math|W<rsup|+>,W<rsup|->\<in\><TT><rsup|\<cup\>><rsub|\<Theta\>>>.
    For all <math|f\<in\><Sch><around*|(|<R>|)>> the bounds

    <\equation>
      <label|eq:SIO-bound:explicit><ltae|<tformat|<cwith|1|1|1|1|cell-halign|l>|<table|<row|<cell|<around*|<left|\<\|\|\>|1>|<1><rsub|<around*|(|V<rsup|+>\<cap\>W<rsup|+>|)>\<setminus\><around*|(|V<rsup|->\<cup\>W<rsup|-><rsup|>|)>><Emb><around*|[|f|]>\<circ\>\<Gamma\><rsub|<around*|(|\<alpha\>,\<beta\>,\<gamma\>|)>>|<right|\<\|\|\>|1>><rsub|<SJ><rsup|u><rsub|\<Theta\>>\<Phi\><rsub|<gr>><rsup|N>>>>|<row|<cell|<space|1em>\<lesssim\><rsub|\<beta\>><ltae|<tformat|<table|<row|<cell|<around*|<left|\<\|\|\>|1>|<1><rsub|<around*|(|V<rsup|+>\<cap\>W<rsup|+>|)>\<setminus\><around*|(|V<rsup|->\<cup\>W<rsup|-><rsup|>|)>><Emb><around*|[|f|]>\<circ\>\<Gamma\><rsub|<around*|(|\<alpha\>,\<beta\>,\<gamma\>|)>>|<right|\<\|\|\>|1>><rsub|<SL><rsup|<around*|(|2,2|)>><rsub|\<Theta\>><wpD><rsub|2<rsup|N<rprime|'><rsup|>><gr>><rsup|N-N<rprime|'><rsup|>>>>>|<row|<cell|+<around*|<left|\<\|\|\>|1>|<1><rsub|<around*|(|V<rsup|+>\<cap\>W<rsup|+>|)>\<setminus\><around*|(|V<rsup|->\<cup\>W<rsup|-><rsup|>|)>><Emb><around*|[|f|]>|<right|\<\|\|\>|1>><rsub|<SL><rsup|<around*|(|\<infty\>,\<infty\>|)>><rsub|\<Theta\>>\<Phi\><rsub|2<rsup|N<rprime|'>><gr>><rsup|N-N<rprime|'>>>>>>>>>>>>>
    </equation>

    hold. The implicit constant is independent of the sets
    <math|V<rsup|\<pm\>>,W<rsup|\<pm\>>>.
  </proposition>

  <\corollary>
    <label|cor:SIO-bound:mu1> Bound <eqref|eq:embedding-bounds:non-uniform-iterated:mu1>
    holds for all <math|f\<in\><Sch><around*|(|<R>|)>>.
  </corollary>

  <\proof>
    By homogeneity, assume that <math|<around*|\<\|\|\>|f|\<\|\|\>><rsub|L<rsup|p>>=1>.
    According to <smart-ref|rem:iterated-outer-bounds-explicit>, bound
    <eqref|eq:AU-non-uniform-embedding-bounds> provides us with a choice of
    <math|V<rsup|-><around*|(|\<lambda\>|)>\<in\><DD><rsup|\<cup\>><rsub|1>>
    and <math|W<rsub|q><around*|(|\<lambda\>,\<tau\>,V<rsup|+>|)>\<in\><TT><rsub|\<Theta\>><rsup|\<cup\>>>
    satisfying <smart-ref|eq:iterated-outer-bounds-explicit> and
    <eqref|eq:iterated-outer-bounds-explicit-full> with

    <\equation*>
      F=<Emb><around*|[|f|]>,<space|2em><SO>=<around*|(|<SL><rsup|<around*|(|\<infty\>,\<infty\>|)>><rsub|\<Theta\>>\<Phi\><rsub|2<rsup|N<rprime|'>><gr>><rsup|N-N<rprime|'>>+<SL><rsup|<around*|(|u,2|)>><rsub|\<Theta\>><wpD><rsub|2<rsup|N<rprime|'>><gr>><rsup|N-N<rprime|'>>+<SL><rsub|\<Theta\>><rsup|<around*|(|u,1|)>><rsub|><dfct><rsub|2<rsup|N<rprime|'>><gr>><rsup|N-N<rprime|'>>|)>.
    </equation*>

    <math|>Bound <smart-ref|eq:SIO-bound:explicit> shows that this same
    choice of <math|W<rsub|q><around*|(|\<lambda\>,\<tau\>,V<rsup|+>|)>\<in\><TT><rsub|\<Theta\>><rsup|\<cup\>>>
    also satisfies conditions <smart-ref|eq:iterated-outer-bounds-explicit>
    and <eqref|eq:iterated-outer-bounds-explicit-full> with
    <math|<SO>=<SF><rsub|\<Gamma\>><rsup|u>\<Phi\><rsub|<mf|r>><rsup|N>>,
    instead. Again, by <smart-ref|rem:iterated-outer-bounds-explicit>, this
    is exactly what is claimed by bound <eqref|eq:embedding-bounds:non-uniform-iterated:mu1>.
  </proof>

  <\render-proof|Proof of <smart-ref|prop:SIO-size-domination>>
    We assume that <math|<around*|(|\<alpha\>,\<beta\>,\<gamma\>|)>=<around*|(|1,1,0|)>>.
    Let

    <\equation*>
      E<rsup|+><eqd>V<rsup|+>\<cap\>W<rsup|+>,<space|2em>E<rsup|-><eqd>V<rsup|->\<cup\>W<rsup|->,<space|2em>E<eqd>E<rsup|+>\<setminus\>E<rsup|->,
    </equation*>

    and for any fixed <math|T\<in\><TT><rsub|\<Theta\>>> let

    <\equation*>
      E<rsup|\<ast\>+><rsub|T><eqd>\<pi\><rsub|T><rsup|-1><around*|(|<mT><rsub|\<Theta\>>\<cap\>V<rsup|+>\<cap\>W<rsup|+>|)>,<space|1em>E<rsup|\<ast\>-><rsub|T><eqd>\<pi\><rsub|T><rsup|-1><around*|<left|(|1>|<mT><rsub|\<Theta\>>\<cap\><around*|(|V<rsup|->\<cup\>W<rsup|->|)>|<right|)|1>>,<space|1em>E<rsup|\<ast\>><rsub|T><eqd>E<rsup|\<ast\>+><rsub|T>\<setminus\>E<rsup|\<ast\>-><rsub|T>.
    </equation*>

    Let <math|<mf|b><rsup|\<ast\>><rsub|\<pm\>><around*|(|\<theta\>,\<zeta\>|)>>
    be the two functions given by <smart-ref|lem:geometry-of-boundary-local>
    such that their graphs are the boundaries of
    <math|E<rsup|\<ast\>\<pm\>>>. \ We use the shorthand

    <\equation*>
      F<rsup|\<ast\>><rsub|T><around*|(|\<theta\>,\<zeta\>,\<sigma\>|)><eqd><Emb><around*|[|f|]>\<circ\>\<pi\><rsub|T><around*|(|\<theta\>,\<zeta\>,\<sigma\>|)>.
    </equation*>

    Our proof is devided into three parts. First of all, we show that for
    some <math|N<rprime|'>\<in\><N>> and for all <math|N\<in\><N>> large
    enough, for any <math|T\<in\><TT><rsub|\<Theta\>>> and any
    <math|\<phi\>\<in\>\<Phi\><rsub|<gr>><rsup|\<infty\>>> with
    <math|<around*|\<\|\|\>|\<phi\>|\<\|\|\>><rsub|\<Phi\><rsub|<gr>><rsup|N>>\<leq\>1>
    it holds that\ 

    <\equation>
      <label|eq:tree-SIO-size><ltae|<tformat|<cwith|2|2|1|1|cell-halign|l>|<cwith|1|1|1|1|cell-halign|l>|<table|<row|<cell|<around*|<left|\<\|\|\>|-1>|<around*|<left|(|-1>|<big|int><rsub|\<Theta\>>sup<rsub|\<sigma\>\<gtr\>0><around*|<left|\||-1>|<big|int><rsub|\<sigma\>><rsup|1><around*|<left|(|1>|<1><rsub|E<rsup|\<ast\>><rsub|T>><wpD><rsub|\<zeta\>><around*|<left|(|-1>|\<theta\>|<right|)|-1>>F<rsup|\<ast\>><rsub|T>|<right|)|1>><around|(|\<theta\>,\<zeta\>,\<rho\>|)><around*|[|\<phi\>|]><frac|<dd>\<rho\>|\<rho\>>|<right|\||-1>><rsup|2><frac|\<mathd\>\<theta\>|<around*|\||\<Theta\>|\|>>|<right|)|-1>><rsup|<frac|1|2>>|<right|\<\|\|\>|-1>><rsub|L<rsup|u><around*|(|B<rsub|1>|)>>>>|<row|<cell|<space|1em>\<lesssim\>sup<rsub|<tabular*|<tformat|<table|<row|<cell|T<rprime|'>\<in\><TT><rsub|\<Theta\>>>>|<row|<cell|s<rsub|T<rprime|'>>\<leq\>s<rsub|T>>>>>>><around*|<left|.>|<around*|(|<around*|<left|\<\|\|\>|2>|<1><rsub|E><Emb><around*|[|f|]>|<right|\<\|\|\>|2>><rsub|<SL><rsup|<around*|(|2,2|)>><rsub|\<Theta\>><wpD><rsub|2<rsup|N<rprime|'><rsup|>><gr>><rsup|N-N<rprime|'><rsup|>><around*|(|T<rprime|'>|)>>+<around*|<left|\<\|\|\>|2>|<1><rsub|E><Emb><around*|[|f|]>|<right|\<\|\|\>|2>><rsub|<SL><rsup|<around*|(|\<infty\>,\<infty\>|)>><rsub|\<Theta\>>\<Phi\><rsub|2<rsup|<with|font-series|bold|>N<rprime|'><rsup|>><gr>><rsup|N-N<rprime|'><rsup|><rsup|>><around*|(|T<rprime|'>|)>>|)>|<right|\<nobracket\>|1>>.>>>>>
    </equation>

    We prove <eqref|eq:tree-SIO-size> in two steps. First, we prove
    <eqref|eq:tree-SIO-size> for <math|u=2> and then we prove
    <eqref|eq:tree-SIO-size> for any <math|u\<in\><around*|[|1,\<infty\>|)>>.
    The second step relies on the fact that
    <math|<LHS|><eqref|eq:tree-SIO-size>> specifically, is a <math|BMO> -type
    quantity. We adopt a procedure inspired by the proof of the
    John-Nirenberg inequality: an induction on the scales of the trees
    <math|T\<in\><TT><rsub|\<Theta\>>> in play. Finally, from
    <eqref|eq:tree-SIO-size> we deduce <eqref|eq:SIO-bound:explicit>,
    concluding the proof.

    <with|font-series|bold|Bound <eqref|eq:tree-SIO-size> for <math|u=2>:>

    Here we show that <eqref|eq:tree-SIO-size> holds for <math|u=2>. By
    symmetry considerations, without loss of generality we can suppose that
    <math|T=T<rsub|\<Theta\>><around*|(|0,0,1|)>>. Let
    <math|\<sigma\>\<of\>\<Theta\>\<times\>B<rsub|1>\<rightarrow\><around*|[|0,1|]>>
    be a smooth function with <math|\<sigma\><around*|(|<around*|(|\<theta\>,\<zeta\>|)>|)>\<geq\><wide|b|~><rsup|\<ast\>><rsub|-><around*|(|\<theta\>,\<zeta\>|)>>,
    let <math|\<phi\>\<in\>\<Phi\><rsub|<gr>><rsup|\<infty\>>> being any wave
    packet with <math|<around*|\<\|\|\>|\<phi\>|\<\|\|\>><rsub|\<Phi\><rsub|<gr>><rsup|N>>\<leq\>1>
    for some <math|N<rprime|'>\<in\><N>> and all <math|N> large enough. We
    show that\ 

    <\equation>
      <label|eq:SIO-proof-stopped-explicit><ltae|<tformat|<table|<row|<cell|<around*|\<\|\|\>|<big|int><rsub|\<sigma\><around*|(|\<theta\>,\<zeta\>|)>><rsup|<mf|<wide|b|~><rsup|\<ast\>><rsub|+><around*|(|\<theta\>,\<zeta\>|)>>><wpD><rsub|\<zeta\>><around*|(|\<theta\>|)>F<rsup|\<ast\>><rsub|T><around*|(|\<theta\>,\<zeta\>,\<rho\>|)><around*|[|\<phi\>|]><frac|<dd>\<rho\>|\<rho\>><rsub|>|\<\|\|\>><rsub|L<rsup|2><rsub|<frac|<dd>\<theta\><dd>\<zeta\>|<around*|\||\<Theta\>|\|>>><around*|(|\<Theta\>\<times\>B<rsub|1>|)>>>>|<row|<cell|<space|1em>\<lesssim\>sup<rsub|<tabular*|<tformat|<table|<row|<cell|T<rprime|'>\<in\><TT><rsub|\<Theta\>>>>|<row|<cell|s<rsub|T<rprime|'>>\<leq\>s<rsub|T>>>>>>><around*|<left|.>|<around*|(|<around*|<left|\<\|\|\>|2>|<1><rsub|E><Emb><around*|[|f|]>|<right|\<\|\|\>|2>><rsub|<SL><rsup|<around*|(|2,2|)>><rsub|\<Theta\>><wpD><rsub|2<rsup|N<rprime|'>><gr>><rsup|N-N<rprime|'><rsup|>><around*|(|T<rprime|'>|)>>+<around*|<left|\<\|\|\>|2>|<1><rsub|E><Emb><around*|[|f|]>|<right|\<\|\|\>|2>><rsub|<SL><rsup|<around*|(|\<infty\>,\<infty\>|)>><rsub|\<Theta\>>\<Phi\><rsub|2<rsup|N<rprime|'>><gr>><rsup|N-N<rprime|'><rsup|>><around*|(|T<rprime|'>|)>>|)>|<right|\<nobracket\>|1>>>>>>>
    </equation>

    holds. First, we show the claim above in the special case
    <math|<around*|\||<dd><rsub|\<zeta\>>\<sigma\><around*|(|\<theta\>,\<zeta\>|)>|\|><rsub|>\<leq\>1>.\ 

    <with|font-series|bold|Sub-case <math|<around*|\||<dd><rsub|\<zeta\>>\<sigma\><around*|(|\<theta\>,\<zeta\>|)>|\|><rsub|>\<leq\>1>:>
    Let <math|A=sup<rsub|\<phi\>,\<sigma\>><around*|(|<LHS|<eqref|eq:SIO-proof-stopped-explicit>>|)>>
    where the upper bound is taken over <math|\<phi\>\<in\>\<Phi\><rsub|<gr>><rsup|\<infty\>>>
    with <math|<around*|\<\|\|\>|\<phi\>|\<\|\|\>><rsub|\<Phi\><rsub|<gr>><rsup|N>>\<leq\>1>
    and all <math|\<sigma\>\<suchthat\>\<Theta\>\<times\>B<rsub|1>\<rightarrow\><around*|[|0,1|]>>
    with <math|<wide|b|~><rsup|\<ast\>><rsub|-><around*|(|\<theta\>,\<zeta\>|)>\<leq\>\<sigma\><around*|(|\<theta\>,\<zeta\>|)>\<leq\><wide|b|~><rsup|\<ast\>><rsub|+><around*|(|\<theta\>,\<zeta\>|)>>
    and <math|<around*|\||<dd><rsub|\<zeta\>>\<sigma\><around*|(|\<theta\>,\<zeta\>|)>|\|><rsub|>\<leq\>1>.
    We prove <eqref|eq:SIO-proof-stopped-explicit> by showing that

    <\equation*>
      A<rsup|2>\<lesssim\>A*<RHS|<eqref|eq:SIO-proof-stopped-explicit>>+<RHS|<eqref|eq:SIO-proof-stopped-explicit>><rsup|2>.
    </equation*>

    Fix <math|\<phi\>\<in\>\<Phi\><rsub|<gr>><rsup|\<infty\>>> and
    <math|\<sigma\>\<suchthat\>\<Theta\>\<times\>B<rsub|1>\<rightarrow\><around*|[|0,1|]>>
    in <math|<LHS|<eqref|eq:SIO-proof-stopped-explicit>>>, that satisfy the
    conditions above, for which <math|><math|<LHS|<eqref|eq:SIO-proof-stopped-explicit>>\<geq\>A/2>.
    We get that\ 

    <\equation*>
      <frac|A<rsup|2>|4><ltae|<tformat|<table|<row|<cell|\<leq\><big|int><rsub|\<Theta\>\<times\>B<rsub|1>><around*|<left|\||-2>|<big|int><rsub|\<sigma\><around*|(|\<theta\>,\<zeta\>|)>><rsup|<mf|<wide|b|~><rsup|\<ast\>><rsub|+><around*|(|\<theta\>,\<zeta\>|)>>><wpD><rsub|\<zeta\>><around*|(|\<theta\>|)>F<rsup|\<ast\>><rsub|T><around*|(|\<theta\>,\<zeta\>,\<rho\>|)><around*|[|\<phi\>|]><frac|<dd>\<rho\>|\<rho\>>|<right|\||-2>><rsub|><frac|<dd>\<theta\><dd>\<zeta\>|<around*|\||\<Theta\>|\|>>>>|<row|<cell|=<big|int><rsub|\<Theta\>\<times\>B<rsub|1>><ltae|<tformat|<table|<row|<cell|<around*|(|<big|int><rsub|\<sigma\><around*|(|\<theta\>,\<zeta\>|)>><rsup|<mf|<wide|b|~><rsup|\<ast\>><rsub|+><around*|(|\<theta\>,\<zeta\>|)>>><wpD><rsub|\<zeta\>><around*|(|\<theta\>|)>F<rsup|\<ast\>><rsub|T><around*|(|\<theta\>,\<zeta\>,\<rho\>|)><around*|[|\<phi\>|]><frac|<dd>\<rho\>|\<rho\>>|)>>>|<row|<cell|\<times\><around*|(|<big|int><rsub|\<sigma\><around*|(|\<theta\>,\<zeta\>|)>><rsup|<mf|<wide|b|~><rsup|\<ast\>><rsub|+><around*|(|\<theta\>,\<zeta\>|)>>><wide|<wpD><rsub|\<zeta\>><around*|(|\<theta\>|)>F<rsup|\<ast\>><rsub|T><around*|(|\<theta\>,\<zeta\>,\<rho\><rprime|'>|)><around*|[|\<phi\>|]>|\<bar\>><frac|<dd>\<rho\><rprime|'>|\<rho\><rprime|'>>|)><rsub|><frac|<dd>\<theta\><dd>\<zeta\>|<around*|\||\<Theta\>|\|>>>>>>><rsub|>>>|<row|<cell|=2\<Re\><big|int><rsub|\<Theta\><rsup|+>\<times\>B<rsub|1>><big|int><rsub|\<sigma\><around*|(|\<theta\>,\<zeta\>|)>><rsup|<mf|<wide|b|~>><rsup|\<ast\>><rsub|+><around*|(|\<zeta\>|)>><ltae|<tformat|<table|<row|<cell|<wpD><rsub|\<zeta\>><around*|(|\<theta\>|)>F<rsup|\<ast\>><rsub|T><around*|(|\<theta\>,\<zeta\>,\<rho\>|)><around*|[|\<phi\>|]>>>|<row|<cell|<space|1em>\<times\><around*|(|<big|int><rsub|\<sigma\><around*|(|\<theta\>,\<zeta\>|)>><rsup|\<rho\>><wide|<wpD><rsub|\<zeta\>><around*|(|\<theta\>|)>F<rsup|\<ast\>><rsub|T><around*|(|\<theta\>,\<zeta\>,\<rho\><rprime|'>|)><around*|[|\<phi\>|]>|\<bar\>><frac|<dd>\<rho\><rprime|'>|\<rho\><rprime|'>>|)><frac|<dd>\<rho\>|\<rho\>><frac|<dd>\<theta\><dd>\<zeta\>|<around*|\||\<Theta\>|\|>>.>>>>>>>>>>
    </equation*>

    There exists a decomposition

    <\equation>
      <label|eq:SIO-proof-phi-decomposition>\<phi\><around*|(|z|)>=z
      <around*|(|-d<rsub|z>+2 \<pi\> i \<theta\>|)>\<phi\><rsup|o><rsub|\<theta\>><around*|(|z|)>+<around*|(|-d<rsub|z>+2
      \<pi\> i \<theta\>|)>\<phi\><rsup|l><rsub|\<theta\>><around*|(|z|)>
    </equation>

    as follows.

    <\equation*>
      \<phi\><rsup|o><rsub|\<theta\>>,\<phi\><rsup|l><rsub|\<theta\>><around*|(|z|)>\<in\>\<Phi\><rsub|2<rsup|3><gr>><rsup|N-3>,<space|2em><around*|\<\|\|\>|\<phi\><rsup|o><rsub|\<theta\>>|\<\|\|\>><rsub|\<Phi\><rsup|N-3><rsub|2<rsup|3><gr>>>\<lesssim\>1,<space|2em><around*|\<\|\|\>|\<phi\><rsup|l><rsub|\<theta\>>|\<\|\|\>><rsub|\<Phi\><rsub|2<rsup|3><gr>><rsup|N-3>>\<lesssim\>1.
    </equation*>

    Assuming this decomposition, which we prove later, we write

    <\equation*>
      <wpD><rsub|\<zeta\>><around*|(|\<theta\>|)>F<rsup|\<ast\>><rsub|T><around*|(|\<theta\>,\<zeta\>,\<rho\><rprime|'>|)><around*|[|\<phi\>|]><ltae|<tformat|<table|<row|<cell|=<wpD><rsub|\<zeta\>><around*|(|\<theta\>|)>F<rsup|\<ast\>><rsub|T><around*|(|\<theta\>,\<zeta\>,\<rho\><rprime|'>|)><around*|[|z
      <around*|(|-d<rsub|z>+2 \<pi\> i \<theta\>|)>\<phi\><rsup|o><rsub|\<theta\>><around*|(|z|)>+<around*|(|-d<rsub|z>+2
      \<pi\> i \<theta\>|)>\<phi\><rsup|l><rsub|\<theta\>><around*|(|z|)>|]>>>|<row|<cell|=<ltae|<tformat|<table|<row|<cell|<wpD><rsub|\<sigma\>><around*|(|\<theta\>|)>F<rsup|\<ast\>><rsub|T><around*|(|\<theta\>,\<zeta\>,\<rho\><rprime|'>|)><around*|[|<around*|(|-d<rsub|z>+2
      \<pi\> i \<theta\>|)>\<phi\><rsup|o><rsub|\<theta\>>|]>+<wpD><rsub|\<zeta\>><around*|(|\<theta\>|)><rsup|2>F<rsup|\<ast\>><rsub|T><around*|(|\<theta\>,\<zeta\>,\<rho\><rprime|'>|)><around*|[|\<phi\><rsup|l><rsub|\<theta\>><around*|(|z|)>|]>>>>>>>>|<row|<cell|=\<rho\><rprime|'><dd><rsub|\<rho\><rprime|'>><around*|(|<wpD><rsub|\<zeta\>><around*|(|\<theta\>|)>F<rsup|\<ast\>><rsub|T>|)><around*|(|\<theta\>,\<zeta\>,\<rho\><rprime|'>|)><around*|[|\<phi\><rsup|o><rsub|\<theta\>>|]>+\<rho\><rprime|'><dd><rsub|\<zeta\>><around*|(|<wpD><rsub|\<zeta\>><around*|(|\<theta\>|)>F<rsup|\<ast\>><rsub|T>|)><around*|(|\<theta\>,\<zeta\>,\<rho\><rprime|'>|)><around*|[|\<phi\><rsup|l><rsub|\<theta\>>|]>>>>>>
    </equation*>

    to obtain that\ 

    <\equation*>
      <ltae|<tformat|<table|<row|<cell|<big|int><rsub|\<Theta\>\<times\>B<rsub|1>><big|int><rsub|\<sigma\><around*|(|\<theta\>,\<zeta\>|)>><rsup|<mf|<wide|b|~>><rsup|\<ast\>><rsub|+><around*|(|\<zeta\>|)>><ltae|<tformat|<table|<row|<cell|<wpD><rsub|\<zeta\>><around*|(|\<theta\>|)>F<rsup|\<ast\>><rsub|T><around*|(|\<theta\>,\<zeta\>,\<rho\>|)><around*|[|\<phi\>|]>>>|<row|<cell|<space|1em>\<times\><around*|(|<big|int><rsub|\<sigma\><around*|(|\<theta\>,\<zeta\>|)>><rsup|\<rho\>><wide|<wpD><rsub|\<zeta\>><around*|(|\<theta\>|)>F<rsup|\<ast\>><rsub|T><around*|(|\<theta\>,\<zeta\>,\<rho\><rprime|'>|)><around*|[|\<phi\>|]>|\<bar\>><frac|<dd>\<rho\><rprime|'>|\<rho\><rprime|'>>|)><frac|<dd>\<rho\>|\<rho\>><frac|<dd>\<theta\><dd>\<zeta\>|<around*|\||\<Theta\>|\|>>>>>>>>>|<row|<cell|<space|1em>=<mrm|I>-<mrm|II>+<mrm|III>,>>>>>
    </equation*>

    where

    <\equation*>
      <ltae|<tformat|<table|<row|<cell|<mrm|I><eqd><big|int><rsub|\<Theta\>\<times\>B<rsub|1>><big|int><rsub|\<sigma\><around*|(|\<theta\>,\<zeta\>|)>><rsup|<mf|<wide|b|~>><rsup|\<ast\>><rsub|+><around*|(|\<zeta\>|)>><wpD><rsub|\<zeta\>><around*|(|\<theta\>|)>F<rsup|\<ast\>><rsub|T><around*|(|\<theta\>,\<zeta\>,\<rho\>|)><around*|[|\<phi\>|]><wide|<wpD><rsub|\<zeta\>><around*|(|\<theta\>|)>F<rsup|\<ast\>><rsub|T><around*|(|\<theta\>,\<zeta\>,\<rho\>|)><around*|[|\<phi\><rsup|o><rsub|\<theta\>>|]>|\<bar\>><frac|<dd>\<rho\>|\<rho\>><frac|<dd>\<theta\><dd>\<zeta\>|<around*|\||\<Theta\>|\|>>,>>|<row|<cell|<mrm|II><eqd><big|int><rsub|\<Theta\>\<times\>B<rsub|1>><around*|(|<big|int><rsub|\<sigma\><around*|(|\<theta\>,\<zeta\>|)>><rsup|<mf|<wide|b|~>><rsup|\<ast\>><rsub|+><around*|(|\<zeta\>|)>><wpD><rsub|\<zeta\>><around*|(|\<theta\>|)>F<rsup|\<ast\>><rsub|T><around*|(|\<theta\>,\<zeta\>,\<rho\>|)><around*|[|\<phi\>|]><frac|<dd>\<rho\>|\<rho\>>|)><wide|<wpD><rsub|\<zeta\>><around*|(|\<theta\>|)>F<rsup|\<ast\>><rsub|T><around*|(|\<theta\>,\<zeta\>,\<sigma\><around*|(|\<theta\>,\<zeta\>|)>|)><around*|[|\<phi\><rsup|o><rsub|\<theta\>>|]>|\<bar\>><frac|<dd>\<theta\><dd>\<zeta\>|<around*|\||\<Theta\>|\|>>,>>|<row|<cell|<mrm|III><eqd><big|int><rsub|\<Theta\>\<times\>B<rsub|1>><big|int><rsub|\<sigma\><around*|(|\<theta\>,\<zeta\>|)>><rsup|<mf|<wide|b|~>><rsup|\<ast\>><rsub|+><around*|(|\<zeta\>|)>><ltae|<tformat|<table|<row|<cell|<wpD><rsub|\<zeta\>><around*|(|\<theta\>|)>F<rsup|\<ast\>><rsub|T><around*|(|\<theta\>,\<zeta\>,\<rho\>|)><around*|[|\<phi\>|]>>>|<row|<cell|<space|1em>\<times\><around*|(|<big|int><rsub|\<sigma\><around*|(|\<theta\>,\<zeta\>|)>><rsup|\<rho\>>\<rho\><rprime|'><dd><rsub|\<zeta\>><wide|<wpD><rsub|\<zeta\>><around*|(|\<theta\>|)>F<rsup|\<ast\>><rsub|T><around*|(|\<theta\>,\<zeta\>,\<rho\><rprime|'>|)><around*|[|\<phi\><rsup|l><rsub|\<theta\>>|]>|\<bar\>><frac|<dd>\<rho\><rprime|'>|\<rho\><rprime|'>>|)><frac|<dd>\<rho\>|\<rho\>><frac|<dd>\<theta\><dd>\<zeta\>|<around*|\||\<Theta\>|\|>>.>>>>>>>>>>
    </equation*>

    We can bound terms <math|<mrm|I>> and <math|<mrm|II>> using
    Cauchy-Schwarz and <smart-ref|lem:wave-packet-decomposition>:

    <\equation*>
      <around*|\||<mrm|I>|\|><ltae|<tformat|<table|<row|<cell|\<lesssim\>sup<rsub|\<phi\>,\<phi\><rprime|'>><ltae|<tformat|<table|<row|<cell|>>>>><big|int><rsub|\<Theta\>\<times\>B<rsub|1>><big|int><rsub|\<sigma\><around*|(|\<theta\>,\<zeta\>|)>><rsup|<mf|<wide|b|~>><rsup|\<ast\>><rsub|+><around*|(|\<zeta\>|)>><around*|<left|\||1>|<wpD><rsub|\<zeta\>><around*|(|\<theta\>|)>F<rsup|\<ast\>><rsub|T><around*|(|\<theta\>,\<zeta\>,\<rho\>|)><around*|[|\<phi\>|]>|<right|\||1>><around*|<left|\||1>|<wide|<wpD><rsub|\<zeta\>><around*|(|\<theta\>|)>F<rsup|\<ast\>><rsub|T><around*|(|\<theta\>,\<zeta\>,\<rho\>|)><around*|[|\<phi\><rprime|'>|]>|\<bar\>>|<right|\||1>><frac|<dd>\<rho\>|\<rho\>><frac|<dd>\<theta\><dd>\<zeta\>|<around*|\||\<Theta\>|\|>>>>|<row|<cell|\<lesssim\><around*|<left|\<\|\|\>|2>|<1><rsub|E><Emb><around*|[|f|]>|<right|\<\|\|\>|2>><rsub|<SL|><rsup|<around|(|2,2|)>><rsub|\<Theta\>>\<Phi\><rsub|2<rsup|5><gr>><rsup|N-5><around*|(|T|)>>,>>>>>
    </equation*>

    with the upper bound taken over <math|<around*|\<\|\|\>|\<phi\>|\<\|\|\>><rsub|\<Phi\><rsup|N-5><rsub|2<rsup|5><gr>>>\<leq\>1>
    and <math|<around*|\<\|\|\>|\<phi\><rprime|'>|\<\|\|\>><rsub|\<Phi\><rsup|N-5><rsub|2<rsup|5><gr>>>\<leq\>1>.
    We also get

    <\equation*>
      <around*|\||<mrm|II>|\|><ltae|<tformat|<table|<row|<cell|\<lesssim\><ltae|<tformat|<table|<row|<cell|<ltae|<tformat|<table|<row|<cell|>>>>><around*|(|<big|int><rsub|\<Theta\>\<times\>B<rsub|1>><around*|\||<big|int><rsub|\<sigma\><around*|(|\<theta\>,\<zeta\>|)>><rsup|<mf|<wide|b|~>><rsup|\<ast\>><rsub|+><around*|(|\<zeta\>|)>><wpD><rsub|\<zeta\>><around*|(|\<theta\>|)>F<rsup|\<ast\>><rsub|T><around*|(|\<theta\>,\<zeta\>,\<rho\>|)><around*|[|\<phi\>|]><frac|<dd>\<rho\>|\<rho\>>|\|><rsup|2><frac|<dd>\<theta\><dd>\<zeta\>|<around*|\||\<Theta\>|\|>>|)><rsup|<frac|1|2>>>>|<row|<cell|<space|1em>\<times\>sup<rsub|\<phi\><rprime|'>><around*|(|<big|int><rsub|\<Theta\>\<times\>B<rsub|1>><around*|<left|\||2>|<wpD><rsub|\<zeta\>><around*|(|\<theta\>|)>F<rsup|\<ast\>><rsub|T><around*|(|\<theta\>,\<zeta\>,\<sigma\><around*|(|\<theta\>,\<zeta\>|)>|)><around*|[|\<phi\><rprime|'>|]>|<right|\||2>><rsup|2><frac|<dd>\<theta\><dd>\<zeta\>|<around*|\||\<Theta\>|\|>>|)><rsup|<frac|1|2>>>>>>>>>|<row|<cell|\<lesssim\>A<around*|<left|\<\|\|\>|2>|<1><rsub|E><Emb><around*|[|f|]>|<right|\<\|\|\>|2>><rsub|<SL|><rsup|<around|(|\<infty\>,\<infty\>|)>><rsub|\<Theta\>>\<Phi\><rsub|10<gr>><rsup|N-6><around*|(|T|)>>,>>>>>
    </equation*>

    with the upper bound taken over <math|<around*|\<\|\|\>|\<phi\><rprime|'>|\<\|\|\>><rsub|\<Phi\><rsup|N-5><rsub|2<rsup|5><gr>>>\<leq\>1>.
    To bound the term <math|<mrm|III>> we integrate by parts

    <\equation*>
      <ltae|<tformat|<cwith|1|1|1|1|cell-halign|l>|<table|<row|<cell|<big|int><rsub|\<Theta\>\<times\>B<rsub|1>><big|int><rsub|\<sigma\><around*|(|\<theta\>,\<zeta\>|)>><rsup|<mf|<wide|b|~>><rsup|\<ast\>><rsub|+><around*|(|\<zeta\>|)>><wpD><rsub|\<zeta\>><around*|(|\<theta\>|)>F<rsup|\<ast\>><rsub|T><around*|(|\<theta\>,\<zeta\>,\<rho\>|)><around*|[|\<phi\>|]><around*|(|<big|int><rsub|\<sigma\><around*|(|\<theta\>,\<zeta\>|)>><rsup|\<rho\>>\<rho\><rprime|'><dd><rsub|\<zeta\>><wide|<wpD><rsub|\<zeta\>><around*|(|\<theta\>|)>F<rsup|\<ast\>><rsub|T><around*|(|\<theta\>,\<zeta\>,\<rho\><rprime|'>|)><around*|[|\<phi\><rsup|l><rsub|\<theta\>>|]>|\<bar\>><frac|<dd>\<rho\><rprime|'>|\<rho\><rprime|'>>|)><frac|<dd>\<rho\>|\<rho\>><frac|<dd>\<theta\><dd>\<zeta\>|<around*|\||\<Theta\>|\|>>>>|<row|<cell|<space|1em>=-<mrm|IV>-<mrm|V>-<mrm|VI>,>>>>>
    </equation*>

    where

    <\equation*>
      <tabular|<tformat|<cwith|1|1|1|1|cell-halign|l>|<cwith|3|3|1|1|cell-halign|l>|<table|<row|<cell|<mrm|IV><eqd><ltae|<tformat|<table|<row|<cell|<big|int><rsub|\<Theta\>\<times\>B<rsub|1>><big|int><rsub|\<sigma\><around*|(|\<theta\>,\<zeta\>|)>><rsup|<mf|<wide|b|~>><rsup|\<ast\>><rsub|+><around*|(|\<theta\>,\<zeta\>|)>><ltae|<tformat|<table|<row|<cell|<wpD><rsub|\<zeta\>><around*|(|\<theta\>|)><rsup|2>F<rsup|\<ast\>><around*|(|\<theta\>,\<zeta\>,\<rho\>|)><around*|[|\<phi\>|]>>>|<row|<cell|<space|1em>\<times\><around*|<left|(|-1>|<big|int><rsub|\<sigma\><around*|(|\<theta\>,\<zeta\>|)>><rsup|\<rho\>><frac|\<rho\><rprime|'>|\<rho\>><wide|<wpD><rsub|\<zeta\>><around*|(|\<theta\>|)>F<rsup|\<ast\>><rsub|T><around*|(|\<theta\>,\<zeta\>,\<rho\><rprime|'>|)><around*|[|\<phi\><rsup|l><rsub|\<theta\>>|]>|\<bar\>><frac|<dd>\<rho\><rprime|'>|\<rho\><rprime|'>>|<right|)|-1>><frac|<dd>\<rho\>|\<rho\>><frac|<dd>\<theta\><dd>\<zeta\>|<around*|\||\<Theta\>|\|>>>>>>>>>>>>>>|<row|<cell|<mrm|V><eqd><big|int><rsub|\<Theta\>\<times\>B<rsub|1>><ltae|<tformat|<table|<row|<cell|<dd><rsub|\<zeta\>><mf|<wide|b|~>><rsup|\<ast\>><rsub|+><around*|(|\<theta\>,\<zeta\>|)>
      <wpD><rsub|\<zeta\>><around*|(|\<theta\>|)>F<rsup|\<ast\>><around*|(|\<theta\>,\<zeta\>,<mf|<wide|b|~>><rsup|\<ast\>><rsub|+><around*|(|\<theta\>,\<zeta\>|)>|)><around*|[|\<phi\>|]>>>|<row|<cell|<space|1em>\<times\><around*|(|<big|int><rsub|\<sigma\><around*|(|\<theta\>,\<zeta\>|)>><rsup|<mf|<wide|b|~>><rsup|\<ast\>><rsub|+><around*|(|\<theta\>,\<zeta\>|)>><frac|\<rho\><rprime|'>|<mf|<wide|b|~>><rsup|\<ast\>><rsub|+><around*|(|\<theta\>,\<zeta\>|)>><wide|F<rsup|\<ast\>><rsub|T><around*|(|\<theta\>,\<zeta\>,\<rho\><rprime|'>|)><around*|[|\<phi\><rsup|l><rsub|\<theta\>>|]>|\<bar\>><frac|<dd>\<rho\><rprime|'>|\<rho\><rprime|'>>|)><frac|<dd>\<theta\><dd>\<zeta\>|<around*|\||\<Theta\>|\|>>,>>>>>>>|<row|<cell|<mrm|VI><eqd><big|int><rsub|\<Theta\>\<times\>B<rsub|1>><ltae|<tformat|<table|<row|<cell|<around*|(|<big|int><rsub|\<sigma\><around*|(|\<theta\>,\<zeta\>|)>><rsup|<mf|<wide|b|~>><rsup|\<ast\>><rsub|+><around*|(|\<theta\>,\<zeta\>|)>><wpD><rsub|\<zeta\>><around*|(|\<theta\>|)>F<rsup|\<ast\>><rsub|T><around*|(|\<theta\>,\<zeta\>,\<rho\>|)><around*|[|\<phi\>|]><frac|<dd>\<rho\>|\<rho\>>|)>>>|<row|<cell|<space|1em>\<times\><around*|<left|(|2>|<dd><rsub|\<zeta\>>\<sigma\><around*|(|\<theta\>,\<zeta\>|)><wide|F<rsup|\<ast\>><rsub|T><around*|(|\<theta\>,\<zeta\>,\<sigma\><around*|(|\<theta\>,\<zeta\>|)>|)><around*|[|\<phi\><rsup|l><rsub|\<theta\>>|]>|\<bar\>>|<right|)|2>><frac|<dd>\<theta\><dd>\<zeta\>|<around*|\||\<Theta\>|\|>>.>>>>>>>>>>
    </equation*>

    For the term <math|<mrm|IV>> we have\ 

    <\equation*>
      <around*|\||<math|<mrm|IV>>|\|><ltae|<tformat|<table|<row|<cell|\<lesssim\><ltae|<tformat|<table|<row|<cell|sup<rsub|\<phi\>><ltae|<tformat|<table|<row|<cell|>>>>><around*|(|<big|int><rsub|\<Theta\>\<times\>B<rsub|1>><big|int><rsub|\<sigma\><around*|(|\<theta\>,\<zeta\>|)>><rsup|<mf|<wide|b|~>><rsup|\<ast\>><rsub|+><around*|(|\<zeta\>|)>><around*|<left|\||2>|<wpD><rsub|\<zeta\>><around*|(|\<theta\>|)>F<rsup|\<ast\>><rsub|T><around*|(|\<theta\>,\<zeta\>,\<rho\>|)><around*|[|\<phi\>|]>|<right|\||2>><rsup|2><frac|<dd>\<rho\>|\<rho\>><frac|<dd>\<theta\><dd>\<zeta\>|<around*|\||\<Theta\>|\|>>|)><rsup|<frac|1|2>>>>|<row|<cell|<space|1em>\<times\>sup<rsub|\<phi\><rprime|'>><around*|(|<big|int><rsub|\<Theta\>\<times\>B<rsub|1>><around*|\||<big|int><rsub|\<sigma\><around*|(|\<theta\>,\<zeta\>|)>><rsup|\<rho\>><frac|\<rho\><rprime|'>|\<rho\>><wide|<wpD><rsub|\<zeta\>><around*|(|\<theta\>|)>F<rsup|\<ast\>><rsub|T><around*|(|\<theta\>,\<zeta\>,\<rho\><rprime|'>|)><around*|[|\<phi\><rprime|'>|]>|\<bar\>><frac|<dd>\<rho\><rprime|'>|\<rho\><rprime|'>>|\|><rsup|2><frac|<dd>\<theta\><dd>\<zeta\>|<around*|\||\<Theta\>|\|>>|)><rsup|<frac|1|2>>>>>>>>>|<row|<cell|\<lesssim\><around*|<left|\<\|\|\>|2>|<1><rsub|E><Emb><around*|[|f|]>|<right|\<\|\|\>|2>><rsub|<SL|><rsup|<around|(|2,2|)>><rsub|\<Theta\>>\<Phi\><rsup|N-5><rsub|2<rsup|5><gr>><around*|(|T|)>><rsup|2>,>>>>>
    </equation*>

    with the upper bound taken over <math|<around*|\<\|\|\>|\<phi\>|\<\|\|\>><rsub|\<Phi\><rsup|N-5><rsub|2<rsup|5><gr>>>\<leq\>1>
    and <math|<around*|\<\|\|\>|\<phi\><rprime|'>|\<\|\|\>><rsub|\<Phi\><rsup|N-5><rsub|2<rsup|5><gr>>>\<leq\>1>;
    we used Young's convolution inequality in the multiplicative variable
    <math|\<rho\><rprime|'>> to bound the second factor. For the term
    <math|<mrm|V>>, since <math|<around*|\||<dd><rsub|\<zeta\>><mf|<wide|b|~>><rsup|\<ast\>><rsub|+><around*|(|\<theta\>,\<zeta\>|)>|\|>\<leq\>1>,
    we have that\ 

    <\equation*>
      <around*|\||<math|<mrm|V>>|\|><ltae|<tformat|<table|<row|<cell|\<lesssim\><ltae|<tformat|<table|<row|<cell|sup<rsub|\<phi\>><ltae|<tformat|<table|<row|<cell|>>>>><around*|(|<big|int><rsub|\<Theta\>\<times\>B<rsub|1>><around*|<left|\||2>|<wpD><rsub|\<zeta\>><around*|(|\<theta\>|)>F<rsup|\<ast\>><around*|(|\<theta\>,\<zeta\>,<mf|<wide|b|~>><rsup|\<ast\>><rsub|+><around*|(|\<theta\>,\<zeta\>|)>|)><around*|[|\<phi\>|]>|<right|\||2>><rsup|2><frac|<dd>\<theta\><dd>\<zeta\>|<around*|\||\<Theta\>|\|>>|)><rsup|<frac|1|2>>>>|<row|<cell|<space|1em>\<times\>sup<rsub|\<phi\><rprime|'>><around*|(|<big|int><rsub|\<Theta\>\<times\>B<rsub|1>><around*|<left|\||-1>|<big|int><rsub|\<sigma\><around*|(|\<theta\>,\<zeta\>|)>><rsup|<mf|<wide|b|~>><rsup|\<ast\>><rsub|+><around*|(|\<theta\>,\<zeta\>|)>><frac|\<rho\><rprime|'>|<mf|<wide|b|~>><rsup|\<ast\>><rsub|+><around*|(|\<theta\>,\<zeta\>|)>><wide|F<rsup|\<ast\>><rsub|T><around*|(|\<theta\>,\<zeta\>,\<rho\><rprime|'>|)><around*|[|\<phi\><rprime|'>|]>|\<bar\>><frac|<dd>\<rho\><rprime|'>|\<rho\><rprime|'>>|<right|\||-1>><rsup|2><frac|<dd>\<theta\><dd>\<zeta\>|<around*|\||\<Theta\>|\|>>|)><rsup|<frac|1|2>>>>>>>>>|<row|<cell|\<lesssim\><around*|<left|\<\|\|\>|2>|<1><rsub|E><Emb><around*|[|f|]>|<right|\<\|\|\>|2>><rsub|<SL|><rsup|<around|(|2,2|)>><rsub|\<Theta\>>\<Phi\><rsub|10<gr>><rsup|N-6><around*|(|T|)>><rsup|2>,>>>>>
    </equation*>

    with the upper bounds taken over <math|<around*|\<\|\|\>|\<phi\>|\<\|\|\>><rsub|\<Phi\><rsup|N-5><rsub|2<rsup|5><gr>>>\<leq\>1>
    and <math|<around*|\<\|\|\>|\<phi\><rprime|'>|\<\|\|\>><rsub|\<Phi\><rsup|N-5><rsub|2<rsup|5><gr>>>\<leq\>1>.
    Finally, for the term <math|<mrm|VI>>, we have\ 

    <\equation*>
      <around*|\||<mrm|VI>|\|><ltae|<tformat|<table|<row|<cell|\<lesssim\><ltae|<tformat|<table|<row|<cell|<around*|(|<big|int><rsub|\<Theta\>\<times\>B<rsub|1>><around*|\||<big|int><rsub|\<sigma\><around*|(|\<theta\>,\<zeta\>|)>><rsup|<mf|<wide|b|~>><rsup|\<ast\>><rsub|+><around*|(|\<theta\>,\<zeta\>|)>><wpD><rsub|\<zeta\>><around*|(|\<theta\>|)>F<rsup|\<ast\>><rsub|T><around*|(|\<theta\>,\<zeta\>,\<rho\>|)><around*|[|\<phi\>|]><frac|<dd>\<rho\>|\<rho\>>|\|><rsup|2><frac|<dd>\<theta\><dd>\<zeta\>|<around*|\||\<Theta\>|\|>>|)><rsup|1/2>>>|<row|<cell|<space|1em>\<times\><around*|(|<big|int><rsub|\<Theta\>\<times\>B<rsub|1>><around*|<left|\||2>|<dd><rsub|\<zeta\>>\<sigma\><around*|(|\<theta\>,\<zeta\>|)><wide|F<rsup|\<ast\>><rsub|T><around*|(|\<theta\>,\<zeta\>,\<sigma\><around*|(|\<theta\>,\<zeta\>|)>|)><around*|[|\<phi\><rsup|l><rsub|\<theta\>>|]>|\<bar\>>|<right|\||2>><rsup|2><frac|<dd>\<theta\><dd>\<zeta\>|<around*|\||\<Theta\>|\|>>|)><rsup|<frac|1|2>>>>>>>>>|<row|<cell|\<lesssim\>A<around*|<left|\<\|\|\>|2>|<1><rsub|E><Emb><around*|[|f|]>|<right|\<\|\|\>|2>><rsub|<SL|><rsup|<around|(|\<infty\>,\<infty\>|)>><rsub|\<Theta\>>\<Phi\><rsup|N-5><rsub|2<rsup|5><gr>><around*|(|T|)>>,>>>>>
    </equation*>

    since <math|<around*|\||<dd><rsub|\<zeta\>>\<sigma\><around*|(|\<theta\>,\<zeta\>|)>|\|>\<leq\>1>.
    We have shown that

    <\equation*>
      A<rsup|2>\<lesssim\><around*|\||<mrm|I>|\|>+<around*|\||<mrm|II>|\|>+<around*|\||<mrm|IV>|\|>+<around*|\||<mrm|V>|\|>+<around*|\||<mrm|VI>|\|>\<lesssim\>A
      <RHS|<eqref|eq:tree-SIO-size>>+<RHS|<eqref|eq:tree-SIO-size>><rsup|2>
    </equation*>

    and thus we have reached our goal of showing
    <eqref|eq:SIO-proof-stopped-explicit> with <math|N<rprime|'>=5>.\ 

    It remains to show that decomposition
    <eqref|eq:SIO-proof-phi-decomposition> holds. Fix
    <math|<FT|\<omega\>>\<in\>C<rsup|\<infty\>><rsub|c><around*|(|B<rsub|1>|)>>
    to be even, real-valued with <math|<FT|\<omega\>><around*|(|<FT|z>|)>=1>
    on <math|B<rsub|7/8>>; set <math|\<omega\><rsub|<gr>><around*|(|z|)><eqd><gr>\<omega\><around*|(|<gr>z|)>\<in\>\<Phi\><rsup|\<infty\>><rsub|8<gr>>>
    and let\ 

    <\equation*>
      <ltae|<tformat|<table|<row|<cell|U<rsub|-><around*|(|\<theta\>|)><eqd><big|int><rsub|<R>><1><rsub|<around*|(|-\<infty\>,0|)>><around*|(|<FT|z>-\<theta\>|)><around*|(|-2\<pi\>i<around*|(|<FT|z>-\<theta\>|)>|)><rsup|2N+100><FT|\<omega\><rsub|<gr>>><around*|(|<FT|z>|)><dd><FT|z>,>>|<row|<cell|U<rsub|+><around*|(|\<theta\>|)><eqd><big|int><rsub|<R>><1><rsub|<around*|(|0,+\<infty\>|)>><around*|(|<FT|z>-\<theta\>|)><around*|(|-2\<pi\>i<around*|(|<FT|z>-\<theta\>|)>|)><rsup|2N+100><FT|\<omega\><rsub|<gr>>><around*|(|<FT|z>|)><dd><FT|z>;>>>>>
    </equation*>

    there exists <math|U<rsub|min>\<gtr\>0> such that
    <math|U<rsub|-><around*|(|\<theta\>|)>\<gtr\>U<rsub|min>> for all
    <math|\<theta\>\<in\>\<Theta\>> and <math|U<rsub|+><around*|(|\<theta\>|)>\<gtr\>U<rsub|min>>
    for all <math|0\<less\>\<theta\>\<less\>5<gr>> since
    <math|<FT|\<omega\><rsub|<gr>>><around*|(|<FT|z>|)>=1> for
    <math|5<gr>\<less\><FT|z>\<less\>6<gr>>. Set\ 

    <\equation*>
      <FT|\<phi\><rsup|l><rsub|\<theta\>>><around*|(|<FT|z>|)><eqd><ltae|<tformat|<table|<row|<cell|<frac|<big|int><rsub|-\<infty\>><rsup|\<theta\>><FT|\<phi\>><around*|(|<FT|w>|)><dd><FT|w>|U<rsub|-><around*|(|\<theta\>|)>><1><rsub|<around*|(|-\<infty\>,0|)>><around*|(|<FT|z>-\<theta\>|)><space|0.6spc><around*|(|-2\<pi\>i<around*|(|<FT|z>-\<theta\>|)>|)><rsup|2N+99><FT|\<omega\><rsub|<gr>>><around*|(|<FT|z>|)>>>|<row|<cell|+<frac|<big|int><rsub|\<theta\>><rsup|+\<infty\>><FT|\<phi\>><around*|(|<FT|w>|)><dd><FT|w>|U<rsub|+><around*|(|\<theta\>|)>><1><rsub|<around*|(|0,+\<infty\>|)>><around*|(|<FT|z>-\<theta\>|)><space|0.6spc><around*|(|-2\<pi\>i<around*|(|<FT|z>-\<theta\>|)>|)><rsup|2N+99><FT|\<omega\><rsub|<gr>>><around*|(|<FT|z>|)>.>>>>>
    </equation*>

    Note that <math|<FT|\<phi\><rsup|l><rsub|\<theta\>>><around*|(|<FT|z>|)>>
    is well defined since <math|U<rsub|+><around*|(|\<theta\>|)>=0> only if
    <math|\<theta\>\<gtr\>5<gr>> while <math|<big|int><rsub|\<theta\>><rsup|+\<infty\>><FT|\<phi\>><around*|(|<FT|w>|)><dd><FT|w>=0>
    for <math|\<theta\>\<gtr\>4<gr>>. It follows that so that
    <math|<around*|\<\|\|\>|\<phi\><rsup|l><rsub|\<theta\>><around*|(|z|)>|\<\|\|\>><rsub|\<Phi\><rsup|2N+10><rsub|8<gr>>>\<lesssim\>1>
    and\ 

    <\equation*>
      <big|int><rsub|<R>><around*|(|-2\<pi\>i<around*|(|<FT|z>-\<theta\>|)>|)><FT|\<phi\><rsup|l><rsub|\<theta\>>><around*|(|<FT|z>|)>=<big|int><rsub|-\<infty\>><rsup|\<theta\>><FT|\<phi\>><around*|(|<FT|w>|)><dd><FT|w>+<big|int><rsub|\<theta\>><rsup|+\<infty\>><FT|\<phi\>><around*|(|<FT|w>|)><dd><FT|w>=\<phi\><around*|(|0|)>.<space|2em>
    </equation*>

    To conclude the decomposition we define
    <math|\<phi\><rsup|o><rsub|\<theta\>><around*|(|z|)>> to satisfy

    <\equation*>
      z <around*|(|-d<rsub|z>+2 \<pi\> i \<theta\>|)>\<phi\><rsup|o><rsub|\<theta\>><around*|(|z|)><eqd>\<phi\><around*|(|z|)>-<around*|(|-d<rsub|z>+2
      \<pi\> i \<theta\>|)>\<phi\><rsup|l><rsub|\<theta\>><around*|(|z|)>.
    </equation*>

    Taking the Fourier transform, this is tantamount to

    <\equation*>
      <dd><rsub|<FT|z>><around*|(|<around*|(|<FT|z>-\<theta\>|)><FT|\<phi\>><rsup|o><rsub|\<theta\>><around*|(|<FT|z>|)>|)>=<FT|\<phi\>><around*|(|<FT|z>|)>-<around*|(|-2\<pi\>i<around*|(|<FT|z>-\<theta\>|)>|)><FT|\<phi\><rsup|l><rsub|\<theta\>>><around*|(|<FT|z>|)>.
    </equation*>

    Since <math|\<phi\>\<in\>\<Phi\><rsub|8<gr>><rsup|N>> then
    <math|\<phi\><around*|(|<FT|z>|)>-<around*|(|-2\<pi\>i<around*|(|<FT|z>-\<theta\>|)>|)>\<phi\><rsup|l><rsub|\<theta\>><around*|(|<FT|z>|)>\<in\>\<Phi\><rsub|8<gr>><rsup|N>>
    and

    <\equation*>
      <FT|z>\<mapsto\><big|int><rsub|-\<infty\>><rsup|<FT|z>><FT|\<phi\>><around*|(|<FT|w>|)>-<around*|(|-2\<pi\>i<around*|(|<FT|w>-\<theta\>|)>|)><FT|\<phi\><rsup|l><rsub|\<theta\>>><around*|(|<FT|w>|)><dd><FT|w>\<in\>C<rsup|N+1><rsub|c><around*|(|B<rsub|8<gr>>|)>
    </equation*>

    with\ 

    <\equation*>
      <big|int><rsub|-\<infty\>><rsup|\<theta\>><FT|\<phi\>><around*|(|<FT|z>|)>-<around*|(|-2\<pi\>i<around*|(|<FT|z>-\<theta\>|)>|)><FT|\<phi\><rsup|l><rsub|\<theta\>>><around*|(|<FT|z>|)><dd><FT|z>=<big|int><rsub|\<theta\>><rsup|+\<infty\>><FT|\<phi\>><around*|(|<FT|z>|)>-<around*|(|-2\<pi\>i<around*|(|<FT|z>-\<theta\>|)>|)><FT|\<phi\><rsup|l><rsub|\<theta\>>><around*|(|<FT|z>|)><dd><FT|z>=0.
    </equation*>

    It follows that

    <\equation*>
      <FT|\<phi\>><rsup|o><rsub|\<theta\>><around*|(|<FT|z>|)>=<frac|<big|int><rsub|-\<infty\>><rsup|<FT|z>><FT|\<phi\>><around*|(|<FT|w>|)>-<around*|(|-2\<pi\>i<around*|(|<FT|w>-\<theta\>|)>|)><FT|\<phi\><rsup|l><rsub|\<theta\>>><around*|(|<FT|w>|)><dd><FT|w>|<FT|z>-\<theta\>>\<in\>C<rsup|N><rsub|c><around*|(|B<rsub|8<gr>>|)>
    </equation*>

    i.e. that <math|\<phi\><rsup|o><rsub|\<theta\>>\<in\>\<Phi\><rsup|N><rsub|8<gr>>>
    with <math|<around*|\<\|\|\>|\<phi\><rsup|o><rsub|\<theta\>>|\<\|\|\>><rsub|\<Phi\><rsup|N><rsub|8<gr>>>\<lesssim\>1<rsub|>>.
    This concludes the proof of <eqref|eq:SIO-proof-phi-decomposition>.

    Next, we show bound <eqref|eq:SIO-proof-stopped-explicit> for general
    <math|\<sigma\>\<suchthat\>\<Theta\>\<times\>B<rsub|1>\<rightarrow\><R><rsub|+>>,
    assuming that it holds for <math|\<sigma\>\<suchthat\>\<Theta\>\<times\>B<rsub|1>\<rightarrow\><R><rsub|+>>
    with \ <math|<around*|\||<dd><rsub|\<zeta\>>\<sigma\><around*|(|\<theta\>,\<zeta\>|)>|\|><rsub|>\<leq\>1>.\ 

    <with|font-series|bold|Sub-case of general
    <math|\<sigma\>\<suchthat\>\<Theta\>\<times\>B<rsub|1>\<rightarrow\><R><rsub|+>>:>
    We clear the meaning of the terms <math|<math-up|I>,<math-up|II>,<math-up|III>,<math-up|IV>>
    from the previous discussion. For the sake of this argument, assume that
    <math|\<zeta\>\<geq\>0>; the case <math|\<zeta\>\<less\>0> is handled
    symmetrically. We also assume that <math|\<sigma\><around*|(|\<theta\>,\<zeta\>|)>\<in\>><math|<around*|<left|(|1>|C<rsup|2>
    <mf|<wide|b|~>><rsup|\<ast\>><rsub|-><around*|(|\<theta\>,\<zeta\>|)>,C<rsup|-2><mf|<wide|b|~>><rsup|\<ast\>><rsub|+><around*|(|\<theta\>,\<zeta\>|)>|<right|)|1>>>
    for some large <math|C\<geq\>1> and we limit ourselves to showing that\ 

    <\equation>
      <label|eq:SIO-proof-stopped-explicit:scale-fix><around*|\<\|\|\>|<big|int><rsub|\<sigma\><around*|(|\<theta\>,\<zeta\>|)>><rsup|<wide|<mf|b>|~><rsup|\<ast\>><rsub|+><around*|(|\<theta\>,\<zeta\>|)>/C><wpD><rsub|\<zeta\>><around*|(|\<theta\>|)>F<rsup|\<ast\>><rsub|T><around*|(|\<theta\>,\<zeta\>,\<rho\>|)><around*|[|\<phi\>|]><frac|\<mathd\>\<rho\>|\<rho\>>|\<\|\|\>><rsub|L<rsup|2><rsub|<frac|<dd>\<theta\><dd>\<zeta\>|<around*|\||\<Theta\>|\|>>><around*|(|\<Theta\>\<times\>B<rsub|1>|)>>\<lesssim\><RHS|<eqref|eq:SIO-proof-stopped-explicit>>.
    </equation>

    This can be done since\ 

    <\equation*>
      <ltae|<tformat|<cwith|2|2|1|1|cell-halign|l>|<table|<row|<cell|<around*|<left|\<\|\|\>|-1>|<around*|<left|(|-2>|<big|int><rsub|C<rsup|-1><mf|<wide|b|~>><rsup|\<ast\>><rsub|+><around*|(|\<theta\>,\<zeta\>|)>><rsup|<wide|<mf|b>|~><rsup|\<ast\>><rsub|+><around*|(|\<theta\>,\<zeta\>|)>>+<big|int><rsub|<mf|<wide|b|~>><rsup|\<ast\>><rsub|-><around*|(|\<theta\>,\<zeta\>|)>><rsup|C<wide|<mf|b>|~><rsup|\<ast\>><rsub|-><around*|(|\<theta\>,\<zeta\>|)>>|<right|)|-2>><around*|<left|\||2>|<wpD><rsub|\<zeta\>><around*|(|\<theta\>|)>F<rsup|\<ast\>><rsub|T><around*|(|\<theta\>,\<zeta\>,\<rho\>|)><around*|[|\<phi\>|]>|<right|\||2>><frac|\<mathd\>\<rho\>|\<rho\>>|<right|\<\|\|\>|-1>><rsub|L<rsup|2><rsub|<frac|<dd>\<theta\><dd>\<zeta\>|<around*|\||\<Theta\>|\|>>><around*|(|\<Theta\>\<times\>B<rsub|1>|)>>>>|<row|<cell|<space|1em>\<lesssim\>
      <around*|<left|\<\|\|\>|1>|<1><rsub|E><Emb><around*|[|f|]>|<right|\<\|\|\>|1>><rsub|<SL><rsup|<around*|(|\<infty\>,\<infty\>|)>><rsub|\<Theta\>>\<Phi\><rsub|4<gr>><rsup|N-4<rsup|>>>.>>>>>
    </equation*>

    In particular, the discussion below is relevant only for those
    <math|<around*|(|\<theta\>,\<zeta\>|)>> for which if <math|
    <mf|<wide|b|~>><rsup|\<ast\>><rsub|-><around*|(|\<theta\>,\<zeta\>|)>\<less\>C<rsup|-4><mf|<wide|b|~>><rsup|\<ast\>><rsub|+><around*|(|\<theta\>,\<zeta\>|)>>.
    We decompose the integrand in <math|<LHS|<eqref|eq:SIO-proof-stopped-explicit:scale-fix>>>
    into the sum\ 

    <\equation*>
      <big|int><rsub|\<sigma\><around*|(|\<theta\>,\<zeta\>|)>><rsup|<wide|<mf|b>|~><rsup|\<ast\>><rsub|+><around*|(|\<theta\>,\<zeta\>|)>/C><wpD><rsub|\<zeta\>><around*|(|\<theta\>|)>F<rsup|\<ast\>><rsub|T><around*|(|\<theta\>,\<zeta\>,\<rho\>|)><around*|[|\<phi\>|]><frac|<dd>\<rho\>|\<rho\>>=<math-up|I><around*|(|\<theta\>,\<zeta\>|)>+<math-up|II><around*|(|\<theta\>,\<zeta\>|)>-<math-up|III><around*|(|\<theta\>,\<zeta\>|)>+<math-up|IV><around*|(|\<theta\>,\<zeta\>|)>
    </equation*>

    with

    <\equation*>
      <ltae|<tformat|<table|<row|<cell|<math-up|I><around*|(|\<theta\>,\<zeta\>|)>\<assign\><big|int><rsub|\<sigma\><around*|(|\<theta\>,\<zeta\>|)>><rsup|C<rsup|-1><wide|<mf|b>|~><rsup|\<ast\>><rsub|+><around*|(|\<theta\>,\<zeta\>|)>><ltae|<tformat|<table|<row|<cell|<around*|(|<wpD><rsub|\<zeta\>><around*|(|\<theta\>|)>F<rsup|\<ast\>><rsub|T><around*|(|\<theta\>,\<zeta\>,\<rho\>|)><around*|[|\<phi\>|]><frac|\<mathd\>\<rho\>|\<rho\>>|\<nobracket\>>>>|<row|<cell|<space|1em><around*|\<nobracket\>|-<around*|<left|(|-1>|<frac|C|\<sigma\><around*|(|\<theta\>,\<zeta\>|)>><big|int><rsub|\<zeta\>-C<rsup|-1>\<sigma\><around*|(|\<theta\>,\<zeta\>|)>><rsup|\<zeta\>><wpD><rsub|\<zeta\>><around*|(|\<theta\>|)>F<rsup|\<ast\>><rsub|T><around*|(|\<theta\>,\<zeta\><rprime|'>,\<rho\>|)><around*|[|\<phi\>|]>\<mathd\>\<zeta\><rprime|'>|<right|)|-1>>
      |)><frac|\<mathd\>\<rho\>|\<rho\>>,>>>>>>>|<row|<cell|<math-up|II><around*|(|\<theta\>,\<zeta\>|)>\<assign\><frac|C|\<sigma\><around*|(|\<theta\>,\<zeta\>|)>><big|int><rsub|\<zeta\>-C<rsup|-1>\<sigma\><around*|(|\<theta\>,\<zeta\>|)>><rsup|\<zeta\>><big|int><rsub|C<rsup|-1><mf|<wide|b|~>><rsup|\<ast\>><rsub|+><around*|(|\<theta\>,\<zeta\><rprime|'>|)>><rsup|C<rsup|-1><mf|<wide|b|~>><rsup|\<ast\>><rsub|+><around*|(|\<theta\>,\<zeta\>|)>><wpD><rsub|\<zeta\>><around*|(|\<theta\>|)>F<rsup|\<ast\>><rsub|T><around*|(|\<theta\>,\<zeta\><rprime|'>,\<rho\><rprime|'>|)><around*|[|\<phi\>|]><frac|\<mathd\>\<rho\><rprime|'>|\<rho\><rprime|'>>\<mathd\>\<zeta\><rprime|'>,>>|<row|<cell|<math-up|III><around*|(|\<theta\>,\<zeta\>|)>\<assign\><frac|C|\<sigma\><around*|(|\<theta\>,\<zeta\>|)>><big|int><rsub|\<zeta\>-C<rsup|-1>\<sigma\><around*|(|\<theta\>,\<zeta\>|)>><rsup|\<zeta\>><big|int><rsub|C<wide|<mf|b>|~><rsup|\<ast\>><rsub|-><around*|(|\<theta\>,\<zeta\><rprime|'>|)>><rsup|\<sigma\><around*|(|\<theta\>,\<zeta\>|)>><wpD><rsub|\<zeta\>><around*|(|\<theta\>|)>F<rsup|\<ast\>><rsub|T><around*|(|\<theta\>,\<zeta\><rprime|'>,\<rho\><rprime|'>|)><around*|[|\<phi\>|]><frac|\<mathd\>\<rho\><rprime|'>|\<rho\><rprime|'>>\<mathd\>\<zeta\><rprime|'>,>>|<row|<cell|<math-up|IV><around*|(|\<theta\>,\<zeta\>|)>\<assign\><frac|C|\<sigma\><around*|(|\<theta\>,\<zeta\>|)>><big|int><rsub|\<zeta\>-C<rsup|-1>\<sigma\><around*|(|\<theta\>,\<zeta\>|)>><rsup|\<zeta\>><big|int><rsub|C<wide|<mf|b>|~><rsup|\<ast\>><rsub|-><around*|(|\<theta\>,\<zeta\><rprime|'>|)>><rsup|C<rsup|-1><mf|<wide|<mf|b>|~>><rsup|\<ast\>><rsub|+><around*|(|\<theta\>,\<zeta\><rprime|'>|)>><wpD><rsub|\<zeta\>><around*|(|\<theta\>|)>F<rsup|\<ast\>><rsub|T><around*|(|\<theta\>,\<zeta\><rprime|'>,\<rho\><rprime|'>|)><around*|[|\<phi\>|]><frac|\<mathd\>\<rho\><rprime|'>|\<rho\><rprime|'>>\<mathd\>\<zeta\><rprime|'>.>>>>>
    </equation*>

    For <math|<math-up|II><around*|(|\<theta\>,\<zeta\>|)>> we adopt the
    convention that

    <\equation*>
      <big|int><rsub|C<rsup|-1><mf|<wide|b|~>><rsup|\<ast\>><rsub|+><around*|(|\<theta\>,\<zeta\><rprime|'>|)>><rsup|C<rsup|-1><mf|<wide|b|~>><rsup|\<ast\>><rsub|+><around*|(|\<theta\>,\<zeta\>|)>><wpD><rsub|\<zeta\>><around*|(|\<theta\>|)>F<rsup|\<ast\>><rsub|T><around*|(|\<theta\>,\<zeta\><rprime|'>,\<rho\>|)><around*|[|\<phi\>|]><frac|\<mathd\>\<rho\>|\<rho\>>=-<big|int><rsub|C<rsup|-1><mf|<wide|b|~>><rsup|\<ast\>><rsub|+><around*|(|\<theta\>,\<zeta\>|)>><rsup|C<rsup|-1><mf|<wide|b|~>><rsup|\<ast\>><rsub|+><around*|(|\<theta\>,\<zeta\><rprime|'>|)>><wpD><rsub|\<zeta\>><around*|(|\<theta\>|)>F<rsup|\<ast\>><rsub|T><around*|(|\<theta\>,\<zeta\><rprime|'>,\<rho\>|)><around*|[|\<phi\>|]><frac|\<mathd\>\<rho\>|\<rho\>>
    </equation*>

    if <math|><math|<mf|<wide|b|~>><rsup|\<ast\>><rsub|+><around*|(|\<theta\>,\<zeta\>|)>\<less\><mf|<wide|b|~>><rsup|\<ast\>><rsub|+><around*|(|\<theta\>,\<zeta\><rprime|'>|)>>.
    In the expressions above, the function <math|F<rsup|\<ast\>><rsub|T>> is
    always evaluated in points in <math|E<rsup|\<ast\>>>. As a matter of
    fact, let <math|<around*|(|\<theta\>,\<zeta\>|)>\<in\>\<Theta\>\<times\><around*|(|0,1|)>>
    and <math|\<zeta\><rprime|'>\<in\><around*|(|\<zeta\>-C<rsup|-1>\<sigma\><around*|(|\<theta\>,\<zeta\>|)>,\<zeta\>|)>>,
    and recall that <math|<around*|\||<dd><rsub|\<zeta\>><wide|<mf|b>|~><rsup|\<ast\>><rsub|-><around*|(|\<theta\>,\<zeta\>|)>|\|>\<less\>1>,
    <math|<around*|\||<dd><rsub|\<zeta\>><wide|<mf|b>|~><rsup|\<ast\>><rsub|+><around*|(|\<theta\>,\<zeta\>|)>|\|>\<less\>1>,
    and that <math|\<sigma\><around*|(|\<theta\>,\<zeta\>|)>\<in\><around*|<left|(|1>|C<rsup|2>
    <mf|<wide|b|~>><rsup|\<ast\>><rsub|-><around*|(|\<theta\>,\<zeta\>|)>,C<rsup|-2><mf|<wide|b|~>><rsup|\<ast\>><rsub|+><around*|(|\<theta\>,\<zeta\>|)>|<right|)|1>>>.
    For the first summand in <math|<math-up|I><around*|(|\<theta\>,\<zeta\>|)>>
    we trivially have

    <\equation*>
      <mf|><wide|<mf|b>|~><rsup|\<ast\>><rsub|-><around*|(|\<theta\>,\<zeta\>|)>\<less\>\<sigma\><around*|(|\<theta\>,\<zeta\>|)>\<leq\>\<rho\>\<less\><wide|<mf|b>|~><rsup|\<ast\>><rsub|+><around*|(|\<theta\>,\<zeta\>|)>.
    </equation*>

    We have that <math|>

    <\equation*>
      <ltae|<tformat|<table|<row|<cell|<mf|<wide|b|~>><rsup|\<ast\>><rsub|+><around*|(|\<theta\>,\<zeta\><rprime|'>|)>\<less\><wide|<mf|b>|~><rsup|\<ast\>><rsub|+><around*|(|\<theta\>,\<zeta\>|)>+C<rsup|-1>\<sigma\><around*|(|\<theta\>,\<zeta\>|)>\<less\><around*|(|1+C<rsup|-3>|)><wide|<mf|b>|~><rsup|\<ast\>><rsub|+><around*|(|\<theta\>,\<zeta\>|)>,>>|<row|<cell|<mf|<wide|b|~>><rsup|\<ast\>><rsub|+><around*|(|\<theta\>,\<zeta\><rprime|'>|)>\<gtr\><wide|<mf|b>|~><rsup|\<ast\>><rsub|+><around*|(|\<theta\>,\<zeta\>|)>-C<rsup|-1>\<sigma\><around*|(|\<theta\>,\<zeta\>|)>\<gtr\><around*|(|1-C<rsup|-3>|)><wide|<mf|b>|~><rsup|\<ast\>><rsub|+><around*|(|\<theta\>,\<zeta\>|)>.>>>>>
    </equation*>

    This implies that <math|C<rsup|-1><mf|<wide|b|~>><rsup|\<ast\>><rsub|+><around*|(|\<theta\>,\<zeta\>|)>\<less\><wide|<mf|b>|~><rsup|\<ast\>><rsub|+><around*|(|\<theta\>,\<zeta\><rprime|'>|)>>.
    Using the inequalities above we also get

    <\equation*>
      <wide|<mf|b>|~><rsup|\<ast\>><rsub|-><around*|(|\<theta\>,\<zeta\><rprime|'>|)><ltae|<tformat|<table|<row|<cell|\<less\><wide|<mf|b>|~><rsup|\<ast\>><rsub|-><around*|(|\<theta\>,\<zeta\>|)>+C<rsup|-1>\<sigma\><around*|(|\<theta\>,\<zeta\>|)>\<less\><around*|(|C<rsup|-2>+C<rsup|-1>|)>\<rho\>>>|<row|<cell|\<less\>C<rsup|-1><around*|(|C<rsup|-2>+C<rsup|-1>|)><mf|<wide|b|~>><rsup|\<ast\>><rsub|+><around*|(|\<theta\>,\<zeta\>|)>\<less\>C<rsup|-2><frac|<around*|(|1+C<rsup|-1>|)>|<around*|(|1-C<rsup|-3>|)>><mf|<wide|b|~>><rsup|\<ast\>><rsub|+><around*|(|\<theta\>,\<zeta\><rprime|'>|)>>>>>>
    </equation*>

    thereby proving our claim about <math|F<rsup|\<ast\>><rsub|T>> in the
    term <math|<math-up|II><around*|(|\<theta\>,\<zeta\>|)>>. Since

    <\equation*>
      \<sigma\><around*|(|\<theta\>,\<zeta\>|)>\<gtr\>C<rsup|2><wide|<mf|b>|~><rsup|\<ast\>><rsub|-><around*|(|\<theta\>,\<zeta\>|)>\<gtr\>C<rsup|2><wide|<mf|b>|~><rsup|\<ast\>><rsub|-><around*|(|\<theta\>,\<zeta\><rprime|'>|)>-C<rsup|2>C<rsup|-1>\<sigma\><around*|(|\<theta\>,\<zeta\>|)>
    </equation*>

    we get that

    <\equation*>
      \<sigma\><around*|(|\<theta\>,\<zeta\>|)>\<gtr\><frac|C<rsup|2>|1+C><wide|<mf|b>|~><rsup|\<ast\>><rsub|-><around*|(|\<theta\>,\<zeta\><rprime|'>|)>
    </equation*>

    proving our claim about <math|F<rsup|\<ast\>><rsub|T>> in the term
    <math|<math-up|III><around*|(|\<theta\>,\<zeta\>|)>>. Finally, note that

    <\equation*>
      C<wide|<mf|b>|~><rsup|\<ast\>><rsub|-><around*|(|\<theta\>,\<zeta\><rprime|'>|)>\<less\>C<rsup|-1><frac|<around*|(|1+C<rsup|-1>|)>|<around*|(|1-C<rsup|-3>|)>><mf|<wide|b|~>><rsup|\<ast\>><rsub|+><around*|(|\<theta\>,\<zeta\><rprime|'>|)>\<less\>C<rsup|-1><around*|(|1+C<rsup|-1>|)><mf|<wide|b|~>><rsup|\<ast\>><rsub|+><around*|(|\<theta\>,\<zeta\><rprime|'>|)>
    </equation*>

    as required by the term <math|<math-up|IV><around*|(|\<theta\>,\<zeta\>|)>>.

    We now proceed to bound the contribution of
    <math|<mrm|I><around*|(|\<theta\>,\<zeta\>|)>>-<math|<mrm|IV><around*|(|\<theta\>,\<zeta\>|)>>.
    For <math|<mrm|I><around*|(|\<theta\>,\<zeta\>|)>> we have that\ 

    <\equation*>
      <ltae|<tformat|<table|<row|<cell|<wpD><rsub|\<zeta\>><around*|(|\<theta\>|)>F<rsup|\<ast\>><rsub|T><around*|(|\<theta\>,\<zeta\>,\<rho\>|)><around*|[|\<phi\>|]>-<frac|C|\<sigma\><around*|(|\<theta\>,\<zeta\>|)>><big|int><rsub|\<zeta\>-C<rsup|-1>\<sigma\><around*|(|\<theta\>,\<zeta\>|)>><rsup|\<zeta\>><wpD><rsub|\<zeta\>><around*|(|\<theta\>|)>F<rsup|\<ast\>><rsub|T><around*|(|\<theta\>,\<zeta\><rprime|'>,\<rho\>|)><around*|[|\<phi\>|]>\<mathd\>\<zeta\><rprime|'>>>|<row|<cell|<space|1em>=<wpD><rsub|\<zeta\>><around*|(|\<theta\>|)>F<rsup|\<ast\>><rsub|T><around*|(|\<theta\>,\<zeta\>,\<rho\><rprime|'>|)><around*|[|\<phi\><rsub|<around*|(|\<theta\>,\<zeta\>|)>>|]>>>>>>
    </equation*>

    with

    <\equation*>
      \<phi\><rsub|<around*|(|\<theta\>,\<zeta\>|)>><eqd><frac|1|\<sigma\><around*|(|\<theta\>,\<zeta\>|)>><big|int><rsub|0><rsup|\<sigma\><around*|(|\<theta\>,\<zeta\>|)>><around*|(|\<phi\>-e<rsup|-2
      \<pi\> i\<theta\><frac|\<zeta\><rprime|''>|\<rho\>>><Tr><rsub|<frac|\<zeta\><rprime|''>|\<rho\>>>\<phi\>|)><dd>\<zeta\><rprime|''>
    </equation*>

    which satisfies <math|<around*|\<\|\|\>|\<phi\><rsub|<around*|(|\<theta\>,\<zeta\>|)>><around*|(|z|)>|\<\|\|\>><rsub|\<Phi\><rsub|<gr>><rsup|N-1>>\<lesssim\><frac|\<sigma\><around*|(|\<theta\>,\<zeta\>|)>|\<rho\>><around*|<left|\<\|\|\>|1>|\<phi\>|<right|\<\|\|\>|1>><rsub|\<Phi\><rsub|<gr>><rsup|N>>>.
    Thus\ 

    <\equation*>
      <around*|<left|\||1>|<math-up|I><around*|(|\<theta\>,\<zeta\>|)>|<right|\||1>><ltae|<tformat|<table|<row|<cell|\<lesssim\><around*|(|<big|int><rsub|\<sigma\><around*|(|\<theta\>,\<zeta\>|)>><rsup|C<rsup|-1><wide|<mf|b>|~><rsup|\<ast\>><rsub|+><around*|(|\<theta\>,\<zeta\>|)>><frac|\<sigma\><around*|(|\<theta\>,\<zeta\>|)>|\<rho\>><frac|<dd>\<rho\>|\<rho\>>
      |)><around*|(|sup<rsub|\<phi\>>sup<rsub|\<rho\><rprime|'>\<in\><around*|[|0,1|]>><around*|<left|\||2>|<1><rsub|E<rsup|*\<ast\>><rsub|T>>F<rsup|\<ast\>><rsub|T><around*|(|\<theta\>,\<zeta\>,\<rho\><rprime|'>|)><around*|[|\<phi\>|]>|<right|\||2>>|)>>>|<row|<cell|\<lesssim\>
      <around*|<left|\<\|\|\>|2>|<1><rsub|E><Emb><around*|[|f|]>|<right|\<\|\|\>|2>><rsub|<SL|><rsup|<around|(|\<infty\>,\<infty\>|)>><rsub|\<Theta\>>\<Phi\><rsub|<gr>><rsup|N-1><around*|(|T|)>>,>>>>>
    </equation*>

    where the upper bound is taken over <math|<around*|<left|\<\|\|\>|1>|\<phi\>|<right|\<\|\|\>|1>><rsub|\<Phi\><rsub|1<gr>><rsup|N-1>>\<leq\>1>.
    For <math|<math-up|II><around*|(|\<theta\>,\<zeta\>|)>> we have that

    <\equation*>
      <around*|<left|\||1>|II<around*|(|\<theta\>,\<zeta\>|)>|<right|\||1>><ltae|<tformat|<table|<row|<cell|\<lesssim\><frac|C|\<sigma\><around*|(|\<theta\>,\<zeta\>|)>><big|int><rsub|\<zeta\>-C<rsup|-1>\<sigma\><around*|(|\<theta\>,\<zeta\>|)>><rsup|\<zeta\>><big|int><rsub|C<rsup|-1><mf|b><rsup|\<ast\>><rsub|+><around*|(|\<theta\>,\<zeta\>|)>><rsup|C<rsup|-1><mf|b><rsup|\<ast\>><rsub|+><around*|(|\<theta\>,\<zeta\><rprime|'>|)>>
      <around*|(|sup<rsub|\<phi\>>sup<rsub|\<rho\>\<in\><around*|(|0,1|)>><around*|<left|\||2>|<1><rsub|E<rsup|*\<ast\>><rsub|T>>F<rsup|\<ast\>><rsub|T><around*|(|\<theta\>,\<zeta\><rprime|'>,\<rho\><rprime|'>|)><around*|[|\<phi\>|]>|<right|\||2>>|)><frac|<dd>\<rho\><rprime|'>|\<rho\><rprime|'>><dd>\<zeta\><rprime|'>>>|<row|<cell|\<lesssim\><around*|<left|\<\|\|\>|2>|<1><rsub|E><Emb><around*|[|f|]>|<right|\<\|\|\>|2>><rsub|<SL|><rsup|<around|(|\<infty\>,\<infty\>|)>><rsub|\<Theta\>>\<Phi\><rsub|<gr>><rsup|N-1><around*|(|T|)>>,>>>>>
    </equation*>

    where the upper bound taken over <math|<around*|\<\|\|\>|\<phi\>|\<\|\|\>><rsub|\<Phi\><rsub|1<gr>><rsup|N-1>>\<leq\>1>.
    We used that

    <\equation*>
      <frac|1|<around*|(|1+C<rsup|-3>|)>>\<less\><frac|<mf|<wide|b|~>><rsup|\<ast\>><rsub|+><around*|(|\<theta\>,\<zeta\><rprime|'>|)>|<mf|<wide|b|~>><rsup|\<ast\>><rsub|+><around*|(|\<theta\>,\<zeta\>|)>>\<less\><around*|(|1+C<rsup|-3>|)>.
    </equation*>

    For <math|<math-up|III><around*|(|\<theta\>,\<zeta\>|)>> we have (see
    <eqref|eq:embedded-no-defect>) that

    <\equation*>
      <wpD><rsub|\<zeta\>><around*|(|\<theta\>|)>F<rsup|\<ast\>><rsub|T><around*|(|\<theta\>,\<zeta\><rprime|'>,\<rho\><rprime|'>|)><around*|[|\<phi\>|]>=\<rho\><rprime|'><dd><rsub|\<zeta\><rprime|'>>F<rsup|\<ast\>><around*|(|\<theta\>,\<zeta\><rprime|'>,\<rho\><rprime|'>|)><around*|[|\<phi\>|]>
    </equation*>

    so we integrate by parts to obtain that

    <\equation*>
      <math-up|III><around*|(|\<theta\>,\<zeta\>|)><ltae|<tformat|<cwith|2|2|1|1|cell-halign|l>|<table|<row|<cell|=<frac|C|\<sigma\><around*|(|\<theta\>,\<zeta\>|)>><big|int><rsub|\<zeta\>-C<rsup|-1>\<sigma\><around*|(|\<theta\>,\<zeta\>|)>><rsup|\<zeta\>><big|int><rsub|C<wide|<mf|b>|~><rsup|\<ast\>><rsub|-><around*|(|\<theta\>,\<zeta\><rprime|'>|)>><rsup|\<sigma\><around*|(|\<theta\>,\<zeta\>|)>>\<rho\><rprime|'><dd><rsub|\<zeta\><rprime|'>>F<rsup|\<ast\>><rsub|T><around*|(|\<theta\>,\<zeta\><rprime|'>,\<rho\><rprime|'>|)><around*|[|\<phi\>|]><frac|\<mathd\>\<rho\><rprime|'>|\<rho\><rprime|'>>\<mathd\>\<zeta\><rprime|'>>>|<row|<cell|=<ltae|<tformat|<table|<row|<cell|C<big|int><rsub|C<wide|<mf|b>|~><rsup|\<ast\>><rsub|-><around*|(|\<theta\>,\<zeta\><rprime|'>|)>><rsup|\<sigma\><around*|(|\<theta\>,\<zeta\>|)>><frac|\<rho\><rprime|'>|\<sigma\><around*|(|\<theta\>,\<zeta\>|)>>
      <around*|<left|(|2>|F<rsup|\<ast\>><around*|(|\<theta\>,\<zeta\>,\<rho\><rprime|'>|)><around*|[|\<phi\>|]>-F<rsup|\<ast\>><around*|(|\<theta\>,\<zeta\>-C<rsup|-1>\<sigma\><around*|(|\<theta\>,\<zeta\>|)>,\<rho\><rprime|'>|)>|<right|)|2>><frac|\<mathd\>\<rho\><rprime|'>|\<rho\><rprime|'>>>>|<row|<cell|+<frac|C|\<sigma\><around*|(|\<theta\>,\<zeta\>|)>><big|int><rsub|\<zeta\>-C<rsup|-1>\<sigma\><around*|(|\<theta\>,\<zeta\>|)>><rsup|\<zeta\>><dd><rsub|\<zeta\><rprime|'>><wide|<mf|b>|~><rsup|\<ast\>><rsub|-><around*|(|\<theta\>,\<zeta\><rprime|'>|)>
      F<rsup|\<ast\>><around*|(|\<theta\>,\<zeta\><rprime|'>,<wide|<mf|b>|~><rsup|\<ast\>><rsub|-><around*|(|\<zeta\><rprime|'>|)>|)><around*|[|\<phi\>|]>\<mathd\>\<zeta\><rprime|'>>>>>>>>>>>
    </equation*>

    Since <math|<around*|\||<dd><rsub|\<zeta\><rprime|'>><wide|<mf|b>|~><rsup|\<ast\>><rsub|-><around*|(|\<theta\>,\<zeta\><rprime|'>|)>|\|>\<leq\>1>
    it holds that

    <\equation*>
      <around*|\||<math-up|III><around*|(|\<theta\>,\<zeta\>|)>|\|>\<leq\><around*|<left|\<\|\|\>|2>|<1><rsub|E><Emb><around*|[|f|]>|<right|\<\|\|\>|2>><rsub|<SL|><rsup|<around|(|\<infty\>,\<infty\>|)>><rsub|\<Theta\>>\<Phi\><rsub|<gr>><rsup|N><around*|(|T|)>>.
    </equation*>

    It remains to deal with the term <math|<math-up|IV><around*|(|\<theta\>,\<zeta\>|)>>.
    Up to an application of the Hardy-Littlewood maximal function,
    <math|<math-up|IV><around*|(|\<theta\>,\<zeta\>|)>> can be compared with
    the original quantity <math|<LHS|<eqref|eq:SIO-proof-stopped-explicit>>>
    but with <math|\<sigma\><around*|(|\<theta\>,\<zeta\>|)>=<mf|<wide|b|~><rsub|-><around*|(|\<theta\>,\<zeta\>|)>>>,
    a case we have addressed previously. More explicitly, it follows directly
    from the expression of <math|<math-up|IV><around*|(|\<theta\>,\<zeta\>|)>>
    that

    <\equation*>
      <around*|\||<math-up|IV><around*|(|\<theta\>,\<zeta\>|)>|\|>\<leq\><HLM><around*|<left|(|2>|<wide|<math-up|IV>|~><around*|(|\<theta\>,\<cdot\>|)>|<right|)|2>><around*|(|\<zeta\>|)>
    </equation*>

    where\ 

    <\equation*>
      <wide|<math-up|IV>|~><around*|(|\<theta\>,\<zeta\><rprime|'>|)>=<big|int><rsub|C<mf|<wide|b|~>><rsup|\<ast\>><rsub|-><around*|(|\<theta\>,\<zeta\>|)>><rsup|C<rsup|-1><mf|<wide|b|~>><rsup|\<ast\>><rsub|+><around*|(|\<theta\>,\<zeta\>|)>><wpD><rsub|\<zeta\>><around*|(|\<theta\>|)>F<rsup|\<ast\>><around*|(|\<theta\>,\<zeta\><rprime|'>,\<rho\><rprime|'>|)><around*|[|\<phi\>|]><frac|\<mathd\>\<rho\><rprime|'>|\<rho\><rprime|'>>
    </equation*>

    so, using the boundedness of the Hardy-Littlewood maximal function
    <math|M> on <math|L<rsup|2>>, we need to show that\ 

    <\equation*>
      <around*|<left|\<\|\|\>|2>|<wide|<math-up|IV>|~><around*|(|\<theta\>,\<zeta\>|)>|<right|\<\|\|\>|2>><rsub|L<rsup|2><rsub|<frac|<dd>\<theta\><dd>\<zeta\>|<around*|\||\<Theta\>|\|>>><around*|(|\<Theta\>\<times\>B<rsub|1>|)>>\<lesssim\><RHS|<eqref|eq:tree-SIO-size>>.
    </equation*>

    It holds that

    <\equation*>
      <around*|<left|\<\|\|\>|2>|<wide|<math-up|IV>|~><around*|(|\<theta\>,\<zeta\>|)>|<right|\<\|\|\>|2>><rsub|L<rsup|2><rsub|<frac|<dd>\<theta\><dd>\<zeta\>|<around*|\||\<Theta\>|\|>>><around*|(|\<Theta\>\<times\>B<rsub|1>|)>><ltae|<tformat|<table|<row|<cell|\<lesssim\><ltae|<tformat|<table|<row|<cell|<around*|\<\|\|\>|<big|int><rsub|<mf|<wide|b|~>><rsup|\<ast\>><rsub|-><around*|(|\<theta\>,\<zeta\>|)>><rsup|<mf|<wide|b|~><rsup|\<ast\>><rsub|+><around*|(|\<theta\>,\<zeta\>|)>>><wpD><rsub|\<zeta\>><around*|(|\<theta\>|)>F<rsup|\<ast\>><rsub|T><around*|(|\<theta\>,\<zeta\>,\<rho\>|)><around*|[|\<phi\>|]><frac|<dd>\<rho\>|\<rho\>><rsub|>|\<\|\|\>><rsub|L<rsup|2><rsub|<frac|<dd>\<theta\><dd>\<zeta\>|<around*|\||\<Theta\>|\|>>><around*|(|\<Theta\>\<times\>B<rsub|1>|)>>>>|<row|<cell|+<around*|<left|\<\|\|\>|2>|<1><rsub|E><Emb><around*|[|f|]>|<right|\<\|\|\>|2>><rsub|<SL|><rsup|<around|(|\<infty\>,\<infty\>|)>><rsub|\<Theta\>>\<Phi\><rsub|<gr>><rsup|N><around*|(|T|)>>.>>>>>>>>>>
    </equation*>

    Using bound <eqref|eq:SIO-proof-stopped-explicit> with
    <math|\<sigma\><around*|(|\<theta\>,\<zeta\>|)>=<mf|<wide|b|~>><rsup|\<ast\>><rsub|-><around*|(|\<theta\>,\<zeta\>|)>>,
    that we already proved, we conclude the proof.\ 

    <with|font-series|bold|Case <math|u\<in\><around*|[|1,\<infty\>|)>>:>

    We have shown that <math|<eqref|eq:tree-SIO-size>> holds for <math|u=2>.
    If <math|u\<in\><around*|[|1,2|)>> bound <math|<eqref|eq:tree-SIO-size>>
    follows by the Hölder inequality since the integral in <math|\<zeta\>>
    and <math|\<theta\>> are taken over sets of bounded measure. We now fix
    <math|u\<in\><around*|(|2,\<infty\>|)>> and prove the
    <math|<eqref|eq:tree-SIO-size>> using an induction on scales argument.\ 

    Suppose we have shown that <math|<eqref|eq:tree-SIO-size>> holds for any
    fixed <math|V<rsup|\<pm\>><rsup|>\<in\><DD><rsub|1><rsup|\<cup\>>>, for
    any <math|W<rsup|\<pm\>>\<in\>\<bbb-T\><rsub|\<Theta\>><rsup|\<cup\>>>,
    and for all <math|T\<in\><TT><rsub|\<Theta\>>> with
    <math|s<rsub|T>\<less\>S> for some <math|S\<gtr\>0>, with the implicit
    constant being <math|C<rsub|u>> depending only on <math|u> and
    <math|\<Theta\>>. We will show that <math|<eqref|eq:tree-SIO-size>> also
    holds with the same constant <math|C<rsub|u>> for those same
    <math|V<rsup|\<pm\>><rsup|><rsup|>>, and any
    <math|W<rsup|\<pm\>>\<in\>\<bbb-T\><rsub|\<Theta\>><rsup|\<cup\>>>, and
    all <math|T\<in\><TT><rsub|\<Theta\>>> with
    <math|s<rsub|T>\<less\>C<rsub|<mrm|step>> S> for some
    <math|C<rsub|<mrm|step>>\<gtr\>1>. This is sufficient to conclude that
    <math|<eqref|eq:tree-SIO-size>> holds for all
    <math|T\<in\><TT><rsub|\<Theta\>>>. As a matter of fact, first fix
    <math|\<varepsilon\>\<gtr\>0>; for any fixed
    <math|V<rsup|->\<supset\><around*|<left|{|1>|<around*|(|\<eta\>,y,t|)>:t\<less\>\<varepsilon\>|<right|}|1>>>
    bound <eqref|eq:tree-SIO-size> holds trivially for
    <math|s<rsub|T>\<less\>S\<less\>\<varepsilon\>> and thus, by induction,
    <math|<eqref|eq:tree-SIO-size>> holds for all
    <math|T\<in\><TT><rsub|\<Theta\>>>. Since the implicit constant in
    <eqref|eq:tree-SIO-size> is independent of <math|\<varepsilon\>\<gtr\>0>,
    we can pass to the limit and conclude that <eqref|eq:tree-SIO-size> holds
    for any <math|V<rsup|\<pm\>>>, as required.

    We will determine the constants <math|C<rsub|u>\<gtr\>1> and
    <math|C<rsub|<mrm|step>>\<gtr\>1> at the end of this proof. By symmetry
    (identity <eqref|eq:size-symmetry> and subsequent discussion), without
    loss of generality we can suppose that the inductive claim holds with
    some <math|S\<gtr\>C<rsub|<mrm|step>><rsup|-1>> and that we need to show
    <eqref|eq:tree-SIO-size> for <math|T=T<rsub|\<Theta\>><around*|(|0,0,1|)>>.
    Let

    <\equation*>
      <mf|F><rsub|T><around*|(|\<zeta\>|)><eqd>
      <around*|<left|(|-1>|<big|int><rsub|\<Theta\>>sup<rsub|\<sigma\>\<gtr\>0><around*|<left|\||-1>|<big|int><rsub|\<sigma\>><rsup|1><around*|(|<1><rsub|E<rsup|\<ast\>>><wpD><rsub|\<zeta\>><around*|(|\<theta\>|)>F<rsup|\<ast\>><rsub|T>|)><around*|(|\<theta\>,\<zeta\>,\<rho\>|)><around*|[|\<phi\>|]><frac|<dd>\<rho\>|\<rho\>>|<right|\||-1>><rsup|2><frac|<dd>\<theta\>|<around*|\||\<Theta\>|\|>>|<right|)|-1>><rsup|<frac|1|2>>
    </equation*>

    with some fixed <math|\<phi\>\<in\>\<Phi\><rsub|<gr>><rsup|\<infty\>>>
    with <math|<around*|\<\|\|\>|\<phi\>|\<\|\|\>><rsub|\<Phi\><rsub|<gr>><rsup|N>>\<leq\>1>.
    We need to show that\ 

    <\equation*>
      <big|int><rsub|B<rsub|1>><mf|F><rsub|T><around*|(|\<zeta\>|)><rsup|u><dd>\<zeta\>\<leq\>C<rsub|u><rsup|u><RHS|<eqref|eq:tree-SIO-size>><rsup|u>.
    </equation*>

    Since <eqref|eq:tree-SIO-size> holds for <math|u=2> we have that\ 

    <\equation*>
      <around*|\<\|\|\>|<mf|<mf|F>><around*|(|\<zeta\>|)>|\<\|\|\>><rsub|L<rsup|2><around*|(|B<rsub|1>|)>>\<leq\>C<rsub|2><RHS|<eqref|eq:tree-SIO-size>>
    </equation*>

    \ We separate <math|B<rsub|1>> into a part where
    <math|<mf|F><around*|(|\<zeta\>|)>> is bounded and an exceptional set

    <\equation*>
      <ms|M><eqd><around*|<left|{|2>|<rigid|>\<zeta\>\<suchthat\><HLM><mf|F><around*|(|\<zeta\>|)>\<geq\>C<rsub|<HLM>><rsup|2><around*|\<\|\|\>|<mf|<mf|F>><around*|(|\<zeta\>|)>|\<\|\|\>><rsub|L<rsup|2><around*|(|B<rsub|1>|)>>|<right|}|2>>
    </equation*>

    for some arbitrarily large <math|C<rsub|<HLM>>\<gg\>1> to be chosen
    later. <math|<ms|M>> is open and can be represented as
    <math|<ms|M>=<big|cup><rsub|n\<in\><N>>B<rsub|s<rsub|n>><around*|(|x<rsub|n>|)>>
    with pairwise disjoint <math|B<rsub|s<rsub|n>><around*|(|x<rsub|n>|)>>.
    Let us set <math|<mf|<wide|b|~>><rsub|+,n><rsup|\<ast\>><around*|(|\<zeta\>|)><eqd>10s<rsub|n>-<around*|\||\<zeta\>-x<rsub|n>|\|>>
    so that <math|9s<rsub|n>\<less\><mf|<wide|b|~>><rsub|+,n><around*|(|\<zeta\>|)>\<leq\>10s<rsub|n><rsub|>>
    on <math|B<rsub|s<rsub|n>><around*|(|x<rsub|n>|)>>. It holds that
    <math|<big|sum><rsub|n\<in\><N>>2s<rsub|n>\<leq\>C<rsub|M><rsup|-1>> as
    long as <math|C<rsub|<HLM>>> is chosen larger than the weak
    <math|L<rsup|1>> operator norm bound on the Hardy-Littlewood maximal
    function. We can now write that

    <\equation>
      <label|eq:SIO:stopping-time-decomp><mf|F><around*|(|\<zeta\>|)><rsup|u>\<leq\><1><rsub|B<rsub|1>\<setminus\><ms|M>><around*|(|\<zeta\>|)><mf|F><around*|(|\<zeta\>|)><rsup|u>+2<rsup|u><big|sum><rsub|n\<in\><N>><around*|<left|(|1>|<mf|F><rsup|\<uparrow\>><rsub|n><around*|(|\<zeta\>|)><rsup|u>+<mf|F><rsup|\<downarrow\>><rsub|n><around*|(|\<zeta\>|)><rsup|u>|<right|)|1>>
    </equation>

    where\ 

    <\equation*>
      <ltae|<tformat|<cwith|2|2|1|1|cell-halign|l>|<cwith|1|1|1|1|cell-halign|l>|<table|<row|<cell|<mf|F><rsup|\<uparrow\>><rsub|n><around*|(|\<zeta\>|)><eqd><1><rsub|B<rsub|s<rsub|n>><around*|(|x<rsub|n>|)>><around*|(|\<zeta\>|)><around*|<left|(|-1>|<big|int><rsub|\<Theta\>>sup<rsub|\<sigma\>\<gtr\>9s<rsub|n>><around*|<left|\||-1>|<big|int><rsub|\<sigma\>><rsup|1><around*|(|<1><rsub|E<rsup|\<ast\>>><wpD><rsub|\<zeta\>><around*|(|\<theta\>|)>F<rsup|\<ast\>><rsub|T>|)><around*|(|\<theta\>,\<zeta\>,\<rho\>|)><around*|[|\<phi\>|]><frac|<dd>\<rho\>|\<rho\>>|<right|\||-1>><rsup|2><frac|<dd>\<theta\>|<around*|\||\<Theta\>|\|>>|<right|)|-1>><rsup|<frac|1|2>>,>>|<row|<cell|<mf|F><rsup|\<downarrow\>><rsub|n><around*|(|\<zeta\>|)><eqd><1><rsub|B<rsub|s<rsub|n>><around*|(|x<rsub|n>|)>><around*|(|\<zeta\>|)><around*|<left|(|-1>|<big|int><rsub|\<Theta\>>sup<rsub|\<sigma\>\<less\><mf|<wide|b|~>><rsub|+,n><rsup|\<ast\>><around*|(|\<zeta\>|)>><around*|<left|\||-1>|<big|int><rsub|\<sigma\>><rsup|10s<rsub|n>><around*|(|<1><rsub|E<rsup|\<ast\>>><wpD><rsub|\<zeta\>><around*|(|\<theta\>|)>F<rsup|\<ast\>><rsub|T>|)><around*|(|\<theta\>,\<zeta\>,\<rho\>|)><around*|[|\<phi\>|]><frac|<dd>\<rho\>|\<rho\>>|<right|\||-1>><rsup|2><frac|<dd>\<theta\>|<around*|\||\<Theta\>|\|>>|<right|)|-1>><rsup|<frac|1|2>>.>>>>>
    </equation*>

    We aim at showing\ 

    <\equation>
      <label|eq:SIO:induction-step><big|int><rsub|B<rsub|1>><mf|F><around*|(|\<zeta\>|)><rsup|u><dd>\<zeta\>\<leq\>
      <around*|(|1+2<rsup|u>|)><around*|(|C<rsub|M><rsup|2>C<rsub|2><rsup|u>+2C<rsub|M><rsup|><around*|(|1+C<rsub|2><rsup|u>|)>+C<rsub|M><rsup|-1>C<rsub|u>|)>
      <RHS|<eqref|eq:tree-SIO-size>><rsup|u>,
    </equation>

    which implies that \ 

    <\equation*>
      <big|int><rsub|B<rsub|1>><mf|F><around*|(|\<zeta\>|)><rsup|u><dd>\<zeta\>\<leq\>C<rsub|u><RHS|<eqref|eq:tree-SIO-size>><rsup|u>,
    </equation*>

    as required, as long as <math|C<rsub|M>\<geq\>2<around*|(|1+2<rsup|u>|)>>
    and <math|C<rsub|u>\<geq\>2<around*|(|1+2<rsup|u>|)><around*|<left|(|1>|C<rsub|M><rsup|2>C<rsub|2><rsup|u>+2C<rsub|M><rsup|><around*|(|1+C<rsub|2><rsup|u>|)>|<right|)|1>>>.
    We now show <eqref|eq:SIO:induction-step> by bounding integrals of terms
    in <eqref|eq:SIO:stopping-time-decomp>.

    The term <math|<1><rsub|B<rsub|1>\<setminus\><ms|M>><around*|(|\<zeta\>|)><mf|F><around*|(|\<zeta\>|)><rsup|u>>
    on <RHS|<eqref|eq:SIO:stopping-time-decomp>> satisfies

    <\equation*>
      <big|int><rsub|B<rsub|1>\<setminus\><ms|M>><mf|F><around*|(|\<zeta\>|)><rsup|u><dd>\<zeta\>\<leq\>C<rsub|<HLM>><rsup|2><around*|\<\|\|\>|<mf|<mf|F>><around*|(|\<zeta\>|)>|\<\|\|\>><rsub|L<rsup|2><around*|(|B<rsub|1>|)>>\<leq\>
      C<rsub|<HLM>><rsup|2>C<rsub|2><rsup|u><RHS|<eqref|eq:tree-SIO-size>><rsup|u>,
    </equation*>

    having assumed that <eqref|eq:tree-SIO-size> holds for <math|u=2> and
    since <math|<mf|F><around*|(|\<zeta\>|)>\<leq\><HLM><mf|F><around*|(|\<zeta\>|)>\<leq\>C<rsub|<HLM>><rsup|2><around*|\<\|\|\>|<mf|<mf|F>>|\<\|\|\>><rsub|L<rsup|2><around*|(|B<rsub|1>|)>>>
    outside <math|<ms|M>>.\ 

    For the term <math|<big|sum><rsub|n\<in\><N>><mf|F><rsup|\<uparrow\>><rsub|n><around*|(|\<zeta\>|)><rsup|u>>
    on <RHS|<eqref|eq:SIO:stopping-time-decomp>> we will show that\ 

    <\equation*>
      <big|int><rsub|B<rsub|1>><big|sum><rsub|n\<in\><N>><mf|F><rsup|\<uparrow\>><rsub|n><around*|(|\<zeta\>|)><rsup|u><dd>\<zeta\>=<big|sum><rsub|n\<in\><N>><big|int><rsub|B<rsub|s<rsub|n>><around*|(|x<rsub|n>|)>><mf|F><rsup|\<uparrow\>><rsub|n><around*|(|\<zeta\>|)><rsup|u><dd>\<zeta\>\<leq\>C<rsub|M><rsup|2>C<rsub|\<uparrow\>>
      C<rsub|2> <RHS|<eqref|eq:tree-SIO-size>><rsup|u>
    </equation*>

    for some fixed <math|C<rsub|\<uparrow\>>\<gtr\>1> by showing that for
    each <math|n\<in\><N>> we have

    <\equation*>
      <big|int><rsub|B<rsub|s<rsub|n>><around*|(|x<rsub|n>|)>><mf|F><rsup|\<uparrow\>><rsub|n><around*|(|\<zeta\>|)><rsup|u><dd>\<zeta\>\<leq\>
      s<rsub|n>C<rsub|M><rsup|2>C<rsub|2>C<rsub|\<uparrow\>>
      \ <RHS|<eqref|eq:tree-SIO-size>><rsup|u>
    </equation*>

    and using that \ <math|<big|sum><rsub|n\<in\><N>>2s<rsub|n>\<leq\>C<rsub|M><rsup|-1>>,
    i.e. the boundedness of the Hardy Littlewood maximal function. Let us use
    this to compare <math|<mf|F><rsup|\<uparrow\>><rsub|n><around*|(|\<zeta\>|)>>
    with <math|<mf|F><rsup|\<uparrow\>><rsub|n><around*|(|\<zeta\><rprime|'>|)>>
    for any <math|\<zeta\>,\<zeta\><rprime|'>\<in\>B<rsub|s<rsub|n>><around*|(|x<rsub|n>|)>>.
    We have

    \;

    <\equation>
      <label|eq:SIO-proof-Fup-comparison><ltae|<tformat|<table|<row|<cell|<mf|F><rsup|\<uparrow\>><rsub|n><around*|(|\<zeta\>|)>-<mf|F><rsup|\<uparrow\>><rsub|n><around*|(|\<zeta\><rprime|'>|)>=<ltae|<tformat|<table|<row|<cell|<around*|<left|(|-1>|<big|int><rsub|\<Theta\>>sup<rsub|\<sigma\>\<gtr\>9s<rsub|n>><around*|<left|\||-1>|<big|int><rsub|\<sigma\>><rsup|1><around*|(|<1><rsub|E<rsup|\<ast\>><rsub|T>><wpD><rsub|\<zeta\>><around*|(|\<theta\>|)>F<rsup|\<ast\>><rsub|T>|)><around*|(|\<theta\>,\<zeta\>,\<rho\>|)><around*|[|\<phi\><rsub|>|]><frac|<dd>\<rho\>|\<rho\>>|<right|\||-1>><rsup|2><frac|<dd>\<theta\>|<around*|\||\<Theta\>|\|>>|<right|)|-1>><rsup|<frac|1|2>>>>|<row|<cell|-<around*|<left|(|-1>|<big|int><rsub|\<Theta\>>sup<rsub|\<sigma\>\<gtr\>9s<rsub|n>><around*|<left|\||-1>|<big|int><rsub|\<sigma\>><rsup|1><around*|(|<1><rsub|E<rsup|\<ast\>><rsub|T>><wpD><rsub|\<zeta\>><around*|(|\<theta\>|)>F<rsup|\<ast\>><rsub|T>|)><around*|(|\<theta\>,\<zeta\><rprime|'>,\<rho\>|)><around*|[|\<phi\><rsub|>|]><frac|<dd>\<rho\>|\<rho\>>|<right|\||-1>><rsup|2><frac|<dd>\<theta\>|<around*|\||\<Theta\>|\|>>|<right|)|-1>><rsup|<frac|1|2>>>>>>>>>|<row|<cell|\<leq\><ltae|<tformat|<table|<row|<cell|2<around*|(|<big|int><rsub|\<Theta\>><around*|(|<big|int><rsub|9s<rsub|n>><rsup|1><rsub|><rsup|>|\<nobracket\>>|\<nobracket\>><ltae|<tformat|<table|<row|<cell|<around*|<left|.>|<around*|\||<1><rsub|E<rsup|\<ast\>><rsub|T>><around*|(|\<theta\>,\<zeta\>,\<rho\>|)>-<1><rsub|E<rsup|\<ast\>><rsub|T>><around*|(|\<theta\>,\<zeta\><rprime|'>,\<rho\>|)>|\|>|<right|\<nobracket\>|1>><around*|<left|(|2>|<around*|\||<around*|(|<1><rsub|E<rsup|\<ast\>><rsub|T>><wpD><rsub|\<zeta\>><around*|(|\<theta\>|)>F<rsup|\<ast\>><rsub|T>|)><around*|(|\<theta\>,\<zeta\>,\<rho\>|)><around*|[|\<phi\><rsub|>|]>|\|>|<right|\<nobracket\>|2>>>>|<row|<cell|<around*|\<nobracket\>|<around*|\<nobracket\>|<space|1em><around*|<left|\<nobracket\>|2>|<around*|<left|.>|+<around*|<left|\||1>|<around*|(|<1><rsub|E<rsup|\<ast\>><rsub|T>><wpD><rsub|\<zeta\>><around*|(|\<theta\>|)>F<rsup|\<ast\>><rsub|T>|)><around*|(|\<theta\>,\<zeta\><rprime|'>,\<rho\>|)><around*|[|\<phi\><rsub|>|]>|<right|\||1>>|<right|)|2>>|<right|)|2>><frac|<dd>\<rho\>|\<rho\>>|)><rsup|2><frac|<dd>\<theta\>|<around*|\||\<Theta\>|\|>>|)><rsup|<frac|1|2>>>>>>>>>|<row|<cell|+2<around*|(|<big|int><rsub|\<Theta\>>sup<rsub|\<sigma\>\<gtr\>9s<rsub|n>>|\<nobracket\>><around*|<left|.>|<around*|(|<big|int><rsub|\<sigma\>><rsup|1><rsub|>|\<nobracket\>>|<right|\<nobracket\>|-1>><ltae|<tformat|<table|<row|<cell|<1><rsub|E<rsup|\<ast\>><rsub|T>><around*|(|\<theta\>,\<zeta\>,\<rho\>|)><1><rsub|E<rsup|\<ast\>><rsub|T>><around*|(|\<theta\>,\<zeta\><rprime|'>,\<rho\>|)><space|0.6spc><around*|<left|\||2>|<around*|<left|.>|<around*|<left|(|1>|<wpD><rsub|\<zeta\>><around*|(|\<theta\>|)>F<rsup|\<ast\>><rsub|T>|<right|)|1>><around*|(|\<theta\>,\<zeta\>,\<rho\>|)><around*|[|\<phi\>|]>|<right|\<nobracket\>|2>>|<right|\<nobracket\>|2>>>>|<row|<cell|<around*|\<nobracket\>|<around*|<left|.>|<space|1em>-<around*|<left|\<nobracket\>|3>|<around*|(|<wpD><rsub|\<zeta\>><around*|(|\<theta\>|)>F<rsup|\<ast\>><rsub|T>|)><wpD><rsub|\<zeta\>><around*|(|\<theta\>|)><around*|(|\<theta\>,\<zeta\><rprime|'>,\<rho\>|)><around*|[|\<phi\>|]>|<right|\||3>><frac|<dd>\<rho\>|\<rho\>>|)><rsup|2><frac|<dd>\<theta\>|<around*|\||\<Theta\>|\|>>|)><rsup|<frac|1|2>>.>>>>>>>>>>>>>>>
    </equation>

    The first term on <RHS|<eqref|eq:SIO-proof-Fup-comparison>> is bounded by

    <\equation*>
      <ltae|<tformat|<table|<row|<cell|sup<rsub|<around*|(|\<theta\>,\<rho\>|)>\<in\>\<Theta\>\<times\><around*|[|9s<rsub|n>,1|]>><around*|<left|(|2>|<around*|\||<around*|(|<1><rsub|E<rsup|\<ast\>><rsub|T>><wpD><rsub|\<zeta\>><around*|(|\<theta\>|)>F<rsup|\<ast\>><rsub|T>|)><around*|(|\<theta\>,\<zeta\>,\<rho\>|)><around*|[|\<phi\><rsub|\<theta\>>|]>|\|>+<around*|\||<around*|(|<1><rsub|E<rsup|\<ast\>><rsub|T>><wpD><rsub|\<zeta\>><around*|(|\<theta\>|)>F<rsup|\<ast\>><rsub|T>|)><around*|(|\<theta\>,\<zeta\><rprime|'>,\<rho\>|)><around*|[|\<phi\>|]>|\|>|<right|)|2>>>>|<row|<cell|<space|1em>\<lesssim\><around*|<left|\<\|\|\>|1>|<1><rsub|E><Emb><around*|[|f|]>|<right|\<\|\|\>|1>><rsub|<SL><rsup|<around*|(|\<infty\>,\<infty\>|)>><rsub|\<Theta\>>\<Phi\><rsub|8<gr>><rsup|N-8<rsup|>>>>>>>>
    </equation*>

    As a matter of fact, for <math|\<theta\>\<in\>\<Theta\>> and any
    <math|\<zeta\>,\<zeta\><rprime|'>\<in\>B<rsub|s<rsub|n>><around*|(|x<rsub|n>|)>>
    the the integral in <math|\<rho\>> is over a single scale:
    <math|<around*|\||<1><rsub|E<rsup|\<ast\>><rsub|T>><around*|(|\<theta\>,\<zeta\>,\<rho\>|)>-<1><rsub|E<rsup|\<ast\>><rsub|T>><around*|(|\<theta\>,\<zeta\><rprime|'>,\<rho\>|)>|\|>\<neq\>0>
    only if <math|<wide|<mf|b>|~><rsup|\<ast\>><rsub|+><around*|(|\<theta\>,\<zeta\>|)>\<wedge\><wide|<mf|b>|~><rsup|\<ast\>><rsub|+><around*|(|\<theta\>,\<zeta\><rprime|'>|)>\<leq\>\<rho\>\<leq\><wide|<mf|b>|~><rsup|\<ast\>><rsub|+><around*|(|\<theta\>,\<zeta\>|)>\<vee\><wide|<mf|b>|~><rsup|\<ast\>><rsub|+><around*|(|\<theta\>,\<zeta\><rprime|'>|)>>
    or <math|<wide|<mf|b>|~><rsup|\<ast\>><rsub|-><around*|(|\<theta\>,\<zeta\>|)>\<wedge\><wide|<mf|b>|~><rsup|\<ast\>><rsub|-><around*|(|\<theta\>,\<zeta\><rprime|'>|)>\<leq\>\<rho\>\<leq\><wide|<mf|b>|~><rsup|\<ast\>><rsub|-><around*|(|\<theta\>,\<zeta\>|)>\<vee\><wide|<mf|b>|~><rsup|\<ast\>><rsub|-><around*|(|\<theta\>,\<zeta\><rprime|'>|)>>.
    Since \ <math|<around*|\||\<zeta\>-\<zeta\><rprime|'>|\|>\<less\>2s<rsub|n>>,
    and <math|><math|<around*|<left|\||1>|<dd><rsub|\<zeta\>><wide|<mf|b>|~><rsup|\<ast\>><rsub|\<pm\>><around*|(|\<theta\>,\<zeta\>|)>|<right|\||1>>\<leq\>1>
    it holds that

    <\equation*>
      <ltae|<tformat|<table|<row|<cell|<big|int><rsub|9s<rsub|n>><rsup|1><rsub|><rsup|><around*|<left|.>|<around*|\||<1><rsub|E<rsup|\<ast\>><rsub|T>><around*|(|\<theta\>,\<zeta\>,\<rho\>|)>-<1><rsub|E<rsup|\<ast\>><rsub|T>><around*|(|\<theta\>,\<zeta\><rprime|'>,\<rho\>|)>|\|>|<right|\<nobracket\>|1>><frac|<dd>\<rho\>|\<rho\>>\<lesssim\>>>|<row|<cell|<space|1em>\<lesssim\><ltae|<tformat|<table|<row|<cell|<1><rsub|<wide|<mf|b>|~><rsup|\<ast\>><rsub|-><around*|(|\<theta\>,\<zeta\>|)>\<wedge\><wide|<mf|b>|~><rsup|\<ast\>><rsub|-><around*|(|\<theta\>,\<zeta\><rprime|'>|)>\<geq\>9s<rsub|n>><rsub|><around*|(|<big|int><rsub|<wide|<mf|b>|~><rsup|\<ast\>><rsub|-><around*|(|\<theta\>,\<zeta\><rprime|'>|)>\<wedge\><wide|<mf|b>|~><rsup|\<ast\>><rsub|-><around*|(|\<theta\>,\<zeta\>|)>><rsup|<wide|<mf|b>|~><rsup|\<ast\>><rsub|-><around*|(|\<theta\>,\<zeta\><rprime|'>|)>\<wedge\><wide|<mf|b>|~><rsup|\<ast\>><rsub|-><around*|(|\<theta\>,\<zeta\>|)>+2s<rsub|n>><rsub|><rsup|><frac|<dd>\<rho\>|\<rho\>>|)>>>|<row|<cell|+<1><rsub|<wide|<mf|b>|~><rsup|\<ast\>><rsub|+><around*|(|\<theta\>,\<zeta\>|)>\<wedge\><wide|<mf|b>|~><rsup|\<ast\>><rsub|+><around*|(|\<theta\>,\<zeta\><rprime|'>|)>\<geq\>9s<rsub|n>><rsub|><around*|(|<big|int><rsub|<wide|<mf|b>|~><rsup|\<ast\>><rsub|-><around*|(|\<theta\>,\<zeta\>|)>\<wedge\><wide|<mf|b>|~><rsup|\<ast\>><rsub|-><around*|(|\<theta\>,\<zeta\><rprime|'>|)>><rsup|<wide|<mf|b>|~><rsup|\<ast\>><rsub|-><around*|(|\<theta\>,\<zeta\>|)>\<wedge\><wide|<mf|b>|~><rsup|\<ast\>><rsub|-><around*|(|\<theta\>,\<zeta\><rprime|'>|)>+2s<rsub|n>><rsub|><rsup|><frac|<dd>\<rho\>|\<rho\>>|)>+<big|int><rsub|9s<rsub|n>><rsup|11s<rsub|n>><rsub|><rsup|><frac|<dd>\<rho\>|\<rho\>>>>>>>>>|<row|<cell|<space|1em>\<lesssim\>1.>>>>>
    </equation*>

    To bound the second summand on <RHS|<eqref|eq:SIO-proof-Fup-comparison>>
    we use that if <math|<around*|(|\<theta\>,\<zeta\>,\<rho\>|)>\<in\>E<rsup|\<ast\>><rsub|T>>
    and <math|<around*|(|\<theta\>,\<zeta\><rprime|'>,\<rho\>|)>\<in\>E<rsup|\<ast\>><rsub|T>>
    then

    <\equation*>
      <wpD><rsub|\<zeta\>><around*|(|\<theta\>|)>F<rsup|\<ast\>><rsub|T><around*|(|\<theta\>,\<zeta\>,\<rho\>|)><around*|[|\<phi\>|]><ltae|<tformat|<table|<row|<cell|=f\<ast\><Dil><rsub|\<rho\>><Mod><rsub|\<theta\>>\<phi\><rsub|\<theta\>><rsup|\<vee\>><around*|(|\<zeta\>|)>=f\<ast\><Tr><rsub|<around*|(|\<zeta\><rprime|'>-\<zeta\>|)>><Dil><rsub|\<rho\>><Mod><rsub|\<theta\>>\<phi\><rsub|\<theta\>><rsup|\<vee\>><around*|(|\<zeta\><rprime|'>|)>>>|<row|<cell|=<wpD><rsub|\<zeta\>><around*|(|\<theta\>|)>F<rsup|\<ast\>><rsub|T><around*|(|\<theta\>,\<zeta\><rprime|'>,\<rho\>|)><around*|<left|[|-1>|e<rsup|2
      \<pi\> i\<theta\><frac|<around*|(|\<zeta\>-\<zeta\><rprime|'>|)>|\<rho\>>><Tr><rsub|<frac|<around*|(|\<zeta\><rprime|'>-\<zeta\>|)>|\<rho\>>>\<phi\>|<right|]|-1>>>>>>>
    </equation*>

    Since

    <\equation*>
      <around*|<left|\<\|\|\>|-1>|e<rsup|2 \<pi\>
      i\<theta\><frac|<around*|(|\<zeta\>-\<zeta\><rprime|'>|)>|\<rho\>>><Tr><rsub|<around*|(|<frac|\<zeta\>-\<zeta\><rprime|'>|\<rho\>>|)>>\<phi\>-\<phi\>|<right|\<\|\|\>|-1>><rsub|\<Phi\><rsub|4<gr>><rsup|N-4>>\<lesssim\><frac|<around*|\||\<zeta\>-\<zeta\><rprime|'>|\|>|\<rho\>><around*|\<\|\|\>|\<phi\>|\<\|\|\>><rsub|\<Phi\><rsub|4<gr>><rsup|N-5>>
    </equation*>

    for <math|<frac|<around*|\||\<zeta\>-\<zeta\><rprime|'>|\|>|\<rho\>>\<lesssim\>1>
    we obtain that

    <\equation*>
      <ltae|<tformat|<table|<row|<cell|<around*|(|<big|int><rsub|\<Theta\>>sup<rsub|\<sigma\>\<gtr\>9s<rsub|n>>|\<nobracket\>><around*|<left|.>|<around*|(|<big|int><rsub|\<sigma\>><rsup|1><rsub|>|\<nobracket\>>|<right|\<nobracket\>|-1>><ltae|<tformat|<table|<row|<cell|<1><rsub|E<rsup|\<ast\>><rsub|T>><around*|(|\<theta\>,\<zeta\>,\<rho\>|)><1><rsub|E<rsup|\<ast\>><rsub|T>><around*|(|\<theta\>,\<zeta\><rprime|'>,\<rho\>|)><space|0.6spc><around*|<left|\||2>|<around*|<left|.>|<around*|<left|(|1>|<wpD><rsub|\<zeta\>><around*|(|\<theta\>|)>F<rsup|\<ast\>><rsub|T>|<right|)|1>><around*|(|\<theta\>,\<zeta\>,\<rho\>|)><around*|[|\<phi\>|]>|<right|\<nobracket\>|2>>|<right|\<nobracket\>|2>>>>|<row|<cell|<around*|\<nobracket\>|<around*|<left|.>|<space|1em>-<around*|<left|\<nobracket\>|3>|<around*|(|<wpD><rsub|\<zeta\>><around*|(|\<theta\>|)>F<rsup|\<ast\>><rsub|T>|)><wpD><rsub|\<zeta\>><around*|(|\<theta\>|)><around*|(|\<theta\>,\<zeta\><rprime|'>,\<rho\>|)><around*|[|\<phi\>|]>|<right|\||3>><frac|<dd>\<rho\>|\<rho\>>|)><rsup|2><frac|<dd>\<theta\>|<around*|\||\<Theta\>|\|>>|)><rsup|<frac|1|2>>.>>>>>>>|<row|<cell|<space|1em><ltae|<tformat|<cwith|2|2|1|1|cell-halign|l>|<table|<row|<cell|\<lesssim\><around*|<left|(|-1>|<big|int><rsub|\<Theta\>><around*|<left|(|-2>|<big|int><rsub|9s<rsub|n>><rsup|1><frac|<around*|\||\<zeta\>-\<zeta\><rprime|'>|\|>|\<rho\>><frac|<dd>\<rho\>|\<rho\>>|<right|)|-2>><rsup|2><frac|<dd>\<theta\>|<around*|\||\<Theta\>|\|>>|<right|)|-1>><rsup|<frac|1|2>><space|0.6spc><around*|<left|\<\|\|\>|2>|<1><rsub|E><Emb><around*|[|f|]>|<right|\<\|\|\>|2>><rsub|<SL|><rsup|<around|(|\<infty\>,\<infty\>|)>><rsub|\<Theta\>>\<Phi\><rsub|4<gr>><rsup|N-5><around*|(|T|)>>>>|<row|<cell|\<lesssim\><around*|<left|\<\|\|\>|2>|<1><rsub|<around*|(|V<rsup|+>\<cap\>W<rsup|+>|)>\<setminus\><around*|(|V<rsup|->\<cup\>W<rsup|-><rsup|>|)>><Emb><around*|[|f|]>|<right|\<\|\|\>|2>><rsub|<SL|><rsup|<around|(|\<infty\>,\<infty\>|)>><rsub|\<Theta\>>\<Phi\><rsub|4<gr>><rsup|N-5><around*|(|T|)>>>>>>>>>>>>
    </equation*>

    where the last bound holds because integration happens over
    <math|\<rho\>\<geq\>s<rsub|n>> and <math|<around*|\||\<zeta\>-\<zeta\><rprime|'>|\|>\<lesssim\>s<rsub|n>>.
    We can now average in <math|\<zeta\>\<in\>B<rsub|s<rsub|n>><around*|(|x<rsub|n>|)>>
    to obtain that\ 

    <\equation*>
      <ltae|<tformat|<cwith|2|2|1|1|cell-halign|l>|<table|<row|<cell|<big|int><rsub|B<rsub|s<rsub|n>><around*|(|x<rsub|n>|)>><mf|F><rsup|\<uparrow\>><rsub|n><around*|(|\<zeta\>|)><rsup|u><dd>\<zeta\>\<leq\><big|int><rsub|B<rsub|s<rsub|n>><around*|(|x<rsub|n>|)>><around*|(|<frac|1|2s<rsub|n>><big|int><rsub|B<rsub|s<rsub|n>><around*|(|x<rsub|n>|)>><around*|<left|(|1>|<around*|\||<mf|F><rsup|\<uparrow\>><rsub|n><around*|(|\<zeta\><rprime|'>|)>|\|>+<around*|\||<mf|F><rsup|\<uparrow\>><rsub|n><around*|(|\<zeta\>|)>-<mf|F><rsup|\<uparrow\>><rsub|n><around*|(|\<zeta\><rprime|'>|)>|\|>|<right|)|1>><dd>\<zeta\><rprime|'>|)><rsup|u><dd>\<zeta\>>>|<row|<cell|<space|1em>\<leq\>s<rsub|n>C<rsub|\<uparrow\>><around*|<left|\<\|\|\>|1>|<1><rsub|E><Emb><around*|[|f|]>|<right|\<\|\|\>|1>><rsub|<SL|><rsup|<around|(|\<infty\>,\<infty\>|)>><rsub|\<Theta\>>\<Phi\><rsub|8<gr>><rsup|N-5><around*|(|T|)>><rsup|u>+s<rsub|n>C<rsub|\<uparrow\>><around*|<left|(|-1>|<frac|1|2s<rsub|n>><big|int><rsub|B<rsub|s<rsub|n>><around*|(|x<rsub|n>|)>><around*|\||<mf|<mf|<mf|F><rsup|>>><rsup|\<uparrow\>><rsub|n><around*|(|\<zeta\><rprime|'>|)>|\|><dd>\<zeta\><rprime|'>|<right|)|-1>><rsup|u>>>>>>
    </equation*>

    for some <math|C<rsub|\<uparrow\>>\<gtr\>0>. By maximality of
    <math|B<rsub|s<rsub|n>><around*|(|x<rsub|n>|)>\<subset\><ms|M>> i.e.
    since <math|x<rsub|n>+s<rsub|n>\<notin\><ms|M>> it holds that\ 

    <\equation*>
      <frac|1|2s<rsub|n>><big|int><rsub|B<rsub|s<rsub|n>><around*|(|x<rsub|n>|)>><around*|\||<mf|<mf|<mf|F><rsup|>>><rsup|\<uparrow\>><rsub|n><around*|(|\<zeta\><rprime|'>|)>|\|><dd>\<zeta\><rprime|'><ltae|<tformat|<table|<row|<cell|\<leq\><frac|1|2s<rsub|n>><big|int><rsub|B<rsub|s<rsub|n>><around*|(|x<rsub|n>|)>><around*|\||<mf|<mf|<mf|F><rsup|>>><around*|(|\<zeta\><rprime|'>|)>|\|><dd>\<zeta\><rprime|'>\<leq\><frac|2|4s<rsub|n>><big|int><rsub|B<rsub|2s<rsub|n>><around*|(|x<rsub|n>+s<rsub|n>|)>><around*|\||<mf|<mf|<mf|F><rsup|>>><around*|(|\<zeta\><rprime|'>|)>|\|><dd>\<zeta\><rprime|'>>>|<row|<cell|\<leq\>2*<HLM><mf|<mf|<mf|F><rsup|>>><around*|(|x<rsub|n>+s<rsub|n>|)>\<leq\>2C<rsub|M><rsup|2><around*|\<\|\|\>|<mf|<mf|<mf|F><rsup|>>>|\<\|\|\>><rsub|L<rsup|2><around*|(|B<rsub|1>|)>>.>>>>>
    </equation*>

    Thus\ 

    <\equation*>
      <big|sum><rsub|n><big|int><rsub|B<rsub|s<rsub|n>><around*|(|x<rsub|n>|)>><mf|F><rsup|\<uparrow\>><rsub|n><around*|(|\<zeta\>|)><rsup|u><dd>\<zeta\><ltae|<tformat|<table|<row|<cell|\<leq\>2*C<rsub|M><rsup|>*C<rsub|\<uparrow\>>*<around*|(|<RHS|<eqref|eq:tree-SIO-size>><rsup|u>+<around*|\<\|\|\>|<mf|<mf|<mf|F><rsup|>>>|\<\|\|\>><rsub|L<rsup|2><around*|(|B<rsub|1>|)>><rsup|u>|)>>>|<row|<cell|\<leq\>2*C<rsub|M><rsup|>*<around*|(|1+C<rsub|2><rsup|u>|)>*<RHS|<eqref|eq:tree-SIO-size>><rsup|u>>>>>>
    </equation*>

    as required.\ 

    Finally, for the term <math|<big|sum><rsub|n\<in\><N>><mf|F><rsup|\<downarrow\>><rsub|n><around*|(|\<zeta\>|)><rsup|u>>
    in <RHS|<eqref|eq:SIO:stopping-time-decomp>> we set
    <math|T<rsub|n>=T<rsub|\<Theta\>><around*|(|0,x<rsub|n>,10 s<rsub|n>|)>>
    and use the induction hypothesis. It holds that\ 

    <\equation*>
      <ltae|<tformat|<cwith|1|1|1|1|cell-halign|l>|<cwith|2|2|1|1|cell-halign|l>|<table|<row|<cell|<frac|1|s<rsub|n
      >><big|int><rsub|B<rsub|s<rsub|n>><around*|(|x<rsub|n>|)>><rsub|><mf|F><rsup|\<downarrow\>><rsub|n><around*|(|\<zeta\>|)><rsup|u><dd>\<zeta\>>>|<row|<cell|<space|1em><ltae|<tformat|<table|<row|<cell|=<frac|1|s<rsub|n
      >><big|int><rsub|B<rsub|s<rsub|n>><around*|(|x<rsub|n>|)>><rsub|><around*|(|<big|int><rsub|\<Theta\>>sup<rsub|\<sigma\>\<less\><mf|<wide|b|~>><rsub|+,n><rsup|\<ast\>><around*|(|\<zeta\>|)>><around*|<left|\||-1>|<big|int><rsub|\<sigma\>><rsup|<mf|<wide|b|~>><rsub|+,n><rsup|\<ast\>><around*|(|\<zeta\>|)>><around*|(|<1><rsub|E<rsub|T><rsup|\<ast\>>><wpD><rsub|\<zeta\>><around*|<left|(|-1>|\<theta\>|<right|)|-1>>F<rsup|\<ast\>><rsub|T>|)><around*|(|\<theta\>,\<zeta\>,\<rho\>|)><around*|[|\<phi\>|]><frac|<dd>\<rho\>|\<rho\>>|<right|\||-1>><rsup|2><frac|<dd>\<theta\>|<around*|\||\<Theta\>|\|>>|)><rsup|<frac|u|2>><dd>\<zeta\>>>|<row|<cell|\<lesssim\>sup<rsub|\<phi\><rprime|'>><around*|\<\|\|\>|<around*|(|<big|int><rsub|\<Theta\>>sup<rsub|\<sigma\>\<gtr\>0><around*|\||<big|int><rsub|\<sigma\>><rsup|1-<around*|\||\<zeta\>|\|>>|\<nobracket\>>|\<nobracket\>>|\<nobracket\>><ltae|<tformat|<table|<row|<cell|<around*|\<nobracket\>|<around*|\<nobracket\>|<around*|\<nobracket\>|<around*|<left|(|1>|<1><rsub|E><wpD><rsub|\<zeta\>><around*|<left|(|-1>|\<theta\>|<right|)|-1>><Emb><around*|[|f|]>|<right|)|1>>\<circ\>\<pi\><rsub|T<rsub|n>><around|(|\<theta\>,\<zeta\>,\<rho\>|)><around*|[|\<phi\><rprime|'>|]><frac|<dd>\<rho\>|\<rho\>>|\|><rsup|2><frac|\<mathd\>\<theta\>|<around*|\||\<Theta\>|\|>>|)><rsup|<frac|1|2>>|\<\|\|\>><rsub|L<rsup|u><around*|(|B<rsub|1>|)>><rsup|u>,>>>>>>>>>>>>>>>
    </equation*>

    where the upper bound is taken over <math|\<phi\><rprime|'>\<in\>\<Phi\><rsub|4<gr>><rsup|\<infty\>>>
    with <math|<around*|\<\|\|\>|\<phi\><rprime|'>|\<\|\|\>><rsub|\<Phi\><rsub|4<gr>><rsup|N-4>>\<leq\>1>.
    Since each <math|s<rsub|n>\<leq\>C<rsub|M><rsup|-1>> by the boundedness
    of the Hardy Littlewood maximal function, we can choose <math|C<rsub|M>>
    sufficiently large so that <math|10s<rsub|n>\<leq\>C<rsub|ind><rsup|-1>>
    and we can apply the induction hypothesis to the bound above to get

    <\equation*>
      <frac|1|s<rsub|n >><big|int><rsub|B<rsub|s<rsub|n>><around*|(|x<rsub|n>|)>><rsub|><mf|F><rsup|\<downarrow\>><rsub|n><around*|(|\<zeta\>|)><rsup|u><dd>\<zeta\>\<lesssim\>C<rsub|u><rsup|u><RHS|<eqref|eq:tree-SIO-size>><rsup|u>.
    </equation*>

    Summing up, this gives

    <\equation*>
      <big|sum><rsub|n\<in\><N>><big|int><rsub|B<rsub|s<rsub|n>><around*|(|x<rsub|n>|)>><rsub|><mf|F><rsup|\<downarrow\>><rsub|n><around*|(|\<zeta\>|)><rsup|u><dd>\<zeta\>\<leq\>C<rsub|M><rsup|-1>C<rsub|u><rsup|u><RHS|<eqref|eq:tree-SIO-size>><rsup|u>.
    </equation*>

    This concludes showing <eqref|eq:SIO:induction-step> and thus
    <eqref|eq:tree-SIO-size>.

    <math|><with|font-series|bold|Deducing <eqref|eq:SIO-bound:explicit> from
    <eqref|eq:tree-SIO-size>:>

    For fixed <math|T> we need to show that\ 

    <\equation*>
      sup<rsub|\<phi\>><around*|<left|\<\|\|\>|1>|sup<rsub|\<sigma\>\<gtr\>0><around*|\||<big|int><rsub|\<sigma\>><rsup|<mf|b><rsup|\<ast\>><rsub|+><around*|(|\<theta\>,\<zeta\>|)>><around*|<left|(|1>|<1><rsub|E<rsup|\<ast\>><rsub|T>><wpD><rsub|\<zeta\>><around*|<left|(|-1>|\<theta\>|<right|)|-1>>F<rsup|\<ast\>><rsub|T>|<right|)|1>><around|(|\<theta\>,\<zeta\>,\<rho\>|)><around*|[|\<phi\>|]><frac|<dd>\<rho\>|\<rho\>>|\|>|<right|\<\|\|\>|1>><rsub|L<rsup|u><rsub|<frac|<dd>\<theta\><dd>\<zeta\>|<around*|\||\<Theta\>|\|>>><around*|(|\<Theta\>\<times\>B<rsub|1>|)>>\<lesssim\><RHS|<eqref|eq:SIO-bound:explicit>>.
    </equation*>

    Having shown that <eqref|eq:tree-SIO-size> holds, we need to show that it
    is sufficient to show that for some fixed <math|N<rprime|'>\<in\><N>> and
    all <math|N\<in\><N>> large enough, for any
    <math|<around*|\<\|\|\>|\<phi\>|\<\|\|\>><rsub|\<Phi\><rsub|<gr>><rsup|N>>\<leq\>1>
    that\ 

    <\equation*>
      <ltae|<tformat|<table|<row|<cell|<rsub|><around*|<left|\<\|\|\>|1>|sup<rsub|\<sigma\>\<gtr\>0><around*|\||<big|int><rsub|\<sigma\>><rsup|<mf|b><rsup|\<ast\>><rsub|+><around*|(|\<theta\>,\<zeta\>|)>><around*|<left|(|1>|<1><rsub|E<rsup|\<ast\>><rsub|T>><wpD><rsub|\<zeta\>><around*|<left|(|-1>|\<theta\>|<right|)|-1>>F<rsup|\<ast\>><rsub|T>|<right|)|1>><around|(|\<theta\>,\<zeta\>,\<rho\>|)><around*|[|\<phi\>|]><frac|<dd>\<rho\>|\<rho\>>|\|>|<right|\<\|\|\>|1>><rsub|L<rsup|u><rsub|<frac|<dd>\<theta\><dd>\<zeta\>|<around*|\||\<Theta\>|\|>>><around*|(|\<Theta\>\<times\>B<rsub|1>|)>>>>|<row|<cell|<space|1em>\<lesssim\><ltae|<tformat|<table|<row|<cell|sup<rsub|\<phi\><rprime|'>><around*|<left|\<\|\|\>|-1>|<around*|<left|(|-1>|<big|int><rsub|\<Theta\>>sup<rsub|\<sigma\>\<gtr\>0><around*|<left|\||-1>|<big|int><rsub|\<sigma\>><rsup|<mf|b><rsup|\<ast\>><rsub|+><around*|(|\<theta\>,\<zeta\>|)>><around*|<left|(|1>|<1><rsub|E<rsup|\<ast\>><rsub|T>><wpD><rsub|\<zeta\>><around*|<left|(|-1>|\<theta\>|<right|)|-1>>F<rsup|\<ast\>><rsub|T>|<right|)|1>><around|(|\<theta\>,\<zeta\>,\<rho\>|)><around*|[|\<phi\><rprime|'>|]><frac|<dd>\<rho\>|\<rho\>>|<right|\||-1>><rsup|2><frac|\<mathd\>\<theta\>|<around*|\||\<Theta\>|\|>>|<right|)|-1>><rsup|<frac|1|2>>|<right|\<\|\|\>|-1>><rsub|L<rsup|u><around*|(|B<rsub|1>|)>>>>|<row|<cell|+<RHS|<eqref|eq:SIO-bound:explicit>>,>>>>>>>>>>
    </equation*>

    where the upper bound is taken over <math|<around*|\<\|\|\>|\<phi\><rprime|'>|\<\|\|\>><rsub|\<Phi\><rsup|N-N<rprime|'>><rsub|2<rsup|N<rprime|'>><gr>>>\<leq\>1>.
    It is sufficient to show that\ 

    <\equation>
      <label|eq:SIO-proof-constant-theta><ltae|<tformat|<table|<row|<cell|<around*|<left|\<\|\|\>|-1>|<around*|<left|(|-1>|<big|int><rsub|\<Theta\>>sup<rsub|\<sigma\>\<gtr\><wide|<mf|b>|~><rsup|\<ast\>><rsub|-><around*|(|\<zeta\>|)>><around*|<left|\||-1>|<big|int><rsub|\<sigma\>><rsup|C<rsup|-1><mf|b><rsup|\<ast\>><rsub|+><around*|(|\<theta\>,\<zeta\>|)>><wpD><rsub|\<zeta\>><around*|<left|(|-1>|\<theta\>|<right|)|-1>>F<rsup|\<ast\>><rsub|T><around|(|\<theta\>,\<zeta\>,\<rho\>|)><around*|[|\<phi\>|]><frac|<dd>\<rho\>|\<rho\>>|<right|\||-1>><rsup|u><frac|\<mathd\>\<theta\>|<around*|\||\<Theta\>|\|>>|<right|)|-1>><rsup|<frac|1|u>>|<right|\<\|\|\>|-1>><rsub|L<rsup|u><around*|(|B<rsub|1>|)>>>>|<row|<cell|<space|1em>\<lesssim\><ltae|<tformat|<table|<row|<cell|sup<rsub|\<phi\><rprime|'>><around*|<left|\<\|\|\>|-1>|<around*|(|<big|int><rsub|\<Theta\>>sup<rsub|\<sigma\>\<gtr\>0><around*|\||<big|int><rsub|\<sigma\>><rsup|<mf|b><rsup|\<ast\>><rsub|+><around*|(|\<theta\>,\<zeta\>|)>><around*|<left|(|1>|<1><rsub|E<rsup|\<ast\>><rsub|T>><wpD><rsub|\<zeta\>><around*|<left|(|-1>|\<theta\>|<right|)|-1>>F<rsup|\<ast\>><rsub|T>|<right|)|1>><around|(|\<theta\>,\<zeta\>,\<rho\>|)><around*|[|\<phi\><rprime|'>|]><frac|<dd>\<rho\>|\<rho\>>|\|><rsup|2><frac|\<mathd\>\<theta\>|<around*|\||\<Theta\>|\|>>|)><rsup|<frac|1|2>>|<right|\<\|\|\>|-1>><rsub|L<rsup|u><around*|(|B<rsub|1>|)>>>>|<row|<cell|+<RHS|<eqref|eq:SIO-bound:explicit>>>>>>>>>>>>
    </equation>

    where <math|<wide|<mf|b>|~><rsup|\<ast\>><rsub|-><around*|(|\<zeta\>|)><eqd>max<rsub|\<theta\>\<in\>\<Theta\>><wide|<mf|b>|~><rsup|\<ast\>><rsub|-><around*|(|\<theta\>,\<zeta\>|)>>,
    and <math|C\<gtr\>1> is some arbitrarily large fixed constant, and the
    upper bound in <math|\<phi\><rprime|'>> is as before. To see this, let
    <math|<wide|\<theta\>|\<bar\>>\<in\>\<Theta\>> be a point where
    <math|max<rsub|\<theta\>\<in\>\<Theta\>><wide|<mf|b>|~><rsup|\<ast\>><rsub|-><around*|(|\<theta\>,\<zeta\>|)>>
    is attained; we integrate the second inequality of
    <eqref|eq:boundary-regularity-local> to get that

    <\equation*>
      <cases|<tformat|<table|<row|<cell|<frac|<mf|b><rsup|\<ast\>><rsub|-><around*|(|\<theta\>,\<zeta\>|)>|<wide|<mf|b>|~><rsup|\<ast\>><rsub|-><around*|(|\<zeta\>|)>>\<gtr\><around*|\||<frac|\<theta\>-\<theta\><rsub|+>|<wide|\<theta\>|\<bar\>>-\<theta\><rsub|+>>|\|>>|<cell|<text|if
      >\<theta\>\<gtr\><wide|\<theta\>|\<bar\>>,>>|<row|<cell|<frac|<mf|b><rsup|\<ast\>><rsub|-><around*|(|\<theta\>,\<zeta\>|)>|<wide|<mf|b>|~><rsup|\<ast\>><rsub|-><around*|(|\<zeta\>|)>>\<less\><around*|\||<frac|\<theta\>-\<theta\><rsub|->|<wide|\<theta\>|\<bar\>>-\<theta\><rsub|->>|\|>>|<cell|\<theta\>\<less\><wide|\<theta\>|\<bar\>>.>>>>>
    </equation*>

    It holds that

    <\equation*>
      <ltae|<tformat|<table|<row|<cell|<around*|<left|\<\|\|\>|-1>|<around*|<left|(|-1>|<big|int><rsub|\<Theta\>><around*|<left|(|-1>|<big|int><rsub|<mf|b><rsup|\<ast\>><rsub|-><around*|(|\<theta\>,\<zeta\>|)>><rsup|<mf|b><rsup|\<ast\>><rsub|-><around*|(|\<zeta\>|)>><around*|<left|\||1>|<wpD><rsub|\<zeta\>><around*|<left|(|-1>|\<theta\>|<right|)|-1>>F<rsup|\<ast\>><rsub|T><around|(|\<theta\>,\<zeta\>,\<rho\>|)><around*|[|\<phi\>|]>|<right|\||1>><frac|<dd>\<rho\>|\<rho\>>|<right|)|-1>><rsup|u><frac|\<mathd\>\<theta\>|<around*|\||\<Theta\>|\|>>|<right|)|-1>><rsup|<frac|1|2>>|<right|\<\|\|\>|-1>><rsub|L<rsup|u><around*|(|B<rsub|1>|)>>>>|<row|<cell|+<around*|<left|\<\|\|\>|-1>|<around*|<left|(|-1>|<big|int><rsub|\<Theta\>><around*|<left|(|-1>|<big|int><rsub|C<rsup|-1><mf|b><rsup|\<ast\>><rsub|+><around*|(|\<theta\>,\<zeta\>|)>><rsup|<mf|b><rsup|\<ast\>><rsub|+><around*|(|\<theta\>,\<zeta\>|)>><around*|<left|\||1>|<wpD><rsub|\<zeta\>><around*|<left|(|-1>|\<theta\>|<right|)|-1>>F<rsup|\<ast\>><rsub|T><around|(|\<theta\>,\<zeta\>,\<rho\>|)><around*|[|\<phi\>|]>|<right|\||1>><frac|<dd>\<rho\>|\<rho\>>|<right|)|-1>><rsup|u><frac|\<mathd\>\<theta\>|<around*|\||\<Theta\>|\|>>|<right|)|-1>><rsup|<frac|1|2>>|<right|\<\|\|\>|-1>><rsub|L<rsup|u><around*|(|B<rsub|1>|)>>>>|<row|<cell|<space|1em><ltae|<tformat|<table|<row|<cell|\<lesssim\><around*|<left|\<\|\|\>|2>|<1><rsub|E><Emb><around*|[|f|]>|<right|\<\|\|\>|2>><rsub|<SL|><rsup|<around|(|\<infty\>,\<infty\>|)>><rsub|\<Theta\>>\<Phi\><rsub|2<rsup|4><gr>><rsup|N-4><around*|(|T|)>><around*|(|<big|int><rsub|\<Theta\>\<times\>B<rsub|1>><around*|<left|(|-1>|log<around*|<left|(|-1>|<frac|<mf|b><rsup|\<ast\>><rsub|-><around*|(|\<theta\>,\<zeta\>|)>|<wide|<mf|b>|~><rsup|\<ast\>><rsub|-><around*|(|\<zeta\>|)>>|<right|)|-1>>+log<around*|<left|(|-1>|<frac|<mf|b><rsup|\<ast\>><rsub|-><around*|(|\<theta\>,\<zeta\>|)>|<wide|<mf|b>|~><rsup|\<ast\>><rsub|-><around*|(|\<zeta\>|)>>|<right|)|-1>>+log
      C|<right|)|-1>><rsup|u><frac|<dd>\<theta\><dd>\<zeta\>|<around*|\||\<Theta\>|\|>>|)>>>|<row|<cell|\<lesssim\><around*|<left|\<\|\|\>|2>|<1><rsub|E><Emb><around*|[|f|]>|<right|\<\|\|\>|2>><rsub|<SL|><rsup|<around|(|\<infty\>,\<infty\>|)>><rsub|\<Theta\>>\<Phi\><rsub|2<rsup|4><gr>><rsup|N-4><around*|(|T|)>>.>>>>><rsup|<frac|1|u>>>>>>>
    </equation*>

    Let us now restrict to <math|\<theta\>\<gtr\>0> and bound
    <LHS|<eqref|eq:SIO-proof-constant-theta>>; the case
    <math|\<theta\>\<less\>0> is dealt with analogously. According to
    <eqref|eq:embedding> (that defines of <Emb>), to <eqref|eq:space-boost>
    (that defines <math|<wpD><rsub|\<zeta\>><around*|<left|(|-1>|\<theta\>|<right|)|-1>>>),
    and to the symmetry property <eqref|eq:piT-symmetry>, we have that

    <\equation*>
      <wpD><rsub|\<zeta\>><around*|<left|(|-1>|\<theta\>|<right|)|-1>>F<rsup|\<ast\>><around*|(|\<theta\>,\<zeta\>,\<rho\>|)><around*|[|\<phi\>|]>=<wpD><rsub|\<zeta\>><around*|<left|(|-1>|\<theta\><rprime|'>|<right|)|-1>>F<rsup|\<ast\>><rsub|T><around*|(|\<theta\><rprime|'>,\<zeta\>,\<rho\>|)><around*|[|<Mod><rsub|<around*|(|\<theta\>-\<theta\><rprime|'>|)>>\<phi\>|]>.
    </equation*>

    Futhermore, it follows from <eqref|eq:boundary-regularity-local> that if
    <math|<mf|b><rsub|-><rsup|\<ast\>><around*|(|\<theta\>,\<zeta\>|)>\<less\>\<rho\>\<less\>C<rsup|-1><mf|b><rsup|\<ast\>><rsub|+><around*|(|\<theta\>,\<zeta\>|)>>
    then \ <math|<around*|(|\<theta\><rprime|'>,\<zeta\>,\<rho\>|)>\<in\>E<rsup|\<ast\>><rsub|T>>
    for all <math|\<theta\><rprime|'>\<in\><around*|(|\<theta\>-<gr>,\<theta\>|)>>.
    If <math|\<phi\>\<in\>\<Phi\><rsub|<gr>><rsup|\<infty\>>> then
    <math|<Mod><rsub|<around*|(|\<theta\>-\<theta\><rprime|'>|)>>\<phi\>\<in\>\<Phi\><rsub|2<gr>><rsup|\<infty\>>>
    with <math|<around*|\<\|\|\>|<Mod><rsub|<around*|(|\<theta\>-\<theta\><rprime|'>|)>>\<phi\>|\<\|\|\>><rsub|\<Phi\><rsub|2<gr>><rsup|N-1>>\<leq\><around*|\<\|\|\>|\<phi\>|\<\|\|\>><rsub|\<Phi\><rsub|<gr>><rsup|N>>>.
    This shows that

    <\equation*>
      <ltae|<tformat|<table|<row|<cell|sup<rsub|\<sigma\>\<gtr\><wide|<mf|b>|~><rsup|\<ast\>><rsub|-><around*|(|\<zeta\>|)>><around*|<left|\||-1>|<big|int><rsub|\<sigma\>><rsup|<wide|<mf|b>|~><rsup|\<ast\>><rsub|+><around*|(|\<zeta\>|)>><wpD><rsub|\<zeta\>><around*|<left|(|-1>|\<theta\>|<right|)|-1>>F<rsup|\<ast\>><rsub|T><around|(|\<theta\>,\<zeta\>,\<rho\>|)><around*|[|\<phi\>|]><frac|<dd>\<rho\>|\<rho\>>|<right|\||-1>><rsup|u>>>|<row|<cell|<space|1em>\<leq\>inf<rsub|\<theta\><rprime|'>>sup<rsub|\<phi\><rprime|'>>sup<rsub|\<sigma\>\<gtr\><wide|<mf|b>|~><rsup|\<ast\>><rsub|-><around*|(|\<zeta\>|)>><around*|<left|\||-1>|<big|int><rsub|\<sigma\>><rsup|<wide|<mf|b>|~><rsup|\<ast\>><rsub|+><around*|(|\<zeta\>|)>><wpD><rsub|\<zeta\>><around*|<left|(|-1>|\<theta\><rprime|'>|<right|)|-1>>F<rsup|\<ast\>><rsub|T><around|(|\<theta\><rprime|'>,\<zeta\>,\<rho\>|)><around*|[|\<phi\><rprime|'>|]><frac|<dd>\<rho\>|\<rho\>>|<right|\||-1>><rsup|u>>>>>>
    </equation*>

    where the upper bound is taken over <math|<around*|\<\|\|\>|\<phi\><rprime|'>|\<\|\|\>><rsub|\<Phi\><rsub|2<gr>><rsup|N-1>>\<leq\>><math|<around*|\<\|\|\>|\<phi\>|\<\|\|\>><rsub|\<Phi\><rsub|<gr>><rsup|N>>>
    and the lower bound is taken over <math|\<theta\><rprime|'>\<in\><around*|(|\<theta\>-<gr>,\<theta\>|)>>.
    In particular, this shows that for any
    <math|\<phi\>\<in\>\<Phi\><rsub|<gr>><rsup|\<infty\>>> with
    <math|<around*|\<\|\|\>|\<phi\>|\<\|\|\>><rsub|\<Phi\><rsup|N><rsub|<gr>>>\<leq\>1>
    it holds that

    <\equation>
      <label|eq:SIO-proof-u-2><ltae|<tformat|<table|<row|<cell|<around*|<left|\<\|\|\>|-1>|<around*|<left|(|-1>|<big|int><rsub|\<Theta\><rsub|n>>sup<rsub|\<sigma\>\<gtr\><wide|<mf|b>|~><rsup|\<ast\>><rsub|-><around*|(|\<zeta\>|)>><around*|<left|\||-1>|<big|int><rsub|\<sigma\>><rsup|<wide|<mf|b>|~><rsup|\<ast\>><rsub|+><around*|(|\<zeta\>|)>><wpD><rsub|\<zeta\>><around*|<left|(|-1>|\<theta\>|<right|)|-1>>F<rsup|\<ast\>><rsub|T><around|(|\<theta\>,\<zeta\>,\<rho\>|)><around*|[|\<phi\>|]><frac|<dd>\<rho\>|\<rho\>>|<right|\||-1>><rsup|u><frac|\<mathd\>\<theta\>|<around*|\||\<Theta\>|\|>>|<right|)|-1>><rsup|<frac|1|u>>|<right|\<\|\|\>|-1>><rsub|L<rsup|u><around*|(|B<rsub|1>|)>><rsup|u>>>|<row|<cell|<space|1em>\<lesssim\><around*|<left|\<\|\|\>|-1>|<around*|<left|(|-1>|<big|int><rsub|\<Theta\><rsub|n>>sup<rsub|\<phi\><rprime|'>\<in\>\<Phi\><rsub|2<gr>><rsup|\<infty\>>>sup<rsub|\<sigma\>\<gtr\><wide|<mf|b>|~><rsup|\<ast\>><rsub|-><around*|(|\<zeta\>|)>><around*|<left|\||-1>|<big|int><rsub|\<sigma\>><rsup|<wide|<mf|b>|~><rsup|\<ast\>><rsub|+><around*|(|\<zeta\>|)>><wpD><rsub|\<zeta\>><around*|<left|(|-1>|\<theta\>|<right|)|-1>>F<rsup|\<ast\>><rsub|T><around|(|\<theta\>,\<zeta\>,\<rho\>|)><around*|[|\<phi\><rprime|'>|]><frac|<dd>\<rho\>|\<rho\>>|<right|\||-1>><rsup|2><frac|\<mathd\>\<theta\>|<around*|\||\<Theta\>|\|>>|<right|)|-1>><rsup|<frac|1|2>>|<right|\<\|\|\>|-1>><rsub|L<rsup|u><around*|(|B<rsub|1>|)>><rsup|u>>>|<row|<cell|<space|1em>\<lesssim\>sup<rsub|\<phi\><rprime|''>\<in\>\<Phi\><rsub|4<gr>><rsup|\<infty\>>><around*|<left|\<\|\|\>|-1>|<around*|<left|(|-1>|<big|int><rsub|\<Theta\><rsub|n>>sup<rsub|\<sigma\>\<gtr\><wide|<mf|b>|~><rsup|\<ast\>><rsub|-><around*|(|\<zeta\>|)>><around*|<left|\||-1>|<big|int><rsub|\<sigma\>><rsup|<wide|<mf|b>|~><rsup|\<ast\>><rsub|+><around*|(|\<zeta\>|)>><wpD><rsub|\<zeta\>><around*|<left|(|-1>|\<theta\>|<right|)|-1>>F<rsup|\<ast\>><rsub|T><around|(|\<theta\>,\<zeta\>,\<rho\>|)><around*|[|\<phi\><rprime|''>|]><frac|<dd>\<rho\>|\<rho\>>|<right|\||-1>><rsup|2><frac|\<mathd\>\<theta\>|<around*|\||\<Theta\>|\|>>|<right|)|-1>><rsup|<frac|1|2>>|<right|\<\|\|\>|-1>><rsub|L<rsup|u><around*|(|B<rsub|1>|)>><rsup|u>>>>>>
    </equation>

    where the upper bound in <math|\<phi\><rprime|'>\<in\>\<Phi\><rsup|\<infty\>><rsub|2<gr>>>
    is taken over functions with <math|<around*|\<\|\|\>|\<phi\><rprime|'>|\<\|\|\>><rsub|\<Phi\><rsub|2<gr>><rsup|N-1>>\<leq\>1>
    while the upper bound in <math|\<phi\><rprime|''>\<in\>\<Phi\><rsub|2<rsup|3><gr>><rsup|\<infty\>>>
    is over <math|<around*|\<\|\|\>|\<phi\><rprime|''>|\<\|\|\>><rsub|\<Phi\><rsub|2<rsup|3><gr>><rsup|N-3>>\<leq\>><math|1>.
    The second inequality is obtained by decomposing
    <math|\<phi\><rprime|'>\<in\>\<Phi\><rsub|2<gr>><rsup|\<infty\>>> into an
    absolutely convergent series of wave packets as described by
    <smart-ref|lem:wave-packet-decomposition>.
  </render-proof>

  <subsection|Counting function improvement><label|sec:non-unif:counting-function-improvement>

  In this section we obtain bound <eqref|eq:embedding-bounds:non-uniform-iterated:complete>
  from bound <eqref|eq:embedding-bounds:non-uniform-iterated:mu1>, thereby
  proving <smart-ref|thm:non-uniform-embedding-bounds>.\ 

  <\render-proof|Proof of <smart-ref|thm:non-uniform-embedding-bounds>:
  <math|\<mu\><rsup|1><rsub|\<Theta\>>> to
  <math|\<mu\><rsup|\<infty\>><rsub|\<Theta\>>>>
    We claim that for any <math|p\<in\><around*|(|1,+\<infty\>|)>>,
    <math|q<rsub|0>\<in\><around*|[|1,+\<infty\>|]>,><math|q\<in\><around*|(|q<rsub|0>,+\<infty\>|]>>
    it holds that

    <\equation*>
      <around*|\<\|\|\>|F|\<\|\|\>><rsub|L<rsup|p><rsub|\<nu\><rsub|1>><fL><rsup|q,+><rsub|\<mu\><rsup|\<infty\>><rsub|\<Theta\>>,\<nu\><rsub|1>><SF><rsup|u><rsub|\<Gamma\>>\<Phi\><rsub|<gr>><rsup|N><around*|(|V<rsup|>|)>>\<lesssim\><around*|\<\|\|\>|F|\<\|\|\>><rsub|L<rsup|p><rsub|\<nu\><rsub|1>><fL><rsup|q<rsub|0>,+><rsub|\<mu\><rsup|1><rsub|\<Theta\>>,\<nu\><rsub|1>><SF><rsup|u><rsub|\<Gamma\>>\<Phi\><rsub|<gr>><rsup|N>>.
    </equation*>

    We prove the claim using weak interpolation. To apply
    <smart-ref|prop:outer-restricted-interpolation> we can suppose that
    <math|F> is supported on <math|V\<in\><DD><rsup|\<cup\>><rsub|1>> and we
    need to check that

    <\equation*>
      <around*|\<\|\|\>|F|\<\|\|\>><rsub|L<rsup|p><rsub|\<nu\><rsub|1>><fL><rsup|q,+><rsub|\<mu\><rsup|\<infty\>><rsub|\<Theta\>>,\<nu\><rsub|1>><SF><rsup|u><rsub|\<Gamma\>>\<Phi\><rsub|<gr>><rsup|N>>\<lesssim\>\<nu\><rsub|1><around*|(|V|)><rsup|<frac|1|p>><around*|\<\|\|\>|F|\<\|\|\>><rsub|<fL><rsup|q<rsub|0>,+><rsub|\<mu\><rsup|1><rsub|\<Theta\>>,\<nu\><rsub|1>><SF><rsup|u><rsub|\<Gamma\>>\<Phi\><rsub|<gr>><rsup|N>>
    </equation*>

    for any <math|p\<gtr\>1>. If <math|q=+\<infty\>> the claim is immediate
    because for any <math|V<rsup|+>>

    <\equation*>
      <around*|\<\|\|\>|F|\<\|\|\>><rsub|<fL><rsup|\<infty\>><rsub|\<mu\><rsup|\<infty\>><rsub|\<Theta\>>,\<nu\><rsub|1>><SF><rsup|u><rsub|\<Theta\>>\<Phi\><rsub|<gr>><rsup|N><around*|(|V<rsup|+>|)>>=<around*|\<\|\|\>|<1><rsub|V<rsup|+>>F|\<\|\|\>><rsub|<SF><rsup|u><rsub|\<Theta\>>\<Phi\><rsub|<gr>><rsup|N>>=<around*|\<\|\|\>|F|\<\|\|\>><rsub|<fL><rsup|\<infty\>><rsub|\<mu\><rsup|1><rsub|\<Theta\>>,\<nu\><rsub|1>><SF><rsup|u><rsub|\<Theta\>>\<Phi\><rsub|<gr>><rsup|N><around*|(|V<rsup|+>|)>>\<leq\><around*|\<\|\|\>|F|\<\|\|\>><rsub|<fL><rsup|q<rsub|0>,+><rsub|\<mu\><rsup|1><rsub|\<Theta\>>,\<nu\><rsub|\<beta\>>><SF><rsup|u><rsub|\<Theta\>>\<Phi\><rsub|<gr>><rsup|N>>.
    </equation*>

    Thus it is sufficient to show that\ 

    <\equation>
      <around*|\<\|\|\>|F|\<\|\|\>><rsub|L<rsup|p><rsub|\<nu\><rsub|1>><fL><rsup|q><rsub|\<mu\><rsup|\<infty\>><rsub|\<Theta\>>,\<nu\><rsub|1>><SF><rsup|u><rsub|\<Theta\>>\<Phi\><rsub|<gr>><rsup|N>>\<lesssim\>\<nu\><rsub|1><around*|(|V|)><rsup|<frac|1|p>><around*|\<\|\|\>|F|\<\|\|\>><rsub|<fL><rsup|q<rsub|0>,+><rsub|\<mu\><rsup|1><rsub|\<Theta\>>,\<nu\><rsub|1>><SF><rsup|u><rsub|\<Theta\>>\<Phi\><rsub|<gr>><rsup|N>>.<label|eq:mu1-muinfty:p-end>
    </equation>

    We will show that for any <math|V<rsup|+>\<in\>\<bbb-D\><rsup|\<cup\>><rsub|1>>
    there exists <math|V<rsup|ecc><around*|(|V<rsup|+>|)>\<in\>\<bbb-D\><rsup|\<cup\>><rsub|1>>
    with <math|\<nu\><rsub|1><around*|<left|(|1>|V<rsup|ecc><around*|(|V<rsup|+>|)>|<right|)|1>>\<leq\><frac|1|2>\<nu\><rsub|1><around*|(|V<rsup|+>|)>>
    such that\ 

    <\equation>
      <around*|\<\|\|\>|<1><rsub|V<rsup|+><rsup|>\<setminus\>V<rsup|ecc><around*|(|V<rsup|+>|)>>F|\<\|\|\>><rsub|L<rsup|<wide|q|\<bar\>>,\<infty\>><rsub|\<mu\><rsup|\<infty\>><rsub|\<Theta\>>><SF><rsup|u><rsub|\<Theta\>>\<Phi\><rsub|<gr>><rsup|N>>\<lesssim\><around*|\<\|\|\>|<1><rsub|V<rsup|+>>F|\<\|\|\>><rsub|<fL><rsup|q<rsub|0>,+><rsub|\<mu\><rsup|1><rsub|\<Theta\>>,\<nu\><rsub|1>><SF><rsup|u><rsub|\<Theta\>>\<Phi\><rsub|<gr>><rsup|N>><label|eq:mu1-muinfty:eccept>
    </equation>

    for any <math|q<rsub|0>\<less\><wide|q|\<bar\>>\<less\>q>. Let us show
    that this is sufficient. Start by setting <math|V<rsub|0>=V> and
    <math|V<rsub|k+1>=V<rsup|ecc><around*|(|V<rsub|k>|)>> to obtain that

    <\equation*>
      F=<big|sum><rsub|k=0><rsup|\<infty\>><1><rsub|V<rsub|k>\<setminus\>V<rsub|k+1>>F<rsub|k>
    </equation*>

    so by quasi-subadditivity for any <math|\<varepsilon\>\<gtr\>0> it holds
    that\ 

    <\equation*>
      <around*|\<\|\|\>|F|\<\|\|\>><rsub|L<rsup|p><rsub|\<nu\><rsub|1>><fL><rsup|q><rsub|\<mu\><rsup|\<infty\>><rsub|\<Theta\>>,\<nu\><rsub|1>><SF><rsup|u><rsub|\<Theta\>>\<Phi\><rsub|<gr>><rsup|N>>\<lesssim\><big|sum><rsub|k=0><rsup|\<infty\>>2<rsup|\<varepsilon\>k><around*|\<\|\|\>|<1><rsub|V<rsub|k>\<setminus\>V<rsub|k+1>>F|\<\|\|\>><rsub|L<rsup|p><rsub|\<nu\><rsub|1>><fL><rsup|q><rsub|\<mu\><rsup|\<infty\>><rsub|\<Theta\>>,\<nu\><rsub|1>><SF><rsup|u><rsub|\<Theta\>>\<Phi\><rsub|<gr>><rsup|N>>.
    </equation*>

    By <smart-ref|def:localized-outer-lebesgue>, by the construction of
    <math|V<rsub|k>>, and by log-convexity of outer Lebesgue norms
    (<eqref|eq:outer-log-convexity> in <smart-ref|prop:outer-properties>) we
    have that\ 

    <\equation*>
      <around*|\<\|\|\>|<1><rsub|V<rsub|k>\<setminus\>V<rsub|k+1>>F|\<\|\|\>><rsub|L<rsup|\<infty\>><rsub|\<nu\><rsub|1>><fL><rsup|q><rsub|\<mu\><rsup|\<infty\>><rsub|\<Theta\>>,\<nu\><rsub|1>><SF><rsup|u><rsub|\<Theta\>>\<Phi\><rsub|<gr>><rsup|N>><ltae|<tformat|<table|<row|<cell|\<lesssim\><around*|\<\|\|\>|<1><rsub|V<rsub|k>\<setminus\>V<rsub|k+1>>F|\<\|\|\>><rsub|L<rsup|<wide|q|\<bar\>>,\<infty\>><rsub|\<mu\><rsup|\<infty\>><rsub|\<Theta\>>><SF><rsup|u><rsub|\<Theta\>>\<Phi\><rsub|<gr>><rsup|N>><rsup|<wide|q|\<bar\>>/q><around*|\<\|\|\>|<1><rsub|V<rsub|k>\<setminus\>V<rsub|k+1>>F|\<\|\|\>><rsub|L<rsup|\<infty\>><rsub|\<mu\><rsup|\<infty\>><rsub|\<Theta\>>><SF><rsup|u><rsub|\<Theta\>>\<Phi\><rsub|<gr>><rsup|N>><rsup|1-<wide|q|\<bar\>>/q>>>|<row|<cell|\<leq\><around*|\<\|\|\>|<1><rsub|V<rsub|k>>F|\<\|\|\>><rsub|<fL><rsup|q<rsub|0>><rsub|\<mu\><rsup|1><rsub|\<Theta\>>,\<nu\><rsub|1>><SF><rsup|u><rsub|\<Theta\>>\<Phi\><rsub|<gr>><rsup|N>><rsup|<wide|q|\<bar\>>/q><around*|\<\|\|\>|<1><rsub|V<rsub|k>\<setminus\>V<rsub|k+1>>F|\<\|\|\>><rsub|<fL><rsup|\<infty\>><rsub|\<mu\><rsup|1><rsub|\<Theta\>>,\<nu\><rsub|1>><SF><rsup|u><rsub|\<Theta\>>\<Phi\><rsub|<gr>><rsup|N>><rsup|1-<wide|q|\<bar\>>/q>>>|<row|<cell|\<leq\><around*|\<\|\|\>|F|\<\|\|\>><rsub|<fL><rsup|q<rsub|0>,+><rsub|\<mu\><rsup|1><rsub|\<Theta\>>,\<nu\>1><SF><rsup|u><rsub|\<Theta\>>\<Phi\><rsub|<gr>><rsup|N>>.>>>>>
    </equation*>

    Since <math|><math|<1><rsub|V<rsub|k>\<setminus\>V<rsub|k+1>>F> is
    supported on <math|V<rsub|k>> that satisfies
    <math|\<nu\><rsub|1><around*|(|V<rsub|k>|)>\<leq\>2<rsup|-k>\<nu\><around*|(|V|)>>
    it holds that

    <\equation*>
      <around*|\<\|\|\>|F|\<\|\|\>><rsub|L<rsup|p><rsub|\<nu\><rsub|1>><fL><rsup|q><rsub|\<mu\><rsup|\<infty\>><rsub|\<Theta\>>,\<nu\><rsub|1>><SF><rsup|u><rsub|\<Theta\>>\<Phi\><rsub|<gr>><rsup|N>>\<lesssim\><big|sum><rsub|k=0><rsup|\<infty\>>2<rsup|\<varepsilon\>k>2<rsup|-k/p>\<nu\><around*|(|V|)><rsup|1/p><around*|\<\|\|\>|<1><rsub|V<rsub|k>>F|\<\|\|\>><rsub|<rsup|<rsub|>><fL><rsup|q<rsub|0>,+><rsub|\<mu\><rsup|1><rsub|\<Theta\>>,\<nu\><rsub|1>><SF><rsup|u><rsub|\<Theta\>>\<Phi\><rsub|<gr>><rsup|N>>\<lesssim\>\<nu\><around*|(|V|)><rsup|1/p><around*|\<\|\|\>|F|\<\|\|\>><rsub|<fL><rsup|q<rsub|0>,+><rsub|\<mu\><rsup|1><rsub|\<Theta\>>,\<nu\><rsub|1>><SF><rsup|u><rsub|\<Theta\>>\<Phi\><rsub|<gr>><rsup|N>>
    </equation*>

    as long as <math|\<varepsilon\>\<less\><frac|1|p>>. This is what was
    required by <smart-ref|eq:mu1-muinfty:p-end>.

    \ Let us now show that <math|<smart-ref|eq:mu1-muinfty:eccept>> holds.
    Assume by homogeneity that <math|<around*|\<\|\|\>|F|\<\|\|\>><rsub|<fL><rsup|q<rsub|0>,+><rsub|\<mu\><rsup|1><rsub|\<Theta\>>,\<nu\><rsub|1>><SF><rsup|u><rsub|\<Theta\>>\<Phi\><rsub|<gr>><rsup|N>>=1>.
    Since <math|<around*|\<\|\|\>|<1><rsub|V<rsup|+>>F|\<\|\|\>><rsub|L<rsup|q<rsub|0>,\<infty\>><rsub|\<mu\><rsup|1><rsub|\<Theta\>>><SF><rsup|u><rsub|\<Theta\>>\<Phi\><rsub|<gr>><rsup|N>>\<leq\><around*|\<\|\|\>|<1><rsub|V<rsup|+>>F|\<\|\|\>><rsub|L<rsup|q<rsub|0>><rsub|\<mu\><rsup|1><rsub|\<Theta\>>><SF><rsup|u><rsub|\<Theta\>>\<Phi\><rsub|<gr>><rsup|N>>>,
    for any <math|k\<in\><N>> there exists
    <math|W<rsub|k>\<in\><TT><rsup|\<cup\>><rsub|\<Theta\>>> such that\ 

    <\equation*>
      <around*|\<\|\|\>|<1><rsub|V<rsup|+>\<setminus\>W<rsub|k>>F|\<\|\|\>><rsub|<SF><rsup|u><rsub|\<Theta\>>\<Phi\><rsub|<gr>><rsup|N>>\<leq\>2<rsup|-<frac|k|q<rsub|0>>>,<space|2em>\<mu\><rsup|1><rsub|\<Theta\>><around*|(|W<rsub|k>|)>\<leq\>2<rsup|k>\<nu\><rsub|1><around*|(|V<rsup|+>|)>.
    </equation*>

    Let <math|<mc|T><rsub|k><rsup|1>\<subset\><TT><rsub|\<Theta\>>> be such
    that <math|W<rsub|k>\<subset\><big|cup><rsub|T\<in\><mc|T><rsub|k><rsup|1>>T>
    and <math|<around*|\<\|\|\>|N<rsub|<mc|T><rsub|k><rsup|1>>|\<\|\|\>><rsub|L<rsup|1>>\<lesssim\>2<rsup|k>><math|\<nu\><rsub|1><around*|(|V<rsup|+>|)>>.
    Set

    <\equation*>
      \<bbb-V\><rsub|k>=<around*|{|x\<in\><R>:<HLM>N<rsub|<mc|T><rsub|k><rsup|1>>\<gtr\>C
      2<rsup|<frac|<wide|q|\<bar\>>|q<rsub|0>>k>|}>
    </equation*>

    and using the fact that <math|\<bbb-V\><rsub|k>> is open let us represent
    it as a countable union of its connected components (open balls):

    <\equation*>
      \<bbb-V\><rsub|k>=<big|cup><rsub|n\<in\><N>>B<rsub|s<rsub|k,n>><around*|(|x<rsub|k,n>|)>.
    </equation*>

    Setting <math|V<rsub|k>=<big|cup><rsub|n\<in\><N>>D<around*|(|x<rsub|k,n>,100s<rsub|k,n>|)>>
    and <math|V<rsup|ecc><around*|(|V<rsup|+>|)>=<big|cup><rsub|k\<in\><N>>V<rsub|k>>,
    by the boundedness of the Hardy Littlewood maximal function we have that

    <\equation*>
      \<nu\><rsub|1><around*|(|V<rsup|ecc><around*|(|V<rsup|+>|)>|)>\<leq\><big|sum><rsub|k\<in\><N>>\<nu\><rsub|1><around*|(|V<rsub|k>|)>\<lesssim\><big|sum><rsub|k\<in\><N>>C<rsup|-1>2<rsup|k<around*|(|1-<frac|<wide|q|\<bar\>>|q<rsub|0>>|)>>\<nu\><rsub|1><around*|(|V<rsup|+>|)>\<lesssim\>C<rsup|-1>\<nu\><rsub|1><around*|(|V<rsup|+>|)>
    </equation*>

    as required, as long as <math|C\<gtr\>1> is chosen large enough. Let us
    now show that\ 

    <\equation*>
      <around*|\<\|\|\>|<1><rsub|V<rsup|+>\<setminus\><around*|(|V<rsup|ecc><around*|(|V<rsup|+>|)>\<cup\>W<rsub|k><rsup|\<infty\>>|)>>F|\<\|\|\>><rsub|<SF><rsup|u><rsub|\<Theta\>>\<Phi\><rsub|<gr>><rsup|N>>\<leq\>2<rsup|-<frac|k|q<rsub|0>>><text|
      and >\<mu\><rsup|\<infty\>><rsub|\<Theta\>><around*|(|W<rsub|k><rsup|\<infty\>>|)>\<lesssim\>2<rsup|<frac|<wide|q|\<bar\>>|q<rsub|0>>k>
    </equation*>

    where\ 

    <\equation*>
      <tabular|<tformat|<cwith|1|1|1|1|cell-halign|c>|<table|<row|<cell|W<rsup|\<infty\>><rsub|k><eqd><big|cup><rsub|T\<in\><mc|T><rsup|\<infty\>><rsub|k>>T>>|<row|<cell|<mc|T><rsup|\<infty\>><rsub|k><eqd><ltae|<tformat|<cwith|1|1|1|1|cell-halign|l>|<table|<row|<cell|<around*|<left|(|-1>|<big|cup><rsub|n\<in\><N>><around*|<left|{|2>|T\<in\><mc|T><rsup|1><rsub|k>\<suchthat\>B<rsub|s<rsub|T>><around*|(|x<rsub|T>|)>\<cap\>B<rsub|s<rsub|k,n>><around*|(|x<rsub|k,n>|)>\<neq\>\<emptyset\>,s<rsub|T>\<gtr\>10
      s<rsub|k,n>|<right|}|2>>|<right|)|-1>>>>|<row|<cell|\<cup\><around*|<left|{|2>|T\<in\><mc|T><rsup|1><rsub|k>\<suchthat\>B<rsub|s<rsub|T>><around*|(|x<rsub|T>|)>\<cap\>V<rsub|k>=\<emptyset\>|<right|}|2>>.>>>>>>>>>>
    </equation*>

    The two bounds imply that <math|<around*|\<\|\|\>|<1><rsub|V<rsup|+>\<setminus\>V<rsup|ecc><around*|(|V<rsup|+>|)>>F|\<\|\|\>><rsub|L<rsup|<wide|q|\<bar\>>,\<infty\>><rsub|\<mu\><rsup|\<infty\>><rsub|\<Theta\>>>><rsup|<wide|q|\<bar\>>>\<lesssim\>1>,
    concluding the proof of <math|<smart-ref|eq:mu1-muinfty:eccept>>. The
    former bound holds because <math|W<rsub|k>\<subset\>V<rsub|k>\<cup\>W<rsup|\<infty\>><rsub|k>>.
    As a matter of fact, <math|W<rsub|k>\<subset\><big|cup><rsub|T\<in\><mc|T><rsub|k><rsup|1>>T>
    and if <math|T\<in\><mc|T><rsub|k><rsup|1>\<setminus\><mc|T><rsup|\<infty\>><rsub|k>>
    then there exists <math|n\<in\><N>> such that
    <math|B<rsub|s<rsub|T>><around*|(|x<rsub|T>|)>\<cap\>B<rsub|s<rsub|k,n>><around*|(|x<rsub|k,n>|)>>
    and <math|s<rsub|T>\<less\>10 s<rsub|k,n>> but then
    <math|B<rsub|s<rsub|T>><around*|(|x<rsub|T>|)>\<subset\>B<rsub|100
    s<rsub|k,n>><around*|(|x<rsub|k,n>|)>> and thus
    <math|T\<subset\>V<rsub|k>>. \ 

    To show that <math|\<mu\><rsup|\<infty\>><rsub|\<Theta\>><around*|(|W<rsub|k><rsup|\<infty\>>|)>\<lesssim\>2<rsup|<frac|<wide|q|\<bar\>>|q<rsub|0>>k>>
    it is sufficient to show that <math|N<rsub|<mc|T><rsub|k><rsup|\<infty\>>><around*|(|x|)>\<lesssim\>2<rsup|<frac|<wide|q|\<bar\>>|q<rsub|0>>k>>
    for all <math|x\<in\><R>>. If <math|x\<notin\>\<bbb-V\><rsub|k>> then the
    claim follows by the definition of <math|\<bbb-V\><rsub|k>> and from the
    fact that <math|N<rsub|<mc|T><rsub|k><rsup|\<infty\>>><around*|(|x|)>\<leq\>N<rsub|<mc|T><rsub|k><rsup|1>><around*|(|x|)>\<leq\><HLM>N<rsub|<mc|T><rsub|k><rsup|1>><around*|(|x|)>>.
    If <math|x\<in\>\<bbb-V\><rsub|k>>then
    <math|x\<in\>B<rsub|s<rsub|k,n>><around*|(|x<rsub|k,n>|)>> for some
    <math|n\<in\><N>>. Let\ 

    <\equation*>
      <mc|T><rsub|k><rsup|\<infty\>><around*|(|x|)><eqd><around*|<left|{|1>|T\<in\><mc|T><rsub|k><rsup|\<infty\>>\<suchthat\>B<rsub|s<rsub|T>><around*|(|x<rsub|T>|)>\<ni\>x|<right|}|1>>
    </equation*>

    so that <math|><math|N<rsub|<mc|T><rsub|k><rsup|\<infty\>>><around*|(|x|)>>
    coincides with the cardinality of <math|<mc|T><rsub|k><rsup|\<infty\>><around*|(|x|)>>.
    Given the way <math|<mc|T><rsub|k><rsup|\<infty\>>> was defined for any
    <math|T\<in\><mc|T><rsub|k><rsup|\<infty\>><around*|(|x|)>> it holds that
    \ <math|s<rsub|T>\<gtr\>10s<rsub|k,n>> and thus either
    <math|B<rsub|s<rsub|T>><around*|(|x<rsub|T>|)>\<supset\><around*|(|x,x+4
    s<rsub|T>|)>> or <math|> <math|B<rsub|s<rsub|T>><around*|(|x<rsub|T>|)>\<supset\><around*|(|x-4s<rsub|T>,x|)>>
    showing that\ 

    <\equation*>
      <big|int><rsub|B<rsub|3s<rsub|k,n>><around*|(|x<rsub|k,n>|)>>N<rsub|<mc|T><rsup|\<infty\>><rsub|k>><around*|(|y|)><dd>y\<gtr\>3s<rsub|k,n>N<rsub|<mc|T><rsub|k><rsup|\<infty\>>><around*|(|x|)>.
    </equation*>

    Thus for any <math|y\<in\>B<rsub|3s<rsub|k,n>><around*|(|x<rsub|k,n>|)>>
    it holds that <math|<HLM>N<rsub|<mc|T><rsub|k><rsup|1>><around*|(|y|)>\<gtrsim\>N<rsub|<mc|T><rsub|k><rsup|\<infty\>>><around*|(|x|)>>
    while we know from the maximality of <math|B<rsub|s<rsub|k,n>><around*|(|x<rsub|k,n>|)>>
    that there exists <math|y\<in\>B<rsub|3s<rsub|k,n>><around*|(|x<rsub|k,n>|)>\<setminus\>B<rsub|s<rsub|k,n>><around*|(|x<rsub|k,n>|)>>
    with <math|<HLM>N<rsub|<mc|T><rsub|k><rsup|1>><around*|(|y|)>\<less\>C
    2<rsup|<frac|<wide|q|\<bar\>>|q<rsub|0>>k>>, showing the claimed bound
    <math|N<rsub|<mc|T><rsub|k><rsup|\<infty\>>><around*|(|x|)>\<lesssim\>2<rsup|<frac|<wide|q|\<bar\>>|q<rsub|0>>k>>.
  </render-proof>

  <section|Uniform embedding bounds - linear case
  <label|sec:uniform-embeddings:linear>>

  In this section we prove <smart-ref|thm:uniform-embedding-bounds:linear>
  about the linear embedding bounds <eqref|eq:embedding-bounds:uniform-iterated>.
  of. Recall from the setup of <smart-ref|thm:uniform-embedding-bounds:linear>
  that <math|\<Gamma\>=\<Gamma\><rsub|<around*|(|\<alpha\>,\<beta\>,\<gamma\>|)>>>
  is as described <eqref|eq:gamma>, <math|\<Theta\>> is an bounded open
  interval with <math|B<rsub|4>\<subsetneq\>\<Theta\>\<subsetneq\><R>>, and
  let <math|\<Theta\><rsup|in>> is a bounded open interval with
  <math|B<rsub|2<rsup|-5>><around*|(|-\<gamma\>|)>\<subsetneq\>\<Theta\><rsup|in>\<subsetneq\>B<rsub|2<rsup|-3>><around*|(|-\<gamma\>|)>>
  and let <math|\<Theta\><rsup|ex><eqd>\<Theta\>\<setminus\>\<Theta\><rsup|in>>.
  We will consistently use the notation <math|\<theta\><rsub|\<Gamma\>><eqd>\<alpha\>\<beta\><around*|(|\<theta\>+\<gamma\>|)>>
  as introduced in <smart-ref|sec:derived-sizes>. Furthermore
  <math|\<Theta\><rsub|\<Gamma\>><eqd>\<alpha\>\<beta\><around*|(|\<Theta\>+\<gamma\>|)>>,
  <math|\<Theta\><rsup|in><rsub|\<Gamma\>><eqd><around*|{|\<theta\><rsub|\<Gamma\>>:\<theta\>\<in\>\<Theta\><rsup|in>|}>>,
  and <math|\<Theta\><rsup|ex><rsub|\<Gamma\>><eqd><around*|{|\<theta\><rsub|\<Gamma\>>:\<theta\>\<in\>\<Theta\><rsup|ex>|}>>.
  As in the rest of the paper we assume that the parameter <math|N> is large
  enough and <math|<gr>\<gtr\>0> is small enough. These parameters, that
  govern the rate of decay and the Fourier support of wave packets
  <math|\<phi\>> appear in the size <math|<SU><rsup|u><rsub|\<Gamma\>>\<Phi\><rsub|<mf|r>><rsup|N>>
  and are ubiquitous in the subsequent section. The values <math|N\<gtr\>100>
  and <math|<gr>\<less\>2<rsup|-10>> are, in particular, always admissible
  and the choice of <math|N> and <math|<gr>> can be made independently of
  <math|\<beta\>\<in\><around*|(|0,1|]>>. All implicit constants appearing in
  <smart-ref|thm:uniform-embedding-bounds:linear> and in this entire section
  are uniform in <math|\<beta\>\<in\><around*|(|0,1|]>>. The constants are
  also uniform in <math|\<Theta\>> and <math|<gr>> as long as
  <math|<around*|\||\<Theta\>|\|>> is uniformly bounded and
  <math|<gr>\<gtr\>0> is bounded away from <math|0>.

  While <smart-ref|thm:uniform-embedding-bounds:linear> holds for all
  <math|\<beta\>\<in\><around*|(|0,1|]>>, we are mainly interested in the
  case <math|0\<less\>\<beta\>\<ll\>1>.

  In this section, for simplicity, the reader may assume that
  <math|\<alpha\>=\<beta\><rsup|-1>> and <math|\<gamma\>=0>. This maintains
  the important features of the subsequent discussion and of the proofs but
  avoids unnecessary complications. Under these assumption one has that
  <math|\<theta\><rsub|\<Gamma\>>=\<theta\>>,
  <math|\<Theta\><rsub|\<Gamma\>>=\<Theta\>>. There does not, however, seem
  to be a direct way to deduce the statements below and
  <smart-ref|thm:uniform-embedding-bounds:linear> itself in their full
  generality from these restricted assumptions on the parameters
  <math|<around*|(|\<alpha\>,\<beta\>,\<gamma\>|)>>.\ 

  The boundedness properties the map <math|F\<mapsto\>F\<circ\>\<Gamma\>> are
  encoded in the two propositions below. They allow us to control outer
  Lebesgue quasi-norms with two auxiliary sizes that do not appear, per se,
  in the size <math|<SU><rsup|u><rsub|\<Gamma\>>\<Phi\><rsub|<mf|r>><rsup|N>>.
  However, for functions of the form <math|F=<Emb><around*|[|f|]>> these
  auxiliary sizes can be used to control outer Lebesgue quasi-norms with size
  <math|<SU><rsup|u><rsub|\<Gamma\>>\<Phi\><rsub|<mf|r>><rsup|N>>.\ 

  <\proposition>
    <label|prop:unif-gamma-bounds:Sex><dueto|Uniform bounds for exterior
    size>The bounds

    <\equation>
      <ltae|<tformat|<table|<row|<cell|<around*|<left|\<\|\|\>|1>|F\<circ\>\<Gamma\>|<right|\<\|\|\>|1>><rsub|L<rsup|r><rsub|\<mu\><rsub|\<Theta\>><rsup|1>>\<Gamma\><rsup|\<ast\>><SL><rsup|<around|(|u,2|)>><rsub|<around|(|\<Theta\>,\<Theta\><rsup|ex>|)>>\<Phi\><rsub|<gr>><rsup|N>>\<lesssim\><around*|<left|\<\|\|\>|1>|F|<right|\<\|\|\>|1>><rsub|L<rsup|r><rsub|\<mu\><rsub|\<Theta\><rsub|\<Gamma\>>><rsup|1>><around*|(|<SL><rsup|<around|(|\<infty\>,\<infty\>|)>><rsub|\<Theta\><rsub|\<Gamma\>>>+<SL><rsup|<around|(|<wide|u|\<bar\>>,2|)>><rsub|<around|(|\<Theta\><rsub|\<Gamma\>>,\<Theta\><rsup|ex><rsub|\<Gamma\>>|)>>|)>\<Phi\><rsub|2<gr>><rsup|N-4>>,>>>>><label|eq:unif-gamma-bounds:Sex>
    </equation>

    hold for all <math|F\<in\>L<rsup|\<infty\>><rsub|loc><around*|(|<R><rsup|3><rsub|+>|)>\<otimes\>\<Phi\><rsub|2<gr>><rsup|\<infty\>><rprime|'>>
    as long as <math|2\<leq\>u\<less\>r\<leq\>+\<infty\>>, and as long as
    <math|<wide|u|\<bar\>>\<in\><around*|(|u,\<infty\>|)>> is sufficiently
    large, depending on <math|<around*|(|u,r|)>>.\ 
  </proposition>

  <\proposition>
    <label|prop:unif-gamma-bounds:singular-size><dueto|Uniform bounds for
    singular size>Let <math|V<rsup|>\<in\>\<bbb-D\><rsup|\<cup\>><rsub|\<beta\>>>,
    <math|W<rsup|>\<in\><TT><rsub|\<Theta\>><rsup|\<cup\>>> and
    <math|E=V\<cap\>W> or <math|E=V\<cup\>W>. The bounds

    <\equation>
      <label|eq:unif-gamma-bounds:singular-size><around*|<left|\<\|\|\>|2>|<rsub|>F\<circ\>\<Gamma\><around*|(|\<eta\>,y,t|)>
      t<dd><rsub|t><1><rsub|E><around*|(|\<eta\>,y,t|)>|<right|\<\|\|\>|2>><rsub|L<rsup|r><rsub|\<mu\><rsub|\<Theta\>><rsup|1>>\<Gamma\><rsup|<rsup|\<ast\>>><SL><rsup|<around|(|u,1|)>><rsub|<around*|(|\<Theta\>,\<Theta\><rsup|in>
      |)>>\<Phi\><rsub|<gr>><rsup|N>>\<lesssim\><around*|<left|\<\|\|\>|1>|F<around*|(|\<eta\>,y,t|)>
      |<right|\<\|\|\>|1>><rsub|L<rsup|r><rsub|\<mu\><rsub|\<Theta\><rsub|\<Gamma\>>><rsup|1>><SL><rsup|<around|(|\<infty\>,\<infty\>|)>><rsub|\<Theta\><rsub|\<Gamma\>>>\<Phi\><rsub|2<gr>><rsup|N-4>>
    </equation>

    hold for all <math|F\<in\>L<rsup|\<infty\>><rsub|loc><around*|(|<R><rsup|3><rsub|+>|)>\<otimes\>\<Phi\><rsub|2<gr>><rsup|\<infty\>><rprime|'>>
    as long as <math|1\<less\>u\<less\>r\<leq\>\<infty\>>. The implicit
    constant is independent of <math|E>. The derivative in <math|
    t<dd><rsub|t><1><rsub|E><around*|(|\<eta\>,y,t|)>> is intended in the
    distributional sense and is a Radon measure on
    <math|<R><rsup|3><rsub|+>>.
  </proposition>

  These two statements are proved in <smart-ref|sec:bound-exterior-size> and
  in <smart-ref|sec:unif-bounds:singular> respectively. The two sections
  follow a similar outline: first we prove a geometric covering lemma on
  <math|<R><rsup|3><rsub|+>> (Lemmata <reference|lem:ext-tree-covering> and
  <reference|lem:singular-tree-covering>), from this we deduce a
  weak-endpoint result for scalar valued functions
  <math|F\<in\><Rad><around*|(|<R><rsup|3><rsub|+>|)>>. Finally, using
  restricted weak interpolation and <smart-ref|lem:wave-packet-decomposition>
  we deduce the desired claim.\ 

  The next lemma shows that sizes <math|\<Gamma\><rsup|\<ast\>><SL><rsup|<around|(|u,2|)>><rsub|<around|(|\<Theta\>,\<Theta\><rsup|ex>|)>>\<Phi\><rsub|<gr>><rsup|N>>
  and <math|\<Gamma\><rsup|<rsup|\<ast\>>><SL><rsup|<around|(|u,1|)>><rsub|<around*|(|\<Theta\>,\<Theta\><rsup|in>
  |)>>\<Phi\><rsub|<gr>><rsup|N>> can be used to control the size
  <math|<SU><rsup|u><rsub|\<Gamma\>>\<Phi\><rsub|<mf|r>><rsup|N>>, that
  appears in <smart-ref|thm:uniform-embedding-bounds:linear>.

  <\lemma>
    <label|lem:unif-derived-size-bound><dueto|Uniform bounds for the
    <math|<SU><rsub|\<Gamma\>><rsup|u>\<Phi\><rsub|<gr>><rsup|N>> size>Let
    <math|V<rsup|+>,V<rsup|->\<in\>\<bbb-D\><rsup|\<cup\>><rsub|\<beta\>>>
    and <math|W<rsup|+>\<in\><TT><rsub|\<Theta\>><rsup|\<cup\>>>. The bounds\ 

    <\equation*>
      <ltae|<tformat|<cwith|1|1|1|1|cell-halign|l>|<table|<row|<cell|<around|<left|\<\|\|\>|2>|<1><rsub|<around*|(|V<rsup|+>\<cap\>W<rsup|+>|)>\<setminus\>V<rsup|->><Emb><around*|[|f|]>\<circ\>\<Gamma\>|<right|\<\|\|\>|2>><rsub|L<rsup|r><rsub|\<mu\><rsup|1><rsub|\<Theta\>>><SU><rsup|u><rsub|\<Gamma\>>\<Phi\><rsub|<mf|r>><rsup|N><rsub|>>>>|<row|<cell|\<lesssim\><ltae|<tformat|<cwith|1|1|1|1|cell-halign|l>|<table|<row|<cell|<around|<left|\<\|\|\>|2>|<1><rsub|<around*|(|V<rsup|+>\<cap\>W<rsup|+>|)>\<setminus\>V<rsup|->><Emb><around*|[|f|]>\<circ\>\<Gamma\>|<right|\<\|\|\>|2>><rsub|L<rsup|r><rsub|\<mu\><rsup|1><rsub|\<Theta\>>>\<Gamma\><rsup|\<ast\>><SL><rsup|<around|(|u,2|)>><rsub|<around|(|\<Theta\>,\<Theta\><rsup|ex>|)>>\<Phi\><rsub|16<gr>><rsup|N-10>>>>|<row|<cell|+<around|<left|\<\|\|\>|2>|<1><rsub|<wide|<around*|(|V<rsup|+>\<cap\>W<rsup|+>|)>|\<bar\>>\<setminus\>V<rsup|->><Emb><around*|[|f|]>\<circ\>\<Gamma\><around*|(|\<eta\>,y,t|)>
      t<dd><rsub|t><1><rsub|<around*|(|V<rsup|+>\<cap\>W<rsup|+>|)>><around*|(|\<eta\>,y,t|)><rsub|>|<right|\<\|\|\>|2>><rsub|L<rsup|r><rsub|\<mu\><rsup|1><rsub|\<Theta\>>>\<Gamma\><rsup|\<ast\>><rsup|><SL><rsup|<around*|(|u,1|)>><rsub|<around*|(|\<Theta\>,\<Theta\><rsup|in>|)>>\<Phi\><rsub|16<gr>><rsup|N-10>>>>|<row|<cell|+<around|<left|\<\|\|\>|2>|<1><rsub|<wide|<around*|(|V<rsup|+>\<cap\>W<rsup|+>|)>|\<bar\>>\<setminus\>V<rsup|->><Emb><around*|[|f|]>\<circ\>\<Gamma\><around*|(|\<eta\>,y,t|)>
      t<dd><rsub|t><1><rsub|<around*|<left|(|1>|<R><rsup|3><rsub|+>\<setminus\>V<rsup|->|<right|)|1>>><around*|(|\<eta\>,y,t|)><rsub|>|<right|\<\|\|\>|2>><rsub|L<rsup|r><rsub|\<mu\><rsup|1><rsub|\<Theta\>>>\<Gamma\><rsup|\<ast\>><rsup|><SL><rsup|<around*|(|u,1|)>><rsub|<around*|(|\<Theta\>,\<Theta\><rsup|in>|)>>\<Phi\><rsub|16<gr>><rsup|N-10>>>>>>>>>>>>
    </equation*>

    hold for any <math|f\<in\><Sch><around*|(|<R>|)>> and for all
    <math|r\<in\><around*|(|u,\<infty\>|]>>. The implicit constant is
    independent of <math|V<rsup|+>>, <math|V<rsup|->>, and <math|W<rsup|+>>.
  </lemma>

  We prove this lemma in <smart-ref|sec:unif-derived-size-bound>. Now we
  conclude by showing how \ <smart-ref|prop:unif-gamma-bounds:Sex>,
  <smart-ref|prop:unif-gamma-bounds:singular-size>, and
  <smart-ref|lem:unif-derived-size-bound> can be used to deduce the embedding
  bounds <eqref|eq:embedding-bounds:uniform-iterated> of
  <smart-ref|thm:uniform-embedding-bounds:linear>.

  <\render-proof|Proof of <smart-ref|thm:uniform-embedding-bounds:linear>>
    \ Using homogeneity let us assume that
    <math|<around*|\<\|\|\>|f<rsub|j>|\<\|\|\>><rsub|L<rsup|p<rsub|j>><around*|(|<R>|)>>=1>.
    According to the discussion in Remark
    <smart-ref|rmk:iterated-outer-bounds-explicit> we need to exhibit a
    choice of sets <math|V<rsup|-><around*|(|\<lambda\>|)>\<in\><DD><rsup|\<cup\>><rsub|\<beta\>>>
    such that\ 

    <\equation*>
      <ltae|<tformat|<cwith|1|1|1|1|cell-halign|l>|<table|<row|<cell|<big|int><rsub|0><rsup|\<infty\>>
      \<nu\><rsub|\<beta\>><around*|<left|(|1>|V<rsup|-><rsup|><around*|(|\<lambda\><rsup|1/p>|)>|<right|)|1>>\<mathd\>\<lambda\>\<lesssim\>1,>>|<row|<cell|<around*|<left|\<\|\|\>|1>|<1><rsub|<R><rsup|3><rsub|+>\<setminus\>V<rsup|-><around*|(|\<lambda\>|)>>
      <around*|(|<Emb><around*|[|f|]>\<circ\>\<Gamma\>|)>|<right|\<\|\|\>|1>><rsub|X<rsup|q,r,+><rsub|\<mu\><rsup|1><rsub|\<Theta\>>,\<nu\><rsub|\<beta\>>><SU><rsup|u><rsub|\<Gamma\>>\<Phi\><rsub|<mf|r>><rsup|N>>\<lesssim\>\<lambda\>.>>>>>
    </equation*>

    Using <smart-ref|thm:non-uniform-embedding-bounds>. with <math|N+14>,
    <math|32<gr>> and some large enough <math|<wide|u|\<bar\>>\<in\><around*|(|2,\<infty\>|)>>
    in place of <math|N>, <math|<gr>>, and <math|u>, we can find
    <math|<wide|V<rsup|->|~><around*|(|\<lambda\>|)>\<in\><DD><rsup|\<cup\>><rsub|1>>
    such that\ 

    <\equation*>
      <big|int><rsub|0><rsup|\<infty\>> \<nu\><rsub|\<beta\>><around*|<left|(|1>|<wide|V<rsup|->|~><around*|(|\<lambda\><rsup|1/p>|)>|<right|)|1>>\<mathd\>\<lambda\>\<lesssim\>1,<space|2em><around*|<left|\<\|\|\>|1>|<1><rsub|<R><rsup|3><rsub|+>\<setminus\><wide|V<rsup|->|~><around*|(|\<lambda\>|)>>
      <Emb><around*|[|f|]>|<right|\<\|\|\>|1>><rsub|<fL><rsup|q,+><rsub|\<mu\><rsup|<with|font-shape|italic|>\<infty\>><rsub|\<Theta\><rsub|\<Gamma\>>>,\<nu\><rsub|1>><SF><rsup|<wide|u|\<bar\>>><rsub|\<Theta\>>\<Phi\><rsub|32<gr>><rsup|N+14>>\<lesssim\>\<lambda\>.
    </equation*>

    Recall that <math|<SF><rsup|<wide|u|\<bar\>>><rsub|\<Theta\>>\<Phi\><rsub|32<gr>><rsup|N+14>\<gtrsim\><SL><rsup|<around|(|\<infty\>,\<infty\>|)>><rsub|\<Theta\><rsub|\<Gamma\>>>\<Phi\><rsub|32<gr>><rsup|N+14>+<SL><rsup|<around|(|<wide|u|\<bar\>>,2|)>><rsub|<around*|(|\<Theta\><rsub|\<Gamma\>>,\<Theta\><rsup|ex><rsub|\<Gamma\>>|)>>\<Phi\><rsub|32<gr>><rsup|N+14>>
    because <math|<SL><rsup|<around|(|<wide|u|\<bar\>>,2|)>><rsub|\<Theta\>><wpD><rsub|32<gr>><rsup|N+14>\<gtrsim\><SL><rsup|<around|(|<wide|u|\<bar\>>,2|)>><rsub|<around*|(|\<Theta\><rsub|\<Gamma\>>,\<Theta\><rsup|ex><rsub|\<Gamma\>>|)>>\<Phi\><rsub|32<gr>><rsup|N+14>>
    since <math|\<Theta\><rsup|ex><rsub|\<Gamma\>>\<cap\>B<rsub|64<gr>>=\<emptyset\>>.
    We set <math|V<rsup|-><around*|(|\<lambda\>|)><eqd>\<Gamma\><rsup|-1><around*|(|<wide|V<rsup|->|~><around*|(|\<lambda\>|)><rsup|>|)>\<in\><DD><rsup|\<cup\>><rsub|\<beta\>>>
    and we claim that\ 

    <\equation*>
      <ltae|<tformat|<cwith|1|1|1|1|cell-halign|l>|<table|<row|<cell|\<nu\><rsub|\<beta\>><around*|<left|(|1>|V<rsup|-><around*|(|\<lambda\>|)>|<right|)|1>>=\<nu\><rsub|1><around*|(|<wide|V<rsup|->|~><around*|(|\<lambda\>|)><rsup|>|)>>>|<row|<cell|<around*|<left|\<\|\|\>|2>|<1><rsub|<R><rsup|3><rsub|+>\<setminus\>V<rsup|-><around*|(|\<lambda\>|)>><around*|(|<Emb><around*|[|f|]>\<circ\>\<Gamma\>|)>|<right|\<\|\|\>|2>><rsub|X<rsup|q,r,+><rsub|\<mu\><rsup|1><rsub|\<Theta\>>,\<nu\><rsub|\<beta\>>><SU><rsup|u><rsub|\<Gamma\>>\<Phi\><rsub|<mf|r>><rsup|N>>\<lesssim\>\<lambda\>.>>>>>
    </equation*>

    The first bound follows since <math|\<Gamma\><around*|(|D<rsub|\<beta\>><around*|(|x,s|)>|)>=D<rsub|1><around*|(|x,s|)>>
    and <math|\<nu\><rsub|\<beta\>><around*|(|D<rsub|\<beta\>><around*|(|x,s|)>|)>=\<nu\><rsub|1><around*|(|D<rsub|1><around*|(|x,s|)>|)>=s>.
    To show the latter bound, according to Remark
    <smart-ref|rmk:iterated-outer-bounds-explicit>, we need to prove that for
    any <math|V<rsup|+>\<in\><DD><rsup|\<cup\>><rsub|\<beta\>>> and
    <math|W<rsup|+>\<in\><TT><rsub|\<Theta\>><rsup|\<cup\>>>, and for
    <math|<wide|r|\<bar\>>\<in\><around*|{|r,q|}>> the bounds

    <\equation>
      <around*|<left|\<\|\|\>|1>|<1><rsub|<around*|(|V<rsup|+>\<cap\>W<rsup|+>|)>\<setminus\>V<rsup|-><around*|(|\<lambda\>|)>><around*|(|<Emb><around*|[|f|]>\<circ\>\<Gamma\>|)>|<right|\<\|\|\>|1>><rsub|L<rsup|<wide|r|\<bar\>>><rsub|\<mu\><rsup|1><rsub|\<Theta\>>><SU><rsup|u><rsub|\<Gamma\>>\<Phi\><rsub|<mf|r>><rsup|N>>\<lesssim\>\<lambda\>\<nu\><rsub|\<beta\>><around*|(|V<rsup|+>|)><rsup|<frac|1|<wide|r|\<bar\>>>>\<mu\><rsup|\<infty\>><rsub|\<Theta\>><around*|(|W<rsup|+>|)><rsup|<frac|1|<wide|r|\<bar\>>>-<frac|1|q>><label|eq:ueb:local-claim-r>
    </equation>

    hold. <smart-ref|lem:unif-derived-size-bound> allows us, instead of
    working with the size \ <math|<SU><rsup|u><rsub|\<Gamma\>>\<Phi\><rsub|<mf|r>><rsup|N>>
    directly, to work with two alternative quantities: specifically those
    appearing in <LHS|<eqref|prop:unif-gamma-bounds:Sex>> and
    <LHS|<eqref|prop:unif-gamma-bounds:singular-size>>. More precisely,
    according to <smart-ref|lem:unif-derived-size-bound> it is sufficient to
    prove that\ 

    <\equation>
      <label|eq:ueb:local-claim-Sex><around|<left|\<\|\|\>|2>|<1><rsub|<around*|(|V<rsup|+>\<cap\>W<rsup|+>|)>\<setminus\>V<rsup|-><around*|(|\<lambda\>|)>><Emb><around*|[|f|]>\<circ\>\<Gamma\>|<right|\<\|\|\>|2>><rsub|L<rsup|<wide|r|\<bar\>>><rsub|\<mu\><rsup|1><rsub|\<Theta\>>>\<Gamma\><rsup|\<ast\>><SL><rsup|<around|(|u,2|)>><rsub|<around|(|\<Theta\>,\<Theta\><rsup|ex>|)>>\<Phi\><rsub|16<gr>><rsup|N-10>>\<lesssim\>\<lambda\>\<nu\><rsub|\<beta\>><around*|(|V<rsup|+>|)><rsup|<frac|1|<wide|r|\<bar\>>>>\<mu\><rsup|\<infty\>><rsub|\<Theta\>><around*|(|W<rsup|+>|)><rsup|<frac|1|<wide|r|\<bar\>>>-<frac|1|q>>,
    </equation>

    and that

    <\equation>
      <tabular|<label|eq:ueb:local-claim-sing>><ltae|<tformat|<cwith|1|1|1|1|cell-halign|l>|<cwith|3|3|1|1|cell-halign|l>|<table|<row|<cell|<around|<left|\<\|\|\>|2>|<1><rsub|<wide|<around*|(|V<rsup|+>\<cap\>W<rsup|+>|)>|\<bar\>>\<setminus\>V<rsup|-><around*|(|\<lambda\>|)>><Emb><around*|[|f|]>\<circ\>\<Gamma\><around*|(|\<eta\>,y,t|)>
      t<dd><rsub|t><1><rsub|<around*|(|V<rsup|+>\<cap\>W<rsup|+>|)>><around*|(|\<eta\>,y,t|)><rsub|>|<right|\<\|\|\>|2>><rsub|L<rsup|<wide|r|\<bar\>>><rsub|\<mu\><rsup|1><rsub|\<Theta\>>>\<Gamma\><rsup|\<ast\>><rsup|><SL><rsup|<around*|(|u,1|)>><rsub|<around*|(|\<Theta\>,\<Theta\><rsup|in>|)>>\<Phi\><rsub|16<gr>><rsup|N-10>>>>|<row|<cell|<space|1em>\<lesssim\>\<lambda\>\<nu\><rsub|\<beta\>><around*|(|V<rsup|+>|)><rsup|<frac|1|<wide|r|\<bar\>>>>\<mu\><rsup|\<infty\>><rsub|\<Theta\>><around*|(|W<rsup|+>|)><rsup|<frac|1|<wide|r|\<bar\>>>-<frac|1|q>>.>>|<row|<cell|<around|<left|\<\|\|\>|2>|<1><rsub|<wide|<around*|(|V<rsup|+>\<cap\>W<rsup|+>|)>|\<bar\>>\<setminus\>V<rsup|-><around*|(|\<lambda\>|)>><Emb><around*|[|f|]>\<circ\>\<Gamma\><around*|(|\<eta\>,y,t|)>
      t<dd><rsub|t><1><rsub|<around*|<left|(|1>|<R><rsup|3><rsub|+>\<setminus\>V<rsup|->|<right|)|1>>><around*|(|\<eta\>,y,t|)><rsub|>|<right|\<\|\|\>|2>><rsub|L<rsup|<wide|r|\<bar\>>><rsub|\<mu\><rsup|1><rsub|\<Theta\>>>\<Gamma\><rsup|\<ast\>><rsup|><SL><rsup|<around*|(|u,1|)>><rsub|<around*|(|\<Theta\>,\<Theta\><rsup|in>|)>>\<Phi\><rsub|16<gr>><rsup|N-10>>>>|<row|<cell|<space|1em>\<lesssim\>\<lambda\>\<nu\><rsub|\<beta\>><around*|(|V<rsup|+>|)><rsup|<frac|1|<wide|r|\<bar\>>>>\<mu\><rsup|\<infty\>><rsub|\<Theta\>><around*|(|W<rsup|+>|)><rsup|<frac|1|<wide|r|\<bar\>>>-<frac|1|q>>.>>>>>
    </equation>

    \;

    Since <smart-ref|prop:unif-gamma-bounds:Sex> and
    <smart-ref|prop:unif-gamma-bounds:singular-size> show that\ 

    <\equation*>
      <LHS|><eqref|eq:ueb:local-claim-Sex>+<LHS|><eqref|eq:ueb:local-claim-sing>\<leq\><around*|<left|\<\|\|\>|1>|<1><rsub|\<Gamma\><around*|(|<around*|(|V<rsup|+>\<cap\>W<rsup|+>|)>\<setminus\>V<rsup|-><around*|(|\<lambda\>|)>|)>><Emb><around*|[|f|]>|<right|\<\|\|\>|1>><rsub|L<rsup|<wide|r|\<bar\>>><rsub|\<mu\><rsub|\<Theta\><rsub|\<Gamma\>>><rsup|1>><around*|(|<SL><rsup|<around|(|\<infty\>,\<infty\>|)>><rsub|\<Theta\><rsub|\<Gamma\>>>+<SL><rsup|<around|(|<wide|u|\<bar\>>,2|)>><rsub|<around|(|\<Theta\><rsub|\<Gamma\>>,\<Theta\><rsup|ex><rsub|\<Gamma\>>|)>>|)>\<Phi\><rsub|32<gr>><rsup|N-14>>
    </equation*>

    as long as <math|<wide|u|\<bar\>>> is large enough, all we need to do is
    show that

    <\equation*>
      <around*|<left|\<\|\|\>|1>|<1><rsub|\<Gamma\><around*|(|<around*|(|V<rsup|+>\<cap\>W<rsup|+>|)>\<setminus\>V<rsup|-><around*|(|\<lambda\>|)>|)>><Emb><around*|[|f|]>|<right|\<\|\|\>|1>><rsub|L<rsup|<wide|r|\<bar\>>><rsub|\<mu\><rsub|\<Theta\><rsub|\<Gamma\>>><rsup|1>><around*|(|<SL><rsup|<around|(|\<infty\>,\<infty\>|)>><rsub|\<Theta\><rsub|\<Gamma\>>>+<SL><rsup|<around|(|<wide|u|\<bar\>>,2|)>><rsub|<around|(|\<Theta\><rsub|\<Gamma\>>,\<Theta\><rsup|ex><rsub|\<Gamma\>>|)>>|)>\<Phi\><rsub|32<gr>><rsup|N-14>>\<lesssim\>\<lambda\>\<nu\><rsub|\<beta\>><around*|(|V<rsup|+>|)><rsup|<frac|1|<wide|r|\<bar\>>>>\<mu\><rsup|\<infty\>><rsub|\<Theta\>><around*|(|W<rsup|+>|)><rsup|<frac|1|<wide|r|\<bar\>>>-<frac|1|q>>,
    </equation*>

    which will be the goal for the rest of the proof. This follows
    essentially by <eqref|eq:outer-Lp-finite-support>, up to controlling
    <math|\<mu\><rsup|1><rsub|\<Theta\><rsub|\<Gamma\>>><around*|(|W<rsup|+>|)>>.
    More precisely, since <math|<wide|r|\<bar\>>\<leq\>q>, by
    <smart-ref|eq:outer-Lp-finite-support> it holds that\ 

    <\equation*>
      <ltae|<tformat|<cwith|1|1|1|1|cell-halign|l>|<table|<row|<cell|<around*|<left|\<\|\|\>|1>|<1><rsub|\<Gamma\><around*|(|<around*|(|V<rsup|+>\<cap\>W<rsup|+>|)>\<setminus\>V<rsup|-><around*|(|\<lambda\>|)>|)>><Emb><around*|[|f|]>|<right|\<\|\|\>|1>><rsub|L<rsup|<wide|r|\<bar\>>><rsub|\<mu\><rsub|\<Theta\><rsub|\<Gamma\>>><rsup|1>><around*|(|<SL><rsup|<around|(|\<infty\>,\<infty\>|)>><rsub|\<Theta\><rsub|\<Gamma\>>>+<SL><rsup|<around|(|<wide|u|\<bar\>>,2|)>><rsub|<around|(|\<Theta\><rsub|\<Gamma\>>,\<Theta\><rsup|ex><rsub|\<Gamma\>>|)>>|)>\<Phi\><rsub|32<gr>><rsup|N-14>>>>|<row|<cell|\<lesssim\>\<mu\><rsup|1><rsub|\<Theta\><rsub|\<Gamma\>>><around*|<left|(|1>|\<Gamma\><around*|(|V<rsup|+>|)>\<cap\>\<Gamma\><around*|(|W<rsup|+>|)>|<right|)|1>><rsup|<frac|1|<wide|r|\<bar\>>>-<frac|1|q>><around*|<left|\<\|\|\>|1>|<1><rsub|\<Gamma\><rsup|><around*|<left|(|1>|<around*|(|V<rsup|+>\<cap\>W<rsup|+>|)>\<setminus\>V<rsup|-><around*|(|\<lambda\>|)>|<right|)|1>>>F|<right|\<\|\|\>|1>><rsub|L<rsup|q><rsub|\<mu\><rsub|\<Theta\><rsub|\<Gamma\>>><rsup|1>><around*|(|<SL><rsup|<around|(|\<infty\>,\<infty\>|)>><rsub|\<Theta\><rsub|\<Gamma\>>>+<SL><rsup|<around|(|<wide|u|\<bar\>>,2|)>><rsub|<around|(|\<Theta\><rsub|\<Gamma\>>,\<Theta\><rsup|ex><rsub|\<Gamma\>>|)>>|)>\<Phi\><rsub|32<gr>><rsup|N-14>>,>>>>>
    </equation*>

    while <smart-ref|lem:measure-comparison-1-infty> applied with
    <math|\<beta\>=1> gives that

    <\equation*>
      \<mu\><rsup|1><rsub|\<Theta\><rsub|\<Gamma\>>><around*|<left|(|1>|\<Gamma\><around*|(|V<rsup|+>|)>\<cap\>W|<right|)|1>>\<lesssim\>\<nu\><rsub|1><around*|(|\<Gamma\><around*|(|V<rsup|+>|)>|)>\<mu\><rsup|\<infty\>><rsub|\<Theta\><rsub|\<Gamma\>>><around*|(|\<Gamma\><around*|(|V<rsup|+>|)>\<cap\>W|)><space|1em>\<forall\>W\<in\><TT><rsup|\<cup\>><rsub|\<Theta\><rsub|\<Gamma\>>>.
    </equation*>

    Using the above bound and <eqref|eq:outer-measure-Lp-comparison> \ we
    obtain that\ 

    <\equation*>
      <ltae|<tformat|<cwith|1|1|1|1|cell-halign|l>|<table|<row|<cell|<around*|<left|\<\|\|\>|1>|<1><rsub|\<Gamma\><rsup|><around*|<left|(|1>|<around*|(|V<rsup|+>\<cap\>W<rsup|+>|)>\<setminus\>V<rsup|->|<right|)|1>>>F|<right|\<\|\|\>|1>><rsub|L<rsup|q><rsub|\<mu\><rsub|\<Theta\><rsub|\<Gamma\>>><rsup|1>><around*|(|<SL><rsup|<around|(|\<infty\>,\<infty\>|)>><rsub|\<Theta\><rsub|\<Gamma\>>>+<SL><rsup|<around|(|<wide|u|\<bar\>>,2|)>><rsub|<around|(|\<Theta\><rsub|\<Gamma\>>,\<Theta\><rsup|ex><rsub|\<Gamma\>>|)>>|)>\<Phi\><rsub|32<gr>><rsup|N-14>>>>|<row|<cell|\<lesssim\>\<nu\><rsub|1><around*|(|\<Gamma\><around*|(|V<rsup|+>|)>|)><rsup|<frac|1|q>><around*|<left|\<\|\|\>|1>|<1><rsub|\<Gamma\><rsup|><around*|<left|(|1>|<around*|(|V<rsup|+>\<cap\>W<rsup|+>|)>\<setminus\>V<rsup|->|<right|)|1>>>F|<right|\<\|\|\>|1>><rsub|L<rsup|q><rsub|\<mu\><rsub|\<Theta\><rsub|\<Gamma\>>><rsup|\<infty\>>><around*|(|<SL><rsup|<around|(|\<infty\>,\<infty\>|)>><rsub|\<Theta\><rsub|\<Gamma\>>>+<SL><rsup|<around|(|<wide|u|\<bar\>>,2|)>><rsub|<around|(|\<Theta\><rsub|\<Gamma\>>,\<Theta\><rsup|ex><rsub|\<Gamma\>>|)>>|)>\<Phi\><rsub|32<gr>><rsup|N-14>>.>>>>>
    </equation*>

    We also have that\ 

    <\equation*>
      \<mu\><rsup|1><rsub|\<Theta\><rsub|\<Gamma\>>><around*|<left|(|1>|\<Gamma\><around*|(|V<rsup|+>|)>\<cap\>\<Gamma\><around*|(|W<rsup|+>|)>|<right|)|1>><rsup|<frac|1|<wide|r|\<bar\>>>-<frac|1|q>>\<leq\>\<nu\><rsub|\<beta\>><around*|(|V<rsup|+>|)><rsup|<frac|1|<wide|r|\<bar\>>>-<frac|1|q>>\<mu\><rsup|\<infty\>><rsub|\<Theta\>><around*|<left|(|1>|W<rsup|+>|<right|)|1>><rsup|<frac|1|<wide|r|\<bar\>>>-<frac|1|q>>
    </equation*>

    because <math|\<Gamma\><around*|(|V<rsup|+>|)>\<in\><DD><rsup|\<cup\>><rsub|1>>,
    <math|\<Gamma\><around*|(|W<rsup|+>|)>\<in\><TT><rsub|\<Theta\><rsub|\<Gamma\>>><rsup|\<cup\>>>,
    <math|\<nu\><rsub|1><around*|(|\<Gamma\><around*|(|V<rsup|+>|)>|)>=\<nu\><rsub|\<beta\>><around*|(|V<rsup|+>|)>>,
    and <math|\<mu\><rsup|\<infty\>><rsub|\<Theta\>><around*|(|W<rsup|+>|)>=\<mu\><rsup|\<infty\>><rsub|\<Theta\><rsub|\<Gamma\>>><around*|(|\<Gamma\><around*|(|W<rsup|+>|)>|)>>.
    The estimates above, combined, give that\ 

    <\equation*>
      <ltae|<tformat|<cwith|1|1|1|1|cell-halign|l>|<table|<row|<cell|<around*|<left|\<\|\|\>|1>|<1><rsub|\<Gamma\><around*|(|<around*|(|V<rsup|+>\<cap\>W<rsup|+>|)>\<setminus\>V<rsup|->|)>><Emb><around*|[|f|]>|<right|\<\|\|\>|1>><rsub|L<rsup|<wide|r|\<bar\>>><rsub|\<mu\><rsub|\<Theta\><rsub|\<Gamma\>>><rsup|1>><around*|(|<SL><rsup|<around|(|\<infty\>,\<infty\>|)>><rsub|\<Theta\><rsub|\<Gamma\>>>+<SL><rsup|<around|(|<wide|u|\<bar\>>,2|)>><rsub|<around|(|\<Theta\><rsub|\<Gamma\>>,\<Theta\><rsup|ex><rsub|\<Gamma\>>|)>>|)>\<Phi\><rsub|32<gr>><rsup|N-14>>>>|<row|<cell|\<lesssim\>\<nu\><rsub|\<beta\>><around*|(|V<rsup|+>|)><rsup|<frac|1|<wide|r|\<bar\>>>>\<mu\><rsup|\<infty\>><rsub|\<Theta\>><around*|(|W<rsup|+>|)><rsup|<frac|1|<wide|r|\<bar\>>>-<frac|1|q>><around*|<left|\<\|\|\>|1>|<1><rsub|\<Gamma\><rsup|><around*|<left|(|1>|<around*|(|V<rsup|+>\<cap\>W<rsup|+>|)>\<setminus\>V<rsup|->|<right|)|1>>><Emb><around*|[|f|]>|<right|\<\|\|\>|1>><rsub|L<rsup|q><rsub|\<mu\><rsub|\<Theta\><rsub|\<Gamma\>>><rsup|\<infty\>>><around*|(|<SL><rsup|<around|(|\<infty\>,\<infty\>|)>><rsub|\<Theta\><rsub|\<Gamma\>>>+<SL><rsup|<around|(|<wide|u|\<bar\>>,2|)>><rsub|<around|(|\<Theta\><rsub|\<Gamma\>>,\<Theta\><rsup|ex><rsub|\<Gamma\>>|)>>|)>\<Phi\><rsub|32<gr>><rsup|N-14>>.>>>>>
    </equation*>

    This is the required bound <smart-ref|eq:ueb:local-claim-Sex> since
    <math|\<Gamma\><around*|(|V<rsup|-><around*|(|\<lambda\>|)>|)>=<wide|V<rsup|->|~><around*|(|\<lambda\>|)>>
    so\ 

    <\equation*>
      <ltae|<tformat|<cwith|2|2|1|1|cell-halign|l>|<table|<row|<cell|<around*|<left|\<\|\|\>|1>|<1><rsub|\<Gamma\><rsup|><around*|<left|(|1>|<around*|(|V<rsup|+>\<cap\>W<rsup|+>|)>\<setminus\>V<rsup|-><around*|(|\<lambda\>|)>|<right|)|1>>><Emb><around*|[|f|]>|<right|\<\|\|\>|1>><rsub|L<rsup|q><rsub|\<mu\><rsub|\<Theta\><rsub|\<Gamma\>>><rsup|\<infty\>>><around*|(|<SL><rsup|<around|(|\<infty\>,\<infty\>|)>><rsub|\<Theta\><rsub|\<Gamma\>>>+<SL><rsup|<around|(|<wide|u|\<bar\>>,2|)>><rsub|<around|(|\<Theta\><rsub|\<Gamma\>>,\<Theta\><rsup|ex><rsub|\<Gamma\>>|)>>|)>\<Phi\><rsub|32<gr>><rsup|N-14>>>>|<row|<cell|\<lesssim\><around*|<left|\<\|\|\>|1>|<1><rsub|<R><rsup|3><rsub|+>\<setminus\><wide|V<rsup|->|~><around*|(|\<lambda\>|)>>
      <Emb><around*|[|f|]>|<right|\<\|\|\>|1>><rsub|<fL><rsup|q,+><rsub|\<mu\><rsup|<with|font-shape|italic|>\<infty\>><rsub|\<Theta\><rsub|\<Gamma\>>>,\<nu\><rsub|1>><SF><rsup|<wide|u|\<bar\>>><rsub|\<Theta\>>\<Phi\><rsub|32<gr>><rsup|N-14>>\<lesssim\>\<lambda\>>>>>>
    </equation*>

    by construction.
  </render-proof>

  <subsection|Uniform bounds for the exterior
  size<label|sec:bound-exterior-size>>

  We now prove <smart-ref|prop:unif-gamma-bounds:Sex>. We begin with a
  uniform covering argument.

  <\lemma>
    <label|lem:ext-tree-covering><dueto|Exterior tree covering>Suppose
    <math|F\<in\><Rad><around|(|<R><rsup|3><rsub|+>|)>> is a compactly
    supported Radon measure. For all <math|\<lambda\>\<gtr\>0> there exists a
    set <math|W<rsub|\<lambda\>>\<subset\><TT><rsup|\<cup\>><rsub|\<Theta\>>>
    and finite collection of trees <math|\<cal-T\>\<subset\>\<bbb-T\><rsub|\<Theta\>>>
    such that\ 

    <\equation*>
      <around|<left|\<\|\|\>|2>|<1><rsub|<R><rsup|3><rsub|+>\<setminus\>W<rsub|\<lambda\>>>F|<right|\<\|\|\>|2>><rsub|<SL><rsup|<around|(|1,1|)>><rsub|<around*|(|\<Theta\>,\<Theta\><rsup|ex>|)>>>\<leq\>\<lambda\>,<space|2em>W<rsub|\<lambda\>>\<supset\><big|cup><rsub|T\<in\><with|font|cal|T>>T,<space|2em>\<mu\><rsup|1><rsub|*\<Theta\>><around*|(|W<rsub|\<lambda\>>|)>\<lesssim\><rsub|><big|sum><rsub|T\<in\><with|font|cal|T>>\<mu\><rsup|1><rsub|\<Theta\>><around*|(|T|)>.
    </equation*>

    Each <math|T\<in\><mc|T>> is endowed with a distinguished subset
    <math|X<rsub|T>\<subset\>\<pi\><rsub|T><around*|(|<mT><rsub|\<Theta\><rsup|ex>>|)>>
    such that

    <\equation*>
      <ltae|<tformat|<table|<row|<cell|<frac|1|\<mu\><rsup|1><rsub|\<Theta\>><around*|(|T|)>><big|int><rsub|X<rsub|T>><around*|\||F<around*|(|\<eta\>,y,t|)>|\|>
      \<mathd\> \<eta\> \<mathd\>y \<mathd\>t\<geq\> \<lambda\>.>>>>>
    </equation*>

    The subsets <math|X<rsub|T>> satisfy\ 

    <\equation>
      <around*|<left|\<\|\|\>|-2>|<big|sum><rsub|T\<in\>\<cal-T\>><1><rsub|\<Gamma\><around*|(|X<rsub|T>|)>><around*|(|\<eta\>,y,t|)>|<right|\<\|\|\>|-2>><rsub|<SL><rsup|<around*|(|\<infty\>,\<infty\>|)>><rsub|\<Theta\><rsub|\<Gamma\>>>>\<lesssim\>1<label|eq:ext-tree-covering:ext-summability>
    </equation>

    and

    <\equation>
      <around*|<left|\<\|\|\>|-2>|<big|sum><rsub|T\<in\>\<cal-T\>><1><rsub|\<Gamma\><around*|(|X<rsub|T>|)>><around*|(|\<eta\>,y,t|)>|<right|\<\|\|\>|-2>><rsub|<SL><rsup|<around*|(|1,1|)>><rsub|<around*|(|\<Theta\><rsub|\<Gamma\>>,\<Theta\><rsup|in><rsub|\<Gamma\>>|)>>>\<lesssim\>1.<label|eq:ext-tree-covering:inner-summability>
    </equation>

    The implicit constants do not depend on <math|\<Gamma\>>.
  </lemma>

  <\proof>
    Let us define local sizes <math|<SL><rsup|<around|(|1,1|)>><rsub|<around*|(|\<Theta\>,\<Theta\><rsup|ex+>|)>><rsub|>>
    and <math|<SL><rsup|<around|(|1,1|)>><rsub|<around*|(|\<Theta\>,\<Theta\><rsup|ex->|)>><rsub|>>
    by setting

    <\equation*>
      <ltae|<tformat|<cwith|1|1|1|1|cell-halign|r>|<table|<row|<cell|\<Theta\><rsup|ex\<pm\>><eqd>\<Theta\>\<cap\><around*|{|\<theta\>\<suchthat\>\<pm\>\<theta\>\<geq\>\<gamma\>|}>.>>>>>
    </equation*>

    It suffices to prove this lemma with <math|<SL><rsup|<around|(|1,1|)>><rsub|<around*|(|\<Theta\>,\<Theta\><rsup|ex+>|)>><rsub|>>
    in place of <math|<SL><rsup|<around|(|1,1|)>><rsub|<around*|(|\<Theta\>,\<Theta\><rsup|ex>|)>><rsub|>>.
    A symmetric proof handles the size <math|<SL><rsup|<around|(|1,1|)>><rsub|<around*|(|\<Theta\>,\<Theta\><rsup|ex->|)>><rsub|>>
    and the two results can then be added together.

    \ Without loss of generality we assume that <math|F> is supported on
    <math|\<bbb-K\>\<subset\><around*|[|-S;S|]><rsup|2>\<times\><around|[|S<rsup|-1>;S|]>>
    for some <math|S\<gg\>1>, and by homogeneity we assume that
    <math|<around|\<\|\|\>|F|\<\|\|\>><rsub|<rsup|><SL><rsup|<around|(|1,1|)>><rsub|<around*|(|\<Theta\>,\<Theta\><rsup|ex+>|)>><rsub|><rsub|>>=1>.
    This guarantees a bound on the parameters
    <math|<around*|(|\<xi\><rsub|T>,x<rsub|T>,s<rsub|T>|)>> of any tree
    <math|T\<in\>\<bbb-T\><rsub|\<Theta\>>> for which
    <math|<around|\<\|\|\>|F|\<\|\|\>><rsub|<SL><rsup|<around|(|1,1|)>><rsub|<around*|(|\<Theta\>,\<Theta\><rsup|ex+>|)>><rsub|><rsub|><around|<left|(|1>|T|<right|)|1>>>\<geq\>\<lambda\>>.
    As a matter of fact, it must hold that <math|s<rsub|T>\<gtr\>S<rsup|-1>>,
    because otherwise <math|T<rsub|\<Theta\>><around*|(|\<xi\><rsub|T>,x<rsub|T>,s<rsub|T>|)><rsub|>\<cap\>
    \<bbb-K\>=\<emptyset\>>. It also holds that
    <math|s<rsub|T>\<leq\>2S\<lambda\><rsup|-1>> because\ 

    <\equation*>
      <ltae|<tformat|<table|<row|<cell|s<rsub|T><around|\<\|\|\>|F|\<\|\|\>><rsub|<SL><rsup|<around|(|1,1|)>><rsub|<around*|(|\<Theta\>,\<Theta\><rsup|ex+>|)>><rsub|><rsub|><around|<left|(|2>|T<rsub|\<Theta\>><around*|(|\<xi\><rsub|T>,x<rsub|T>,s<rsub|T>|)><rsup|>|<right|)|2>>>\<leq\>2S<around|\<\|\|\>|F|\<\|\|\>><rsub|<SL><rsup|<around|(|1,1|)>><rsub|<around*|(|\<Theta\>,\<Theta\><rsup|ex+>|)>><rsub|><rsub|><around|<left|(|1>|T<rsub|\<Theta\>><around|(|\<xi\><rsub|T>,0,2S|)><rsup|>|<right|)|1>>>\<leq\>2S>>>>>
    </equation*>

    since <math|T<rsub|\<Theta\>><around*|(|\<xi\><rsub|T>,x<rsub|T>,s<rsub|T>|)>\<cap\>
    \<bbb-K\>\<subset\>T<rsub|\<Theta\>><around|(|\<xi\><rsub|T>,0,2S|)><rsup|>\<cap\>
    \<bbb-K\>> and since we assumed that <math|<around|\<\|\|\>|F|\<\|\|\>><rsub|<SL><rsup|<around|(|1,1|)>><rsub|<around*|(|\<Theta\>,\<Theta\><rsup|ex+>|)>><rsub|><rsub|>>=1>.
    It also holds that <math|<around*|\||x<rsub|T>|\|>\<less\>S+2S\<lambda\><rsup|-1>>
    because otherwise, again <math|T<rsub|\<Theta\>><around*|(|\<xi\><rsub|T>,x<rsub|T>,s<rsub|T>|)>\<cap\>
    \<bbb-K\>=\<emptyset\>>. For the same reason we must have that
    <math|<around*|\||\<xi\><rsub|T>|\|>\<less\>4S<rsup|2><around*|(|S<rsup|2>+<around*|\||\<Theta\>|\|>|)>\<lambda\><rsup|-1>>.\ 

    We want to construct <math|\<cal-T\>> by an iterative algorithm. The
    following preparatory step guarantees that the algorithm will terminate.
    We discretize the set of all trees by setting

    <\equation*>
      <ltae|<tformat|<cwith|1|-1|1|1|cell-halign|l>|<table|<row|<cell|<R><rsup|3,latt><rsub|+>\<assign\><around*|<left|{|1>|<around|(|\<eta\>,y,t|)>:\<eta\>t,y
      t<rsup|-1>\<in\><Z>,t\<in\>2<rsup|<Z>>|<right|}|1>>,>>|<row|<cell|\<bbb-T\><rsub|\<Theta\>><rsup|latt>\<assign\><around*|{|T<rsub|\<Theta\>><rsup|><around|(|\<eta\>,y,t|)>:<around|(|\<eta\>,y,t|)>\<in\><R><rsup|3,latt><rsub|+>|}>.>>>>>
    </equation*>

    Given any <math|T\<in\>\<bbb-T\><rsub|\<Theta\>><rsup|>> we associate to
    it a collection of trees <math|\<cal-W\><around*|(|T|)>\<subset\>
    \<bbb-T\><rsub|\<Theta\>><rsup|latt>> given by

    <\equation*>
      \<cal-W\><around|(|T|)>\<assign\><around*|{|T<rsub|\<Theta\>><around*|(|\<xi\>,x,s|)><rsup|>\<in\>\<bbb-T\><rsub|\<Theta\>><rsup|latt>\<suchthat\>1<rsup|>\<leq\><frac|s|s<rsub|T>>\<less\>2<rsup|4>,<around|\||x-x<rsub|T>|\|>\<leq\>2s<rsub|T>,s<rsub|T><around|\||\<xi\>-\<xi\><rsub|T>|\|>\<less\>2<rsup|8>|}>.
    </equation*>

    It holds that <math|\<mu\><rsub|\<Theta\>><rsup|1><around|<left|(|1>|<big|cup><rsub|T<rprime|'>\<in\><with|font|cal|W><around*|(|T|)>>T<rprime|'>|<right|)|1>>\<lesssim\>\<mu\><rsub|\<Theta\>><rsup|1><around|(|T|)>>
    and <math|<big|cup><rsub|\<heartsuit\>\<in\><around|{|-1,0,1|}>>T<rsub|<around|(|\<xi\><rsub|T>+\<heartsuit\>s<rsub|T><rsup|-1>,x<rsub|T>,s<rsub|T>|)>>\<subset\><big|cup><rsub|T<rprime|'>\<in\><with|font|cal|W><around*|(|T|)>>T<rprime|'>>.
    Take \ <math|\<cal-K\><rsup|latt><rsub|\<lambda\>>\<subset\>
    \<bbb-T\><rsub|\<Theta\>><rsup|latt>> to be\ 

    <\equation*>
      \<cal-K\><rsup|latt><rsub|\<lambda\>>\<assign\><big|cup><rsub|<around*|(|\<xi\><rsub|T>,x<rsub|T>,s<rsub|T>|)>\<in\>A\<subset\><R><rsup|3><rsub|+>>\<cal-W\><around|<left|(|1>|T<rsub|\<Theta\>><rsup|><around*|(|\<xi\><rsub|T>,x<rsub|T>,s<rsub|T>|)>|<right|)|1>>\<subset\>\<bbb-T\><rsub|\<Theta\>><rsup|latt>
    </equation*>

    where <math|>

    <\equation*>
      A<eqd><around*|<left|{|3>|<around*|(|\<xi\><rsub|T>,x<rsub|T>,s<rsub|T>|)>\<suchthat\>S<rsup|-1>\<leq\>s<rsub|T>\<leq\>2S\<lambda\><rsup|-1>,<around|\||x<rsub|T>|\|>\<leq\>S+2S\<lambda\><rsup|-1>,<around|\||\<xi\><rsub|T>|\|>\<leq\>4S<rsup|2><around*|(|S<rsup|2>+<around*|\||\<Theta\>|\|>|)>\<lambda\><rsup|-1>|<right|}|3>>,
    </equation*>

    so that the trees in <math|\<cal-K\><rsup|latt><rsub|\<lambda\>>> cover
    <math|\<bbb-K\>> and so that for any tree
    <math|T\<in\><TT><rsub|\<Theta\>>> such that
    <math|<around|\<\|\|\>|F|\<\|\|\>><rsub|<SL><rsup|<around|(|1,1|)>><rsub|<around*|(|\<Theta\>,\<Theta\><rsup|ex+>|)>><rsub|><rsub|><around|(|T|)>>\<geq\>\<lambda\>>
    it holds that <math|\<cal-W\><around|(|T|)>\<subset\>\<cal-K\><rsup|latt><rsub|\<lambda\>>>.
    The collection <math|\<cal-K\><rsup|latt><rsub|\<lambda\>>> is finite,
    since the tops of trees in <math|\<cal-K\><rsup|latt><rsub|\<lambda\>>>
    are a bounded subset of the discrete set <math|<R><rsup|3,latt><rsub|+>>.\ 

    Let us now proceed to the actual selection algorithm. Given a collection
    of trees <math|\<cal-X\>\<subset\>\<bbb-T\><rsub|\<Theta\>><rsup|>> we
    say that <math|T\<in\>\<cal-X\>> is <em|quasi-maximal> if

    <\equation*>
      T<rprime|'>\<in\>\<cal-X\>\<Longrightarrow\>\<xi\><rsub|T<rprime|'>>\<leq\>\<xi\><rsub|T>+\<varepsilon\><rsub|max>
    </equation*>

    with a constant <math|\<varepsilon\><rsub|max>=\<varepsilon\><rsub|max><around*|(|\<lambda\>,S|)>>
    to be determined later. We start with the collection
    <math|\<cal-T\><rsub|0>=\<emptyset\>> and let
    <math|\<bbb-K\><rsub|0>\<assign\>\<bbb-K\>>. Suppose that at step
    <math|n> we have a collection <math|\<cal-T\><rsub|n>=<around*|{|T<rsub|1>,\<ldots\>,T<rsub|n>|}>\<subset\>\<bbb-T\><rsub|\<Theta\>><rsup|>>
    and a subset <math|\<bbb-K\><rsub|n>\<subset\>\<bbb-K\>>. At step
    <math|n+1> let

    <\equation*>
      <math|\<cal-X\><rsub|n+1>\<assign\><around|<left|{|2>|T\<in\>\<bbb-T\><rsub|\<Theta\>>:<around|\<\|\|\>|<1><rsub|\<bbb-K\><rsub|n><rsub|>>F|\<\|\|\>><rsub|<SL><rsup|<around|(|1,1|)>><rsub|<around*|(|\<Theta\>,\<Theta\><rsup|ex+>|)>><rsub|><rsub|><around|(|T|)>>\<geq\>\<lambda\>|<right|}|2>>>;
    </equation*>

    if <math|\<cal-X\><rsub|n+1>> is empty, we terminate the iteration,
    otherwise we choose a quasi-maximal element <math|T<rsub|n+1>> of
    <math|\<cal-X\><rsub|n+1>>; this can be done since
    <math|<around|<left|{|2>|<around|(|\<xi\>,x,s|)>\<in\><R><rsup|3><rsub|+>\<suchthat\>T<rsub|\<Theta\>><around|(|\<xi\>,x,s|)><rsup|>\<in\>\<cal-X\><rsub|n+1>|<right|}|2>>>
    is precompact and non-empty, and thus has at least one quasi-maximal
    element. Let <math|\<cal-T\><rsub|n+1>=\<cal-T\><rsub|n>\<cup\><around*|{|T<rsub|n+1>|}>>
    and let <math|X<rsub|T<rprime|'>>\<assign\>\<bbb-K\><rsub|n>\<cap\>\<pi\><rsub|T<rsub|n+1>><around*|(|<mT><rsub|\<Theta\><rsup|ex+>>|)><rsub|>>.
    Now set \ <math|\<bbb-K\><rsub|n+1>=\<bbb-K\><rsub|n>\<setminus\><big|cup><rsub|T<rprime|'>\<in\><with|font|cal|W><around*|(|T<rsub|n+1>|)>>T<rprime|'>>.
    This process terminates after finitely many steps: if <math|T<rsub|n+1>>
    gets selected then\ 

    <\equation*>
      \<cal-W\><around*|(|T<rsub|n+1>|)>\<cap\><around*|<left|(|-1>|\<cal-K\><rsup|latt><rsub|\<lambda\>>\<setminus\><big|cup><rsub|n<rprime|'>=0><rsup|n>\<cal-W\><around*|(|T<rsub|n<rprime|'>>|)>|<right|)|-1>>\<neq\>\<emptyset\>,
    </equation*>

    given that \ <math|T<rsub|n<rprime|'>>\<subset\><big|cup><rsub|T<rprime|'>\<in\><with|font|cal|W><around*|(|T<rsub|n<rprime|'>>|)>>T<rprime|'>>
    for any <math|n<rprime|'>> and that

    <\equation*>
      <around|\<\|\|\>|F|\<\|\|\>><rsub|<SL><rsup|<around|(|1,1|)>><rsub|<around*|(|\<Theta\>,\<Theta\><rsup|ex+>|)>><rsub|><rsub|><around|(|T<rsub|n+1>|)>>\<geq\><around|\<\|\|\>|<1><rsub|\<bbb-K\><rsub|n><rsub|>>F|\<\|\|\>><rsub|<SL><rsup|<around|(|1,1|)>><rsub|<around*|(|\<Theta\>,\<Theta\><rsup|ex+>|)>><rsub|><rsub|><around|(|T<rsub|n+1>|)>>\<gtr\>\<lambda\>
    </equation*>

    and thus <math|\<cal-W\><around|(|T|)>\<subset\>\<cal-K\><rsup|latt><rsub|\<lambda\>>>.
    By construction, <math|\<cal-K\><rsup|latt><rsub|\<lambda\>>\<setminus\><big|cup><rsub|n<rprime|'>=0><rsup|n>\<cal-W\><around*|(|T<rsub|n<rprime|'>>|)>>
    is thus a sequence of finite collections of trees that is strictly
    decreasing in <math|n> as long as the algorithm continues. The collection
    eventually stabilizes so the algorithm terminates.

    The procedure described above yields a collection of trees
    <math|\<cal-T\>=<big|cup><rsub|n\<in\><N>><mc|T><rsub|n>> and
    distinguished subsets <math|X<rsub|T<rprime|'>>\<subset\>\<pi\><rsub|T<rprime|'>><around*|(|<mT><rsub|\<Theta\><rsup|ex+>>|)>>
    for any <math|T<rprime|'>\<in\><with|font|cal|T>>. According to the
    selection criterion, it holds that\ 

    <\equation*>
      <frac|1|\<mu\><rsup|1><rsub|\<Theta\>><around*|(|T|)>><big|int><rsub|X<rsub|T>><around*|\||F<around*|(|\<eta\>,y,t|)>|\|>
      \<mathd\> \<eta\>\<mathd\>y\<mathd\>t\<geq\> \<lambda\>.
    </equation*>

    We set <math|W<rsub|\<lambda\>>=<big|cup><rsub|T\<in\>\<cal-T\>>W<around|(|T|)>\<supset\><big|cup><rsub|T\<in\>\<cal-T\>>T>
    and thus we have <math|\<mu\><rsup|1><rsub|\<Theta\>><around*|(|W<rsub|\<lambda\>>|)>\<lesssim\><big|sum><rsub|T\<in\>\<cal-T\>>\<mu\><rsup|1><rsub|\<Theta\>><around*|(|T|)>>.
    Since the procedure terminated it holds that
    <math|<around*|<left|\<\|\|\>|2>|<1><rsub|\<bbb-K\>\<setminus\>W<rsub|\<lambda\>>>F|<right|\<\|\|\>|2>><rsub|<SL><rsup|<around|(|1,1|)>><rsub|<around*|(|\<Theta\>,\<Theta\><rsup|ex+>|)>>>\<leq\>\<lambda\>>.
    It remains to show bounds <eqref|eq:ext-tree-covering:ext-summability>
    and <eqref|eq:ext-tree-covering:inner-summability>. The former follows
    since the sets <math|X<rsub|T>> are constructed to be pairwise disjoint.
    To show the latter bound let us show that\ 

    <\equation>
      <big|int><rsub|<R><rsub|+>><big|sum><rsub|T\<in\>\<cal-T\>><1><rsub|X<rsub|T>><around*|(|\<xi\>+\<theta\>t<rsup|-1>,x,t|)><frac|\<mathd\>
      t|t>\<lesssim\>1+log<around*|<left|(|-1>|1+<frac|<around*|\||\<Theta\><rsup|ex+>|\|>|<dist><around*|(|\<theta\>,\<Theta\><rsup|ex+>|)>>|<right|)|-1>><label|eq:treesel-contra-claim-integral>
    </equation>

    for any <math|\<xi\>,x\<in\><R>> and <math|\<theta\>\<in\>\<Theta\><rsup|in>>
    with some absolute constant. This is sufficient to deduce
    <eqref|eq:ext-tree-covering:inner-summability>: using a change of
    variables we would then rewrite condition
    <eqref|eq:ext-tree-covering:inner-summability> and get

    <\equation*>
      <ltae|<tformat|<cwith|1|1|1|1|cell-halign|l>|<cwith|2|2|1|1|cell-halign|l>|<table|<row|<cell|<around*|<left|\<\|\|\>|-2>|<big|sum><rsub|T\<in\>\<cal-T\>><1><rsub|\<Gamma\><around*|(|X<rsub|T>|)>><around*|(|\<eta\>,y,t|)>|<right|\<\|\|\>|-2>><rsub|<SL><rsup|<around*|(|1,1|)>><rsub|<around*|(|\<Theta\><rsub|\<Gamma\>>,\<Theta\><rsup|in><rsub|\<Gamma\>>|)>><around*|(|T<rsub|\<Theta\><rsub|\<Gamma\>>><around*|(|\<alpha\>\<xi\>,x,s|)>|)>>>>|<row|<cell|\<leq\><big|int><rsub|B<rsub|1>><big|int><rsub|\<Theta\><rsup|in><rsub|\<Gamma\>>><big|int><rsub|<R><rsub|+>><big|sum><rsub|T\<in\>\<cal-T\>><1><rsub|\<Gamma\><around*|(|X<rsub|T>|)>><around*|(|\<alpha\>\<xi\>+\<theta\><around*|(|s\<sigma\>|)><rsup|-1>,x<rsub|>+s<rsub|>\<zeta\>,s<rsub|>\<sigma\>|)><frac|\<mathd\>
      \<sigma\>|\<sigma\>><frac|<dd>\<zeta\><dd>\<theta\>|<around*|\||\<Theta\><rsub|\<Gamma\>>|\|>>>>|<row|<cell|\<leq\><big|int><rsub|B<rsub|1>><big|int><rsub|\<Theta\><rsup|in><rsub|>><big|int><rsub|<R><rsub|+>><big|sum><rsub|T\<in\>\<cal-T\>><1><rsub|\<Gamma\><around*|(|X<rsub|T>|)>><around*|(|\<alpha\>\<xi\>+\<alpha\>\<beta\><around*|(|\<theta\><rprime|'>+\<gamma\>|)><around*|(|s<rsub|>\<beta\>\<sigma\><rprime|'>|)><rsup|-1>,x<rsub|>+s<rsub|>\<zeta\>,s<rsub|>\<beta\>\<sigma\><rprime|'>|)><frac|\<mathd\>
      \<sigma\><rprime|'>|\<sigma\><rprime|'>><frac|<dd>\<zeta\><dd>\<theta\><rprime|'>|<around*|\||\<Theta\>|\|>>>>|<row|<cell|\<leq\><big|int><rsub|B<rsub|1>><big|int><rsub|\<Theta\><rsup|in>><big|int><rsub|<R><rsub|+>><big|sum><rsub|T\<in\>\<cal-T\>><1><rsub|X<rsub|T>><around*|(|\<xi\>+\<theta\><rprime|'><around*|(|s\<sigma\><rprime|'>|)><rsup|-1>,x<rsub|T>+s<rsub|>\<zeta\>,s<rsub|>\<sigma\><rprime|'>|)><frac|\<mathd\>
      \<sigma\><rprime|'>|\<sigma\><rprime|'>><frac|<dd>\<zeta\><dd>\<theta\><rprime|'>|<around*|\||\<Theta\>|\|>>>>|<row|<cell|\<leq\><big|int><rsub|B<rsub|1>><big|int><rsub|\<Theta\><rsup|in>><around*|(|1+log<around*|<left|(|-1>|1+<frac|<around*|\||\<Theta\><rsup|ex>|\|>|<dist><around*|(|\<theta\><rprime|'>,\<Theta\><rsup|ex>|)>>|<right|)|-1>>|)><frac|<dd>\<zeta\><dd>\<theta\><rprime|'>|<around*|\||\<Theta\>|\|>>\<lesssim\>1+<around*|\||\<Theta\>|\|>.>>>>>
    </equation*>

    Fix <math|\<xi\>,x\<in\><R>> and <math|\<theta\>\<in\>\<Theta\><rsup|in>>
    and let us prove <eqref|eq:treesel-contra-claim-integral> by showing that\ 

    <\equation>
      <frac|\<tau\><rsub|+>|\<tau\><rsub|->>\<leq\><frac|2<around*|\||\<Theta\><rsup|ex+>|\|>|<dist><around*|(|\<theta\>,\<Theta\><rsup|ex+>|)>>+1,<label|eq:treesel-contra-claim>
    </equation>

    where

    <\equation*>
      <ltae|<tformat|<cwith|2|2|1|1|cell-halign|l>|<table|<row|<cell|\<tau\><rsub|+>\<assign\>sup<around*|{|t\<in\><around*|[|0,+\<infty\>|)>\<suchthat\><around*|(|\<xi\>+\<theta\>t<rsup|-1>,x,t|)>\<in\><big|cup><rsub|T\<in\>\<cal-T\>>X<rsub|T>|}>,>>|<row|<cell|\<tau\><rsub|->\<assign\>inf<around*|<left|{|-1>|t\<in\><around*|[|0,+\<infty\>|)>\<suchthat\><around*|(|\<xi\>+\<theta\>t<rsup|-1>,x,t|)>\<in\><big|cup><rsub|T\<in\>\<cal-T\>>X<rsub|T>|<right|}|-1>>.>>>>>
    </equation*>

    The quantity <math|\<tau\><rsub|+>> is positive and finite unless
    <math|<big|sum><rsub|T\<in\>\<cal-T\>><1><rsub|X<rsub|T>><around*|(|\<xi\>+\<theta\>t<rsup|-1>,x,t|)>=0>
    for all <math|t>, but then <LHS|<eqref|eq:treesel-contra-claim-integral>>
    vanishes. According to the definition of <math|\<tau\><rsub|+>> we may
    find <math|t<rsub|0>\<in\><around*|(|<frac|\<tau\><rsub|+>|1+\<varepsilon\>>,\<tau\><rsub|+>|)>>
    and a tree <math|T<rsub|0>> such that
    <math|<around*|(|\<xi\>+\<theta\>t<rsup|-1>,x,t|)>\<in\>X<rsub|T<rsub|0>>>.\ 

    Let <math|\<cal-T\><rsub|\<gtr\>>> be the subset of trees in
    <math|<mc|T>> selected <with|font-shape|italic|after> <math|T<rsub|0>> by
    the algorithm of this proof. It holds that\ 

    <\equation*>
      inf<around*|<left|{|-1>|t\<in\><around*|[|0,+\<infty\>|)>\<suchthat\><around*|(|\<xi\>+\<theta\>t<rsup|-1>,x,t|)>\<in\><big|cup><rsub|T\<in\>\<cal-T\><rsub|\<gtr\>>>X<rsub|T>|<right|}|-1>>\<geq\>t<rsub|0>=<frac|\<tau\><rsub|+>|1+\<varepsilon\><rsub|max>>.
    </equation*>

    As a matter of fact <math|<around*|(|\<xi\>+\<theta\><wide|t|~><rsup|-1>,x,<wide|t|~>|)>\<in\>T<rsub|0>>
    for any <math|<wide|t|~>\<less\>t<rsub|0>> so in particular
    <math|<around*|(|\<xi\>+\<theta\><wide|t|~><rsup|-1>,x,<wide|t|~>|)>\<notin\>X<rsub|T<rsub|\<gtr\>>>\<subset\>T<rsub|\<gtr\>>\<setminus\>T<rsub|0>>
    for any <math|T<rsub|\<gtr\>>\<in\><mc|T>> selected after
    <math|T<rsub|0>>.\ 

    Let us then focus a tree <math|T<rsub|\<less\>>\<in\><mc|T><rsub|\<less\>>>
    selected before <math|T<rsub|0>>. By quasi-maximality we \ have that
    <math|-\<varepsilon\><rsub|max>+\<xi\><rsub|T<rsub|0>>\<leq\>\<xi\><rsub|T<rsub|\<less\>>>>
    and thus

    <\equation*>
      \<xi\>-\<xi\><rsub|T<rsub|\<less\>>>\<leq\>\<xi\>-\<xi\><rsub|T<rsub|0>>+\<varepsilon\><rsub|max>.
    </equation*>

    If <math|\<xi\><rsub|T<rsub|\<less\>>>\<geq\>\<xi\>> then we would have
    that <math|\<pi\><rsub|T<rsub|\<less\>>><around*|(|<mT><rsub|\<Theta\><rsup|ex+>>|)>\<cap\><around*|<left|{|1>|<around*|(|\<xi\>+\<theta\>t<rsup|-1>,x,t|)>:t\<in\><R><rsub|+>|<right|}|1>>=\<emptyset\>>
    so \ <math|T<rsub|\<less\>>> would not contribute to defining
    <math|\<tau\><rsup|->>. Suppose <math|\<xi\><rsub|T<rsub|\<less\>>>\<less\>\<xi\>>;
    then it holds that

    <\equation*>
      <around*|<left|{|2>|t:<around*|(|\<xi\>+\<theta\>t<rsup|-1>,x,t|)>\<in\>\<pi\><rsub|T<rsub|\<less\>>><around*|(|<mT><rsub|\<Theta\><rsup|ex+>>|)>|<right|}|2>>\<subset\><around*|<left|(|-1>|<frac|<dist><around*|(|\<theta\>,\<Theta\><rsup|ex+>|)>|\<xi\>-\<xi\><rsub|T<rsub|\<less\>>>>,+\<infty\>|<right|)|-1>>\<subset\><around*|<left|(|-1>|<frac|<dist><around*|(|\<theta\>,\<Theta\><rsup|ex+>|)>|\<xi\>-\<xi\><rsub|T<rsub|0>>+\<varepsilon\><rsub|max><rsub|>>,+\<infty\>|<right|)|-1>>
    </equation*>

    \ To bound <math|<frac|<dist><around*|(|\<theta\>,\<Theta\><rsup|ex+>|)>|\<xi\>-\<xi\><rsub|T<rsub|0>>+\<varepsilon\><rsub|max><rsub|>>>
    from below we use the fact that <math|<around*|(|\<xi\>+\<theta\>t<rsub|0><rsup|-1>,x,t<rsub|0>|)>\<in\>X<rsub|T<rsub|0>>>
    and, as a consequence,

    <\equation*>
      <frac|<dist><around*|(|\<theta\>,\<Theta\><rsup|ex+>|)>|t<rsub|0>>\<less\>\<xi\>-\<xi\><rsub|T<rsub|0>>\<less\><frac|<around*|\||\<Theta\><rsup|ex+>|\|>|t<rsub|0>>
    </equation*>

    because <math|X<rsub|T<rsub|0>>\<subset\><around*|<left|{|2>|<around*|(|\<xi\><rsub|T<rsub|0>>+<wide|\<theta\>|\<bar\>><wide|t|\<bar\>><rsup|-1>,<wide|x|\<bar\>>,<wide|t|\<bar\>>|)>:<wide|\<theta\>|\<bar\>>\<in\>\<Theta\><rsup|ex+>,<wide|x|\<bar\>>\<in\>B<rsub|s<rsub|T<rsub|0>>><around*|(|x<rsub|T<rsub|0>>|)>,<wide|t|\<bar\>>\<less\>s<rsub|T<rsub|0>>|<right|}|2>>>.
    It follows that\ 

    <\equation*>
      <around*|<left|{|2>|t:<around*|(|\<xi\>+\<theta\>t<rsup|-1>,x,t|)>\<in\>\<pi\><rsub|T<rsub|\<less\>>><around*|(|<mT><rsub|\<Theta\><rsup|ex+>>|)>|<right|}|2>>\<subset\><around*|<left|(|-1>|t<rsub|0>
      <frac|<dist><around*|(|\<theta\>,\<Theta\><rsup|ex+>|)>|<around*|\||\<Theta\><rsup|ex+>|\|>+\<varepsilon\><rsub|max><rsub|>t<rsub|0>>,+\<infty\>|<right|)|-1>>.
    </equation*>

    Recall that <math|t<rsub|0>\<less\>2S\<lambda\><rsup|-1>> since all trees
    <math|T> in <math|<mc|T>> satisfy <math|s<rsub|T>\<less\>2S\<lambda\><rsup|-1>>.
    It is sufficient to take <math|\<varepsilon\><rsub|max>=<frac|\<lambda\><around*|\||\<Theta\><rsup|ex+>|\|>|2S>>
    to yield\ 

    <\equation*>
      <around*|<left|{|2>|t:<around*|(|\<xi\>+\<theta\>t<rsup|-1>,x,t|)>\<in\>\<pi\><rsub|T<rsub|\<less\>>><around*|(|<mT><rsub|\<Theta\><rsup|ex+>>|)>|<right|}|2>>\<subset\><around*|<left|(|-1>|<frac|\<tau\><rsub|+>|<around*|(|1+\<varepsilon\>|)>>
      <frac|<dist><around*|(|\<theta\>,\<Theta\><rsup|ex+>|)>|2<around*|\||\<Theta\><rsup|ex+>|\|>>,+\<infty\>|<right|)|-1>>
    </equation*>

    and prove that \ 

    <\equation*>
      \<tau\><rsub|->\<gtr\><frac|\<tau\><rsub|+>|<around*|(|1+\<varepsilon\>|)>>min
      <around*|<left|(|-1>|<frac|<dist><around*|(|\<theta\>,\<Theta\><rsup|ex+>|)>|2<around*|\||\<Theta\><rsup|ex+>|\|><around*|(|1+\<varepsilon\>|)>>,1|<right|)|-1>>
    </equation*>

    \ Since <math|\<varepsilon\>\<gtr\>0> can be chosen arbitrarily, this
    proves our claim.
  </proof>

  The covering lemma above allows us to obtain the following uniform weak
  <math|L<rsup|1>> bound.\ 

  <\lemma>
    <label|lem:unif-Sex-bound>The bound

    <\equation>
      <around*|\<\|\|\>|F\<circ\>\<Gamma\>|\<\|\|\>><rsub|L<rsup|1,\<infty\>><rsub|\<mu\><rsub|\<Theta\>><rsup|1>>\<Gamma\><rsup|\<ast\>><SL><rsup|<around|(|1,1|)>><rsub|<around|(|\<Theta\>,\<Theta\><rsup|ex>|)>>>\<lesssim\><around*|<left|\<\|\|\>|1>|F|<right|\<\|\|\>|1>><rsub|L<rsup|1><rsub|\<mu\><rsub|\<Theta\><rsub|\<Gamma\>>><rsup|1>><around*|(|<SL><rsup|<around|(|\<infty\>,\<infty\>|)>><rsub|\<Theta\><rsub|\<Gamma\>>>+<SL><rsup|<around|(|1,1|)>><rsub|<around|(|\<Theta\><rsub|\<Gamma\>>,\<Theta\><rsup|ex><rsub|\<Gamma\>>|)>>|)>><label|eq:unif-Sex-bound>
    </equation>

    holds for any <math|F\<in\><Rad><around*|(|<R><rsup|3><rsub|+>|)>>.
  </lemma>

  <\proof>
    We need to show that for every <math|\<lambda\>\<gtr\>0> there exists a
    set <math|W<rsub|\<lambda\>>=<big|cup><rsub|T\<in\><with|font|cal|T>\<subset\>\<bbb-T\><rsub|\<Theta\>>>T>
    such that\ 

    <\equation*>
      <ltae|<tformat|<cwith|1|-1|1|1|cell-halign|l>|<table|<row|<cell|<around*|<left|\<\|\|\>|1>|<1><rsub|<R><rsup|3><rsub|+>\<setminus\>W<rsub|\<lambda\>>
      >F\<circ\>\<Gamma\>|<right|\<\|\|\>|1>><rsub|<SL><rsup|<around|(|1,1|)>><rsub|<around|(|\<Theta\>,\<Theta\><rsup|ex>|)>>>\<leq\>\<lambda\>,>>|<row|<cell|\<mu\><rsub|\<Theta\>><rsup|1><around*|(|W<rsub|\<lambda\>>|)>\<lesssim\>
      \<lambda\><rsup|-1><around|\<\|\|\>|F|\<\|\|\>><rsub|L<rsup|1><rsub|\<mu\><rsub|\<Theta\><rsub|\<Gamma\>><rsup|>><rsup|1>><around*|(|<SL><rsup|<around|(|\<infty\>,\<infty\>|)>><rsub|\<Theta\><rsub|\<Gamma\>><rsup|><rsup|>>+<SL><rsup|<around|(|1,1|)>><rsub|<around|(|\<Theta\><rsub|\<Gamma\>><rsup|>,\<Theta\><rsub|\<Gamma\>><rsup|ex>|)>>|)>>.>>>>>
    </equation*>

    We may assume that <math|F> is supported on a compact set by the
    discussion at the end of <smart-ref|sec:sizes>. Fix
    <math|\<lambda\>\<gtr\>0> and let <math|W<rsub|\<lambda\>>\<assign\><big|cup><rsub|T\<in\><with|font|cal|T<rsub|>><rsub|\<lambda\>>\<subset\>\<bbb-T\><rsub|\<Theta\>>>T>
    where <math|\<cal-T\><rsub|\<lambda\>>\<subset\>\<bbb-T\><rsub|\<Theta\>>><math|><math|>
    is obtained by applying Lemma <reference|lem:ext-tree-covering> to
    <math|F\<circ\>\<Gamma\><rsub|>> in place of <math|F>. \ It remains to
    prove the required bounds on <math|\<mu\><rsub|\<Theta\>><rsup|1><around*|(|W<rsub|\<lambda\>>|)>>.
    For each tree <math|T\<in\>\<cal-T\><rsub|\<lambda\>>>, Lemma
    <reference|lem:ext-tree-covering> gives the bound

    <\equation*>
      \<lambda\>\<mu\><rsup|1><rsub|\<Theta\>><around*|(|T|)>\<leq\><big|int><rsub|X<rsub|T>><around*|<left|\||1>|F\<circ\>\<Gamma\><around|(|\<eta\>,y,t|)>|<right|\||1>>\<mathd\>\<eta\>
      \<mathd\>y \<mathd\>t.
    </equation*>

    Summing the bound over all trees <math|T\<in\>\<cal-T\><rsub|\<lambda\>>>
    and applying a change of variables gives\ 

    <\equation*>
      <ltae|<tformat|<cwith|1|-1|1|1|cell-halign|l>|<table|<row|<cell|\<lambda\>\<mu\><rsup|1><rsub|\<Theta\>><around*|(|W<rsub|\<lambda\>>|)><tabular*|<tformat|<cwith|1|1|1|1|cell-halign|l>|<twith|table-valign|T>|<cwith|2|2|1|1|cell-halign|l>|<table|<row|<cell|\<lesssim\>\<lambda\><big|sum><rsub|T\<in\><with|font|cal|T><rsub|\<lambda\>>>\<mu\><rsup|1><rsub|\<Theta\>><around*|(|T|)>\<lesssim\><big|int><rsub|<R><rsup|3><rsub|+>><around*|<left|(|-2>|<big|sum><rsub|T\<in\>\<cal-T\><rsub|\<lambda\>>><1><rsub|X<rsub|T>><around|(|\<eta\>,y,t|)>|<right|)|-2>><around*|<left|\||1>|F\<circ\>\<Gamma\><rsub|><around|(|\<eta\>,y,t|)>|<right|\||1>>\<mathd\>\<eta\>
      \<mathd\>y \<mathd\>t>>|<row|<cell|=<big|int><rsub|<R><rsup|3><rsub|+>><around*|<left|(|-2>|<big|sum><rsub|T\<in\>\<cal-T\><rsub|\<lambda\>>><1><rsub|X<rsub|T>><around|(|\<eta\>,y,t|)>|<right|)|-2>><around*|<left|\||1>|F<around|(|\<alpha\><around*|(|\<eta\>+\<gamma\>t<rsup|-1>|)>,y,\<beta\>t|)>|<right|\||1>>\<mathd\>\<eta\>
      \<mathd\>y \<mathd\>t>>|<row|<cell|=<big|int><rsub|<R><rsup|3><rsub|+>><around*|<left|(|-2>|<big|sum><rsub|T\<in\>\<cal-T\><rsub|\<lambda\>>><1><rsub|\<Gamma\><around*|(|X<rsub|T>|)>><around|(|\<alpha\><around*|(|\<eta\>+\<gamma\>t<rsup|-1>|)>,y,\<beta\>t|)>|<right|)|-2>><around*|<left|\||1>|F<around|(|\<alpha\><around*|(|\<eta\>+\<gamma\>t<rsup|-1>|)>,y,\<beta\>t|)>|<right|\||1>>\<mathd\>\<eta\>
      \<mathd\>y \<mathd\>t>>|<row|<cell|=<big|int><rsub|<R><rsup|3><rsub|+>><frac|1|\<alpha\>\<beta\>><around*|<left|(|-2>|<big|sum><rsub|T\<in\>\<cal-T\><rsub|\<lambda\>>><1><rsub|\<Gamma\><around*|(|X<rsub|T>|)>><around|(|\<eta\>,y,t|)>|<right|)|-2>><around*|<left|\||1>|F<around|(|\<eta\>,y,t|)>|<right|\||1>>\<mathd\>\<eta\>
      \<mathd\>y \<mathd\>t.>>>>>>>>>>
    </equation*>

    It remains to bound the <math|<RHS|>> of this inequality from above. By
    <smart-ref|prop:outer-RN> we have that\ 

    <\equation*>
      <ltae|<tformat|<cwith|1|-1|1|1|cell-halign|l>|<table|<row|<cell|<big|int><rsub|<R><rsup|3><rsub|+>><around*|<left|(|-2>|<big|sum><rsub|T\<in\>\<cal-T\><rsub|\<lambda\>>><1><rsub|\<Gamma\><around*|(|X<rsub|T>|)>><around|(|\<eta\>,y,t|)>|<right|)|-2>><around*|\||F<around|(|\<eta\>,y,t|)>|\|>\<mathd\>\<eta\>
      \<mathd\>y \<mathd\>t>>|<row|<cell|<space|2em>\<lesssim\><around|\<\|\|\>|F|\<\|\|\>><rsub|L<rsup|1><rsub|\<mu\><rsub|\<Theta\><rsub|2>><rsup|1>><around*|<left|(|-1>|<SL><rsup|<around|(|\<infty\>,\<infty\>|)>><rsub|\<Theta\><rsub|\<Gamma\>>>+<SL><rsup|<around|(|1,1|)>><rsub|<around*|(|\<Theta\><rsub|\<Gamma\>>,\<Theta\><rsub|\<Gamma\>><rsup|ex>|)>>|<right|)|-1>>><around|<left|\<\|\|\>|2>|<big|sum><rsub|T\<in\>\<cal-T\><rsub|\<lambda\>><rsub|>><1><rsub|\<Gamma\><around*|(|X<rsub|T>|)>><around|(|\<eta\>,y,t|)>|<right|\<\|\|\>|2>><rsub|L<rsup|\<infty\>><rsub|\<mu\><rsub|\<Theta\>><rsup|1>><around*|<left|(|-1>|<SL><rsup|<around|(|1,1|)>><rsub|<around*|(|\<Theta\><rsub|\<Gamma\>>,\<Theta\><rsub|\<Gamma\>><rsup|in>|)>>+<SL><rsup|<around|(|\<infty\>,\<infty\>|)>><rsub|\<Theta\><rsub|\<Gamma\>>>|<right|)|-1>>>.>>>>>
    </equation*>

    Since

    <\equation*>
      <ltae|<tformat|<cwith|1|1|1|1|cell-halign|l>|<twith|table-valign|T>|<table|<row|<cell|<around|<left|\<\|\|\>|2>|<big|sum><rsub|T\<in\>\<cal-T\><rsub|\<lambda\>><rsub|>><1><rsub|\<Gamma\><around*|(|X<rsub|T>|)>><around|(|\<eta\>,y,t|)>|<right|\<\|\|\>|2>><rsub|L<rsup|\<infty\>><rsub|\<mu\><rsub|\<Theta\>><rsup|1>><around*|<left|(|-1>|<SL><rsup|<around|(|1,1|)>><rsub|<around*|(|\<Theta\><rsub|\<Gamma\>>,\<Theta\><rsub|\<Gamma\>><rsup|in>|)>>+<SL><rsup|<around|(|\<infty\>,\<infty\>|)>><rsub|<around*|(|\<Theta\><rsub|\<Gamma\>>,\<Theta\><rsub|\<Gamma\>><rsup|ex>|)>>|<right|)|-1>>>\<lesssim\>1>>>>>
    </equation*>

    this concludes the proof.
  </proof>

  We are now ready to deduce <smart-ref|prop:unif-gamma-bounds:Sex> from
  <smart-ref|lem:unif-Sex-bound>. We use <smart-ref|lem:wave-packet-decomposition>
  to reduce to the scalar case i.e. to proving bounds for
  <math|F\<in\><Rad><around*|(|<R><rsup|3><rsub|+>|)>> instead of for
  <math|F\<in\><Rad><around*|(|<R><rsup|3><rsub|+>|)>\<otimes\>\<Phi\><rsup|N><rsub|<gr>>>.
  Then we conclude using a restricted weak type interpolation argument.\ 

  <\render-proof>
    Proof of <smart-ref|prop:unif-gamma-bounds:Sex>
  <|render-proof>
    We begin by reducing to the scalar bound. In particular, a
    straightforward adaptation of \ <smart-ref|cor:wave-packet-decomposition-and-sizes>
    to the case of the sizes <math|\<Gamma\><rsup|\<ast\>><SL><rsup|<around|(|u,2|)>><rsub|<around|(|\<Theta\>,\<Theta\><rsup|ex>|)>>>
    shows that\ 

    <\equation*>
      <around*|<left|\<\|\|\>|1>|F\<circ\>\<Gamma\>|<right|\<\|\|\>|1>><rsub|L<rsup|r><rsub|\<mu\><rsub|\<Theta\>><rsup|1>>\<Gamma\><rsup|\<ast\>><SL><rsup|<around|(|u,2|)>><rsub|<around|(|\<Theta\>,\<Theta\><rsup|ex>|)>>\<Phi\><rsup|N><rsub|<gr>>>\<lesssim\>sup<rsub|\<phi\>><around*|\<\|\|\>|F\<circ\>\<Gamma\><around*|(|\<eta\>,y,t|)><around*|[|\<phi\>|]>|\<\|\|\>><rsub|L<rsup|r><rsub|\<mu\><rsub|\<Theta\>><rsup|1>>\<Gamma\><rsup|\<ast\>><SL><rsup|<around|(|u,2|)>><rsub|<around|(|\<Theta\>,\<Theta\><rsup|ex>|)>>>
    </equation*>

    where the upper bound is taken over all
    <math|\<phi\>\<in\>\<Phi\><rsup|N<rprime|'>><rsub|2<gr>>> with
    <math|<around*|\<\|\|\>|\<phi\>|\<\|\|\>><rsub|\<Phi\><rsup|N<rprime|'>><rsub|2<gr>>>\<lesssim\>1>,
    as long as <math|N\<geq\>N<rprime|'>+4>. Bound
    <smart-ref|eq:unif-gamma-bounds:Sex> can thus be deduced from

    <\equation>
      <around*|<left|\<\|\|\>|1>|F\<circ\>\<Gamma\>|<right|\<\|\|\>|1>><rsub|L<rsup|r><rsub|\<mu\><rsub|\<Theta\>><rsup|1>>\<Gamma\><rsup|\<ast\>><SL><rsup|<around|(|u,2|)>><rsub|<around|(|\<Theta\>,\<Theta\><rsup|ex>|)>>>\<lesssim\><around*|<left|\<\|\|\>|1>|F|<right|\<\|\|\>|1>><rsub|L<rsup|r><rsub|\<mu\><rsub|\<Theta\><rsub|\<Gamma\>>><rsup|1>><around*|(|<SL><rsup|<around|(|\<infty\>,\<infty\>|)>><rsub|\<Theta\><rsub|\<Gamma\>>>+<SL><rsup|<around|(|<wide|u|\<bar\>>,2|)>><rsub|<around|(|\<Theta\><rsub|\<Gamma\>>,\<Theta\><rsup|ex><rsub|\<Gamma\>>|)>>|)>><label|eq:unif-gamma-bound-non-iter:Sex:scalar>
    </equation>

    for all <math|F\<in\><Rad><around*|(|<R><rsup|3><rsub|+>|)>>. The
    remaining step is to deduce bound <smart-ref|eq:unif-gamma-bound-non-iter:Sex:scalar>
    from bound <smart-ref|eq:unif-Sex-bound> of
    <smart-ref|lem:unif-Sex-bound>. In particular let us show that

    <\equation>
      <around*|<left|\<\|\|\>|1>|F\<circ\>\<Gamma\>|<right|\<\|\|\>|1>><rsub|L<rsup|r><rsub|\<mu\><rsub|\<Theta\>><rsup|1>>\<Gamma\><rsup|\<ast\>><SL><rsup|<around|(|u,1|)>><rsub|<around|(|\<Theta\>,\<Theta\><rsup|ex>|)>>>\<lesssim\><around*|<left|\<\|\|\>|1>|F|<right|\<\|\|\>|1>><rsub|L<rsup|r><rsub|\<mu\><rsub|\<Theta\><rsub|\<Gamma\>>><rsup|1>><around*|(|<SL><rsup|<around|(|\<infty\>,\<infty\>|)>><rsub|\<Theta\><rsub|\<Gamma\>>>+<SL><rsup|<around|(|<wide|u|\<bar\>>,1|)>><rsub|<around|(|\<Theta\><rsub|\<Gamma\>>,\<Theta\><rsup|ex><rsub|\<Gamma\>>|)>>|)>><label|eq:unif-gamma-bound-non-iter:Sex:scalar:weak:non-diag>
    </equation>

    for <math|1\<leq\>u\<less\><wide|u|\<bar\>>\<leq\>\<infty\>> and
    <math|r\<in\><around*|<left|(|-1>|u<frac|<wide|u|\<bar\>>-1|<wide|u|\<bar\>>-u>,\<infty\>|<right|]|-1>>>
    from <smart-ref|eq:unif-Sex-bound>. Bound
    <smart-ref|eq:unif-gamma-bound-non-iter:Sex:scalar> follows from
    <smart-ref|eq:unif-gamma-bound-non-iter:Sex:scalar:weak:non-diag> by
    applying it to <math|F<rsup|2>> in lieu of <math|F> and choosing
    <math|<wide|u|\<bar\>>> appropriately large. For any
    <math|<wide|u|\<bar\>>\<gtr\>u> the <math|r=\<infty\>> endpoint for
    <smart-ref|eq:unif-gamma-bound-non-iter:Sex:scalar:weak:non-diag>, given
    by

    <\equation*>
      <around*|\<\|\|\>|F\<circ\>\<Gamma\>|\<\|\|\>><rsub|L<rsup|\<infty\>><rsub|\<mu\><rsub|\<Theta\>><rsup|1>>\<Gamma\><rsup|\<ast\>><SL><rsup|<around|(|u,1|)>><rsub|<around*|(|\<Theta\>,\<Theta\><rsup|ex>|)>>>\<leq\><around*|\<\|\|\>|F|\<\|\|\>><rsub|L<rsup|\<infty\>><rsub|\<mu\><rsub|\<Theta\>><rsup|1>><SL><rsup|<around|(|<wide|u|\<bar\>>,1|)>><rsub|<around*|(|\<Theta\><rsub|\<Gamma\>>,\<Theta\><rsub|\<Gamma\>><rsup|ex>|)>>>,
    </equation*>

    follows from the fact that \ <math|\<Gamma\><around*|(|T<rsub|\<Theta\>><around*|(|\<xi\><rsub|T>,x<rsub|T>,s<rsub|T>|)>|)>\<subset\>T<rsub|\<Theta\><rsub|\<Gamma\>>><around*|(|\<alpha\>
    \<xi\><rsub|T>,x<rsub|T>,s<rsub|T>|)>>. We can use
    <smart-ref|prop:outer-restricted-interpolation> to conclude that bound
    <smart-ref|eq:unif-gamma-bound-non-iter:Sex:scalar:weak:non-diag> holds
    for all other <math|r\<gtr\>u<rsup|\<ast\>><eqd>u<frac|<wide|u|\<bar\>>-1|<wide|u|\<bar\>>-u>>
    if we show the <math|u<rsup|\<ast\>>> restricted weak endpoint

    <\equation>
      <ltae|<tformat|<cwith|1|1|1|1|cell-halign|l>|<table|<row|<cell|<around*|\<\|\|\>|F\<circ\>\<Gamma\>|\<\|\|\>><rsub|L<rsup|u<rsup|\<ast\>>,\<infty\>><rsub|\<mu\><rsub|\<Theta\>><rsup|1>>\<Gamma\><rsup|\<ast\>><SL><rsup|<around|(|u,1|)>><rsub|<around*|(|\<Theta\>,\<Theta\><rsup|ex>|)>>>\<lesssim\><tabular*|<tformat|<cwith|1|-1|1|1|cell-halign|l>|<twith|table-valign|T>|<cwith|2|2|1|1|cell-halign|r>|<table|<row|<cell|\<mu\><rsub|\<Theta\>><rsup|1><around*|(|<around|\<\|\|\>|F|\<\|\|\>><rsub|<around*|<left|(|-1>|<SL><rsup|<around|(|\<infty\>,\<infty\>|)>><rsub|\<Theta\><rsub|\<Gamma\>>>+<SL><rsup|<around|(|1,1|)>><rsub|<around*|(|\<Theta\><rsub|\<Gamma\>>,\<Theta\><rsub|\<Gamma\>><rsup|ext>|)>>|<right|)|-1>>>\<gtr\>0|)><rsup|<frac|1|u<rsup|\<ast\>>>>>>|<row|<cell|<space|2em>\<times\><around|\<\|\|\>|F|\<\|\|\>><rsub|<around*|<left|(|-1>|<SL><rsup|<around|(|\<infty\>,\<infty\>|)>><rsub|\<Theta\><rsub|\<Gamma\>>>+<SL><rsup|<around|(|<wide|u|\<bar\>>,1|)>><rsub|<around*|(|\<Theta\><rsub|\<Gamma\>>,\<Theta\><rsub|\<Gamma\>><rsup|ex>|)>>|<right|)|-1>>>.>>>>>>>>>><label|eq:unif-gamma-bound-non-iter:Sex:scalar:Lrestricted>
    </equation>

    Fix any <math|\<tau\>\<gtr\>0> and let us apply
    <smart-ref|lem:unif-Sex-bound>: there exists
    <math|W<rsub|\<tau\>>\<in\><TT><rsub|\<Theta\>><rsup|\<cup\>>> such that\ 

    <\equation*>
      <ltae|<tformat|<cwith|1|-1|1|1|cell-halign|l>|<table|<row|<cell|\<mu\><rsup|1><rsub|\<Theta\>><around|(|W<rsub|\<tau\>>|)>\<lesssim\><tabular*|<tformat|<cwith|1|2|1|1|cell-halign|l>|<twith|table-valign|T>|<cwith|2|2|1|1|cell-halign|r>|<table|<row|<cell|\<tau\><rsup|-1>\<mu\><rsub|\<Theta\>><rsup|1><around*|(|<around|\<\|\|\>|F|\<\|\|\>><rsub|<around*|<left|(|-1>|<SL><rsup|<around|(|\<infty\>,\<infty\>|)>><rsub|\<Theta\>>+<SL><rsup|<around|(|<wide|u|\<bar\>>,1|)>><rsub|<around*|(|\<Theta\><rsub|\<Gamma\>>,\<Theta\><rsub|\<Gamma\>><rsup|ext>|)>>|<right|)|-1>>>\<gtr\>0|)><space|2em>>>|<row|<cell|<space|2em>\<times\><around|\<\|\|\>|F|\<\|\|\>><rsub|<around*|(|<SL><rsup|<around|(|\<infty\>,\<infty\>|)>><rsub|\<Theta\>>+<SL><rsup|<around|(|<wide|u|\<bar\>>,1|)>><rsub|<around*|(|\<Theta\><rsub|\<Gamma\>>,\<Theta\><rsub|\<Gamma\>><rsup|ex>|)>>|)>>,>>>>>>>|<row|<cell|<around|\<\|\|\>|<1><rsub|<R><rsup|3><rsub|+>\<setminus\>W<rsub|\<tau\>>>F\<circ\>\<Gamma\>|\<\|\|\>><rsub|\<Gamma\><rsup|\<ast\>><SL><rsup|<around|(|1,1|)>><rsub|<around*|(|\<Theta\>,\<Theta\><rsup|ex>|)>>>\<leq\>\<tau\>.>>>>>
    </equation*>

    By <math|log>-convexity of the <math|<SL><rsup|<around|(|u,1|)>><rsub|<around*|(|\<Theta\>,\<Theta\><rsup|ex>|)>>>
    sizes in the parameter <math|u\<in\><around*|[|1,\<infty\>|]>>, we have
    that

    <\equation*>
      <ltae|<tformat|<cwith|2|2|1|1|cell-halign|r>|<table|<row|<cell|<around*|\<\|\|\>|<1><rsub|<R><rsup|3><rsub|+>\<setminus\>W<rsub|\<tau\>>>F\<circ\>\<Gamma\>|\<\|\|\>><rsub|\<Gamma\><rsup|\<ast\>><SL><rsup|<around|(|u,1|)>><rsub|<around*|(|\<Theta\>,\<Theta\><rsup|ext>|)>>>\<leq\><around|\<\|\|\>|<1><rsub|<R><rsup|3><rsub|+>\<setminus\>W<rsub|\<tau\>>>F\<circ\>\<Gamma\>|\<\|\|\>><rsub|\<Gamma\><rsup|\<ast\>><SL><rsup|<around|(|1,1|)>><rsub|<around*|(|\<Theta\>,\<Theta\><rsup|ex>|)>>><rsup|<frac|1|u<rsup|\<ast\>>>><around|\<\|\|\>|<1><rsub|<R><rsup|3><rsub|+>\<setminus\>W<rsub|\<tau\>>>F\<circ\>\<Gamma\>|\<\|\|\>><rsub|\<Gamma\><rsup|\<ast\>><SL><rsup|<around|(|<wide|u|\<bar\>>,1|)>><rsub|<around*|(|\<Theta\>,\<Theta\><rsup|ex>|)>>><rsup|<frac|u<rsup|\<ast\>>-1|u<rsup|\<ast\>>>>>>|<row|<cell|\<leq\>\<tau\><rsup|<frac|1|u<rsup|\<ast\>>>><around|\<\|\|\>|F|\<\|\|\>><rsub|\<Gamma\><rsup|\<ast\>><SL><rsup|<around|(|<wide|u|\<bar\>>,1|)>><rsub|<around*|(|\<Theta\>,\<Theta\><rsup|ex>|)>>><rsup|<frac|u<rsup|\<ast\>>-1|u<rsup|\<ast\>>>>>>>>>.
    </equation*>

    Combining the estimate above with the measure bound on
    <math|W<rsub|\<tau\>>> we get that

    <\equation*>
      \<mu\><rsub|\<Theta\>><rsup|1><around*|(|W<rsub|\<tau\>>|)><rsup|><around*|\<\|\|\>|<1><rsub|<R><rsup|3><rsub|+>\<setminus\>W<rsub|\<tau\>>>F\<circ\>\<Gamma\>|\<\|\|\>><rsub|<SL><rsup|<around|(|u,1|)>><rsub|<around*|(|\<Theta\>,\<Theta\><rsup|ext>|)>>><rsup|u<rsub|\<ast\>>>\<lesssim\><tabular*|<tformat|<cwith|1|-1|1|1|cell-halign|l>|<twith|table-valign|T>|<cwith|2|2|1|1|cell-halign|r>|<table|<row|<cell|\<mu\><rsub|\<Theta\>><rsup|1><around*|(|<around|\<\|\|\>|F|\<\|\|\>><rsub|<around*|<left|(|-1>|<SL><rsup|<around|(|\<infty\>,\<infty\>|)>><rsub|\<Theta\><rsub|\<Gamma\>>>+<SL><rsup|<around|(|<wide|u|\<bar\>>,1|)>><rsub|<around*|(|\<Theta\><rsub|\<Gamma\>>,\<Theta\><rsub|\<Gamma\>><rsup|ex>|)>>|<right|)|-1>>>\<gtr\>0|)><space|2em>>>|<row|<cell|<space|2em>\<times\><around|\<\|\|\>|F|\<\|\|\>><rsub|<around*|(|<SL><rsup|<around|(|\<infty\>,\<infty\>|)>><rsub|\<Theta\><rsub|\<Gamma\>>>+<SL><rsup|<around|(<wide|u|\<bar\>>|,1|)>><rsub|<around*|(|\<Theta\><rsub|\<Gamma\>>,\<Theta\><rsub|\<Gamma\>><rsup|ex>|)>>|)>><rsup|u<rsup|\<ast\>>>.>>>>>
    </equation*>

    Since <math|\<tau\>\<gtr\>0> is arbitrary we have shown that
    <smart-ref|eq:unif-gamma-bound-non-iter:Sex:scalar:Lrestricted> holds.
  </render-proof>

  <subsection|Uniform bounds for the singular
  size<label|sec:unif-bounds:singular>>

  We now prove <smart-ref|prop:unif-gamma-bounds:singular-size>, proceeding
  roughly in the same manner as in <smart-ref|sec:bound-exterior-size> while
  proving <smart-ref|prop:unif-gamma-bounds:Sex>. We begin with a uniform
  covering argument for the interior part of trees.

  <\lemma>
    <label|lem:singular-tree-covering><dueto|Singular tree covering>Let
    <math|V<rsup|>\<in\>\<bbb-D\><rsup|\<cup\>><rsub|\<beta\>>>,
    <math|W<rsup|>\<in\><TT><rsub|\<Theta\>><rsup|\<cup\>>> and let
    <math|E=V\<cap\>W> or <math|E=V\<cup\>W>. Suppose
    <math|F\<in\>L<rsup|\<infty\>><rsub|loc><around|(|<R><rsup|3><rsub|+>|)>>
    is a compactly supported function. For all <math|\<lambda\>\<gtr\>0>
    there exists a set <math|W<rsub|\<lambda\>>\<subset\><TT><rsup|\<cup\>><rsub|\<Theta\>>>
    and finite collection of trees <math|\<cal-T\>\<subset\>\<bbb-T\><rsub|\<Theta\>>>
    such that

    <\equation*>
      <ltae|<tformat|<table|<row|<cell|<around|<left|\<\|\|\>|2>|<1><rsub|<R><rsup|3><rsub|+>\<setminus\>W<rsub|\<lambda\>>>F<around*|(|\<eta\>,y,t|)>
      t<dd><rsub|t><1><rsub|E><around*|(|\<eta\>,y,t|)>|<right|\<\|\|\>|2>><rsub|<SL><rsup|<around|(|1,1|)>><rsub|<around*|(|\<Theta\>,\<Theta\><rsup|in>|)>>>\<leq\>\<lambda\>,>>|<row|<cell|W<rsub|\<lambda\>>\<supset\><big|cup><rsub|T\<in\><with|font|cal|T>>T,<space|2em>\<mu\><rsup|1><rsub|*\<Theta\>><around*|(|W<rsub|\<lambda\>>|)>\<lesssim\><rsub|><big|sum><rsub|T\<in\><with|font|cal|T>>\<mu\><rsup|1><rsub|\<Theta\>><around*|(|T|)>.>>>>>
    </equation*>

    Each <math|T\<in\><mc|T>> is endowed with a distinguished bounded subset
    <math|X<rsub|T>\<subset\>\<pi\><rsub|T><around*|(|<mT><rsub|\<Theta\><rsup|in>>|)>>
    such that

    <\equation*>
      <frac|1|\<mu\><rsup|1><rsub|\<Theta\>><around*|(|T|)>><big|int><rsub|X<rsub|T>><around*|<left|\||1>|F<around*|(|\<eta\>,y,t|)>|<right|\||1>>
      t <dd><rsub|t><1><rsub|E><around*|(|\<eta\>,y,t|)> \<mathd\>\<eta\>
      \<mathd\>y<dd>t\<geq\> \<lambda\>.
    </equation*>

    and\ 

    <\equation>
      <around*|<left|\<\|\|\>|-1>|<around*|<left|(|-2>|<big|sum><rsub|T\<in\>\<cal-T\>><1><rsub|\<Gamma\><around*|(|X<rsub|T>|)>><around*|(|\<eta\>,y,t|)>|<right|)|-2>>t<dd><rsub|t><1><rsub|\<Gamma\><around*|(|E|)>><around*|(|\<eta\>,y,t|)>|<right|\<\|\|\>|-1>><rsub|<SL><rsup|<around*|(|1,1|)>><rsub|\<Theta\><rsub|\<Gamma\>>>>\<lesssim\>1<label|eq:int-tree-covering:summability>
    </equation>

    for any <math|\<Gamma\>> as in <eqref|eq:gamma>. The implicit constants
    do not depend on the set <math|E> nor on <math|\<Gamma\>>.
  </lemma>

  <\render-proof|Proof of <smart-ref|lem:singular-tree-covering>>
    The proof follows along the same lines of the proof of
    <smart-ref|lem:ext-tree-covering>. We begin by making a geometric
    assumption on <math|W>. If <math|W=<big|cup><rsub|n\<in\><N>>T<rsub|n>>
    then let us set <math|W<rsup|\<pm\>><eqd><big|cup><rsub|n\<in\><N>>T<rsub|n><rsup|\<pm\>>>
    where\ 

    <\equation*>
      T<rsup|\<pm\>>:<around*|<left|{|2>|<around*|(|\<eta\>\<pm\>h,y,t|)>,<around*|(|\<eta\>,y,t|)>\<in\>T,h\<geq\>0|<right|}|2>>;
    </equation*>

    notice that <math|T<rsup|+>\<in\><TT><rsup|\<cup\>><rsub|\<Theta\>>> if
    <math|T\<in\><TT><rsup|\<cup\>><rsub|\<Theta\>>> and it holds that
    <math|T=T<rsup|+>\<cap\>T<rsup|->>. Thus, if <math|E=V\<cap\>W> it holds
    that <math|E=E<rsup|+>\<cap\>E<rsup|->> where
    <math|E<rsup|\<pm\>><eqd>V\<cap\>W<rsup|\<pm\>>> and we have that\ 

    <\equation*>
      <around*|\||F<around*|(|\<eta\>,y,t|)>
      t<dd><rsub|t><1><rsub|E><around*|(|\<eta\>,y,t|)>|\|>\<leq\>F<around*|(|\<eta\>,y,t|)>
      \ <around*|\||t<dd><rsub|t><1><rsub|E<rsup|->><around*|(|\<eta\>,y,t|)>|\|>+F<around*|(|\<eta\>,y,t|)>
      \ <around*|\||t<dd><rsub|t><1><rsub|E<rsup|+>><around*|(|\<eta\>,y,t|)>|\|>
    </equation*>

    Similarly, if <math|E=V\<cup\>W> then <math|E=E<rsup|+>\<cup\>E<rsup|->>
    and\ 

    <\equation*>
      <around*|\||F<around*|(|\<eta\>,y,t|)>
      t<dd><rsub|t><1><rsub|E><around*|(|\<eta\>,y,t|)>|\|>\<leq\>F<around*|(|\<eta\>,y,t|)>
      \ <around*|\||t<dd><rsub|t><1><rsub|E<rsup|->><around*|(|\<eta\>,y,t|)>|\|>+F<around*|(|\<eta\>,y,t|)>
      \ <around*|\||t<dd><rsub|t><1><rsub|E<rsup|+>><around*|(|\<eta\>,y,t|)>|\|>.
    </equation*>

    By the quasi triangle inequality, it is thus sufficient to show the claim
    for <math|E<rsup|+>> in place of <math|E>. We reason in the case
    <math|E<rsup|+>=V\<cap\>W<rsup|+>> and we write <math|F> in place of
    <math|F<around*|(|\<eta\>,y,t|)> <1><rsub|E<rsup|->><around*|(|\<eta\>,y,t|)>>.

    Without loss of generality we assume that <math|F> is supported on
    <math|\<bbb-K\>\<subset\><around*|[|-S;S|]><rsup|2>\<times\><around|[|S<rsup|-1>;S|]>>
    for some <math|S\<gg\>1>. It follows from
    <smart-ref|lem:geometry-of-boundary> that
    <math|<around*|<left|\<\|\|\>|2>|F\<circ\>\<Gamma\><around*|(|\<eta\>,y,t|)>t<dd><rsub|t><1><rsub|E><around*|(|\<eta\>,y,t|)>|<right|\<\|\|\>|2>><rsub|<SL><rsup|<around|(|1,1|)>><rsub|<around*|(|\<Theta\>,\<Theta\><rsup|in>|)>>>\<less\>\<infty\>>
    so by homogeneity we assume that

    <\equation*>
      <around*|<left|\<\|\|\>|2>|F\<circ\>\<Gamma\><around*|(|\<eta\>,y,t|)>t<dd><rsub|t><1><rsub|E><around*|(|\<eta\>,y,t|)>|<right|\<\|\|\>|2>><rsub|<SL><rsup|<around|(|1,1|)>><rsub|<around*|(|\<Theta\>,\<Theta\><rsup|in>|)>>>=1.
    </equation*>

    The parameters <math|<around*|(|\<xi\><rsub|T>,x<rsub|T>,s<rsub|T>|)>> of
    any tree <math|T\<in\>\<bbb-T\><rsub|\<Theta\>>> for which

    <\equation*>
      <around*|<left|\<\|\|\>|2>|F\<circ\>\<Gamma\><around*|(|\<eta\>,y,t|)>t<dd><rsub|t><1><rsub|E><around*|(|\<eta\>,y,t|)>|<right|\<\|\|\>|2>><rsub|<SL><rsup|<around|(|1,1|)>><rsub|<around*|(|\<Theta\>,\<Theta\><rsup|in>|)>><around*|(|T|)>>\<geq\>\<lambda\>
    </equation*>

    are bounded and <math|s<rsub|T>> is bounded away from <math|0>. As a
    matter of fact

    <\equation*>
      <ltae|<tformat|<cwith|1|1|1|1|cell-halign|l>|<table|<row|<cell|s<rsub|T><around|\<\|\|\>|F<around*|(|\<eta\>,y,t|)>
      t<dd><rsub|t><1><rsub|E<rsup|+>><around*|(|\<eta\>,y,t|)>|\<\|\|\>><rsub|<SL><rsup|<around|(|1,1|)>><rsub|<around*|(|\<Theta\>,\<Theta\><rsup|in>|)>><rsub|><rsub|><around|<left|(|2>|T<rsub|\<Theta\>><around*|(|\<xi\><rsub|T>,x<rsub|T>,s<rsub|T>|)><rsup|>|<right|)|2>>>>>|<row|<cell|<space|2em>\<leq\>2S<around|\<\|\|\>|F<around*|(|\<eta\>,y,t|)>
      t<dd><rsub|t><1><rsub|E<rsup|+>><around*|(|\<eta\>,y,t|)>|\<\|\|\>><rsub|<SL><rsup|<around|(|1,1|)>><rsub|<around*|(|\<Theta\>,\<Theta\><rsup|in>|)>><rsub|><rsub|><around|<left|(|1>|T<rsub|\<Theta\>><around|(|\<xi\><rsub|T>,0,2S|)><rsup|>|<right|)|1>>>.>>>>>
    </equation*>

    \;

    We want to construct <math|\<cal-T\>> by an iterative procedure. We enact
    the same preparatory steps that we have done in the proof of
    <smart-ref|lem:ext-tree-covering>: we introduce
    <math|\<bbb-T\><rsub|\<Theta\>><rsup|latt>>, the discrete collection of
    trees; to any <math|T\<in\>\<bbb-T\><rsub|\<Theta\>><rsup|>> we associate
    a collection of trees <math|\<cal-W\><around*|(|T|)>\<subset\>
    \<bbb-T\><rsub|\<Theta\>><rsup|latt>> such that
    \ <math|\<mu\><rsub|\<Theta\>><rsup|1><around|<left|(|1>|<big|cup><rsub|T<rprime|'>\<in\><with|font|cal|W><around*|(|T|)>>T<rprime|'>|<right|)|1>>\<lesssim\>\<mu\><rsub|\<Theta\>><rsup|1><around|(|T|)>>
    and <math|<big|cup><rsub|\<heartsuit\>\<in\><around|{|-1,0,1|}>>T<rsub|<around|(|\<xi\><rsub|T>+\<heartsuit\>s<rsub|T><rsup|-1>,x<rsub|T>,s<rsub|T>|)>>\<subset\><big|cup><rsub|T<rprime|'>\<in\><with|font|cal|W><around*|(|T|)>>T<rprime|'>>.
    We define a finite collection <math|\<cal-K\><rsup|latt><rsub|\<lambda\>>\<subset\>
    \<bbb-T\><rsub|\<Theta\>><rsup|latt>> so that the trees in
    <math|\<cal-K\><rsup|latt><rsub|\<lambda\>>> cover <math|\<bbb-K\>> and
    so that for any tree <math|T\<in\><TT><rsub|\<Theta\>>> such that
    <math|<around*|<left|\<\|\|\>|2>|F\<circ\>\<Gamma\><around*|(|\<eta\>,y,t|)>t<dd><rsub|t><1><rsub|E><around*|(|\<eta\>,y,t|)>|<right|\<\|\|\>|2>><rsub|<SL><rsup|<around|(|1,1|)>><rsub|<around*|(|\<Theta\>,\<Theta\><rsup|in>|)>><around*|(|T|)>>\<geq\>\<lambda\>>
    it holds that <math|\<cal-W\><around|(|T|)>\<subset\>\<cal-K\><rsup|latt><rsub|\<lambda\>>>.

    Let us now proceed to the selection algorithm. Given a collection of
    trees <math|\<cal-X\>\<subset\>\<bbb-T\><rsub|\<Theta\>><rsup|>> we say
    that <math|T\<in\>\<cal-X\>> is <em|quasi-maximal> if

    <\equation*>
      T<rprime|'>\<in\>\<cal-X\>\<Longrightarrow\>\<xi\><rsub|T<rprime|'>>\<leq\>\<xi\><rsub|T>+\<varepsilon\><rsub|max>
    </equation*>

    with <math|\<varepsilon\><rsub|max>\<leq\>2<rsup|-100>S.> Let us start
    with the collection <math|\<cal-T\><rsub|0>=\<emptyset\>> and let
    <math|\<bbb-K\><rsub|0>\<assign\>\<bbb-K\>>. Suppose that at step
    <math|n> we have a collection <math|\<cal-T\><rsub|n>=<around*|{|T<rsub|1>,\<ldots\>,T<rsub|n>|}>\<subset\>\<bbb-T\><rsub|\<Theta\>><rsup|>>
    and a subset <math|\<bbb-K\><rsub|n>\<subset\>\<bbb-K\>>. At step
    <math|n+1> let

    <\equation*>
      <math|\<cal-X\><rsub|n+1>\<assign\><around|<left|{|2>|T\<in\>\<bbb-T\><rsub|\<Theta\>>:<around|\<\|\|\>|<1><rsub|\<bbb-K\><rsub|n><rsub|>>F\<circ\>\<Gamma\><around*|(|\<eta\>,y,t|)>t<dd><rsub|t><1><rsub|E><around*|(|\<eta\>,y,t|)>|\<\|\|\>><rsub|<SL><rsup|<around|(|1,1|)>><rsub|<around*|(|\<Theta\>,\<Theta\><rsup|in>|)>><rsub|><rsub|><around|(|T|)>>\<geq\>\<lambda\>|<right|}|2>>>;
    </equation*>

    if <math|\<cal-X\><rsub|n+1>> is empty, we terminate the iteration.
    Otherwise choose a quasi-maximal element <math|T<rsub|n+1>> of
    <math|\<cal-X\><rsub|n+1>> and let <math|\<cal-T\><rsub|n+1>=\<cal-T\><rsub|n>\<cup\><around*|{|T<rsub|n+1>|}>>,
    <math|X<rsub|T<rprime|'>>\<assign\>\<bbb-K\><rsub|n>\<cap\>\<pi\><rsub|T<rsub|n+1>><around*|(|<mT><rsub|\<Theta\><rsup|in>>|)><rsub|>>
    and <math|\<bbb-K\><rsub|n+1>=\<bbb-K\><rsub|n>\<setminus\><big|cup><rsub|T<rprime|'>\<in\><with|font|cal|W><around*|(|T<rsub|n+1>|)>>T<rprime|'>>.
    This process terminates after finitely many steps. This procedure yields
    a collection of trees <math|\<cal-T\>=<big|cup><rsub|n\<in\><N>><mc|T><rsub|n>>
    and distinguished subsets <math|X<rsub|T<rprime|'>>\<subset\>\<pi\><rsub|T<rprime|'>><around*|(|<mT><rsub|\<Theta\><rsup|in>>|)>>
    for any <math|T<rprime|'>\<in\><with|font|cal|T>>. According to the
    selection criterion (and Lemma <smart-ref|lem:geometry-of-boundary>) we
    have that

    <\equation*>
      <frac|1|\<mu\><rsup|1><rsub|\<Theta\>><around*|(|T|)>><big|int><rsub|X<rsub|T>><around*|<left|\||1>|F<around*|(|\<eta\>,y,t|)>|<right|\||1>>
      t <dd><rsub|t><1><rsub|E><around*|(|\<eta\>,y,t|)> \<mathd\>\<eta\>
      \<mathd\>y<dd>t\<geq\> \<lambda\>.
    </equation*>

    We set <math|W<rsub|\<lambda\>>=<big|cup><rsub|T\<in\>\<cal-T\>>W<around|(|T|)>\<supset\><big|cup><rsub|T\<in\>\<cal-T\>>T>
    and we have <math|\<mu\><rsup|1><rsub|\<Theta\>><around*|(|W<rsub|\<lambda\>>|)>\<lesssim\><big|sum><rsub|T\<in\>\<cal-T\>>\<mu\><rsup|1><rsub|\<Theta\>><around*|(|T|)>>.
    Since the procedure terminated it holds that

    <\equation*>
      <around|\<\|\|\>|<1><rsub|<R><rsup|3><rsub|+>\<setminus\>W<rsub|\<lambda\>>>F\<circ\>\<Gamma\><around*|(|\<eta\>,y,t|)>t<dd><rsub|t><1><rsub|E><around*|(|\<eta\>,y,t|)>|\<\|\|\>><rsub|<SL><rsup|<around|(|1,1|)>><rsub|<around*|(|\<Theta\>,\<Theta\><rsup|in>|)>><rsub|><rsub|><around|(|T|)>>\<leq\>\<lambda\>.
    </equation*>

    It remains to show that <smart-ref|eq:int-tree-covering:summability>
    holds. It holds that <math|\<Gamma\><around*|(|E<rsup|+>|)>=\<Gamma\><around*|(|V|)>\<cap\>\<Gamma\><around*|(|W<rsup|+>|)>>
    with <math|\<Gamma\><around*|(|V|)>\<in\><DD><rsub|1><rsup|\<cup\>>> and
    <math|\<Gamma\><around*|(|W<rsup|+>|)>\<in\><TT><rsub|\<Theta\><rsub|\<Gamma\>>><rsup|\<cup\>>>
    so let <math|<mf|b><around*|(|\<eta\>,y|)>> be the function whose graph
    is the boundary of <math|\<Gamma\><around*|(|E<rsup|+>|)>>, as described
    in <math|><smart-ref|lem:geometry-of-boundary>. Denoting
    <math|\<Theta\><rsub|\<Gamma\>>=<around*|(|\<theta\><rsub|\<Gamma\>->,\<theta\><rsub|\<Gamma\>+>|)>>,
    according to <smart-ref|lem:geometry-of-boundary> it holds that\ 

    <\equation>
      0\<leq\>-<dd><rsub|\<eta\>><around*|(|<frac|1|<mf|b><around*|(|\<eta\>,y|)>>|)>\<leq\><around*|\||\<theta\><rsub|\<Gamma\>->|\|><rsup|-1>;<label|eq:singular-size-integrand-b-ODE>
    </equation>

    the condition <math|<dd><rsub|\<eta\>><mf|b><around*|(|\<eta\>,y|)>\<geq\>0>
    comes from the fact that <math|\<eta\>\<mapsto\><mf|b><around*|(|\<eta\>,y|)>>
    is non-decreasing: if <math|<around*|(|\<eta\>,y,t|)>\<in\>\<Gamma\><around*|(|E<rsup|+>|)>>
    then <math|><math|<around*|(|\<eta\><rprime|'>,y,t|)>\<in\>\<Gamma\><around*|(|E<rsup|+>|)>>
    for any <math|\<eta\><rprime|'>\<geq\>\<eta\>>. It follows that for any
    <math|\<eta\><rsub|0>\<in\><R>> and any
    <math|\<eta\><rsub|0>\<less\>\<eta\>\<less\><frac|<around*|\||\<theta\><rsub|\<Gamma\>->|\|>|<mf|b><around*|(|\<eta\><rsub|0>,y|)>>>
    one has\ 

    <\equation>
      <ltae|<tformat|<cwith|1|1|1|1|cell-halign|l>|<table|<row|<cell|<mf|b><around*|(|\<eta\><rsub|0>,y|)>\<leq\><mf|b><around*|(|\<eta\>,y|)>,<space|2em>\<forall\>\<eta\>\<geq\>\<eta\><rsub|0>,>>|<row|<cell|<mf|b><around*|(|\<eta\>,y|)>\<leq\><frac|<around*|\||\<theta\><rsub|\<Gamma\>->|\|><mf|b><around*|(|\<eta\><rsub|0>,y|)>|<around*|\||\<theta\><rsub|\<Gamma\>->|\|>-<mf|b><around*|(|\<eta\><rsub|0>,y|)><around*|(|\<eta\>-\<eta\><rsub|0>|)>>,<space|2em>\<forall\>\<eta\>\<in\><around*|<left|(|-1>|\<eta\><rsub|0>,<frac|<around*|\||\<theta\><rsub|\<Gamma\>->|\|>|<mf|b><around*|(|\<eta\><rsub|0>,y|)>>|<right|)|-1>>.>>>>><label|eq:singular-size-integrand-b-ODE-sol>
    </equation>

    We must bound the expression

    <\equation>
      <ltae|<tformat|<cwith|1|1|1|1|cell-halign|l>|<table|<row|<cell|<around|<left|\<\|\|\>|2>|<big|sum><rsub|T\<in\>\<cal-T\>><1><rsub|\<Gamma\><around*|(|X<rsub|T>|)>><around*|(|\<eta\>,y,t|)>t<dd><rsub|t><1><rsub|\<Gamma\><around*|(|E|)>><around*|(|\<eta\>,y,t|)>|<right|\<\|\|\>|2>><rsub|<SL><rsup|<around|(|1,1|)>><rsub|\<Theta\><rsub|\<Gamma\>>><rsub|><rsub|><around|(|T|)>>>>|<row|<cell|=<frac|1|s<rsub|T>><big|int><rsub|B<rsub|s<rsub|T>><around*|(|x<rsub|T>|)>><around*|<left|(|-1>|<big|int><rsub|<R><rsub|>><around*|<left|(|-1>|<big|sum><rsub|T\<in\>\<cal-T\>><1><rsub|\<Gamma\><around*|(|X<rsub|T>|)>><around*|(|\<eta\>,y,<mf|b><around*|(|\<eta\>,y|)>|)>|<right|)|-1>><1><rsub|T><around*|(|\<eta\>,y,<mf|b><around*|(|\<eta\>,y|)>|)><mf|b><around*|(|\<eta\>,y|)><frac|<dd>\<eta\>|<around*|\||\<Theta\>|\|>>|<right|)|-1>><dd>y.>>>>><label|eq:singular-size-integrand>
    </equation>

    Without loss of generality, let us suppose that
    <math|T=T<rsub|\<Theta\><rsub|\<Gamma\>>><around*|(|0,0,1|)>>. Fix
    <math|y\<in\>B<rsub|1><around*|(|0|)>> and fix
    <math|<wide|\<theta\>|\<bar\>>\<gtr\>\<theta\><rsub|\<Gamma\>->> close to
    <math|><math|\<theta\><rsub|\<Gamma\>->>; in particular let
    <math|<wide|\<theta\>|\<bar\>>\<less\>-<around*|\||\<theta\><rsub|\<Gamma\>-><rsup|in>|\|>>.\ 

    Let <math|<wide|\<eta\>|\<bar\>>> be the lower bound of
    <math|\<eta\>\<in\><R>> such that <math|\<eta\><mf|b><around*|(|\<eta\>,y|)>\<gtr\><wide|\<theta\>|\<bar\>>>
    (or <math|+\<infty\>> if no such <math|\<eta\>> exists). The quantity
    <math|\<eta\>\<mapsto\>\<eta\><mf|b><around*|(|\<eta\>,y|)>> is
    non-decreasing, according to <eqref|eq:singular-size-integrand-b-ODE>.
    Let us start by showing that \ 

    <\equation*>
      <big|int><rsub|\<eta\>\<gtr\><wide|\<eta\>|\<bar\>>><around*|<left|(|-2>|<big|sum><rsub|T\<in\>\<cal-T\>><1><rsub|\<Gamma\><around*|(|X<rsub|T>|)>><around*|(|\<eta\>,y,<mf|b><around*|(|\<eta\>,y|)>|)>|<right|)|-2>><1><rsub|T><around*|(|\<eta\>,y,<mf|b><around*|(|\<eta\>,y|)>|)><mf|b><around*|(|\<eta\>,y|)><frac|<dd>\<eta\>|<around*|\||\<Theta\>|\|>>\<lesssim\>1.
    </equation*>

    This is relevant only if <math|<wide|\<eta\>|\<bar\>>\<less\>+\<infty\>>.
    From <eqref|eq:singular-size-integrand-b-ODE-sol> we can deduce that for
    <math|<wide|\<eta\>|\<bar\>>\<less\>\<eta\>\<less\><frac|<wide|\<theta\>|\<bar\>>-\<theta\><rsub|\<Gamma\>->|2<mf|b><around*|(|<wide|\<eta\>|\<bar\>>,y|)>>>
    it holds that\ 

    <\equation*>
      <mf|b><around*|(|\<eta\>,y|)>\<less\><frac|2<around*|\||\<theta\><rsub|\<Gamma\>->|\|><mf|b><around*|(|<wide|\<eta\>|\<bar\>>,y|)>|<wide|\<theta\>|\<bar\>>-\<theta\><rsub|\<Gamma\>>>.
    </equation*>

    When the graph <math|\<eta\>\<mapsto\><mf|b><around*|(|\<eta\>,y|)>>
    intersects <math|T> we have that <math|<mf|b><around*|(|\<eta\>,y|)>\<leq\><frac|\<theta\><rsub|\<Gamma\><rsub|+>>|\<eta\>>>.
    Thus for <math|\<eta\>\<gtr\><frac|<wide|\<theta\>|\<bar\>>-\<theta\><rsub|\<Gamma\>>|2<mf|b><around*|(|<wide|\<eta\>|\<bar\>>,y|)>>>
    we have

    <\equation*>
      <mf|b><around*|(|\<eta\>,y|)>\<less\><frac|\<theta\><rsub|\<Gamma\><rsub|+>>2<mf|b><around*|(|<wide|\<eta\>|\<bar\>>,y|)>|<wide|\<theta\>|\<bar\>>-\<theta\><rsub|\<Gamma\><rsub|->>>.
    </equation*>

    We have shown that for all <math|\<eta\>\<gtr\><wide|\<eta\>|\<bar\>>>
    when the graph <math|\<eta\>\<mapsto\><mf|b><around*|(|\<eta\>,y|)>>
    intersects <math|T> it holds that

    <\equation*>
      <mf|b><around*|(|\<eta\>,y|)>\<less\><frac|<around*|(|2<around*|\||\<theta\><rsub|\<Gamma\>->|\|>+\<theta\><rsub|\<Gamma\><rsub|+>>|)>2<mf|b><around*|(|<wide|\<eta\>|\<bar\>>,y|)>|<around*|\||\<Theta\>|\|>>.
    </equation*>

    The graph <math|\<eta\>\<mapsto\><mf|b><around*|(|\<eta\>,y|)>>
    intersects <math|T> only if <math|\<eta\>\<less\><frac|\<theta\><rsub|\<Gamma\>+>|<mf|b><around*|(|<wide|\<eta\>|\<bar\>>,y|)>>>
    so

    <\equation*>
      <big|int><rsub|\<eta\>\<gtr\><wide|\<eta\>|\<bar\>>><around*|(|<big|sum><rsub|T\<in\>\<cal-T\>><1><rsub|\<Gamma\><around*|(|X<rsub|T>|)>><around*|(|\<eta\>,y,<mf|b><around*|(|\<eta\>,y|)>|)>|)><1><rsub|T><around*|(|\<eta\>,y,<mf|b><around*|(|\<eta\>,y|)>|)><mf|b><around*|(|\<eta\>,y|)><frac|<dd>\<eta\>|<around*|\||\<Theta\>|\|>>\<leq\>2<around*|(|<around*|\||\<theta\><rsub|\<Gamma\>->|\|>+\<theta\><rsub|\<Gamma\><rsub|+>>|)>.
    </equation*>

    \;

    It thus remains to bound the inner integrand of
    <eqref|eq:singular-size-integrand> restricted to when
    <math|\<eta\>\<less\><wide|\<eta\>|\<bar\>>> and in particular when
    <math|\<theta\><rsub|\<Gamma\>->\<less\>\<eta\>b<around*|(|\<eta\>,y|)>\<less\><wide|\<theta\>|\<bar\>>>.
    Let <math|A=<around*|<left|{|1>|<around*|(|\<eta\>,y,t|)>:\<theta\><rsub|\<Gamma\>->\<less\>\<eta\>b<around*|(|\<eta\>,y|)>\<less\><wide|\<theta\>|\<bar\>>|<right|}|1>>.>
    Let <math|T<rsub|0>\<in\><mc|T>> be the tree selected earliest by the
    algorithm among those for which the graph
    <math|\<eta\>\<mapsto\><mf|b><around*|(|\<eta\>,y|)>> intersects
    <math|\<Gamma\><around*|(|X<rsub|T<rsub|0>>|)>\<cap\>T\<cap\>A>. We need
    to show the bound\ 

    <\equation>
      <big|int><rsub|\<eta\>=-\<infty\><rsub|>><rsup|<wide|\<eta\>|\<bar\>>><around*|(|<big|sum><rsub|T\<in\>\<cal-T\><rsub|\<gtr\>0>><1><rsub|\<Gamma\><around*|(|X<rsub|T>|)>><around*|(|\<eta\>,y,<mf|b><around*|(|\<eta\>,y|)>|)>|)><1><rsub|T\<cap\>A><around*|(|\<eta\>,y,<mf|b><around*|(|\<eta\>,y|)>|)><mf|b><around*|(|\<eta\>,y|)><frac|<dd>\<eta\>|<around*|\||\<Theta\>|\|>>\<lesssim\>1<label|eq:singular-size-integrand-y-fixed>
    </equation>

    where <math|\<cal-T\><rsub|\<gtr\>0>> is the sub collection of those
    trees in <math|<mc|T>> selected after <math|T<rsub|n<rsub|0>>>. Let
    <math|\<eta\><rsub|0>> be the lower bound of <math|\<eta\>> for which the
    graph <math|\<eta\>\<mapsto\><mf|b><around*|(|\<eta\>,y|)>> intersects
    <math|\<Gamma\><around*|(|X<rsub|T<rsub|n<rsub|0>>>|)>\<cap\>T>. It holds
    that\ 

    <\equation*>
      \<alpha\>\<xi\><rsub|T<rsub|n<rsub|0>>>\<less\>\<eta\><rsub|0>+<around*|\||\<theta\><rsub|\<Gamma\>-><rsup|in>|\|><mf|b><around*|(|\<eta\><rsub|0>,y|)><rsup|-1>\<less\>0
    </equation*>

    because <math|\<eta\><rsub|0><mf|b><around*|(|\<eta\><rsub|0>,y|)>\<less\><wide|\<theta\>|\<bar\>>\<less\>-<around*|\||\<theta\><rsub|\<Gamma\>-><rsup|in>|\|>>.
    It follows that <math|<around*|<left|{|1>|<around*|(|\<eta\>,y,t|)>\<in\>T:\<eta\>\<leq\>\<eta\><rsub|0>,t\<less\><mf|b><around*|(|\<eta\><rsub|0>,t|)>|<right|}|1>>\<subset\>\<Gamma\><around*|(|T<rsub|n<rsub|0>>|)>>
    and thus the graph <math|\<eta\>\<mapsto\><mf|b><around*|(|\<eta\>,y|)>>
    over <math|\<eta\>\<in\><around*|(|-\<infty\>,\<eta\><rsub|0>|]>> cannot
    intersect <math|><math|\<Gamma\><around*|(|X<rsub|T<rsub|\<gtr\>>>|)>\<cap\>T\<cap\>A>
    for any <math|T<rsub|\<gtr\>>\<in\><mc|T>> selected after
    <math|T<rsub|n<rsub|0>>>. We are down to bounding\ 

    <\equation*>
      <big|int><rsub|\<eta\><rsub|>=\<eta\><rsub|0>><rsup|<wide|\<eta\>|\<bar\>>><around*|(|<big|sum><rsub|T\<in\>\<cal-T\><rsub|\<gtr\>0>><1><rsub|\<Gamma\><around*|(|X<rsub|T>|)>><around*|(|\<eta\>,y,<mf|b><around*|(|\<eta\>,y|)>|)>|)><1><rsub|T\<cap\>A><around*|(|\<eta\>,y,<mf|b><around*|(|\<eta\>,y|)>|)><mf|b><around*|(|\<eta\>,y|)><frac|<dd>\<eta\>|<around*|\||\<Theta\>|\|>>
    </equation*>

    Any tree <math|T<rsub|\<gtr\>>\<in\>\<cal-T\><rsub|\<gtr\>0>> satisfies\ 

    <\equation*>
      \<alpha\>\<xi\><rsub|T<rprime|'>>\<less\>\<alpha\>\<xi\><rsub|T<rsub|n<rsub|0>>>+\<alpha\>\<varepsilon\><rsub|max>\<less\>\<eta\><rsub|0>+<around*|\||\<theta\><rsub|\<Gamma\>-><rsup|in>|\|><mf|b><around*|(|\<eta\><rsub|0>,y|)><rsup|-1>+\<alpha\>\<varepsilon\><rsub|max>\<less\>\<eta\><rsub|0>+2<around*|\||\<theta\><rsub|\<Gamma\>-><rsup|in>|\|><mf|b><around*|(|\<eta\><rsub|0>,y|)><rsup|-1>
    </equation*>

    by the selection condition, given that
    <math|\<epsilon\><rsub|max>\<less\><frac|<math|<around*|\||\<theta\><rsub|\<Gamma\>-><rsup|in>|\|>>|S>>.
    The graph <math|\<eta\>\<mapsto\><mf|b><around*|(|\<eta\>,y|)>>
    intersects <math|\<Gamma\><around*|(|X<rsub|T<rsub|\<gtr\>>>|)>\<cap\>T\<subset\>\<Gamma\><around*|<left|(|1>|\<pi\><rsub|T<rsub|\<gtr\>>><around*|(|<mT><rsub|\<Theta\><rsup|in>>|)>|<right|)|1>>\<cap\>T>
    only if\ 

    <\equation*>
      <mf|b><around*|(|\<eta\>,y|)>\<less\><frac|<around*|\||\<theta\><rsup|in><rsub|\<Gamma\>+>|\|>|\<eta\>-\<alpha\>\<xi\><rsub|T<rsub|\<gtr\>>>>.
    </equation*>

    This shows that if <math|\<eta\>\<gtr\>\<alpha\>\<xi\><rsub|T<rsub|\<gtr\>>>+\<varepsilon\><rprime|'><mf|b><around*|(|\<eta\><rsub|0>,y|)><rsup|-1>>
    for some <math|\<varepsilon\><rprime|'>\<gtr\>0> then\ 

    <\equation*>
      <mf|b><around*|(|\<eta\>,y|)>\<less\><frac|<around*|\||\<theta\><rsup|in><rsub|\<Gamma\>+>|\|><mf|b><around*|(|\<eta\><rsub|0>,y|)>|\<varepsilon\><rprime|'>>.
    </equation*>

    We have already established that

    <\equation*>
      <mf|b><around*|(|\<eta\>,y|)>\<leq\><frac|<around*|\||\<theta\><rsub|\<Gamma\>->|\|><mf|b><around*|(|\<eta\><rsub|0>,y|)>|<around*|\||\<theta\><rsub|\<Gamma\>->|\|>-<mf|b><around*|(|\<eta\><rsub|0>,y|)><around*|(|\<eta\>-\<eta\><rsub|0>|)>>
    </equation*>

    so if <math|\<eta\>\<less\>\<alpha\>\<xi\><rsub|T<rprime|'>>+\<varepsilon\><rprime|'><mf|b><around*|(|\<eta\><rsub|0>,y|)><rsup|-1>>
    then <math|0\<less\>\<eta\>-\<eta\><rsub|0>\<less\><around*|(|2<around*|\||\<theta\><rsub|\<Gamma\>-><rsup|in>|\|>+\<varepsilon\><rprime|'>|)><mf|b><around*|(|\<eta\><rsub|0>,y|)><rsup|-1>>
    so

    <\equation*>
      <mf|b><around*|(|\<eta\>,y|)>\<leq\><frac|<around*|\||\<theta\><rsub|\<Gamma\>->|\|><mf|b><around*|(|\<eta\><rsub|0>,y|)>|<around*|\||\<theta\><rsub|\<Gamma\>->|\|>-<around*|(|2<around*|\||\<theta\><rsub|\<Gamma\>-><rsup|in>|\|>+\<varepsilon\><rprime|'>|)>>.
    </equation*>

    Choosing <math|\<varepsilon\><rprime|'>=1/4> we get that

    <\equation*>
      <mf|b><around*|(|\<eta\>,y|)>\<leq\><around*|(|<around*|\||\<theta\><rsub|\<Gamma\>->|\|>+4<around*|\||\<theta\><rsup|in><rsub|\<Gamma\>+>|\|>|)><mf|b><around*|(|\<eta\><rsub|0>,y|)>
    </equation*>

    when the graph <math|\<eta\>\<mapsto\><mf|b><around*|(|\<eta\>,y|)>>
    intersects <math|\<Gamma\><around*|(|X<rsub|T<rsub|\<gtr\>>>|)>\<cap\>T>.
    Since <math|\<eta\>\<mapsto\><mf|b><around*|(|\<eta\>,y|)>> is
    non-decreasing it holds that the graph
    <math|\<eta\>\<mapsto\><mf|b><around*|(|\<eta\>,y|)>> intersects <math|T>
    only if <math|\<eta\><mf|b><around*|(|\<eta\><rsub|0>,y|)>\<less\>\<theta\><rsub|\<Gamma\>+>>
    so we have shown that\ 

    <\equation*>
      <ltae|<tformat|<table|<row|<cell|<big|int><rsub|\<eta\><rsub|>=\<eta\><rsub|0>><rsup|<wide|\<eta\>|\<bar\>>><around*|(|<big|sum><rsub|T\<in\>\<cal-T\><rsub|\<gtr\>0>><1><rsub|\<Gamma\><around*|(|X<rsub|T>|)>><around*|(|\<eta\>,y,<mf|b><around*|(|\<eta\>,y|)>|)>|)><1><rsub|T\<cap\>A><around*|(|\<eta\>,y,<mf|b><around*|(|\<eta\>,y|)>|)><mf|b><around*|(|\<eta\>,y|)><frac|<dd>\<eta\>|<around*|\||\<Theta\>|\|>>>>|<row|<cell|\<leq\><big|int><rsub|\<eta\><rsub|>=\<theta\><rsub|\<Gamma\>->/<mf|b><around*|(|\<eta\><rsub|0>,y|)>><rsup|\<theta\><rsub|\<Gamma\>+>/<mf|b><around*|(|\<eta\><rsub|0>,y|)>><around*|(|<around*|\||\<theta\><rsub|\<Gamma\>->|\|>+4<around*|\||\<theta\><rsup|in><rsub|\<Gamma\>+>|\|>|)><mf|b><around*|(|\<eta\><rsub|0>,y|)><frac|<dd>\<eta\>|<around*|\||\<Theta\>|\|>>\<lesssim\><around*|\||\<theta\><rsub|\<Gamma\>->|\|>+4<around*|\||\<theta\><rsup|in><rsub|\<Gamma\>+>|\|>.>>>>>
    </equation*>

    The claim follows.\ 
  </render-proof>

  The covering lemma above allows us to obtain the following uniform weak
  <math|L<rsup|1>> bound.

  <\lemma>
    <label|lem:unif-sing-bound>Let <math|V<rsup|>\<in\>\<bbb-D\><rsup|\<cup\>><rsub|\<beta\>>>,
    <math|W<rsup|>\<in\><TT><rsub|\<Theta\>><rsup|\<cup\>>> and
    <math|E=V\<cap\>W> or <math|E=V\<cup\>W>. The bound

    <\equation>
      <ltae|<tformat|<table|<row|<cell|<around*|<left|\<\|\|\>|2>|F\<circ\>\<Gamma\><around*|(|\<eta\>,y,t|)>t<dd><rsub|t><1><rsub|E><around*|(|\<eta\>,y,t|)>|<right|\<\|\|\>|2>><rsub|L<rsup|1,\<infty\>><rsub|\<mu\><rsub|\<Theta\>><rsup|1>>\<Gamma\><rsup|\<ast\>><SL><rsup|<around|(|1,1|)>><rsub|<around*|(|\<Theta\>,\<Theta\><rsup|in>|)>>>\<lesssim\><rsub|><around|<left|\<\|\|\>|1>|F<around*|(|\<eta\>,y,t|)>
      |<right|\<\|\|\>|1>><rsub|L<rsup|1><rsub|\<mu\><rsub|\<Theta\>><rsup|1>><SL><rsup|<around|(|\<infty\>,\<infty\>|)>><rsub|\<Theta\><rsub|\<Gamma\>>>>,>>>>><label|eq:unif-sing-bound>
    </equation>

    holds for any function <math|F\<in\>L<rsup|\<infty\>><rsub|loc><around|(|<R><rsup|3><rsub|+>|)>>.
    The implicit constant is independent of the set <math|E>.
  </lemma>

  <\proof>
    We need to show that for every <math|\<lambda\>\<gtr\>0> there exists a
    set <math|W<rsub|\<lambda\>>=<big|cup><rsub|T\<in\><with|font|cal|T>\<subset\>\<bbb-T\><rsub|\<Theta\>>>T>
    such that\ 

    <\equation*>
      <ltae|<tformat|<cwith|1|-1|1|1|cell-halign|l>|<table|<row|<cell|<around*|<left|\<\|\|\>|1>|<1><rsub|<R><rsup|3><rsub|+>\<setminus\>W<rsub|\<lambda\>>
      >F\<circ\>\<Gamma\><around*|(|\<eta\>,y,t|)>t<dd><rsub|t><1><rsub|E><around*|(|\<eta\>,y,t|)>|<right|\<\|\|\>|1>><rsub|\<Gamma\><rsup|\<ast\>><SL><rsup|<around|(|1,1|)>><rsub|<around*|(|\<Theta\>,\<Theta\><rsup|in>|)>>>\<leq\>\<lambda\>,>>|<row|<cell|\<mu\><rsub|\<Theta\>><rsup|1><around*|(|W<rsub|\<lambda\>>|)>\<lesssim\>
      \<lambda\><rsup|-1><around|\<\|\|\>|F|\<\|\|\>><rsub|L<rsup|1><rsub|\<mu\><rsub|\<Theta\><rsup|>><rsup|1><rsub|\<Gamma\>>><SL><rsup|<around|(|\<infty\>,\<infty\>|)>><rsub|\<Theta\><rsub|\<Gamma\>>>>.>>>>>
    </equation*>

    We may assume that <math|F> is supported on a compact set by the
    discussion at the end of <smart-ref|sec:sizes>. Fix
    <math|\<lambda\>\<gtr\>0> and let <math|W<rsub|\<lambda\>>\<assign\><big|cup><rsub|T<rprime|'>\<in\><with|font|cal|T<rsub|>><rsub|\<lambda\>>\<subset\>\<bbb-T\><rsub|\<Theta\>>>T<rprime|'>>
    where <math|\<cal-T\><rsub|\<lambda\>>\<subset\>\<bbb-T\><rsub|\<Theta\>>><math|><math|>
    is obtained by applying <smart-ref|lem:singular-tree-covering> to <math|
    F\<circ\>\<Gamma\><rsub|>> in place of <math|F>. It remains to prove the
    required bounds on <math|\<mu\><rsub|\<Theta\>><rsup|1><around*|(|W<rsub|\<lambda\>>|)>>.
    Let <math|<around*|(|\<eta\>,y|)>\<mapsto\><mf|b><around*|(|\<eta\>,y|)>>
    be the function whose graph is the boundary of <math|E<rsup|>>, as
    described in <math|><smart-ref|lem:geometry-of-boundary>. For each tree
    <math|T<rprime|'>\<in\>\<cal-T\><rsub|\<lambda\>>>, Lemma
    <reference|lem:singular-tree-covering> gives the bound

    <\equation*>
      <math|<big|int><rsub|<R><rsup|2>><1><rsub|X<rsub|T<rprime|'>>><around*|(|\<eta\>,y,<mf|b><around*|(|\<eta\>,y|)>|)><around*|<left|\||2>|F\<circ\>\<Gamma\><around|(|\<eta\>,y,<mf|b><around*|(|\<eta\>,y|)>|)>|<right|\||2>><mf|b><around*|(|\<eta\>,y|)>\<mathd\>\<eta\>
      \<mathd\>y \<geq\>\<lambda\>\<mu\><rsup|1><rsub|\<Theta\>><around*|(|T|)>>.
    </equation*>

    and thus

    <\equation*>
      <ltae|<tformat|<cwith|1|-1|1|1|cell-halign|l>|<cwith|2|2|1|1|cell-halign|r>|<cwith|1|1|1|1|cell-halign|l>|<cwith|2|2|1|1|cell-halign|l>|<cwith|3|3|1|1|cell-halign|l>|<table|<row|<cell|\<lambda\>\<mu\><rsup|1><rsub|\<Theta\>><around*|(|W<rsub|\<lambda\>>|)>\<lesssim\>\<lambda\><big|sum><rsub|T<rprime|'>\<in\><with|font|cal|T><rsub|\<lambda\>>>\<mu\><rsup|1><rsub|\<Theta\>><around*|(|T<rprime|'>|)>>>|<row|<cell|\<lesssim\><big|int><rsub|<R><rsup|2>><around*|<left|(|-2>|<big|sum><rsub|T<rprime|'>\<in\>\<cal-T\><rsub|\<lambda\>>><1><rsub|X<rsub|T>><around*|(|\<eta\>,y,<mf|b><around*|(|\<eta\>,y|)>|)>|<right|)|-2>><around*|<left|\||1>|F\<circ\>\<Gamma\><around|(|\<eta\>,y,<mf|b><around*|(|\<eta\>,y|)>|)>|<right|\||1>><mf|b><around*|(|\<eta\>,y|)>\<mathd\>\<eta\>
      \<mathd\>y >>|<row|<cell|\<lesssim\><tabular*|<tformat|<twith|table-valign|T>|<cwith|1|1|1|1|cell-halign|l>|<table|<row|<cell|<big|int><rsub|<R><rsup|2>><around*|<left|(|-2>|<big|sum><rsub|T<rprime|'>\<in\>\<cal-T\><rsub|\<lambda\>>><1><rsub|\<Gamma\><around*|(|X<rsub|T<rprime|'>>|)>><around*|(|\<alpha\><around*|(|\<eta\>+\<gamma\><mf|b><around*|(|\<eta\>,y|)><rsup|-1>|)>,y,\<beta\><mf|b><around*|(|\<eta\>,y|)>|)>|<right|)|-2>>>>|<row|<cell|<space|2em>\<times\><around*|<left|\||1>|F<around|(|\<alpha\><around*|(|\<eta\>+\<gamma\><mf|b><around*|(|\<eta\>,y|)><rsup|-1>|)>,y,\<beta\><mf|b><around*|(|\<eta\>,y|)>|)>|<right|\||1>><mf|b><around*|(|\<eta\>,y|)>\<mathd\>\<eta\>
      \<mathd\>y.>>>>>>>>>>
    </equation*>

    Let us enact the Lipschitz change of variables
    <math|\<eta\><rprime|'><around*|(|\<eta\>,y|)>=\<alpha\><around*|(|\<eta\>+\<gamma\><mf|b><around*|(|\<eta\>,y|)><rsup|-1>|)>>.
    We have the following bound on the Jacobian:

    <\equation*>
      <frac|<dd>\<eta\><rprime|'><around*|(|\<eta\>,y|)>|<dd>\<eta\>>=\<alpha\>
      <around*|(|1-\<gamma\><frac|\<partial\><rsub|\<eta\>><mf|b><around*|(|\<eta\>,y|)>|<mf|b><around*|(|\<eta\>,y|)><rsup|2>>|)>\<gtrsim\>\<alpha\>;
    </equation*>

    this holds since \ <math|<around*|\||\<gamma\>|\|>\<less\>1> and
    <math|<around*|\||\<theta\><rsub|+>|\|>,<around*|\||\<theta\><rsub|->|\|>\<geq\>2>
    and thus, according to <smart-ref|eq:boundary-regularity>, it holds that
    <math|<around*|\||\<gamma\><frac|\<partial\><rsub|\<eta\>><mf|b><around*|(|\<eta\>,y|)>|<mf|b><around*|(|\<eta\>,y|)><rsup|2>>|\|>\<less\><frac|1|2>>.
    Let <math|<around*|(|\<eta\><rprime|'>,y|)>\<mapsto\><mf|b><rsub|\<Gamma\>><around*|(|\<eta\><rprime|'>,y|)>>
    be the function whose graph is the boundary of
    <math|\<Gamma\><around*|(|E|)>>. <math|><smart-ref|lem:geometry-of-boundary>
    applies since <math|\<Gamma\><around*|(|E|)>=\<Gamma\><around*|(|V|)>\<cap\>\<Gamma\><around*|(|W|)>>
    (or, respectively, <math|\<Gamma\><around*|(|E|)>=\<Gamma\><around*|(|V|)>\<cup\>\<Gamma\><around*|(|W|)>>)
    and it holds that <math|\<Gamma\><around*|(|V|)>\<in\><DD><rsub|1><rsup|\<cup\>>>
    and <math|\<Gamma\><around*|(|W|)>\<in\><TT><rsup|\<cup\>><rsub|\<Theta\><rsub|\<Gamma\>>>.>
    It follows that\ 

    <\equation*>
      \<beta\><mf|b><around*|(|\<eta\>,y|)>=<mf|b><rsub|\<Gamma\>><around*|(|\<eta\><rprime|'>,y|)>
    </equation*>

    since the boundary of <math|E> is the set

    <\equation*>
      <around*|<left|{|2>|<around*|<left|(|1>|\<eta\>,y,<mf|b><around*|(|\<eta\>,y|)>|<right|)|1>>,<around*|(|\<eta\>,y|)>\<in\><R><rsup|2>|<right|}|2>>
    </equation*>

    while the image under <math|\<Gamma\>> of this set is\ 

    <\equation*>
      <ltae|<tformat|<cwith|1|1|1|1|cell-halign|l>|<table|<row|<cell|\<Gamma\><around*|<left|(|3>|<around*|<left|{|2>|<around*|<left|(|1>|\<eta\>,y,<mf|b><around*|(|\<eta\>,y|)>|<right|)|1>>,<around*|(|\<eta\>,y|)>\<in\><R><rsup|2>|<right|}|2>>|<right|)|3>>>>|<row|<cell|<space|2em><tabular*|<tformat|<cwith|2|2|1|1|cell-halign|r>|<table|<row|<cell|=<around*|<left|{|2>|<around*|<left|(|1>|<around*|(|\<eta\>+\<gamma\><mf|b><around*|(|\<eta\>,y|)><rsup|-1>|)>,y,\<beta\><mf|b><around*|(|\<eta\>,y|)>|<right|)|1>>\<suchthat\><around*|(|\<eta\>,y|)>\<in\><R><rsup|2>|<right|}|2>>>>|<row|<cell|=<around*|<left|{|2>|<around*|(|\<eta\><rprime|'>,y,<mf|b><rsub|\<Gamma\>><around*|(|\<eta\><rprime|'>,y|)>|)>\<suchthat\><around*|(|\<eta\><rprime|'>,y|)>\<in\><R><rsup|2>|<right|}|2>>.>>>>>>>>>>
    </equation*>

    We get that

    <\equation*>
      <ltae|<tformat|<cwith|1|1|1|1|cell-halign|l>|<table|<row|<cell|\<lambda\>\<mu\><rsup|1><rsub|\<Theta\>><around*|(|W<rsub|\<lambda\>>|)>>>|<row|<cell|\<lesssim\><frac|1|\<alpha\>\<beta\>><big|int><rsub|<R><rsup|2>><around*|<left|(|-2>|<big|sum><rsub|T<rprime|'>\<in\>\<cal-T\><rsub|\<lambda\>>><1><rsub|\<Gamma\><around*|(|X<rsub|T<rprime|'>>|)>><around*|(|\<eta\><rprime|'>,y,<mf|b><rsub|\<Gamma\>><around*|(|\<eta\><rprime|'>,y|)>|)>|<right|)|-2>><around*|<left|\||1>|F<around|(|\<eta\><rprime|'>,y,<mf|b><rsub|\<Gamma\>><around*|(|\<eta\><rprime|'>,y|)>|)>|<right|\||1>><mf|b><rsub|\<Gamma\>><around*|(|\<eta\><rprime|'>,y|)>
      \<mathd\>\<eta\><rprime|'> \<mathd\>y>>>>>
    </equation*>

    It remains to bound the <math|<RHS|>> of this inequality from above. By
    <smart-ref|prop:outer-RN> and by the Hölder inequality
    (<smart-ref|cor:outer-holder-classical>) we have that\ 

    <\equation*>
      <ltae|<tformat|<cwith|1|1|1|1|cell-halign|l>|<cwith|2|2|1|1|cell-halign|l>|<cwith|3|3|1|1|cell-halign|r>|<table|<row|<cell|<big|int><rsub|<R><rsup|2>><around*|<left|(|-2>|<big|sum><rsub|T<rprime|'>\<in\>\<cal-T\><rsub|\<lambda\>>><1><rsub|\<Gamma\><around*|(|X<rsub|T<rprime|'>>|)>><around*|(|\<eta\><rprime|'>,y,<mf|b><rsub|\<Gamma\>><around*|(|\<eta\><rprime|'>,y|)>|)>|<right|)|-2>><around*|<left|\||1>|F<around|(|\<eta\><rprime|'>,y,<mf|b><rsub|\<Gamma\>><around*|(|\<eta\><rprime|'>,y|)>|)>|<right|\||1>><mf|b><rsub|\<Gamma\>><around*|(|\<eta\><rprime|'>,y|)>
      \<mathd\>\<eta\><rprime|'> \<mathd\>y>>|<row|<cell|=<big|int><rsub|<R><rsup|2>><around*|<left|(|-2>|<big|sum><rsub|T<rprime|'>\<in\>\<cal-T\><rsub|\<lambda\>>><1><rsub|\<Gamma\><around*|(|X<rsub|T<rprime|'>>|)>><around*|(|\<eta\><rprime|'>,y,t<rprime|'>|)>|<right|)|-2>><around*|<left|\||1>|F<around|(|\<eta\><rprime|'>,y,t<rprime|'>|)>|<right|\||1>>
      t<rprime|'>\<delta\><around*|(|t<rprime|'>-<mf|b><rsub|\<Gamma\>><around*|(|\<eta\><rprime|'>,y|)>|)>
      \<mathd\>\<eta\><rprime|'> \<mathd\>y>>|<row|<cell|\<leq\><around*|<left|\<\|\|\>|-1>|<around*|<left|(|-2>|<big|sum><rsub|T<rprime|'>\<in\>\<cal-T\><rsub|\<lambda\>>><1><rsub|\<Gamma\><around*|(|X<rsub|T<rprime|'>>|)>><around*|(|\<eta\><rprime|'>,y,t<rprime|'>|)>|<right|)|-2>>F<around|(|\<eta\><rprime|'>,y,t<rprime|'>|)>
      t<rprime|'>\<delta\><around*|(|t<rprime|'>-<mf|b><rsub|\<Gamma\>><around*|(|\<eta\><rprime|'>,y|)>|)>|<right|\<\|\|\>|-1>><rsub|L<rsup|1><rsub|\<mu\><rsub|\<Theta\><rsub|\<Gamma\>>><rsup|1>><SL><rsup|<around*|(|1,1|)>><rsub|\<Theta\><rsub|\<Gamma\>>>>>>|<row|<cell|\<leq\><around*|<left|\<\|\|\>|-1>|F<around|(|\<eta\><rprime|'>,y,t<rprime|'>|)>
      |<right|\<\|\|\>|-1>><rsub|L<rsup|1><rsub|\<mu\><rsub|\<Theta\><rsub|\<Gamma\>>><rsup|1>><SL><rsup|<around*|(|\<infty\>,\<infty\>|)>><rsub|\<Theta\><rsub|\<Gamma\>>>><around*|<left|\<\|\|\>|-2>|<around*|<left|(|-2>|<big|sum><rsub|T<rprime|'>\<in\>\<cal-T\><rsub|\<lambda\>>><1><rsub|\<Gamma\><around*|(|X<rsub|T<rprime|'>>|)>><around*|(|\<eta\><rprime|'>,y,t<rprime|'>|)>|<right|)|-2>>t<rprime|'>\<delta\><around*|(|t<rprime|'>-<mf|b><rsub|\<Gamma\>><around*|(|\<eta\><rprime|'>,y|)>|)>|<right|\<\|\|\>|-2>><rsub|L<rsup|\<infty\>><rsub|\<mu\><rsub|\<Theta\><rsub|\<Gamma\>>><rsup|1>><SL><rsup|<around*|(|1,1|)>><rsub|\<Theta\><rsub|\<Gamma\>>>>>>>>>
    </equation*>

    Using bound <eqref|eq:int-tree-covering:summability> provided by
    <smart-ref|lem:singular-tree-covering> we have

    <\equation*>
      <ltae|<tformat|<cwith|1|1|1|1|cell-halign|l>|<table|<row|<cell|<around*|<left|\<\|\|\>|-2>|<around*|<left|(|-2>|<big|sum><rsub|T<rprime|'>\<in\>\<cal-T\><rsub|\<lambda\>>><1><rsub|\<Gamma\><around*|(|X<rsub|T<rprime|'>>|)>><around*|(|\<eta\><rprime|'>,y,t<rprime|'>|)>|<right|)|-2>>t<rprime|'>\<delta\><around*|(|t<rprime|'>-<mf|b><rsub|\<Gamma\>><around*|(|\<eta\><rprime|'>,y|)>|)>|<right|\<\|\|\>|-2>><rsub|L<rsup|\<infty\>><rsub|\<mu\><rsub|\<Theta\><rsub|\<Gamma\>>><rsup|1>><SL><rsup|<around*|(|1,1|)>><rsub|\<Theta\><rsub|\<Gamma\>>>>>>|<row|<cell|<space|2em>=<around*|<left|\<\|\|\>|-2>|<around*|<left|(|-2>|<big|sum><rsub|T<rprime|'>\<in\>\<cal-T\><rsub|\<lambda\>>><1><rsub|\<Gamma\><around*|(|X<rsub|T<rprime|'>>|)>><around*|(|\<eta\><rprime|'>,y,t<rprime|'>|)>|<right|)|-2>>t<rprime|'><dd><rsub|t><1><rsub|\<Gamma\><around*|(|E|)>><around*|(|\<eta\><rprime|'>,y,t<rprime|'>|)>|<right|\<\|\|\>|-2>><rsub|L<rsup|\<infty\>><rsub|\<mu\><rsub|\<Theta\><rsub|\<Gamma\>>><rsup|1>><SL><rsup|<around*|(|1,1|)>><rsub|\<Theta\><rsub|\<Gamma\>>>>\<lesssim\>1>>>>>
    </equation*>

    that concludes the proof.
  </proof>

  We are now ready to deduce <smart-ref|prop:unif-gamma-bounds:singular-size>
  from <smart-ref|lem:unif-sing-bound>. The procedure is analogous to the
  deduction of <smart-ref|prop:unif-gamma-bounds:Sex> from
  <smart-ref|lem:unif-Sex-bound>: first we reduce to a scalar inequality and
  then we conclude using restricted weak type interpolation with one endpoint
  provided by <smart-ref|lem:unif-sing-bound>. The <math|L<rsup|\<infty\>>>
  endpoint of this argument is more involved than in the proof of
  <smart-ref|prop:unif-gamma-bounds:Sex>. The reader is encouraged to refer
  to the proof of <smart-ref|prop:unif-gamma-bounds:Sex> for the explanation
  of the common steps with the proof below, that here are presented
  succinctly.\ 

  <\render-proof|Proof of <smart-ref|prop:unif-gamma-bounds:singular-size>>
    Bound <eqref|eq:unif-gamma-bounds:singular-size> follows from the scalar
    bound

    <\equation>
      <around*|<left|\<\|\|\>|2>|<rsub|>F\<circ\>\<Gamma\><around*|(|\<eta\>,y,t|)>
      t<dd><rsub|t><1><rsub|E><around*|(|\<eta\>,y,t|)>|<right|\<\|\|\>|2>><rsub|L<rsup|r><rsub|\<mu\><rsub|\<Theta\>><rsup|1>>\<Gamma\><rsup|<rsup|\<ast\>>><SL><rsup|<around|(|u,1|)>><rsub|<around*|(|\<Theta\>,\<Theta\><rsup|in>
      |)>>>\<lesssim\><around*|<left|\<\|\|\>|1>|F<around*|(|\<eta\>,y,t|)>
      |<right|\<\|\|\>|1>><rsub|L<rsup|r><rsub|\<mu\><rsub|\<Theta\><rsub|\<Gamma\>>><rsup|1>><SL><rsup|<around|(|\<infty\>,\<infty\>|)>><rsub|\<Theta\><rsub|\<Gamma\>>>><label|eq:unif-gamma-bound-non-iter:singular:scalar>
    </equation>

    for all <math|F\<in\>L<rsup|\<infty\>><rsub|loc><around*|(|<R><rsup|3><rsub|+>|)>>,
    as has been discussed in <smart-ref|cor:wave-packet-decomposition-and-sizes>
    and at the beginning of the proof of <smart-ref|prop:unif-gamma-bounds:Sex>.
    Next, we deduce the bound <eqref|eq:unif-gamma-bound-non-iter:singular:scalar>
    from the bound <eqref|eq:unif-sing-bound>. It is sufficient to prove
    <eqref|eq:unif-gamma-bound-non-iter:singular:scalar> with <math|u=1>
    since <math|F\<in\>L<rsup|\<infty\>><rsub|loc><around*|(|<R><rsup|3><rsub|+>|)>>
    is arbitrary,

    <\equation*>
      <around*|<left|\<\|\|\>|1>|F<around*|(|\<eta\>,y,t|)>
      |<right|\<\|\|\>|1>><rsub|L<rsup|r><rsub|\<mu\><rsub|\<Theta\><rsub|\<Gamma\>>><rsup|1>><SL><rsup|<around|(|\<infty\>,\<infty\>|)>><rsub|\<Theta\><rsub|\<Gamma\>>>>=<around*|<left|\<\|\|\>|1>|<around*|\||F<around*|(|\<eta\>,y,t|)>|\|><rsup|u>
      |<right|\<\|\|\>|1>><rsub|L<rsup|r/u><rsub|\<mu\><rsub|\<Theta\><rsub|\<Gamma\>>><rsup|1>><SL><rsup|<around|(|\<infty\>,\<infty\>|)>><rsub|\<Theta\><rsub|\<Gamma\>>>><rsup|1/u>,
    </equation*>

    and by <eqref|eq:boundary-singular-size> it holds that\ 

    <\equation*>
      <ltae|<tformat|<cwith|1|1|1|1|cell-halign|l>|<table|<row|<cell|<around*|<left|\<\|\|\>|2>|<rsub|>F\<circ\>\<Gamma\><around*|(|\<eta\>,y,t|)>
      t<dd><rsub|t><1><rsub|E><around*|(|\<eta\>,y,t|)>|<right|\<\|\|\>|2>><rsub|L<rsup|r><rsub|\<mu\><rsub|\<Theta\>><rsup|1>>\<Gamma\><rsup|<rsup|\<ast\>>><SL><rsup|<around|(|u,1|)>><rsub|<around*|(|\<Theta\>,\<Theta\><rsup|in>
      |)>>>>>|<row|<cell|<space|2em>\<lesssim\><around*|<left|\<\|\|\>|2>|<rsub|><around*|\||F|\|><rsup|u>\<circ\>\<Gamma\><around*|(|\<eta\>,y,t|)>
      t<dd><rsub|t><1><rsub|E><around*|(|\<eta\>,y,t|)>|<right|\<\|\|\>|2>><rsub|L<rsup|r/u><rsub|\<mu\><rsub|\<Theta\>><rsup|1>>\<Gamma\><rsup|<rsup|\<ast\>>><SL><rsup|<around|(|1,1|)>><rsub|<around*|(|\<Theta\>,\<Theta\><rsup|in>
      |)>>><rsup|1/u>.>>>>>
    </equation*>

    Now, supposing <math|u=1>, we prove the bound by interpolation
    (<smart-ref|prop:outer-restricted-interpolation>). The weak
    <math|L<rsup|1>> endpoint is given by <smart-ref|lem:unif-sing-bound>.
    The <math|r=\<infty\>> endpoint for <smart-ref|eq:unif-gamma-bound-non-iter:Sex:scalar:weak:non-diag>,
    given by

    <\equation*>
      <around*|<left|\<\|\|\>|2>|<rsub|>F\<circ\>\<Gamma\><around*|(|\<eta\>,y,t|)>
      t<dd><rsub|t><1><rsub|E><around*|(|\<eta\>,y,t|)>|<right|\<\|\|\>|2>><rsub|L<rsup|\<infty\>><rsub|\<mu\><rsub|\<Theta\>><rsup|1>>\<Gamma\><rsup|<rsup|\<ast\>>><SL><rsup|<around|(|1,1|)>><rsub|<around*|(|\<Theta\>,\<Theta\><rsup|in>
      |)>>>\<leq\><around*|<left|\<\|\|\>|1>|F<around*|(|\<eta\>,y,t|)>
      |<right|\<\|\|\>|1>><rsub|L<rsup|r><rsub|\<mu\><rsub|\<Theta\><rsub|\<Gamma\>>><rsup|1>><SL><rsup|<around|(|\<infty\>,\<infty\>|)>><rsub|\<Theta\><rsub|\<Gamma\>>>>.
    </equation*>

    This bound holds because\ 

    <\equation*>
      <ltae|<tformat|<cwith|1|1|1|1|cell-halign|l>|<cwith|3|3|1|1|cell-halign|l>|<table|<row|<cell|<around*|<left|\<\|\|\>|2>|<rsub|>F\<circ\>\<Gamma\><around*|(|\<eta\>,y,t|)>
      t<dd><rsub|t><1><rsub|E><around*|(|\<eta\>,y,t|)>|<right|\<\|\|\>|2>><rsub|L<rsup|\<infty\>><rsub|\<mu\><rsub|\<Theta\>><rsup|1>>\<Gamma\><rsup|<rsup|\<ast\>>><SL><rsup|<around|(|1,1|)>><rsub|<around*|(|\<Theta\>,\<Theta\><rsup|in>
      |)>>>>>|<row|<cell|<space|2em>\<leq\><around*|<left|\<\|\|\>|2>|<rsub|>F\<circ\>\<Gamma\><around*|(|\<eta\>,y,t|)>
      |<right|\<\|\|\>|2>><rsub|L<rsup|\<infty\>><rsub|\<mu\><rsub|\<Theta\>><rsup|1>>\<Gamma\><rsup|<rsup|\<ast\>>><SL><rsup|<around|(|\<infty\>,\<infty\>|)>><rsub|\<Theta\>>><around*|<left|\<\|\|\>|2>|<rsub|>
      t<dd><rsub|t><1><rsub|E><around*|(|\<eta\>,y,t|)>|<right|\<\|\|\>|2>><rsub|L<rsup|\<infty\>><rsub|\<mu\><rsub|\<Theta\>><rsup|1>>\<Gamma\><rsup|<rsup|\<ast\>>><SL><rsup|<around|(|1,1|)>><rsub|<around*|(|\<Theta\>,\<Theta\><rsup|in>
      |)>>>>>|<row|<cell|<space|2.0em>\<leq\><around*|<left|\<\|\|\>|2>|<rsub|>F|<right|\<\|\|\>|2>><rsub|L<rsup|\<infty\>><rsub|\<mu\><rsub|\<Theta\><rsub|\<Gamma\>>><rsup|1>><SL><rsup|<around|(|\<infty\>,\<infty\>|)>><rsub|\<Theta\><rsub|\<Gamma\>>>><around*|<left|\<\|\|\>|2>|<rsub|>
      t<dd><rsub|t><1><rsub|E><around*|(|\<eta\>,y,t|)>|<right|\<\|\|\>|2>><rsub|L<rsup|\<infty\>><rsub|\<mu\><rsub|\<Theta\>><rsup|1>>\<Gamma\><rsup|<rsup|\<ast\>>><SL><rsup|<around|(|1,1|)>><rsub|<around*|(|\<Theta\>,\<Theta\><rsup|in>
      |)>>>\<leq\><around*|<left|\<\|\|\>|1>|<rsub|>F|<right|\<\|\|\>|1>><rsub|L<rsup|\<infty\>><rsub|\<mu\><rsub|\<Theta\><rsub|\<Gamma\>>><rsup|1>><SL><rsup|<around|(|\<infty\>,\<infty\>|)>><rsub|\<Theta\><rsub|\<Gamma\>>>>.>>>>>
    </equation*>

    The last bound requires us to show that\ 

    <\equation>
      <around*|<left|\<\|\|\>|1>|<rsub|> t<dd><rsub|t><1><rsub|E><around*|(|\<eta\>,y,t|)>|<right|\<\|\|\>|1>><rsub|\<Gamma\><rsup|<rsup|\<ast\>>><SL><rsup|<around|(|1,1|)>><rsub|<around*|(|\<Theta\>,\<Theta\><rsup|in>
      |)>><around*|(|T|)>>\<lesssim\>1<space|2em>\<forall\>T\<in\><TT><rsub|\<Theta\>>,<label|eq:boundary-bound>
    </equation>

    that we will now show and, allowing us to conclude the proof. Let
    <math|<around*|(|\<eta\>,y|)>\<mapsto\><mf|b><around*|(|\<eta\>,y|)>> is
    the function whose graph is the boundary of <math|E>, as described by
    <smart-ref|lem:geometry-of-boundary>. The same lemma gives that\ 

    <\equation*>
      <ltae|<tformat|<cwith|1|1|1|1|cell-halign|l>|<table|<row|<cell|<around*|<left|\<\|\|\>|1>|<rsub|>
      t<dd><rsub|t><1><rsub|E><around*|(|\<eta\>,y,t|)>|<right|\<\|\|\>|1>><rsub|\<Gamma\><rsup|<rsup|\<ast\>>><SL><rsup|<around|(|1,1|)>><rsub|<around*|(|\<Theta\>,\<Theta\><rsup|in>
      |)>><around*|(|T|)>>>>|<row|<cell|<space|2em>=<big|int><rsub|<R><rsup|2><rsub|+>><1><rsub|\<pi\><rsub|T><around*|(|<mT><rsub|\<Theta\><rsup|in>>|)>><around*|(|\<eta\>,y,<mf|b><around*|(|\<eta\>,y|)>|)><mf|b><around*|(|\<eta\>,y|)><frac|<dd>y<dd>\<eta\>|s<rsub|T><around*|\||\<Theta\>|\|>>.>>>>>
    </equation*>

    By symmetry, assume <math|T=T<rsub|\<Theta\>><around*|(|0,0,1|)>>. Let us
    denote <math|\<Theta\>=<around*|(|\<theta\><rsub|->,\<theta\><rsub|+>|)>>
    and <math|\<Theta\><rsup|in>=<around*|(|\<theta\><rsub|-><rsup|in>,\<theta\><rsup|in><rsub|+>|)>>.
    Integrating bounds <eqref|eq:boundary-regularity>, for
    <math|\<eta\>\<gtr\>0> it holds that

    <\equation*>
      <frac|<around*|\||\<theta\><rsub|+>|\|><mf|b><around*|(|0,y|)>|<around*|\||\<theta\><rsub|+>|\|>+\<eta\><mf|b><around*|(|0,y|)><rsup|>>\<leq\><mf|b><around*|(|\<eta\>,y|)>,
    </equation*>

    and if also <math|\<eta\>\<less\><around*|\||\<theta\><rsub|->|\|><mf|b><around*|(|0,y|)><rsup|-1>>
    then\ 

    <\equation*>
      <mf|b><around*|(|\<eta\>,y|)>\<leq\><frac|<around*|\||\<theta\><rsub|->|\|><mf|b><around*|(|0,y|)>|<around*|\||\<theta\><rsub|->|\|>-\<eta\><mf|b><around*|(|0,y|)><rsup|>>.
    </equation*>

    When <math|\<eta\>\<less\>0> it holds that\ 

    <\equation*>
      <frac|<around*|\||\<theta\><rsub|->|\|><mf|b><around*|(|0,y|)>|<around*|\||\<theta\><rsub|->|\|>-\<eta\><mf|b><around*|(|0,y|)><rsup|>>\<leq\><mf|b><around*|(|\<eta\>,y|)>\<leq\><frac|<around*|\||\<theta\><rsub|+>|\|><mf|b><around*|(|0,y|)>|<around*|\||\<theta\><rsub|+>|\|>+\<eta\><mf|b><around*|(|0,y|)><rsup|>>
    </equation*>

    and if also <math|\<eta\>\<gtr\>-<around*|\||\<theta\><rsub|+>|\|><mf|b><around*|(|0,y|)><rsup|-1>>
    then

    <\equation*>
      <mf|b><around*|(|\<eta\>,y|)>\<leq\><frac|<around*|\||\<theta\><rsub|+>|\|><mf|b><around*|(|0,y|)>|<around*|\||\<theta\><rsub|+>|\|>+\<eta\><mf|b><around*|(|0,y|)><rsup|>>.
    </equation*>

    Since <math|<around*|(|\<eta\>,y,<mf|b><around*|(|\<eta\>,y|)>|)>\<in\>\<pi\><rsub|T><around*|(|<mT><rsub|\<Theta\><rsup|in>>|)>>
    only if \ <math|<around*|\||\<eta\><mf|b><around*|(|\<eta\>,y|)>|\|>\<less\>\<theta\><rsup|in><rsub|\<ast\>><eqd>max<around*|(|<around*|\||\<theta\><rsup|in><rsub|+>|\|>,<around*|\||\<theta\><rsup|in><rsub|->|\|>|)>>.\ 

    Let us show that if the graph of <math|<mf|b>> intersects
    <math|\<pi\><rsub|T><around*|(|<mT><rsub|\<Theta\><rsup|in>>|)>> then
    <math|<mf|b><around*|(|\<eta\>,y|)>\<lesssim\><mf|b><around*|(|0,y|)>>.
    Supposing that <math|\<eta\>\<gtr\>0>, if <math|<mf|b>> intersects
    <math|\<pi\><rsub|T><around*|(|<mT><rsub|\<Theta\><rsup|in>>|)>> then

    <\equation*>
      <mf|b><around*|(|\<eta\>,y|)>\<leq\><frac|<around*|\||\<theta\><rsub|->|\|><mf|b><around*|(|0,y|)>|<around*|\||\<theta\><rsub|->|\|>-\<eta\><mf|b><around*|(|0,y|)><rsup|>><1><rsub|\<eta\>\<less\><frac|<around*|\||\<theta\><rsub|->|\|>|2<mf|b><around*|(|0,y|)>><rsup|>>+<frac|\<theta\><rsup|in><rsub|\<ast\>>|\<eta\>><1><rsub|\<eta\>\<gtr\><frac|<around*|\||\<theta\><rsub|->|\|>|2<mf|b><around*|(|0,y|)>><rsup|>>\<leq\>2<around*|(|1+<frac|\<theta\><rsup|in><rsub|+>|<around*|\||\<theta\><rsub|->|\|>>|)><mf|b><around*|(|0,y|)>
    </equation*>

    On the other hand if <math|\<eta\>\<less\>0> then

    <\equation*>
      <mf|b><around*|(|\<eta\>,y|)>\<leq\><frac|<around*|\||\<theta\><rsub|+>|\|><mf|b><around*|(|0,y|)>|<around*|\||\<theta\><rsub|+>|\|>+\<eta\><mf|b><around*|(|0,y|)><rsup|>><1><rsub|\<eta\>\<gtr\>-<frac|<around*|\||\<theta\><rsub|+>|\|>|2<mf|b><around*|(|0,y|)>>>+<frac|\<theta\><rsup|in><rsub|\<ast\>>|<around*|\||\<eta\>|\|>><1><rsub|\<eta\>\<less\>-<frac|<around*|\||\<theta\><rsub|+>|\|>|2<mf|b><around*|(|0,y|)>>>\<leq\>2<around*|(|1+<frac|<around*|\||\<theta\><rsup|in><rsub|->|\|>|<around*|\||\<theta\><rsub|+>|\|>>|)><mf|b><around*|(|0,y|)>.
    </equation*>

    Let us show that if the graph of <math|<mf|b>> intersects
    <math|\<pi\><rsub|T><around*|(|<mT><rsub|\<Theta\><rsup|in>>|)>> then
    <math|<around*|\||\<eta\>|\|>\<lesssim\><mf|b><around*|(|0,y|)><rsup|-1>>.
    Given the bounds on <math|<mf|b>>, the graph of <math|<mf|b>> intersects
    <math|\<pi\><rsub|T><around*|(|<mT><rsub|\<Theta\><rsup|in>>|)>> only if

    <\equation*>
      <ltae|<tformat|<table|<row|<cell|<frac|<around*|\||\<theta\><rsub|+>|\|><mf|b><around*|(|0,y|)>|<around*|\||\<theta\><rsub|+>|\|>+\<eta\><mf|b><around*|(|0,y|)><rsup|>>\<less\><frac|\<theta\><rsup|in><rsub|\<ast\>>|\<eta\>><text|
      when > \<eta\>\<gtr\>0,>>|<row|<cell|<frac|<around*|\||\<theta\><rsub|->|\|><mf|b><around*|(|0,y|)>|<around*|\||\<theta\><rsub|->|\|>+<around*|\||\<eta\>|\|><mf|b><around*|(|0,y|)><rsup|>>\<less\><frac|\<theta\><rsup|in><rsub|\<ast\>>|<around*|\||\<eta\>|\|>><text|
      when > \<eta\>\<less\>0,>>>>>
    </equation*>

    and thus\ 

    <\equation*>
      <ltae|<tformat|<table|<row|<cell|<mf|b><around*|(|0,y|)><around*|(|<around*|\||\<theta\><rsub|+>|\|>-\<theta\><rsup|in><rsub|\<ast\>>|)><around*|\||\<eta\>|\|>\<less\><around*|\||\<theta\><rsub|+>|\|>
      \<theta\><rsup|in><rsub|\<ast\>><text| when >
      \<eta\>\<gtr\>0,>>|<row|<cell|<mf|b><around*|(|0,y|)><around*|(|<around*|\||\<theta\><rsub|->|\|>-\<theta\><rsup|in><rsub|\<ast\>>|)><around*|\||\<eta\>|\|>\<less\><around*|\||\<theta\><rsub|+>|\|>
      \<theta\><rsup|in><rsub|\<ast\>><text| when > \<eta\>\<less\>0.>>>>>
    </equation*>

    Since <math|\<theta\><rsup|in><rsub|\<ast\>>\<less\>1\<less\>max<around*|(|<around*|\||\<theta\><rsub|+>|\|>,<around*|\||\<theta\><rsub|->|\|>|)>>
    it follows that <math|<around*|\||\<eta\>|\|>\<lesssim\><mf|b><around*|(|0,y|)><rsup|-1>>.
    Together with the bound <math|<mf|b><around*|(|\<eta\>,y|)>\<lesssim\><mf|b><around*|(|0,y|)>>
    it shows that\ 

    <\equation*>
      <big|int><rsub|<R><rsup|2><rsub|+>><1><rsub|\<pi\><rsub|T><around*|(|<mT><rsub|\<Theta\><rsup|in>>|)>><around*|(|\<eta\>,y,<mf|b><around*|(|\<eta\>,y|)>|)><mf|b><around*|(|\<eta\>,y|)><frac|<dd>y<dd>\<eta\>|s<rsub|T><around*|\||\<Theta\>|\|>>\<lesssim\>1
    </equation*>

    as required.
  </render-proof>

  \;

  <subsection|Uniform bounds for the <math|<SU><rsub|\<Gamma\>><rsup|u>\<Phi\><rsub|<gr>><rsup|N>>
  size<label|sec:unif-derived-size-bound>>

  In this section we prove <smart-ref|lem:unif-derived-size-bound>. The size
  <math|<SU><rsub|\<Gamma\>><rsup|u>\<Phi\><rsub|<gr>><rsup|N>>, as defined
  in <eqref|eq:uniform-embedding-full-size:linear>, consists of three parts;
  the three lemmata <reference|lem:uniform-defect-bound>,
  <reference|lem:unif-lac-size-domination>, and
  <reference|lem:unif-max-size-domination> below address these parts: the
  sizes <math|\<Gamma\><rsup|\<ast\>><rsup|><SL><rsup|<around*|(|u,1|)>><rsub|<around*|(|\<Theta\>,\<Theta\><rsup|in>|)>><dfct><rsub|<gr>><rsup|N>>,
  <math|\<Gamma\><rsup|\<ast\>><rsup|><SL><rsup|<around*|(|u,2|)>><rsub|\<Theta\>><wpD><rsub|<gr>><rsup|N>>,
  and <math|\<beta\><rsup|<frac|1|u>><rsup|>\<Gamma\><rsup|\<ast\>><SL><rsup|<around|(|u,\<infty\>|)>><rsub|\<Theta\>>\<Phi\><rsub|<gr>><rsup|N>>
  respectively. <smart-ref|lem:uniform-defect-bound>, up next, amounts to
  showing that the defect of <math|<1><rsub|<around*|(|V<rsup|+>\<cap\>W<rsup|+>|)>\<setminus\>V<rsup|->><Emb><around*|[|f|]>\<circ\>\<Gamma\>>
  is essentially concentrated on the boundary of the region
  <math|<around*|(|V<rsup|+>\<cap\>W<rsup|+>|)>\<setminus\>V<rsup|->> and
  thus can be controlled by the quantity on
  <LHS|<eqref|prop:unif-gamma-bounds:singular-size>>, introduced in
  <smart-ref|prop:unif-gamma-bounds:singular-size>.

  <\lemma>
    <label|lem:uniform-defect-bound><dueto|Defect size domination>Let
    <math|V<rsup|+>,V<rsup|->\<in\>\<bbb-D\><rsup|\<cup\>><rsub|\<beta\>>>
    and <math|W<rsup|+>,W<rsup|->\<in\><TT><rsub|\<Theta\>><rsup|\<cup\>>>.
    The bounds

    <\equation>
      <ltae|<tformat|<cwith|1|1|1|1|cell-halign|l>|<table|<row|<cell|<around|<left|\<\|\|\>|2>|<1><rsub|<around*|(|V<rsup|+>\<cap\>W<rsup|+>|)>\<setminus\><around*|(|V<rsup|->\<cup\>W<rsup|->|)>><around*|(|<Emb><around*|[|f|]>\<circ\>\<Gamma\>|)>|<right|\<\|\|\>|2>><rsub|\<Gamma\><rsup|\<ast\>><rsup|><SL><rsup|<around*|(|u,1|)>><rsub|<around*|(|\<Theta\>,\<Theta\><rsup|in>|)>><dfct><rsub|<gr>><rsup|N>>>>|<row|<cell|\<lesssim\><tabular*|<tformat|<twith|table-valign|T>|<cwith|3|3|1|1|cell-halign|l>|<cwith|1|1|1|1|cell-halign|l>|<table|<row|<cell|<around|<left|\<\|\|\>|2>|<1><rsub|<wide|<around*|(|V<rsup|+>\<cap\>W<rsup|+>|)>|\<bar\>>\<setminus\><around*|(|V<rsup|->\<cup\>W<rsup|->|)>><around*|(|<Emb><around*|[|f|]>\<circ\>\<Gamma\>|)><around*|(|\<eta\>,y,t|)>
      t<dd><rsub|t><1><rsub|<around*|(|V<rsup|+>\<cap\>W<rsup|+>|)>><around*|(|\<eta\>,y,t|)><rsub|>|<right|\<\|\|\>|2>><rsub|\<Gamma\><rsup|\<ast\>><rsup|><SL><rsup|<around*|(|u,1|)>><rsub|<around*|(|\<Theta\>,\<Theta\><rsup|in>|)>>\<Phi\><rsub|16<gr>><rsup|N-8>>>>|<row|<cell|+<around|<left|\<\|\|\>|2>|<1><rsub|<wide|<around*|(|V<rsup|+>\<cap\>W<rsup|+>|)>|\<bar\>>\<setminus\><around*|(|V<rsup|->\<cup\>W<rsup|->|)>><around*|(|<Emb><around*|[|f|]>\<circ\>\<Gamma\>|)><around*|(|\<eta\>,y,t|)>
      t<dd><rsub|t><1><rsub|<around*|<left|(|1>|<R><rsup|3><rsub|+>\<setminus\>V<rsup|->|<right|)|1>>><around*|(|\<eta\>,y,t|)><rsub|>|<right|\<\|\|\>|2>><rsub|\<Gamma\><rsup|\<ast\>><rsup|><SL><rsup|<around*|(|u,1|)>><rsub|<around*|(|\<Theta\>,\<Theta\><rsup|in>|)>>\<Phi\><rsub|16<gr>><rsup|N-8>>>>|<row|<cell|+<around|<left|\<\|\|\>|2>|<1><rsub|<around*|(|V<rsup|+>\<cap\>W<rsup|+>|)>\<setminus\><around*|(|V<rsup|->\<cup\>W<rsup|->|)>><around*|(|<Emb><around*|[|f|]>\<circ\>\<Gamma\>|)>|<right|\<\|\|\>|2>><rsub|\<Gamma\><rsup|\<ast\>><SL><rsup|<around|(|u,2|)>><rsub|<around|(|\<Theta\>,\<Theta\><rsup|ex>|)>>\<Phi\><rsub|16<gr>><rsup|N-8>>>>>>>>>>>><label|eq:geometry-of-defects>

      \;
    </equation>

    hold for any <math|f\<in\><Sch><around*|(|<R>|)>> and for all
    <math|u\<in\><around*|[|1,+\<infty\>|]>>. The implicit constant is
    independent of the sets <math|V<rsup|+>>, <math|V<rsup|->>,
    <math|W<rsup|+>>, and <math|W<rsup|->>.
  </lemma>

  <\proof>
    To show <eqref|eq:geometry-of-defects> it is sufficient to prove that\ 

    <\equation*>
      <ltae|<tformat|<table|<row|<cell|<ltae|<tformat|<cwith|1|1|1|1|cell-halign|l>|<table|<row|<cell|<around|<left|\<\|\|\>|2>|<1><rsub|<around*|(|V<rsup|+>\<cap\>W<rsup|+>|)>\<setminus\><around*|(|V<rsup|->\<cup\>W<rsup|->|)>><around*|(|<Emb><around*|[|f|]>\<circ\>\<Gamma\>|)>|<right|\<\|\|\>|2>><rsub|\<Gamma\><rsup|\<ast\>><rsup|><SL><rsup|<around*|(|u,1|)>><rsub|<around*|(|\<Theta\>,\<Theta\><rsup|in>|)>><dfct><rsub|\<zeta\>,<gr>><rsup|N><around*|(|T|)>>>>|<row|<cell|<space|1em>+<around|<left|\<\|\|\>|2>|<1><rsub|<around*|(|V<rsup|+>\<cap\>W<rsup|+>|)>\<setminus\><around*|(|V<rsup|->\<cup\>W<rsup|->|)>><around*|(|<Emb><around*|[|f|]>\<circ\>\<Gamma\>|)>|<right|\<\|\|\>|2>><rsub|\<Gamma\><rsup|\<ast\>><rsup|><SL><rsup|<around*|(|u,1|)>><rsub|<around*|(|\<Theta\>,\<Theta\><rsup|in>|)>><dfct><rsub|\<sigma\>,<gr>><rsup|N><around*|(|T|)>>>>>>>>>|<row|<cell|\<lesssim\><ltae|<tformat|<cwith|3|3|1|1|cell-halign|l>|<cwith|1|1|1|1|cell-halign|l>|<table|<row|<cell|<around|<left|\<\|\|\>|2>|<1><rsub|<wide|<around*|(|V<rsup|+>\<cap\>W<rsup|+>|)>|\<bar\>>\<setminus\><around*|(|V<rsup|->\<cup\>W<rsup|->|)>><around*|(|<Emb><around*|[|f|]>\<circ\>\<Gamma\>|)><around*|(|\<eta\>,y,t|)>
      t<dd><rsub|t><1><rsub|<around*|(|V<rsup|+>\<cap\>W<rsup|+>|)>><around*|(|\<eta\>,y,t|)><rsub|>|<right|\<\|\|\>|2>><rsub|\<Gamma\><rsup|\<ast\>><rsup|><SL><rsup|<around*|(|u,1|)>><rsub|<around*|(|\<Theta\>,\<Theta\><rsup|in>|)>>\<Phi\><rsub|16<gr>><rsup|N-8>>>>|<row|<cell|+<around|<left|\<\|\|\>|2>|<1><rsub|<wide|<around*|(|V<rsup|+>\<cap\>W<rsup|+>|)>|\<bar\>>\<setminus\><around*|(|V<rsup|->\<cup\>W<rsup|->|)>><around*|(|<Emb><around*|[|f|]>\<circ\>\<Gamma\>|)><around*|(|\<eta\>,y,t|)>
      t<dd><rsub|t><1><rsub|<around*|<left|(|1>|<R><rsup|3><rsub|+>\<setminus\>V<rsup|->|<right|)|1>>><around*|(|\<eta\>,y,t|)><rsub|>|<right|\<\|\|\>|2>><rsub|\<Gamma\><rsup|\<ast\>><rsup|><SL><rsup|<around*|(|u,1|)>><rsub|<around*|(|\<Theta\>,\<Theta\><rsup|in>|)>>\<Phi\><rsub|16<gr>><rsup|N-8>>>>|<row|<cell|+<around|<left|\<\|\|\>|2>|<1><rsub|<wide|<around*|(|V<rsup|+>\<cap\>W<rsup|+>|)>|\<bar\>>\<setminus\><around*|(|V<rsup|->\<cup\>W<rsup|->|)>><around*|(|<Emb><around*|[|f|]>\<circ\>\<Gamma\>|)>|<right|\<\|\|\>|2>><rsub|\<Gamma\><rsup|\<ast\>><SL><rsup|<around|(|u,2|)>><rsub|<around|(|\<Theta\>,\<Theta\><rsup|ex>|)>>\<Phi\><rsub|16<gr>><rsup|N-8>>>>>>>>>>>>
    </equation*>

    holds for any <math|T\<in\><TT><rsub|\<Theta\>>>. Let us fix
    <math|f\<in\><Sch><around*|(|<R>|)>>. By symmetry, according to
    <eqref|eq:size-symmetry> and the subsequent discussion, we can assume
    that <math|T=T<rsub|\<Theta\>><rsub|><around*|(|0,0,1|)>> so that
    <math|\<Gamma\>\<circ\>\<pi\><rsub|T><around*|(|\<theta\>,\<zeta\>,\<sigma\>|)>=<around*|(|\<alpha\>\<beta\><around*|(|\<theta\>+\<gamma\>|)><around*|(|\<beta\>\<sigma\>|)><rsup|-1>,\<zeta\>,\<beta\>\<sigma\>|)>=<around*|<left|(|1>|\<theta\><rsub|\<Gamma\>><around*|(|\<beta\>\<sigma\>|)><rsup|-1>,\<zeta\>,\<beta\>\<sigma\>|<right|)|1>>>.
    For conciseness we set <math|F<rsub|\<Gamma\>>=<Emb><around*|[|f|]>\<circ\>\<Gamma\>>.
    \ By <eqref|eq:embedded-no-defect> it holds that\ 

    <\equation*>
      <ltae|<tformat|<cwith|1|1|1|1|cell-halign|l>|<table|<row|<cell|<around*|<left|(|1>|\<Gamma\><rsup|\<ast\>><wpD><rsub|\<zeta\>><around*|(|t\<eta\>|)>-\<beta\>t<dd><rsub|y>|<right|)|1>>F<rsub|\<Gamma\>><around*|(|\<eta\>,y,t|)>=0,>>|<row|<cell|<around*|<left|(|-1>|\<Gamma\><rsup|\<ast\>><wpD><rsub|\<sigma\>><around*|(|t\<eta\>|)>-t<dd><rsub|t>+\<eta\><dd><rsub|\<eta\>>|<right|)|-1>>F<rsub|\<Gamma\>><around*|(|\<eta\>,y,t|)>=0.>>>>>
    </equation*>

    According to definitions <eqref|eq:gamma-defect-size> (see also the
    discussion below <eqref|eq:embedded-no-defect>) it holds that\ 

    <\equation>
      <ltae|<tformat|<cwith|1|1|1|1|cell-halign|l>|<cwith|2|2|1|1|cell-halign|l>|<table|<row|<cell|<around|<left|\<\|\|\>|1>|F<rsub|\<Gamma\>><around*|(|\<eta\>,y,t|)>|<right|\<\|\|\>|1>><rsub|\<Gamma\><rsup|\<ast\>><SL><rsub|<around*|(|\<Theta\>,\<Theta\><rsup|in>|)><rsub|>><rsup|<around*|(|u,1|)>><rsub|><dfct><rsub|\<zeta\>,<gr>><rsup|N<rsup|>><around*|(|T|)>>>>|<row|<cell|<space|1em>\<leq\><tabular*|<tformat|<cwith|3|3|1|1|cell-halign|r>|<cwith|2|2|1|1|cell-halign|l>|<twith|table-valign|T>|<cwith|1|1|1|1|cell-halign|l>|<table|<row|<cell|<around*|<left|\<\|\|\>|3>|<around*|<left|(|1>|\<beta\>t<dd><rsub|y><1><rsub|<around*|(|W<rsup|+>\<cap\>V<rsup|+>|)>><around*|(|\<eta\>,y,t|)>|<right|)|1>><around*|(|<1><rsub|<R><rsup|3><rsub|+>\<setminus\><around*|(|W<rsup|->\<cup\>V<rsup|->|)>>F<rsub|\<Gamma\>>|)><around*|(|\<eta\>,y,t|)>|<right|\<\|\|\>|3>><rsub|<SL><rsub|<around*|(|\<Theta\>,\<Theta\><rsup|in>|)>><rsup|<around*|(|u,1|)>>\<Phi\><rsub|<mf|r>><rsup|N><around|(|T|)>><rsub|>>>|<row|<cell|+<around*|<left|\<\|\|\>|3>|<around*|<left|(|1>|\<beta\>t<dd><rsub|y><1><rsub|<R><rsup|3><rsub|+>\<setminus\>V<rsup|->><around*|(|\<eta\>,y,t|)>|<right|)|1>><around*|(|<1><rsub|<wide|<around*|(|W<rsup|+>\<cap\>V<rsup|+>|)>|\<bar\>>\<setminus\><around*|(|W<rsup|->\<cup\>V<rsup|->|)>>F<rsub|\<Gamma\>>|)><around*|(|\<eta\>,y,t|)>|<right|\<\|\|\>|3>><rsub|<SL><rsub|<around*|(|\<Theta\>,\<Theta\><rsup|in>|)>><rsup|<around*|(|u,1|)>>\<Phi\><rsub|<mf|r>><rsup|N><around|(|T|)>><rsub|>>>|<row|<cell|+<around*|<left|\<\|\|\>|3>|<around*|<left|(|2>|\<beta\>t<dd><rsub|y><1><rsub|<R><rsup|3><rsub|+>\<setminus\>W<rsup|->><around*|(|\<eta\>,y,t|)>|<right|)|2>><around*|(|<1><rsub|<wide|<around*|(|W<rsup|+>\<cap\>V<rsup|+>|)>|\<bar\>>\<setminus\><around*|(|W<rsup|->\<cup\>V<rsup|->|)>>F<rsub|\<Gamma\>>|)><around*|(|\<eta\>,y,t|)>|<right|\<\|\|\>|3>><rsub|<SL><rsub|<around*|(|\<Theta\>,\<Theta\><rsup|in>|)>><rsup|<around*|(|u,1|)>>\<Phi\><rsub|<mf|r>><rsup|N><around|(|T|)>><rsub|>,>>>>>>>>>><label|eq:geometry-of-defects:space>
    </equation>

    and

    <\equation>
      <ltae|<tformat|<table|<row|<cell|<around|<left|\<\|\|\>|1>|F<rsub|\<Gamma\>><around*|(|\<eta\>,y,t|)>|<right|\<\|\|\>|1>><rsub|\<Gamma\><rsup|\<ast\>><SL><rsub|<around*|(|\<Theta\>,\<Theta\><rsup|in>|)><rsub|>><rsup|<around*|(|u,v|)>><rsub|><dfct><rsub|\<sigma\>,<gr>><rsup|N<rsup|>><around*|(|T|)>>>>|<row|<cell|<space|1em>\<leq\><ltae|<tformat|<cwith|2|2|1|1|cell-valign|c>|<cwith|1|1|1|1|cell-halign|l>|<cwith|3|3|1|1|cell-halign|c>|<cwith|2|2|1|1|cell-halign|l>|<table|<row|<cell|<around*|<left|\<\|\|\>|3>|<around*|<left|(|1>|<around*|(|t<dd><rsub|t>-\<eta\><dd><rsub|\<eta\>>|)><1><rsub|<around*|(|W<rsup|+>\<cap\>V<rsup|+>|)>><around*|(|\<eta\>,y,t|)>|<right|)|1>><around*|(|<1><rsub|<R><rsup|3><rsub|+>\<setminus\><around*|(|W<rsup|->\<cup\>V<rsup|->|)>>F<rsub|\<Gamma\>>|)><around*|(|\<eta\>,y,t|)>|<right|\<\|\|\>|3>><rsub|<SL><rsub|<around*|(|\<Theta\>,\<Theta\><rsup|in>|)>><rsup|<around*|(|u,1|)>>\<Phi\><rsub|<mf|r>><rsup|N><around|(|T|)>><rsub|>>>|<row|<cell|+<around*|<left|\<\|\|\>|3>|<around*|<left|(|2>|<around*|(|t<dd><rsub|t>-\<eta\><dd><rsub|\<eta\>>|)><1><rsub|<R><rsup|3><rsub|+>\<setminus\>V<rsup|->><around*|(|\<eta\>,y,t|)>|<right|)|2>><around*|(|<1><rsub|<wide|<around*|(|W<rsup|+>\<cap\>V<rsup|+>|)>|\<bar\>>\<setminus\><around*|(|W<rsup|->\<cup\>V<rsup|->|)>>F<rsub|\<Gamma\>>|)><around*|(|\<eta\>,y,t|)>|<right|\<\|\|\>|3>><rsub|<SL><rsub|<around*|(|\<Theta\>,\<Theta\><rsup|in>|)>><rsup|<around*|(|u,1|)>>\<Phi\><rsub|<mf|r>><rsup|N><around|(|T|)>><rsub|>>>|<row|<cell|+<around*|<left|\<\|\|\>|3>|<around*|<left|(|2>|<around*|(|t<dd><rsub|t>-\<eta\><dd><rsub|\<eta\>>|)><1><rsub|<R><rsup|3><rsub|+>\<setminus\>W<rsup|->><around*|(|\<eta\>,y,t|)>|<right|)|2>><around*|(|<1><rsub|<wide|<around*|(|W<rsup|+>\<cap\>V<rsup|+>|)>|\<bar\>>\<setminus\><around*|(|W<rsup|->\<cup\>V<rsup|->|)>>F<rsub|\<Gamma\>>|)><around*|(|\<eta\>,y,t|)>|<right|\<\|\|\>|3>><rsub|<SL><rsub|<around*|(|\<Theta\>,\<Theta\><rsup|in>|)>><rsup|<around*|(|u,1|)>>\<Phi\><rsub|<mf|r>><rsup|N><around|(|T|)>.><rsub|>>>>>>>>>>><label|eq:geometry-of-defects:scale>
    </equation>

    Let <math|<mf|b><rsub|+>>, <math|<mf|b><rsub|->> and
    <math|<mf|b><rsub|W<rsup|->>> \ be the functions whose graphs are the
    boundaries of <math|V<rsup|+>\<cap\>W<rsup|+>>, <math|V<rsup|->>, and
    <math|W<rsup|->> respectively, given by
    <smart-ref|lem:geometry-of-boundary>. According to
    <eqref|eq:boundary-regularity> we have\ 

    <\equation*>
      <ltae|<tformat|<cwith|2|2|1|1|cell-halign|l>|<cwith|1|1|1|1|cell-halign|l>|<table|<row|<cell|<around*|\||\<beta\>t<dd><rsub|y><1><rsub|V<rsup|+>\<cap\>W<rsup|+>><around*|(|\<eta\>,y,t|)>|\|>\<lesssim\>t\<delta\><around*|(|t-<mf|b><rsub|+><around*|(|\<eta\>,y|)>|)>,>>|<row|<cell|<around*|\||\<beta\>t<dd><rsub|y><1><rsub|<R><rsup|3><rsub|+>\<setminus\>V<rsup|->><around*|(|\<eta\>,y,t|)>|\|>\<lesssim\>t\<delta\><around*|(|t-<mf|b><rsub|-><around*|(|\<eta\>,y|)>|)>,>>|<row|<cell|<around*|\||\<beta\>t<dd><rsub|y><1><rsub|<R><rsup|3><rsub|+>\<setminus\>W<rsup|->><around*|(|\<eta\>,y,t|)>|\|>\<lesssim\>t\<delta\><around*|(|t-<mf|b><rsub|W<rsup|->><around*|(|\<eta\>,y|)>|)>.>>>>>
    </equation*>

    Similarly, when <math|<around*|(|\<eta\>,y,t|)>\<in\>\<pi\><rsub|T><around*|(|<mT><rsub|\<Theta\>>|)>>,
    or in general when <math|\<eta\>t> is bounded it holds that\ 

    <\equation*>
      <ltae|<tformat|<table|<row|<cell|<around*|\||<around*|(|t<dd><rsub|t>-\<eta\><dd><rsub|\<eta\>>|)><1><rsub|V<rsup|+>\<cap\>W<rsup|+>><around*|(|\<eta\>,y,t|)>|\|>\<lesssim\>t\<delta\><around*|(|t-<mf|b><rsub|+><around*|(|\<eta\>,y|)>|)>,>>|<row|<cell|<around*|\||<around*|(|t<dd><rsub|t>-\<eta\><dd><rsub|\<eta\>>|)><1><rsub|<R><rsup|3><rsub|+>\<setminus\>V<rsup|->><around*|(|\<eta\>,y,t|)>|\|>\<lesssim\>t\<delta\><around*|(|t-<mf|b><rsub|-><around*|(|\<eta\>,y|)>|)>,>>|<row|<cell|<around*|\||<around*|(|t<dd><rsub|t>-\<eta\><dd><rsub|\<eta\>>|)><1><rsub|<R><rsup|3><rsub|+>\<setminus\>W<rsup|->><around*|(|\<eta\>,y,t|)>|\|>\<lesssim\>t\<delta\><around*|(|t-<mf|b><rsub|W<rsup|->><around*|(|\<eta\>,y|)>|)>.>>>>>
    </equation*>

    As a matter of fact, if <math|<mf|b>> is any of the functions
    <math|<mf|b><rsub|+>,<mf|b><rsub|->,<mf|b><rsub|W<rsup|->>> then <math|>

    <\equation*>
      \<eta\><dd><rsub|\<eta\>><1><rsub|t\<gtr\><mf|b><around*|(|\<eta\>,y|)>>=-\<delta\><around*|<left|(|1>|t-<mf|b><around*|(|\<eta\>,y|)>|<right|)|1>>\<eta\><dd><rsub|\<eta\>><mf|b><around*|(|\<eta\>,y|)>=-t\<delta\><around*|(|t-<mf|b><around*|(|\<eta\>,y|)>|)>\<eta\>t<frac|<dd><rsub|\<eta\>><mf|b><around*|(|\<eta\>,y|)>|<mf|b><around*|(|\<eta\>,y|)><rsup|2>>
    </equation*>

    and, according to <eqref|eq:boundary-regularity>,
    <math|<around*|\||\<eta\>t<frac|<dd><rsub|\<eta\>><mf|b><around*|(|\<eta\>,y|)>|<mf|b><around*|(|\<eta\>,y|)><rsup|2>>|\|>\<lesssim\>1>.
    Thus the first two summands in <RHS|<eqref|eq:geometry-of-defects:space>>
    and in <RHS|<eqref|eq:geometry-of-defects:scale>> are bounded by the
    first two summands in <RHS|><eqref|eq:geometry-of-defects>. It remains to
    show that the last summand of <RHS|<eqref|eq:geometry-of-defects:space>>
    and the last summand of <RHS|<eqref|eq:geometry-of-defects:scale>> are
    each bounded by <RHS|><eqref|eq:geometry-of-defects>. According to the
    discussion above, this follows by showing the bound

    <\equation*>
      <around*|<left|\<\|\|\>|3>|<around*|(|<1><rsub|<wide|<around*|(|W<rsup|+>\<cap\>V<rsup|+>|)>|\<bar\>>\<setminus\><around*|(|W<rsup|->\<cup\>V<rsup|->|)>>F<rsub|\<Gamma\>>|)><around*|(|\<eta\>,y,t|)>t\<delta\><around*|(|t-<mf|b><rsub|W<rsup|->><around*|(|\<eta\>,y|)>|)>|<right|\<\|\|\>|3>><rsub|<SL><rsub|<around*|(|\<Theta\>,\<Theta\><rsup|in>|)>><rsup|<around*|(|u,1|)>>\<Phi\><rsub|<mf|r>><rsup|N><around|(|T|)>><rsub|>\<lesssim\><RHS|><eqref|eq:geometry-of-defects>.
    </equation*>

    Let \ <math|<mf|b><rsub|+><rsup|\<ast\>>>,
    <math|<mf|b><rsub|-><rsup|\<ast\>>> and
    <math|<mf|b><rsub|W<rsup|->><rsup|\<ast\>>> be the functions
    <math|<mf|b><rsub|+>>, <math|<mf|b><rsub|->> and
    <math|<mf|b><rsub|W<rsup|->>> expressed in local coordinates of
    <math|\<pi\><rsub|T>> i.e. such that <eqref|eq:boundary-pullback-condition>
    holds for <math|><math|<mf|b>=<mf|b><rsub|+>>,
    <math|<mf|b>=<mf|b><rsub|->> or <math|<mf|b>=<mf|b><rsub|W<rsup|->>>,
    respectively. By <eqref|eq:boundary-singular-size-local> we need to show
    that\ 

    <\equation*>
      <big|int><rsub|\<Theta\><rsup|in>\<times\>B<rsub|1>><around*|<left|\||2>|<1><rsub|E<rsup|\<ast\>>>F<rsup|\<ast\>><around*|<left|(|1>|\<theta\>,\<zeta\>,<mf|b><rsub|W<rsup|->><rsup|\<ast\>><around*|(|\<theta\>,\<zeta\>|)>|<right|)|1>><around*|[|\<phi\>|]>|<right|\||2>><rsup|u><frac|<dd>\<theta\><dd>\<zeta\>|<around*|\||\<Theta\>|\|>>\<lesssim\><RHS|><eqref|eq:geometry-of-defects><rsup|u><around*|\<\|\|\>|\<phi\>|\<\|\|\>><rsub|\<Phi\><rsup|N><rsub|<gr>>>
    </equation*>

    where we use the shorthand <math|F<rsup|\<ast\>>=<1><rsub|<mT><rsub|\<Theta\><rsup|in><rsub|\<Gamma\>>>><around*|(|<Emb><around*|[|f|]>\<circ\>\<Gamma\>\<circ\>\<pi\><rsub|T>|)>>
    and <math|E<rsup|\<ast\>>=<around*|<left|{|2>|<around*|(|\<theta\>,\<zeta\>,\<sigma\>|)>:<mf|b><rsub|-><rsup|\<ast\>><around*|(|\<theta\>,\<zeta\>|)>\<less\>\<sigma\>\<less\><mf|b><rsub|+><rsup|\<ast\>><around*|(|\<theta\>,\<zeta\>|)>|<right|}|2>>>.
    First we record that locally in <math|\<theta\>> and <math|\<sigma\>> the
    function <math|F<rsup|\<ast\>>> is almost constant. As a matter of fact,
    it follows form the definitions <eqref|eq:embedding> and <eqref|eq:gamma>
    of <Emb> and <math|\<Gamma\>> that

    <\equation*>
      F<rsup|\<ast\>><around*|(|\<theta\>,\<zeta\>,\<sigma\>|)><around*|[|\<phi\>|]>=<1><rsub|<mT><rsub|\<Theta\><rsup|in><rsub|\<Gamma\>>>><around*|(|\<theta\>,\<zeta\>,\<sigma\>|)>f\<ast\><Dil><rsub|\<sigma\>><Mod><rsub|\<theta\><rsub|\<Gamma\>>>\<phi\><rsup|\<vee\>><around*|(|\<zeta\>|)>
    </equation*>

    where <math|\<phi\><rsup|\<vee\>><around*|(|z|)>=\<phi\><around*|(|-z|)>>.
    Thus, if we define <math|\<phi\><rsub|<around*|(|\<theta\><rprime|'>,\<sigma\><rprime|'>,\<theta\>,\<sigma\>|)>>>
    by setting\ 

    <\equation>
      <Dil><rsub|\<sigma\><rprime|'>><Mod><rsub|\<theta\><rprime|'><rsub|\<Gamma\>>>\<phi\><rsub|<around*|(|\<theta\><rprime|'>,\<sigma\><rprime|'>,\<theta\>,\<sigma\>|)>><rsup|\<vee\>><eqd><Dil><rsub|\<sigma\>><Mod><rsub|\<theta\><rsub|\<Gamma\>>>\<phi\><rsup|\<vee\>><label|eq:wave-packet-move>.
    </equation>

    it holds that <math|F<rsup|\<ast\>><around*|(|\<theta\>,\<zeta\>,\<sigma\>|)><around*|[|\<phi\>|]>=F<rsup|\<ast\>><around*|(|\<theta\><rprime|'>,\<zeta\><rprime|'>,\<sigma\><rprime|'>|)><around*|[|\<phi\><rsub|<around*|(|\<theta\><rprime|'>,\<sigma\><rprime|'>,\<theta\>,\<sigma\>|)>>|]>>
    as long as <math|<around*|(|\<theta\><rprime|'>,\<zeta\><rprime|'>,\<sigma\><rprime|'>|)>\<in\><mT><rsub|\<Theta\><rsup|in><rsub|\<Gamma\>>>>.
    Furthermore, any <math|<wide|r|\<bar\>>\<gtr\>0> small enough
    independently of <math|\<Gamma\>>, if
    <math|<around*|\||\<theta\><rprime|'>-\<theta\>|\|>\<less\><wide|r|\<bar\>>>
    and <math|<around*|\||\<sigma\><rprime|'>/\<sigma\>-1|\|>\<less\><wide|r|\<bar\>>>
    one has that <math|<around*|\<\|\|\>|\<phi\><rsub|<around*|(|\<theta\><rprime|'>,\<sigma\><rprime|'>,\<theta\>,\<sigma\>|)>>|\<\|\|\>><rsub|\<Phi\><rsup|N><rsub|2<rsup|l+1><gr>>>\<lesssim\><around*|\<\|\|\>|\<phi\>|\<\|\|\>><rsub|\<Phi\><rsup|N><rsub|2<rsup|l><gr>>>>
    for any <math|l\<in\><around*|{|0,\<ldots\>,10|}>>, any
    <math|N\<less\>N<rsub|0>> for some fixed arbitrary large
    <math|N<rsub|0>\<in\><N>> and any <math|\<phi\>\<in\>\<Phi\><rsub|2<rsup|l><gr>><rsup|N>>.
    Let us fix such a small <math|<wide|r|\<bar\>>\<gtr\>0> so that the facts
    above hold.\ 

    Next we want to show that close to any point
    <math|<around*|(|\<theta\>,\<zeta\>,<mf|b><rsub|W<rsup|->><rsup|\<ast\>><around*|(|\<theta\>,\<zeta\>|)>|)>\<in\><mT><rsub|\<Theta\><rsup|in><rsub|\<Gamma\>>>\<cap\>E<rsup|\<ast\>>>
    there exists a small neighborhood in <math|\<pi\><rsub|T><rsup|-1><around*|<left|(|1>|T\<setminus\>W<rsup|->|<right|)|1>>>
    such that the contribution of <math|<around*|<left|\||2>|<1><rsub|E<rsup|\<ast\>>>F<rsup|\<ast\>><around*|<left|(|1>|\<theta\>,\<zeta\>,<mf|b><rsub|W<rsup|->><rsup|\<ast\>><around*|(|\<theta\>,\<zeta\>|)>|<right|)|1>><around*|[|\<phi\>|]>|<right|\||2>><rsup|u>>
    to the integral we are bounding is controlled by <math|F<rsup|\<ast\>>>
    on that neighborhood. We will then, in turn, bound <math|F<rsup|\<ast\>>>
    on that neighborhood by <math|<RHS|><eqref|eq:geometry-of-defects>>. For
    small enough <math|r<rsub|\<theta\>>,r<rsub|\<zeta\>>,r<rsub|\<sigma\>>\<gtr\>0>
    let

    <\equation*>
      <ltae|<tformat|<cwith|2|2|1|1|cell-valign|c>|<table|<row|<cell|R<around*|(|\<theta\>,\<zeta\>|)><eqd><around*|<left|{|2>|<around*|(|\<theta\><rprime|'>,\<zeta\><rprime|'>|)>\<in\>\<Theta\><rsup|in><rsub|\<Gamma\>>\<times\>B<rsub|1>\<of\><around*|\||\<theta\><rprime|'>-\<theta\>|\|>\<less\>r<rsub|\<theta\>>,<around*|\||\<zeta\><rprime|'>-\<zeta\>|\|>\<less\>r<rsub|\<zeta\>><mf|b><rsub|W<rsup|->><rsup|\<ast\>><around*|(|\<theta\>,\<zeta\>|)>|<right|}|2>>>>|<row|<cell|R<rsup|0><around*|(|\<theta\>,\<zeta\>|)><eqd><around*|<left|{|1>|<around*|(|\<theta\><rprime|'>,\<zeta\><rprime|'>,\<sigma\><rprime|'>|)>\<of\><around*|(|\<theta\><rprime|'>,\<zeta\><rprime|'>|)>\<in\>R<around*|(|\<theta\>,\<zeta\>|)>,<frac|\<sigma\><rprime|'>|<mf|b><rsub|W<rsup|->><rsup|\<ast\>><around*|(|\<theta\>,\<zeta\>|)>>\<in\><around*|<left|[|1>|1-10r<rsub|\<sigma\>>,1+10r<rsub|\<sigma\>>|<right|]|1>>|<right|}|1>>,>>|<row|<cell|R<rsup|+><around*|(|\<theta\>,\<zeta\>|)><eqd><around*|{|<around*|(|\<theta\><rprime|'>,\<zeta\><rprime|'>,\<sigma\><rprime|'>|)>\<of\><around*|(|\<theta\><rprime|'>,\<zeta\><rprime|'>|)>\<in\>R<around*|(|\<theta\>,\<zeta\>|)>,
      <frac|\<sigma\><rprime|'>|<mf|b><rsub|W<rsup|->><rsup|\<ast\>><around*|(|\<theta\>,\<zeta\>|)>>\<in\><around*|<left|(|1>|1+2r<rsub|\<sigma\>>,1+8r<rsub|\<sigma\>>|<right|)|1>>|}>,>>|<row|<cell|R<rsup|++><around*|(|\<theta\>,\<zeta\>|)><eqd><around*|{|<around*|(|\<theta\><rprime|'>,\<zeta\><rprime|'>,\<sigma\><rprime|'>|)>\<of\><around*|(|\<theta\><rprime|'>,\<zeta\><rprime|'>|)>\<in\>R<around*|(|\<theta\>,\<zeta\>|)>,
      <frac|\<sigma\><rprime|'>|<mf|b><rsub|W<rsup|->><rsup|\<ast\>><around*|(|\<theta\>,\<zeta\>|)>>\<in\><around*|<left|(|1>|1+4r<rsub|\<sigma\>>,1+6r<rsub|\<sigma\>>|<right|)|1>>|}>.>>>>>
    </equation*>

    Clearly <math|R<rsup|++><around*|(|\<theta\>,\<zeta\>|)>\<subset\>R<rsup|+><around*|(|\<theta\>,\<zeta\>|)>\<subset\>R<rsup|0><around*|(|\<theta\>,\<zeta\>|)>\<subset\>R<around*|(|\<theta\>,\<zeta\>|)>\<times\><R><rsub|+>>.
    From the bounds <eqref|eq:boundary-regularity-local> and in particular
    from the fact that <math|W<rsup|->\<in\><TT><rsub|\<Theta\>><rsup|\<cup\>>>
    so <math|<around*|\||\<partial\><rsub|\<zeta\>><mf|b><rsup|\<ast\>><rsub|W<rsup|->><around*|(|\<theta\>,\<zeta\>|)>|\|>\<leq\>1>
    we can see that <math|r<rsub|\<theta\>>,r<rsub|\<zeta\>>,r<rsub|\<sigma\>>>
    can be chosen small enough so that

    <\equation*>
      <ltae|<tformat|<table|<row|<cell|<around*|(|\<theta\><rprime|'>,\<zeta\><rprime|'>,<mf|b><rsub|W<rsup|->><rsup|\<ast\>><around*|(|\<theta\><rprime|'>,\<zeta\><rprime|'>|)>|)>\<subset\>R<rsup|0><around*|(|\<theta\>,\<zeta\>|)><space|2em>\<forall\><around*|(|\<theta\><rprime|'>,\<zeta\><rprime|'>|)>\<in\>R<around*|(|\<theta\>,\<zeta\>|)>,>>|<row|<cell|<around*|(|\<theta\><rprime|'>,\<zeta\><rprime|'>,\<sigma\><rprime|'>|)>,<around*|(|\<theta\><rprime|''>,\<zeta\><rprime|'>,\<sigma\><rprime|''>|)>\<in\>R<rsup|0><around*|(|\<theta\>,\<zeta\>|)>\<Longrightarrow\><around*|\||\<theta\><rprime|'>-\<theta\>|\|>\<less\><wide|r|\<bar\>>,<around*|\||\<sigma\><rprime|'>/\<sigma\>-1|\|>\<less\><wide|r|\<bar\>>,>>|<row|<cell|R<rsup|++><around*|(|\<theta\>,\<zeta\>|)>\<subset\>R<rsup|+><around*|(|\<theta\>,\<zeta\>|)>\<subset\>\<pi\><rsub|T><rsup|-1><around*|(|<R><rsup|3><rsub|+>\<setminus\>W<rsup|->|)>.>>>>>
    </equation*>

    As a matter of fact for fixed <math|r<rsub|\<theta\>>\<gtr\>0> and
    <math|r<rsub|\<zeta\>>\<gtr\>0> it holds that for any
    <math|<around*|(|\<theta\><rprime|'>,\<zeta\><rprime|'>|)>\<in\>R<around*|(|\<theta\>,\<zeta\>|)>>
    one has\ 

    <\equation*>
      <mf|b><rsub|W<rsup|->><rsup|\<ast\>><around*|(|\<theta\>,\<zeta\>|)><around*|(|e<rsup|-C
      r<rsub|\<theta\>>>-r<rsub|\<zeta\>>|)>\<less\><mf|b><rsub|W<rsup|->><rsup|\<ast\>><around*|(|\<theta\><rprime|'>,\<zeta\><rprime|'>|)>\<less\><mf|b><rsub|W<rsup|->><rsup|\<ast\>><around*|(|\<theta\>,\<zeta\>|)><around*|(|e<rsup|C
      r<rsub|\<theta\>>>+r<rsub|\<zeta\>>|)>
    </equation*>

    where <math|C=<frac|1|<dist><around*|(|\<Theta\><rsup|in>,<R>\<setminus\>\<Theta\>|)>-r<rsub|\<theta\>>>\<lesssim\>1>.
    \ Thus, choosing <math|10r<rsub|t>\<less\><around*|<left|\||1>|<around*|(|e<rsup|C
    r<rsub|\<theta\>>>+r<rsub|\<zeta\>>|)>-1|<right|\||1>>+<around*|<left|\||1>|<around*|(|e<rsup|-C
    r<rsub|\<theta\>>>-r<rsub|\<zeta\>>|)>-1|<right|\||1>>><math|> provides
    us with the first claim. The other claims can be satisfied analogously.
    It holds that\ 

    <\equation>
      <ltae|<tformat|<cwith|1|1|1|1|cell-halign|l>|<table|<row|<cell|<big|int><rsub|R<around*|(|\<theta\>,\<zeta\>|)>><around*|<left|\||2>|<1><rsub|E<rsup|\<ast\>>><rsub|>F<rsup|\<ast\>><around*|<left|(|1>|\<theta\><rprime|'>,\<zeta\><rprime|'>,<mf|b><rsub|W<rsup|->><rsup|\<ast\>><around*|(|\<theta\><rprime|'>,\<zeta\><rprime|'>|)>|<right|)|1>><around*|[|\<phi\>|]>|<right|\||2>><rsup|u><dd>\<zeta\><rprime|'><dd>\<theta\><rprime|'>>>|<row|<cell|<space|1em>\<lesssim\><ltae|<tformat|<cwith|1|1|1|1|cell-halign|l>|<table|<row|<cell|<big|int><rsub|R<rsup|+><around*|(|\<theta\>,\<zeta\>|)>><around*|<left|\||2>|<1><rsub|E<rsup|\<ast\>>><rsub|>F<rsup|\<ast\>><around*|<left|(|1>|\<theta\><rprime|'>,\<zeta\><rprime|'>,\<sigma\><rprime|'>|<right|)|1>><around*|[|\<phi\><rsub|<around*|(|\<theta\><rprime|''>,\<sigma\><rprime|'>,\<theta\><rprime|'>,<mf|b><rsub|W<rsup|->><rsup|\<ast\>><around*|(|\<theta\><rprime|'>,\<zeta\><rprime|'>|)>|)>>|]>|<right|\||2>><rsup|u>>>|<row|<cell|<space|1em>\<times\><around*|<left|(|2>|<1><rsub|L<rsub|<around*|(|\<theta\>,\<zeta\>|)>>><around*|(|\<zeta\><rprime|'>|)>+\<sigma\><rprime|'>\<delta\><around*|(|\<sigma\><rprime|'>-<mf|b><rsub|-><rsup|\<ast\>><around*|(|\<theta\><rprime|''>,\<zeta\><rprime|'>|)>|)>+\<sigma\><rprime|'>\<delta\><around*|(|\<sigma\><rprime|'>-<mf|b><rsub|+><rsup|\<ast\>><around*|(|\<theta\><rprime|'>,\<zeta\><rprime|'>|)>|)>|<right|)|2>><dd>\<zeta\><rprime|'><dd>\<theta\><rprime|'><frac|<dd>\<sigma\><rprime|'>|\<sigma\><rprime|'>>>>>>>>>>>><label|eq:defect-stopped-bound>

      \;
    </equation>

    where

    <\equation*>
      L<rsub|<around*|(|\<theta\>,\<zeta\>|)>>=<big|cap><rsub|\<theta\><rprime|'>><around*|<left|{|2>|\<zeta\><rprime|'>\<in\>B<rsub|1>:<text|><around*|(|\<theta\><rprime|'>,\<zeta\><rprime|'>|)>\<times\><around*|{|<mf|b><rsub|-><rsup|\<ast\>><around*|(|\<theta\><rprime|'>,\<zeta\><rprime|'>|)>,<mf|b><rsub|+><rsup|\<ast\>><around*|(|\<theta\><rprime|'>,\<zeta\><rprime|'>|)>|}>\<cap\>R<rsup|++><around*|(|\<theta\>,\<zeta\>|)>=\<emptyset\>
      |<right|}|2>>
    </equation*>

    with the intersection taken over all <math|\<theta\><rprime|'>> with
    <math|<around*|(|\<theta\><rprime|'>,\<zeta\><rprime|'>|)>\<in\>R<around*|(|\<theta\>,\<zeta\>|)>>.
    The bound follows because for every fixed <math|\<zeta\><rprime|'>>
    either <math|<1><rsub|L<rsub|<around*|(|\<theta\>,\<zeta\>|)>>><around*|(|\<zeta\><rprime|'>|)>\<neq\>0>
    and thus\ 

    <\equation*>
      <ltae|<tformat|<cwith|2|2|1|1|cell-halign|l>|<table|<row|<cell|<1><rsub|R<around*|(|\<theta\>,\<zeta\>|)>><around*|(|\<theta\><rprime|'>,\<zeta\><rprime|'>|)><around*|<left|\||2>|<1><rsub|E<rsup|\<ast\>>><rsub|>F<rsup|\<ast\>><around*|<left|(|1>|\<theta\><rprime|'>,\<zeta\><rprime|'>,<mf|b><rsub|W<rsup|->><rsup|\<ast\>><around*|(|\<theta\><rprime|'>,\<zeta\><rprime|'>|)>|<right|)|1>><around*|[|\<phi\>|]>|<right|\||2>><rsup|u>>>|<row|<cell|<space|1em>\<lesssim\><around*|<left|\||2>|<1><rsub|E<rsup|\<ast\>>><rsub|>F<rsup|\<ast\>><around*|<left|(|1>|\<theta\><rprime|'>,\<zeta\><rprime|'>,\<sigma\><rprime|'>|<right|)|1>><around*|[|\<phi\><rsub|<around*|(|\<theta\><rprime|'>,\<sigma\><rprime|'>,\<theta\><rprime|'>,<mf|b><rsub|W<rsup|->><rsup|\<ast\>><around*|(|\<theta\><rprime|'>,\<zeta\><rprime|'>|)>|)>>|]>|<right|\||2>><rsup|u>>>>>>
    </equation*>

    for every <math|\<theta\><rprime|'>> with
    <math|<around*|(|\<theta\><rprime|'>,\<zeta\><rprime|'>|)>\<in\>R<around*|(|\<theta\>,\<zeta\>|)>>.
    Otherwise, if <math|<1><rsub|L<rsub|<around*|(|\<theta\>,\<zeta\>|)>>><around*|(|\<zeta\><rprime|'>|)>=0>
    then there exist <math|<wide|\<theta\>|\<bar\>>> with
    <math|<around*|(|<wide|\<theta\>|\<bar\>>,\<zeta\><rprime|'>|)>\<in\>R<around*|(|\<theta\>,\<zeta\>|)>>
    such that either <math|<around*|(|<wide|\<theta\>|\<bar\>>,\<zeta\><rprime|'>,<mf|b><rsub|-><rsup|\<ast\>><around*|(|<wide|\<theta\>|\<bar\>>,\<zeta\><rprime|'>|)>|)>\<in\>R<rsup|++><around*|(|\<theta\>,\<zeta\>|)>\<neq\>\<emptyset\>>
    or <math|<around*|(|<wide|\<theta\>|\<bar\>>,\<zeta\><rprime|'>,<mf|b><rsub|+><rsup|\<ast\>><around*|(|<wide|\<theta\>|\<bar\>>,\<zeta\><rprime|'>|)>|)>\<in\>R<rsup|++><around*|(|\<theta\>,\<zeta\>|)>\<neq\>\<emptyset\>>.
    In the former case, there exists an absolute
    <math|<wide|r|\<bar\>>\<gtr\>0> depending on
    <math|r<rsub|\<theta\>>,r<rsub|\<zeta\>>,r<rsub|\<sigma\>>\<gtr\>0> such
    that <math|<around*|(|\<theta\><rprime|''>,\<zeta\><rprime|'>,<mf|b><rsub|-><rsup|\<ast\>><around*|(|\<theta\><rprime|'>,\<zeta\><rprime|'>|)>|)>\<in\>R<rsup|+><around*|(|\<theta\>,\<zeta\>|)>>
    for all <math|<around*|\||\<theta\><rprime|''>-\<theta\>|\|>\<less\><wide|r|\<bar\>>>.
    Similarly, <math|<around*|(|\<theta\><rprime|''>,\<zeta\><rprime|'>,<mf|b><rsub|+><rsup|\<ast\>><around*|(|\<theta\><rprime|'>,\<zeta\><rprime|'>|)>|)>\<in\>R<rsup|+><around*|(|\<theta\>,\<zeta\>|)>>
    in the case <math|<around*|(|<wide|\<theta\>|\<bar\>>,\<zeta\><rprime|'>,<mf|b><rsub|+><rsup|\<ast\>><around*|(|<wide|\<theta\>|\<bar\>>,\<zeta\><rprime|'>|)>|)>\<in\>R<rsup|++><around*|(|\<theta\>,\<zeta\>|)>\<neq\>\<emptyset\>>.
    The claim then follows by integrating over <math|\<zeta\><rprime|'>> and
    <math|\<theta\><rprime|''>>.

    Our argument then proceeds as follows. We need to show that\ 

    <\equation>
      <RHS|<eqref|eq:defect-stopped-bound>>\<lesssim\><mf|b><rsub|W<rsup|->><rsup|\<ast\>><around*|(|\<theta\>,\<zeta\>|)><RHS|<eqref|eq:geometry-of-defects>><rsup|u><around*|\<\|\|\>|\<phi\>|\<\|\|\>><rsub|\<Phi\><rsup|N><rsub|<gr>>><label|eq:defect-stopped-bound-bound>
    </equation>

    Then we will show the following fact:

    <\equation>
      <big|int><rsub|\<Theta\><rsup|in><rsub|\<Gamma\>>\<times\>B<rsub|1>><frac|1|<mf|b><rsub|W<rsup|->><rsup|\<ast\>><around*|(|\<theta\>,\<zeta\>|)>><1><rsub|R<around*|(|\<theta\>,\<zeta\>|)>><around*|(|\<theta\><rprime|'>,\<zeta\><rprime|'>|)><dd>\<theta\><dd>\<zeta\>\<gtrsim\><1><rsub|\<Theta\><rsup|in>\<times\>B<rsub|1>><around*|(|\<theta\><rprime|'>,\<zeta\><rprime|'>|)>.<label|eq:defect-stopping-construction>
    </equation>

    From these two bounds we can conclude the proof: using
    <eqref|eq:defect-stopping-construction> we get that\ 

    <\equation*>
      <ltae|<tformat|<cwith|1|1|1|1|cell-halign|l>|<table|<row|<cell|<big|int><rsub|\<Theta\><rsup|in><rsub|\<Gamma\>>\<times\>B<rsub|1>><around*|<left|\||2>|<1><rsub|E<rsup|\<ast\>>><rsub|>F<rsup|\<ast\>><around*|<left|(|1>|\<theta\><rprime|'>,\<zeta\><rprime|'>,<mf|b><rsub|W<rsup|->><rsup|\<ast\>><around*|(|\<theta\><rprime|'>,\<zeta\><rprime|'>|)>|<right|)|1>><around*|[|\<phi\>|]>|<right|\||2>><rsup|u><dd>\<theta\><rprime|'><dd>\<zeta\><rprime|'>>>|<row|<cell|<space|1em>\<lesssim\><big|int><rsub|\<Theta\><rsup|in><rsub|\<Gamma\>>\<times\>B<rsub|1>><frac|1|<mf|b><rsub|W<rsup|->><rsup|\<ast\>><around*|(|\<theta\>,\<zeta\>|)>><around*|(|<big|int><rsub|R<around*|(|\<theta\>,\<zeta\>|)>><around*|<left|\||2>|<1><rsub|E<rsup|\<ast\>>><rsub|>F<rsup|\<ast\>><around*|<left|(|1>|\<theta\><rprime|'>,\<zeta\><rprime|'>,<mf|b><rsub|W<rsup|->><rsup|\<ast\>><around*|(|\<theta\><rprime|'>,\<zeta\><rprime|'>|)>|<right|)|1>><around*|[|\<phi\>|]>|<right|\||2>><rsup|u><dd>\<theta\><rprime|'><dd>\<zeta\><rprime|'>|)><dd>\<theta\><dd>\<zeta\>;>>>>>
    </equation*>

    using <eqref|eq:defect-stopped-bound-bound> we obtain that\ 

    <\equation*>
      <ltae|<tformat|<table|<row|<cell|<big|int><rsub|\<Theta\><rsup|in><rsub|\<Gamma\>>\<times\>B<rsub|1>><frac|1|<mf|b><rsub|W<rsup|->><rsup|\<ast\>><around*|(|\<theta\>,\<zeta\>|)>><around*|(|<big|int><rsub|R<around*|(|\<theta\>,\<zeta\>|)>><around*|<left|\||2>|<1><rsub|E<rsup|\<ast\>>><rsub|>F<rsup|\<ast\>><around*|<left|(|1>|\<theta\><rprime|'>,\<zeta\><rprime|'>,<mf|b><rsub|W<rsup|->><rsup|\<ast\>><around*|(|\<theta\><rprime|'>,\<zeta\><rprime|'>|)>|<right|)|1>><around*|[|\<phi\>|]>|<right|\||2>><rsup|u><dd>\<theta\><rprime|'><dd>\<zeta\><rprime|'>|)><dd>\<theta\><dd>\<zeta\>>>|<row|<cell|<space|1em>\<lesssim\><big|int><rsub|\<Theta\><rsup|in><rsub|\<Gamma\>>\<times\>B<rsub|1>><RHS|><eqref|eq:geometry-of-defects><rsup|u><around*|\<\|\|\>|\<phi\>|\<\|\|\>><rsub|\<Phi\><rsup|N><rsub|<gr>>><dd>\<theta\><dd>\<zeta\>,>>>>>
    </equation*>

    and this concludes the claim. Let us show that
    <eqref|eq:defect-stopping-construction> holds. For any fixed
    <math|<around*|(|<math|\<theta\><rprime|'>,\<zeta\><rprime|'>>|)>\<in\>\<Theta\><rsup|in><rsub|\<Gamma\>>\<times\>B<rsub|1>>
    and any <math|<around*|(|\<theta\><rprime|''>,\<zeta\><rprime|''>|)>\<in\>R<around*|(|\<theta\><rprime|'>,\<zeta\><rprime|'>|)>>
    it holds that <math|<mf|b><rsub|W<rsup|->><rsup|\<ast\>><around*|(|\<theta\><rprime|''>,\<zeta\><rprime|''>|)>\<gtr\><mf|b><rsub|W<rsup|->><rsup|\<ast\>><around*|(|\<theta\>,\<zeta\>|)><around*|(|1-10r<rsub|t>|)>.>
    It follows that if <math|<around*|\||\<theta\><rprime|''>-\<theta\><rprime|'>|\|>\<less\>r<rsub|\<theta\>>>
    and <math|<around*|\||\<zeta\><rprime|''>-\<zeta\><rprime|'>|\|>\<less\>r<rsub|\<zeta\>><around*|(|1-10r<rsub|t>|)><mf|b><rsub|W<rsup|->><rsup|\<ast\>><around*|(|\<theta\><rprime|'>,\<zeta\><rprime|'>|)>>
    then <math|<around*|(|\<theta\><rprime|'>,\<zeta\><rprime|'>|)>\<in\>R<around*|(|\<theta\><rprime|''>,\<zeta\><rprime|''>|)>>.
    It follows that\ 

    <\equation*>
      <big|int><rsub|\<Theta\><rsup|in><rsub|\<Gamma\>>\<times\>B<rsub|1>><1><rsub|R<around*|(|\<theta\><rprime|''>,\<zeta\><rprime|''>|)>><around*|(|\<theta\><rprime|'>,\<zeta\><rprime|'>|)><dd>\<theta\><rprime|''><dd>\<zeta\><rprime|''>\<gtrsim\><mf|b><rsub|W<rsup|->><rsup|\<ast\>><around*|(|\<theta\><rprime|'>,\<zeta\><rprime|'>|)>
    </equation*>

    with an absolute constant depending on
    <math|r<rsub|\<theta\>>,r<rsub|\<zeta\>>,r<rsub|\<sigma\>>> and
    <math|r<rprime|''>>, as required.\ 

    It remains to show that <eqref|eq:defect-stopped-bound-bound> holds. Note
    that <math|\<pi\><rsub|T><around*|(|R<rsup|+><around*|(|\<theta\>,\<zeta\>|)>\<cap\><mT><rsub|\<Theta\><rsup|in><rsub|\<Gamma\>>>|)>\<subset\>\<pi\><rsub|T<rprime|'>><around*|(|<mT><rsub|\<Theta\><rsup|in><rsub|\<Gamma\>>>|)>>
    with <math|T<rprime|'>=T<rsub|\<Theta\>><around*|<left|(|1>|\<xi\><rsub|T>,x<rsub|T>+\<zeta\>,2<mf|b><rsub|W<rsup|->><rsup|\<ast\>><around*|(|\<theta\>,\<zeta\>|)>|<right|)|1>>>.
    As a matter of fact, <math|<around*|(|\<theta\><rprime|'>,\<zeta\><rprime|'>,\<sigma\><rprime|'>|)>\<in\>R<rsup|+><around*|(|\<theta\>,\<zeta\>|)>\<cap\><mT><rsub|\<Theta\><rsup|in>>>
    only if <math|\<theta\><rprime|'>\<in\>\<Theta\><rsup|in><rsub|\<Gamma\>>>,
    <math|<around*|\||\<zeta\><rprime|'>-\<zeta\>|\|>\<less\>r<rsub|\<zeta\>><mf|b><rsub|W<rsup|->><rsup|\<ast\>><around*|(|\<theta\>,\<zeta\>|)><rsub|>>,
    and <math|\<sigma\><rprime|'>\<less\><around*|(|1+8r<rsub|t>|)><mf|b><rsub|W<rsup|->><rsup|\<ast\>><around*|(|\<theta\>,\<zeta\>|)>>.
    In particular, this means that if <math|<around*|(|\<eta\><rprime|'>,y<rprime|'>,t<rprime|'>|)>=\<pi\><rsub|T><around*|(|\<theta\><rprime|'>,\<zeta\><rprime|'>,\<sigma\><rprime|'>|)>>
    then\ 

    <\equation*>
      <ltae|<tformat|<table|<row|<cell|t<rprime|'>\<less\><around*|(|1+8r<rsub|t>|)><mf|b><rsub|W<rsup|->><rsup|\<ast\>><around*|(|\<theta\>,\<zeta\>|)>,>>|<row|<cell|<around*|\||y<rprime|'>-<around*|(|x<rsub|T>+\<zeta\>|)>|\|>\<less\>r<rsub|\<zeta\>><mf|b><rsub|W<rsup|->><rsup|\<ast\>><around*|(|\<theta\>,\<zeta\>|)>,>>|<row|<cell|t<rprime|'><around*|(|\<eta\><rprime|'>-\<xi\><rsub|T>|)>\<in\>\<Theta\><rsup|in><rsub|\<Gamma\>>,>>>>>
    </equation*>

    that shows the claimed inclusion. Applying
    <smart-ref|lem:wave-packet-decomposition> to
    <math|\<phi\><rsub|<around*|(|\<theta\><rprime|'>,\<sigma\><rprime|'>,\<theta\><rprime|'>,<mf|b><rsub|W<rsup|->><rsup|\<ast\>><around*|(|\<theta\><rprime|'>,\<zeta\><rprime|'>|)>|)>>>
    we get that\ 

    <\equation*>
      \<phi\><rsub|<around*|(|\<theta\><rprime|'>,\<sigma\><rprime|'>,\<theta\><rprime|'>,<mf|b><rsub|W<rsup|->><rsup|\<ast\>><around*|(|\<theta\><rprime|'>,\<zeta\><rprime|'>|)>|)>>=<big|sum><rsub|k>a<rsub|k><around*|<left|(|1>|\<theta\><rprime|'>,\<sigma\><rprime|'>,\<theta\><rprime|'>,<mf|b><rsub|W<rsup|->><rsup|\<ast\>><around*|(|\<theta\><rprime|'>,\<zeta\><rprime|'>|)>|<right|)|1>><wide|\<phi\><rsub|k>|~>
    </equation*>

    with <math|<around*|\<\|\|\>|<wide|\<phi\><rsub|k>|~>|\<\|\|\>><rsub|\<Phi\><rsup|N-2><rsub|4<gr>>>\<lesssim\>1>
    and <math|<around*|<left|\||1>|a<rsub|k><around*|<left|(|1>|\<theta\><rprime|'>,\<sigma\><rprime|'>,\<theta\><rprime|'>,<mf|b><rsub|W<rsup|->><rsup|\<ast\>><around*|(|\<theta\><rprime|'>,\<zeta\><rprime|'>|)>|<right|)|1>>|<right|\||1>>\<lesssim\><around*|\<langle\>|k|\<rangle\>><rsup|-2><around*|\<\|\|\>|\<phi\>|\<\|\|\>><rsub|\<Phi\><rsup|N><rsub|<gr>>>>
    so

    <\equation*>
      <ltae|<tformat|<cwith|1|1|1|1|cell-halign|l>|<table|<row|<cell|<ltae|<tformat|<cwith|1|1|1|1|cell-halign|l>|<table|<row|<cell|<big|int><rsub|R<rsup|+><around*|(|\<theta\>,\<zeta\>|)>><around*|<left|\||2>|<1><rsub|E<rsup|\<ast\>>><rsub|>F<rsup|\<ast\>><around*|<left|(|1>|\<theta\><rprime|'>,\<zeta\><rprime|'>,\<sigma\><rprime|'>|<right|)|1>><around*|[|\<phi\><rsub|<around*|(|\<theta\><rprime|'>,\<sigma\><rprime|'>,\<theta\><rprime|'>,<mf|b><rsub|W<rsup|->><rsup|\<ast\>><around*|(|\<theta\><rprime|'>,\<zeta\><rprime|'>|)>|)>>|]>|<right|\||2>><rsup|u>>>|<row|<cell|<space|1em>\<times\><around*|<left|(|2>|<1><rsub|L<rsub|<around*|(|\<theta\>,\<zeta\>|)>>><around*|(|\<zeta\><rprime|'>|)>+\<sigma\><rprime|'>\<delta\><around*|(|\<sigma\><rprime|'>-<mf|b><rsub|-><rsup|\<ast\>><around*|(|\<theta\><rprime|'>,\<zeta\><rprime|'>|)>|)>+\<sigma\><rprime|'>\<delta\><around*|(|\<sigma\><rprime|'>-<mf|b><rsub|+><rsup|\<ast\>><around*|(|\<theta\><rprime|'>,\<zeta\><rprime|'>|)>|)>|<right|)|2>><dd>\<zeta\><rprime|'><dd>\<theta\><rprime|'><frac|<dd>\<sigma\><rprime|'>|\<sigma\><rprime|'>>>>>>>>>|<row|<cell|<space|1em>\<lesssim\><around*|\<\|\|\>|\<phi\>|\<\|\|\>><rsub|\<Phi\><rsup|N><rsub|<gr>>>
      sup<rsub|<wide|\<phi\>|~>><big|int><rsub|R<rsup|+><around*|(|\<theta\>,\<zeta\>|)>><ltae|<tformat|<cwith|1|1|1|1|cell-halign|l>|<table|<row|<cell|<around*|<left|\||2>|<1><rsub|E<rsup|\<ast\>>><rsub|>F<rsup|\<ast\>><around*|<left|(|1>|\<theta\><rprime|'>,\<zeta\><rprime|'>,\<sigma\><rprime|'>|<right|)|1>><around*|[|<wide|\<phi\>|~>|]>|<right|\||2>><rsup|u><around*|<left|(|3>|<1><rsub|L<rsub|<around*|(|\<theta\>,\<zeta\>|)>>><around*|(|\<zeta\><rprime|'>|)>+\<sigma\><rprime|'>\<delta\><around*|(|\<sigma\><rprime|'>-<mf|b><rsub|-><rsup|\<ast\>><around*|(|\<theta\><rprime|'>,\<zeta\><rprime|'>|)>|)>|<right|.>>>>|<row|<cell|<space|1em>\<times\><around*|<left|.>|+\<sigma\><rprime|'>\<delta\><around*|(|\<sigma\><rprime|'>-<mf|b><rsub|+><rsup|\<ast\>><around*|(|\<theta\><rprime|'>,\<zeta\><rprime|'>|)>|)>|<right|)|3>><dd>\<zeta\><rprime|'><dd>\<theta\><rprime|'><frac|<dd>\<sigma\><rprime|'>|\<sigma\><rprime|'>>.>>>>>>>>>>
    </equation*>

    where the upper bound is taken over <math|<wide|\<phi\>|~>\<in\>\<Phi\><rsup|\<infty\>><rsub|4<gr>>>
    with <math|<around*|\<\|\|\>|<wide|\<phi\>|~>|\<\|\|\>><rsub|\<Phi\><rsup|N-2><rsub|4<gr>>>\<lesssim\>1>.
    By <eqref|eq:boundary-singular-size-local> we obtain that\ 

    <\equation*>
      <ltae|<tformat|<cwith|2|2|1|1|cell-halign|l>|<cwith|1|1|1|1|cell-halign|l>|<cwith|3|3|1|1|cell-halign|l>|<table|<row|<cell|<around*|\<\|\|\>|\<phi\>|\<\|\|\>><rsub|\<Phi\><rsup|N><rsub|<gr>>>
      sup<rsub|<wide|\<phi\>|~>><big|int><rsub|R<rsup|+><around*|(|\<theta\>,\<zeta\>|)>><ltae|<tformat|<cwith|1|1|1|1|cell-halign|l>|<table|<row|<cell|<around*|<left|\||2>|<1><rsub|E<rsup|\<ast\>>><rsub|>F<rsup|\<ast\>><around*|<left|(|1>|\<theta\><rprime|'>,\<zeta\><rprime|'>,\<sigma\><rprime|'>|<right|)|1>><around*|[|<wide|\<phi\>|~>|]>|<right|\||2>><rsup|u>>>|<row|<cell|<space|1em>\<times\><around*|<left|(|2>|\<sigma\><rprime|'>\<delta\><around*|(|\<sigma\><rprime|'>-<mf|b><rsub|-><rsup|\<ast\>><around*|(|\<theta\><rprime|'>,\<zeta\><rprime|'>|)>|)>+\<sigma\><rprime|'>\<delta\><around*|(|\<sigma\><rprime|'>-<mf|b><rsub|+><rsup|\<ast\>><around*|(|\<theta\><rprime|'>,\<zeta\><rprime|'>|)>|)>|<right|)|2>><dd>\<zeta\><rprime|'><dd>\<theta\><rprime|'><frac|<dd>\<sigma\><rprime|'>|\<sigma\><rprime|'>>>>>>>>>|<row|<cell|<space|1em>\<lesssim\><ltae|<tformat|<table|<row|<cell|<around*|\<\|\|\>|\<phi\>|\<\|\|\>><rsub|\<Phi\><rsup|N><rsub|<gr>>>
      \<mu\><rsup|1><rsub|\<Theta\>><around*|(|T<rprime|'>|)>>>|<row|<cell|\<times\><ltae|<tformat|<table|<row|<cell|<around*|(|<around*|<left|\<\|\|\>|2>|<1><rsub|<wide|<around*|(|W<rsup|+>\<cap\>V<rsup|+>|)>|\<bar\>>\<setminus\><around*|(|W<rsup|->\<cup\>V<rsup|->|)>>F<rsub|\<Gamma\>><around*|(|\<eta\>,y,t|)>t\<delta\><around*|(|t-<mf|<mf|b><rsub|->><around*|(|\<eta\>,y|)>|)>|<right|\<\|\|\>|2>><rsub|<SL><rsup|<around*|(|u,1|)>><rsub|<around*|(|\<Theta\>,\<Theta\><rsup|in>|)>><around*|(|T<rprime|'>|)>>|\<nobracket\>>>>|<row|<cell|<space|1em>+<around*|\<nobracket\>|<around*|<left|\<\|\|\>|2>|<1><rsub|<wide|<around*|(|W<rsup|+>\<cap\>V<rsup|+>|)>|\<bar\>>\<setminus\><around*|(|W<rsup|->\<cup\>V<rsup|->|)>>F<rsub|\<Gamma\>><around*|(|\<eta\>,y,t|)>t\<delta\><around*|(|t-<mf|<mf|b><rsub|+>><around*|(|\<eta\>,y|)>|)>|<right|\<\|\|\>|2>><rsub|<SL><rsup|<around*|(|u,1|)>><rsub|<around*|(|\<Theta\>,\<Theta\><rsup|in>|)>><around*|(|T<rprime|'>|)>>|)>>>>>>>>>>>>>|<row|<cell|<space|1em>\<lesssim\><around*|\<\|\|\>|\<phi\>|\<\|\|\>><rsub|\<Phi\><rsup|N><rsub|<gr>>><RHS|><eqref|eq:geometry-of-defects><rsup|u>\<mu\><rsup|1><rsub|\<Theta\>><around*|(|T<rprime|'>|)>\<lesssim\><around*|\<\|\|\>|\<phi\>|\<\|\|\>><rsub|\<Phi\><rsup|N><rsub|<gr>>><mf|b><rsub|W<rsup|->><rsup|\<ast\>><around*|(|\<theta\>,\<zeta\>|)><RHS|><eqref|eq:geometry-of-defects><rsup|u>,>>>>>
    </equation*>

    as required. It remains to show the bound \ 

    <\equation*>
      <around*|(|<frac|1|<mf|b><rsub|W<rsup|->><rsup|\<ast\>><around*|(|\<theta\>,\<zeta\>|)>><big|int><rsub|R<rsup|+><around*|(|\<theta\>,\<zeta\>|)>><1><rsub|L<rsub|<around*|(|\<theta\>,\<zeta\>|)>>><around*|(|\<zeta\><rprime|'>|)><around*|<left|\||2>|<1><rsub|E<rsup|\<ast\>>><rsub|>F<rsup|\<ast\>><around*|<left|(|1>|\<theta\><rprime|'>,\<zeta\><rprime|'>,\<sigma\><rprime|'>|<right|)|1>><around*|[|<wide|\<phi\>|~>|]>|<right|\||2>><rsup|u><dd>\<zeta\><rprime|'><dd>\<theta\><rprime|'><frac|<dd>\<sigma\><rprime|'>|\<sigma\><rprime|'>>|)><rsup|<frac|1|u>>\<lesssim\><RHS|><eqref|eq:geometry-of-defects><rsup|>
    </equation*>

    for any fixed <math|><math|<wide|\<phi\>|~>\<in\>\<Phi\><rsup|\<infty\>><rsub|4<gr>>>
    with <math|<around*|\<\|\|\>|<wide|\<phi\>|~>|\<\|\|\>><rsub|\<Phi\><rsup|N-2><rsub|4<gr>>>\<leq\>1>.
    It holds that <math|\<pi\><rsub|T><around*|(|R<rsup|++><around*|(|\<theta\>,\<zeta\>|)>\<cap\><mT><rsub|\<Theta\><rsup|in><rsub|\<Gamma\>>>|)>\<subset\>\<pi\><rsub|T<rprime|''>><around*|(|<mT><rsub|\<Theta\><rsup|in><rsub|\<Gamma\>>>|)>>
    with <math|T<rprime|''>=T<rsub|\<Theta\>><around*|<left|(|1>|\<xi\><rsub|T>-<frac|1|2<mf|b><rsub|W<rsup|->><rsup|\<ast\>><around*|(|\<theta\>,\<zeta\>|)>>,x<rsub|T>+\<zeta\>,2<mf|b><rsub|W<rsup|->><rsup|\<ast\>><around*|(|\<theta\>,\<zeta\>|)>|<right|)|1>>>.
    As a matter of fact, <math|<around*|(|\<theta\><rprime|'>,\<zeta\><rprime|'>,\<sigma\><rprime|'>|)>\<in\>R<rsup|++><around*|(|\<theta\>,\<zeta\>|)>\<cap\><mT><rsub|\<Theta\><rsup|in><rsub|\<Gamma\>>>>
    only if <math|\<theta\><rprime|'>\<in\>\<Theta\><rsup|in><rsub|\<Gamma\>>>,
    <math|<around*|\||\<zeta\><rprime|'>-\<zeta\>|\|>\<less\>r<rsub|\<zeta\>><mf|b><rsub|W<rsup|->><rsup|\<ast\>><around*|(|\<theta\>,\<zeta\>|)><rsub|>>,
    and <math|<around*|(|1+4r<rsub|t>|)><mf|b><rsub|W<rsup|->><rsup|\<ast\>><around*|(|\<theta\>,\<zeta\>|)>\<less\>\<sigma\><rprime|'>\<less\><around*|(|1+6r<rsub|t>|)><mf|b><rsub|W<rsup|->><rsup|\<ast\>><around*|(|\<theta\>,\<zeta\>|)>>.
    In particular, this means that if <math|<around*|(|\<eta\><rprime|'>,y<rprime|'>,t<rprime|'>|)>=\<pi\><rsub|T><around*|(|\<theta\><rprime|'>,\<zeta\><rprime|'>,\<sigma\><rprime|'>|)>>
    then\ 

    <\equation*>
      <ltae|<tformat|<table|<row|<cell|<around*|(|1+4r<rsub|t>|)><mf|b><rsub|W<rsup|->><rsup|\<ast\>><around*|(|\<theta\>,\<zeta\>|)>\<less\>t<rprime|'>\<less\><around*|(|1+6r<rsub|t>|)><mf|b><rsub|W<rsup|->><rsup|\<ast\>><around*|(|\<theta\>,\<zeta\>|)>,>>|<row|<cell|<around*|\||y<rprime|'>-<around*|(|x<rsub|T>+\<zeta\>|)>|\|>\<less\>r<rsub|\<zeta\>><mf|b><rsub|W<rsup|->><rsup|\<ast\>><around*|(|\<theta\>,\<zeta\>|)>,>>|<row|<cell|t<rprime|'><around*|(|\<eta\><rprime|'>-\<xi\><rsub|T>|)>\<in\>\<Theta\><rsup|in><rsub|\<Gamma\>>.>>>>>
    </equation*>

    But then\ 

    <\equation*>
      t<rprime|'><around*|<left|(|-1>|\<eta\><rprime|'>-<around*|<left|(|-2>|\<xi\><rsub|T>-<frac|1|2<mf|b><rsub|W<rsup|->><rsup|\<ast\>><around*|(|\<theta\>,\<zeta\>|)>>|<right|)|-2>>|<right|)|-1>>\<in\>\<Theta\><rsup|in><rsub|\<Gamma\>>+<around*|<left|(|-1>|<frac|1+4r<rsub|t>|2>,<frac|1+6r<rsub|t>|2>|<right|)|-1>>\<subset\>\<Theta\><rsup|ex><rsub|\<Gamma\>>,
    </equation*>

    as required. If <math|u\<leq\>2> this is sufficient to conclude: it holds
    that\ 

    <\equation*>
      <ltae|<tformat|<cwith|1|1|1|1|cell-halign|l>|<cwith|4|4|1|1|cell-halign|r>|<table|<row|<cell|<around*|(|<frac|1|<mf|b><rsub|W<rsup|->><rsup|\<ast\>><around*|(|\<theta\>,\<zeta\>|)>><big|int><rsub|R<rsup|+><around*|(|\<theta\>,\<zeta\>|)>><1><rsub|L<rsub|<around*|(|\<theta\>,\<zeta\>|)>>><around*|(|\<zeta\><rprime|'>|)><around*|<left|\||2>|<1><rsub|E<rsup|\<ast\>>><rsub|>F<rsup|\<ast\>><around*|<left|(|1>|\<theta\><rprime|'>,\<zeta\><rprime|'>,\<sigma\><rprime|'>|<right|)|1>><around*|[|<wide|\<phi\>|~>|]>|<right|\||2>><rsup|u><dd>\<zeta\><rprime|'><dd>\<theta\><rprime|'><frac|<dd>\<sigma\><rprime|'>|\<sigma\><rprime|'>>|)><rsup|<frac|1|u>>>>|<row|<cell|<space|2em>\<lesssim\><around*|\<\|\|\>|<1><rsub|<wide|<around*|(|W<rsup|+>\<cap\>V<rsup|+>|)>|\<bar\>>\<setminus\><around*|(|W<rsup|->\<cup\>V<rsup|->|)>><1><rsub|\<pi\><rsub|T><around*|<left|(|1>|R<rsup|+><around*|(|\<theta\>,\<zeta\>|)>|<right|)|1>>>F<rsub|\<Gamma\>>|\<\|\|\>><rsub|\<Gamma\><rsup|\<ast\>><rsup|><SL><rsup|<around*|(|u,u|)>><rsub|<around*|(|\<Theta\>,\<Theta\><rsup|ex>|)>>\<Phi\><rsub|4<gr>><rsup|N-2><around*|(|T<rprime|''>|)>><rsup|>>>|<row|<cell|<space|2em>\<lesssim\><around*|\<\|\|\>|<1><rsub|<wide|<around*|(|W<rsup|+>\<cap\>V<rsup|+>|)>|\<bar\>>\<setminus\><around*|(|W<rsup|->\<cup\>V<rsup|->|)>><1><rsub|\<pi\><rsub|T><around*|<left|(|1>|R<rsup|+><around*|(|\<theta\>,\<zeta\>|)>|<right|)|1>>>F<rsub|\<Gamma\>>|\<\|\|\>><rsub|\<Gamma\><rsup|\<ast\>><rsup|><SL><rsup|<around*|(|u,2|)>><rsub|<around*|(|\<Theta\>,\<Theta\><rsup|ex>|)>>\<Phi\><rsub|4<gr>><rsup|N-2><around*|(|T<rprime|''>|)>>>>|<row|<cell|\<times\><around*|\<\|\|\>|<1><rsub|<wide|<around*|(|W<rsup|+>\<cap\>V<rsup|+>|)>|\<bar\>>\<setminus\><around*|(|W<rsup|->\<cup\>V<rsup|->|)>><1><rsub|\<pi\><rsub|T><around*|<left|(|1>|R<rsup|+><around*|(|\<theta\>,\<zeta\>|)>|<right|)|1>>>|\<\|\|\>><rsub|\<Gamma\><rsup|\<ast\>><rsup|><SL><rsup|<around*|<left|(|-1>|\<infty\>,<frac|2u|2-u>|<right|)|-1>>><rsub|<around*|(|\<Theta\>,\<Theta\><rsup|ex>|)>><around*|(|T<rprime|''>|)>>>>>>>
    </equation*>

    and

    <\equation*>
      <ltae|<tformat|<cwith|2|2|1|1|cell-halign|r>|<cwith|1|1|1|1|cell-halign|l>|<table|<row|<cell|<around*|\<\|\|\>|<1><rsub|<wide|<around*|(|W<rsup|+>\<cap\>V<rsup|+>|)>|\<bar\>>\<setminus\><around*|(|W<rsup|->\<cup\>V<rsup|->|)>><1><rsub|\<pi\><rsub|T><around*|<left|(|1>|R<rsup|+><around*|(|\<theta\>,\<zeta\>|)>|<right|)|1>>>|\<\|\|\>><rsub|\<Gamma\><rsup|\<ast\>><rsup|><SL><rsup|<around*|<left|(|-1>|\<infty\>,<frac|2u|2-u>|<right|)|-1>>><rsub|<around*|(|\<Theta\>,\<Theta\><rsup|ex>|)>><around*|(|T<rprime|''>|)>><rsup|<frac|2u|2-u>>>>|<row|<cell|<space|2em>\<lesssim\>sup<rsub|\<theta\>\<in\>\<Theta\>>sup<rsub|\<zeta\>\<in\>B<rsub|1>><big|int><rsub|0><rsup|1><around*|<left|\||2>|<1><rsub|R<rsup|+><around*|(|\<theta\>,\<zeta\>|)>><around*|(|\<pi\><rsub|T><rsup|-1>\<pi\><rsub|T<rprime|''>><around*|(|\<theta\><rprime|'>,\<zeta\><rprime|'>,\<sigma\><rprime|'>|)>|)><rsub|>|<right|\||2>><rsup|<frac|2u|2-u>><frac|<dd>\<sigma\><rprime|'>|\<sigma\><rprime|'>>>>|<row|<cell|\<lesssim\>sup<rsub|\<theta\>\<in\>\<Theta\>>sup<rsub|\<zeta\>\<in\>B<rsub|1>><big|int><rsub|0><rsup|1><1><rsub|<around*|(|1+2r<rsub|\<sigma\>>|)>/2\<less\>\<sigma\><rprime|'>\<less\><around*|<left|(|1>|1+8r<rsub|\<sigma\>>|<right|)|1>>/2><frac|<dd>\<sigma\><rprime|'>|\<sigma\><rprime|'>>>>>>>
    </equation*>

    since <math|><math|<around*|(|\<theta\><rprime|''>,\<zeta\><rprime|''>,\<sigma\><rprime|''>|)>=\<pi\><rsub|T><rsup|-1>\<pi\><rsub|T<rprime|''>><around*|(|\<theta\><rprime|'>,\<zeta\><rprime|'>,\<sigma\><rprime|'>|)>>
    only if <math|><math|\<sigma\><rprime|''>=2<mf|b><rsub|W<rsup|->><rsup|\<ast\>><around*|(|\<theta\>,\<zeta\>|)>\<sigma\><rprime|'>>.
    If <math|u\<gtr\>2> we use that the integrand
    <math|<1><rsub|E<rsup|\<ast\>>><rsub|>F<rsup|\<ast\>><around*|<left|(|1>|\<theta\><rprime|'>,\<zeta\><rprime|'>,\<sigma\><rprime|'>|<right|)|1>><around*|[|<wide|\<phi\>|~>|]>>
    is almost constant over <math|R<rsup|+><around*|(|\<theta\>,\<zeta\>|)>>.
    As a matter of fact it holds that\ 

    <\equation*>
      <1><rsub|L<rsub|<around*|(|\<theta\>,\<zeta\>|)>>><around*|(|\<zeta\><rprime|'>|)><around*|<left|\||2>|<1><rsub|E<rsup|\<ast\>>><rsub|>F<rsup|\<ast\>><around*|<left|(|1>|\<theta\><rprime|'>,\<zeta\><rprime|'>,\<sigma\><rprime|'>|<right|)|1>><around*|[|\<phi\>|]>|<right|\||2>>=<1><rsub|L<rsub|<around*|(|\<theta\>,\<zeta\>|)>>><around*|(|\<zeta\><rprime|'>|)><around*|<left|\||1>|<1><rsub|E<rsup|\<ast\>>><rsub|>F<rsup|\<ast\>><around*|<left|(|1>|\<theta\><rprime|''>,\<zeta\><rprime|'>,\<sigma\><rprime|''>|<right|)|1>><around*|[|\<phi\><rsub|><rsub|<around*|(|\<theta\><rprime|''>,\<sigma\><rprime|''>,\<theta\><rprime|'>,\<sigma\><rprime|'>|)>>|]>|<right|\||1>>
    </equation*>

    \ <math|>as per <eqref|eq:wave-packet-move> for any
    <math|<around*|(|\<theta\><rprime|''>,\<zeta\><rprime|'>,\<sigma\><rprime|''>|)>\<in\>R<rsup|++><around*|(|\<theta\>,\<zeta\>|)>>.
    Applying <smart-ref|lem:wave-packet-decomposition> to
    <math|\<phi\><rsub|><rsub|<around*|(|\<theta\><rprime|''>,\<sigma\><rprime|''>,\<theta\><rprime|'>,\<sigma\><rprime|'>|)>>>

    <\equation*>
      <ltae|<tformat|<table|<row|<cell|<tabular*|<tformat|<cwith|1|1|1|1|cell-halign|l>|<table|<row|<cell|<1><rsub|L<rsub|<around*|(|\<theta\>,\<zeta\>|)>>><around*|(|\<zeta\><rprime|'>|)><around*|<left|\||2>|<1><rsub|E<rsup|\<ast\>>><rsub|>F<rsup|\<ast\>><around*|<left|(|1>|\<theta\><rprime|'>,\<zeta\><rprime|'>,\<sigma\><rprime|'>|<right|)|1>><around*|[|<wide|\<phi\>|~>|]>|<right|\||2>>>>|<row|<cell|<space|2em>=sup<rsub|<wide|<wide|\<phi\><rsub|>|~>|~>><around*|<left|(|-1>|<frac|<big|int><rsub|R<rsup|++><around*|(|\<theta\>,\<zeta\>|)>><1><rsub|L<rsub|<around*|(|\<theta\>,\<zeta\>|)>>><around*|(|\<zeta\><rprime|'>|)><around*|<left|\||2>|<1><rsub|E<rsup|\<ast\>>><rsub|>F<rsup|\<ast\>><around*|<left|(|1>|\<theta\><rprime|''>,\<zeta\><rprime|'>,\<sigma\><rprime|''>|<right|)|1>><around*|[|<wide|<wide|\<phi\><rsub|>|~>|~>|]>|<right|\||2>><rsup|2><frac|<dd>\<sigma\><rprime|''>|\<sigma\><rprime|''>><dd>\<theta\><rprime|'>|<big|int><rsub|R<rsup|++><around*|(|\<theta\>,\<zeta\>|)>><1><rsub|L<rsub|<around*|(|\<theta\>,\<zeta\>|)>>><around*|(|\<zeta\><rprime|'>|)><frac|<dd>\<sigma\><rprime|''>|\<sigma\><rprime|''>><dd>\<theta\><rprime|'>>|<right|)|-1>><rsup|<frac|1|2>>>>>>><rsup|>>>>>>
    </equation*>

    where the upper bound is taken over <math|<wide|<wide|\<phi\><rsub|>|~>|~>\<in\>\<Phi\><rsup|\<infty\>><rsub|16<gr>>>
    with <math|<around*|\<\|\|\>|<wide|\<phi\>|~>|\<\|\|\>><rsub|\<Phi\><rsup|N-4><rsub|16<gr>>>\<lesssim\>1>.
    Since\ 

    <\equation*>
      <big|int><rsub|R<rsup|++><around*|(|\<theta\>,\<zeta\>|)>><1><rsub|L<rsub|<around*|(|\<theta\>,\<zeta\>|)>>><around*|(|\<zeta\><rprime|'>|)><frac|<dd>\<sigma\><rprime|''>|\<sigma\><rprime|''>><dd>\<theta\><rprime|'>\<gtrsim\>1
    </equation*>

    we have that\ 

    <\equation*>
      <ltae|<tformat|<cwith|1|1|1|1|cell-halign|l>|<table|<row|<cell|<frac|1|<mf|b><rsub|W<rsup|->><rsup|\<ast\>><around*|(|\<theta\>,\<zeta\>|)>><big|int><rsub|R<rsup|+><around*|(|\<theta\>,\<zeta\>|)>><1><rsub|L<rsub|<around*|(|\<theta\>,\<zeta\>|)>>><around*|(|\<zeta\><rprime|'>|)><around*|<left|\||2>|<1><rsub|E<rsup|\<ast\>>><rsub|>F<rsup|\<ast\>><around*|<left|(|1>|\<theta\><rprime|'>,\<zeta\><rprime|'>,\<sigma\><rprime|'>|<right|)|1>><around*|[|<wide|\<phi\>|~>|]>|<right|\||2>><rsup|u><dd>\<zeta\><rprime|'><dd>\<theta\><rprime|'><frac|<dd>\<sigma\><rprime|'>|\<sigma\><rprime|'>>>>|<row|<cell|\<lesssim\>sup<rsub|<wide|<wide|\<phi\><rsub|>|~>|~>><big|int><rsub|B<rsub|1>><around*|(|<big|int><rsub|\<Theta\><rsup|in>\<times\><around*|[|0,1|]>><1><rsub|L<rsub|<around*|(|\<theta\>,\<zeta\>|)>>><around*|(|\<zeta\><rprime|'>|)><around*|<left|\||2>|<1><rsub|R<rsup|++><around*|(|\<theta\>,\<zeta\>|)>><1><rsub|E<rsup|\<ast\>>><rsub|>F<rsup|\<ast\>><around*|<left|(|1>|\<theta\><rprime|''>,\<zeta\><rprime|'>,\<sigma\><rprime|''>|<right|)|1>><around*|[|<wide|<wide|\<phi\><rsub|>|~>|~>|]>|<right|\||2>><rsup|2><frac|<dd>\<sigma\><rprime|''>|\<sigma\><rprime|''>><dd>\<theta\><rprime|'>|)><rsup|u/2><dd>\<zeta\><rprime|'>.>>>>>
    </equation*>

    Now, the same procedure as before allows us, using that <math|u\<geq\>2>
    to deduce that\ 

    <\equation*>
      <tabular|<tformat|<cwith|1|1|1|1|cell-halign|l>|<cwith|3|3|1|1|cell-halign|r>|<table|<row|<cell|<around*|(|<frac|1|<mf|b><rsub|W<rsup|->><rsup|\<ast\>><around*|(|\<theta\>,\<zeta\>|)>><big|int><rsub|R<rsup|+><around*|(|\<theta\>,\<zeta\>|)>><1><rsub|L<rsub|<around*|(|\<theta\>,\<zeta\>|)>>><around*|(|\<zeta\><rprime|'>|)><around*|<left|\||2>|<1><rsub|E<rsup|\<ast\>>><rsub|>F<rsup|\<ast\>><around*|<left|(|1>|\<theta\><rprime|'>,\<zeta\><rprime|'>,\<sigma\><rprime|'>|<right|)|1>><around*|[|<wide|\<phi\>|~>|]>|<right|\||2>><rsup|u><dd>\<zeta\><rprime|'><dd>\<theta\><rprime|'><frac|<dd>\<sigma\><rprime|'>|\<sigma\><rprime|'>>|)><rsup|<frac|1|u>>>>|<row|<cell|<space|2em>\<lesssim\><around*|\<\|\|\>|<1><rsub|<wide|<around*|(|W<rsup|+>\<cap\>V<rsup|+>|)>|\<bar\>>\<setminus\><around*|(|W<rsup|->\<cup\>V<rsup|->|)>><1><rsub|\<pi\><rsub|T><around*|<left|(|1>|R<rsup|+><around*|(|\<theta\>,\<zeta\>|)>|<right|)|1>>>F<rsub|\<Gamma\>>|\<\|\|\>><rsub|\<Gamma\><rsup|\<ast\>><rsup|><SL><rsup|<around*|(|u,2|)>><rsub|<around*|(|\<Theta\>,\<Theta\><rsup|ex>|)>>\<Phi\><rsub|4<gr>><rsup|N-2><around*|(|T<rprime|''>|)>>>>|<row|<cell|\<times\><around*|\<\|\|\>|<1><rsub|<wide|<around*|(|W<rsup|+>\<cap\>V<rsup|+>|)>|\<bar\>>\<setminus\><around*|(|W<rsup|->\<cup\>V<rsup|->|)>><1><rsub|\<pi\><rsub|T><around*|<left|(|1>|R<rsup|+><around*|(|\<theta\>,\<zeta\>|)>|<right|)|1>>>|\<\|\|\>><rsub|\<Gamma\><rsup|\<ast\>><rsup|><SL><rsup|<around*|<left|(|-1>|\<infty\>,\<infty\>|<right|)|-1>>><rsub|<around*|(|\<Theta\>,\<Theta\><rsup|ex>|)>><around*|(|T<rprime|''>|)>>>>|<row|<cell|<space|2em>\<lesssim\><around*|\<\|\|\>|<1><rsub|<wide|<around*|(|W<rsup|+>\<cap\>V<rsup|+>|)>|\<bar\>>\<setminus\><around*|(|W<rsup|->\<cup\>V<rsup|->|)>><1><rsub|\<pi\><rsub|T><around*|<left|(|1>|R<rsup|+><around*|(|\<theta\>,\<zeta\>|)>|<right|)|1>>>F<rsub|\<Gamma\>>|\<\|\|\>><rsub|\<Gamma\><rsup|\<ast\>><rsup|><SL><rsup|<around*|(|u,2|)>><rsub|<around*|(|\<Theta\>,\<Theta\><rsup|ex>|)>>\<Phi\><rsub|4<gr>><rsup|N-2><around*|(|T<rprime|''>|)>>.>>>>>
    </equation*>
  </proof>

  <\lemma>
    <label|lem:unif-lac-size-domination><dueto|Lacunary size domination>Given
    any sets <math|V<rsup|+>,V<rsup|->\<in\><DD><rsub|\<beta\><rsup|>><rsup|\<cup\>>>,
    and \ let <math|W<rsup|+>,W<rsup|->\<in\><TT><rsub|\<Theta\>><rsup|\<cup\>>>,
    the bounds

    <\equation>
      <ltae|<tformat|<cwith|1|1|1|1|cell-halign|l>|<table|<row|<cell|<around|<left|\<\|\|\>|1>|<1><rsub|<around*|(|V<rsup|+>\<cap\>W<rsup|+>|)>\<setminus\><around*|(|V<rsup|->\<cup\>W<rsup|->|)>><around*|(|<Emb><around*|[|f|]>\<circ\>\<Gamma\>|)>|<right|\<\|\|\>|1>><rsub|\<Gamma\><rsup|\<ast\>><rsup|><SL><rsup|<around*|(|u,2|)>><rsub|\<Theta\>><wpD><rsub|<gr>><rsup|N>><space|2em>>>|<row|<cell|<space|2em>\<lesssim\><tabular*|<tformat|<twith|table-valign|T>|<table|<row|<cell|<around|<left|\<\|\|\>|1>|<1><rsub|<around*|(|V<rsup|+>\<cap\>W<rsup|+>|)>\<setminus\><around*|(|V<rsup|->\<cup\>W<rsup|->|)>>
      <around*|(|<Emb><around*|[|f|]>\<circ\>\<Gamma\>|)>|<right|\<\|\|\>|1>><rsub|\<Gamma\><rsup|\<ast\>><rsup|><SL><rsup|<around|(|u,2|)>><rsub|<around|(|\<Theta\>,\<Theta\><rsup|ex>|)>>\<Phi\><rsub|16<gr>><rsup|N-10>>>>|<row|<cell|+<around|<left|\<\|\|\>|1>|<1><rsub|<around*|(|V<rsup|+>\<cap\>W<rsup|+>|)>\<setminus\><around*|(|V<rsup|->\<cup\>W<rsup|->|)>>
      <around*|(|<Emb><around*|[|f|]>\<circ\>\<Gamma\>|)>|<right|\<\|\|\>|1>><rsub|\<Gamma\><rsup|\<ast\>><rsup|><SL><rsup|<around*|(|u,1|)>><rsub|<around*|(|\<Theta\>,\<Theta\><rsup|in>|)>><dfct><rsup|N-10><rsub|16<gr>>>>>>>>>>>>><label|eq:unif-lac-size-domination>
    </equation>

    hold for all <math|f\<in\><Sch><around*|(|<R>|)>> as long as
    <math|u\<in\><around*|[|1,\<infty\>|]>>. The implicit constant is
    independent of <math|f> and of the sets
    <math|V<rsup|\<pm\>>,W<rsup|\<pm\>>>.
  </lemma>

  <\proof>
    Let us fix <math|T\<in\><TT><rsub|\<Theta\>>> and show that\ 

    <\equation*>
      <ltae|<tformat|<table|<row|<cell|<around|<left|\<\|\|\>|1>|<1><rsub|<around*|(|V<rsup|+>\<cap\>W<rsup|+>|)>\<setminus\><around*|(|V<rsup|->\<cup\>W<rsup|->|)>><around*|(|<Emb><around*|[|f|]>\<circ\>\<Gamma\>|)>|<right|\<\|\|\>|1>><rsub|\<Gamma\><rsup|\<ast\>><rsup|><SL><rsup|<around*|(|u,2|)>><rsub|\<Theta\>><wpD><rsub|<gr>><rsup|N><around*|(|T|)>>\<lesssim\><RHS|<eqref|eq:unif-lac-size-domination>>.>>>>>
    </equation*>

    By symmetry, (see <eqref|eq:size-symmetry> and the subsequent
    discussion), we can assume that <math|T=T<rsub|\<Theta\>><rsub|><around*|(|0,0,1|)>>
    so that

    <\equation*>
      \<Gamma\>\<circ\>\<pi\><rsub|T><around*|(|\<theta\>,\<zeta\>,\<sigma\>|)>=<around*|(|\<alpha\>\<beta\><around*|(|\<theta\>+\<gamma\>|)><around*|(|\<beta\>\<sigma\>|)><rsup|-1>,\<zeta\>,\<beta\>\<sigma\>|)>=<around*|<left|(|1>|\<theta\><rsub|\<Gamma\>><around*|(|\<beta\>\<sigma\>|)><rsup|-1>,\<zeta\>,\<beta\>\<sigma\>|<right|)|1>>=\<pi\><rsub|T><around*|(|\<theta\><rsub|\<Gamma\>>,\<zeta\>,\<beta\>\<sigma\>|)>.
    </equation*>

    For the sake of this proof, let us suppose that
    <math|\<alpha\>\<beta\>\<gtr\>0> and <math|\<gamma\>\<less\>0>. Any other
    combination of signs can be dealt with, mutatis mutandis, following the
    same argument. We use the shorthand <math|E<rsub|+><rsup|\<ast\>>\<assign\>\<pi\><rsub|T><rsup|-1><around|(|V<rsup|+>\<cap\>W<rsup|+>\<cap\>T|)>>,
    <math|E<rsub|-><rsup|\<ast\>>\<assign\>\<pi\><rsub|T><rsup|-1><around|(|V<rsup|->\<cup\>W<rsup|->|)>>,
    and <math|F<rsup|\<ast\>><eqd><1><rsub|E<rsub|+><rsup|\<ast\>>\<setminus\>E<rsub|-><rsup|\<ast\>>><Emb|><around*|[|f|]>\<circ\>\<Gamma\>\<circ\>\<pi\><rsub|T>>.
    From <smart-ref|def:lacunary-size> we have that\ 

    <\equation*>
      <ltae|<tformat|<cwith|2|2|1|1|cell-halign|c>|<table|<row|<cell|<around|<left|\<\|\|\>|1>|<1><rsub|<around*|(|V<rsup|+>\<cap\>W<rsup|+>|)>\<setminus\><around*|(|V<rsup|->\<cup\>W<rsup|->|)>><around*|(|<Emb><around*|[|f|]>\<circ\>\<Gamma\>|)>|<right|\<\|\|\>|1>><rsub|\<Gamma\><rsup|\<ast\>><rsup|><SL><rsup|<around*|(|u,2|)>><rsub|\<Theta\>><wpD><rsub|<gr>><rsup|N><around*|(|T|)>>=sup<rsub|\<phi\>><around*|\<\|\|\>|F<rsup|\<ast\>><around*|(|\<theta\>,\<zeta\>,\<sigma\>|)><around*|[|\<phi\><rsub|\<theta\>>|]>|\<\|\|\>><rsub|L<rsup|u><rsub|<frac|\<mathd\>\<theta\>\<mathd\>\<zeta\>|<around*|\||\<Theta\>|\|>>*>L<rsup|2><rsub|<frac|\<mathd\>\<sigma\>|\<sigma\>>>>>>|<row|<cell|\<phi\><rsub|\<theta\>><around*|(|z|)><eqd><around*|(|-d<rsub|z>+2
      \<pi\> i\<theta\><rsub|\<Gamma\>>|)>\<phi\><around*|(|z|)>>>>>>
    </equation*>

    with the upper bound taken over <math|\<phi\>\<in\>\<Phi\><rsup|\<infty\>><rsub|<gr>>>
    with <math|<around*|\<\|\|\>|\<phi\>|\<\|\|\>><rsub|\<Phi\><rsup|N><rsub|<gr>>>\<leq\>1>.
    First we address the case <math|\<theta\>\<in\>\<Theta\><rsup|ex><rsub|\<Gamma\>>>
    i.e. <math|\<theta\><rsub|\<Gamma\>>\<notin\>\<Theta\><rsup|in>>. Since

    <\equation*>
      <ltae|<tformat|<table|<row|<cell|<wpD><rsub|\<zeta\>><around*|(|\<theta\><rsub|\<Gamma\>>|)>F<rsup|\<ast\>><around*|(|\<theta\>,\<zeta\>,\<sigma\>|)><around*|[|\<phi\>|]>=F<rsup|\<ast\>><around*|(|\<theta\>,\<zeta\>,\<sigma\>|)><around*|[|\<phi\><rsub|\<theta\>>|]>>>>>>
    </equation*>

    and \ <math|<around*|<left|\<\|\|\>|1>|-d<rsub|z>\<phi\>|<right|\<\|\|\>|1>><rsub|\<Phi\><rsub|<gr>><rsup|N>>+<around*|\<\|\|\>|2
    \<pi\> i\<theta\><rsub|\<Gamma\>>\<phi\>|\<\|\|\>><rsub|\<Phi\><rsub|<gr>><rsup|N>>\<lesssim\><around*|\<\|\|\>|\<phi\>|\<\|\|\>><rsub|\<Phi\><rsub|<gr>><rsup|N>>>
    it follows immediately that

    <\equation*>
      <ltae|<tformat|<cwith|1|1|1|1|cell-halign|l>|<table|<row|<cell|sup<rsub|\<phi\>>
      <big|int><rsub|<R><rsup|2>><around*|(|<big|int><rsub|<R><rsub|+>><1><rsub|<mT><rsub|\<Theta\><rsub|\<Gamma\>><rsup|ex>>><1><rsub|E<rsub|+><rsup|\<ast\>>\<setminus\>E<rsub|-><rsup|\<ast\>>><around*|<left|\||2>|<wpD><rsub|\<zeta\>><around*|(|\<theta\><rsub|\<Gamma\>>|)>F<rsup|\<ast\>><around|(|\<theta\>,\<zeta\>,\<sigma\>|)><around|[|\<phi\>|]>|<right|\||2>><rsup|2><space|0.17em><frac|<dd>\<sigma\>|\<sigma\>>|)><rsup|<frac|u|2>><space|0.17em><frac|<dd>\<zeta\><dd>\<theta\>|<around*|\||\<Theta\>|\|>>>>|<row|<cell|<space|2em><tabular*|<tformat|<cwith|2|2|1|1|cell-halign|l>|<table|<row|<cell|\<lesssim\>sup<rsub|\<phi\>>
      <big|int><rsub|<R><rsup|2>><around*|(|<big|int><rsub|<R><rsub|+>><1><rsub|<mT><rsub|\<Theta\><rsub|\<Gamma\>><rsup|ex>>><1><rsub|E<rsub|+><rsup|\<ast\>>\<setminus\>E<rsub|-><rsup|\<ast\>>><around*|<left|\||2>|F<rsup|\<ast\>><around|(|\<theta\>,\<zeta\>,\<sigma\>|)><around|[|\<phi\>|]>|<right|\||2>><rsup|2><space|0.17em><frac|<dd>\<sigma\>|\<sigma\>>|)><rsup|<frac|u|2>><space|0.17em><frac|<dd>\<zeta\><dd>\<theta\>|<around*|\||\<Theta\>|\|>>>>|<row|<cell|\<lesssim\><around|\<\|\|\>|<1><rsub|<around*|(|V<rsup|+>\<cap\>W<rsup|+>|)>\<setminus\><around*|(|V<rsup|->\<cup\>W<rsup|->|)>><around*|(|<Emb><around*|[|f|]>\<circ\>\<Gamma\>|)>|\<\|\|\>><rsup|u><rsub|\<Gamma\><rsup|\<ast\>><rsup|><SL><rsup|<around|(|u,2|)>><rsub|<around|(|\<Theta\>,\<Theta\><rsup|ex>|)>>\<Phi\><rsub|<gr>><rsup|N>>.>>>>>>>>>>
    </equation*>

    The rest of the proof is dedicated to dealing with the case
    <math|\<theta\>\<in\>\<Theta\><rsup|in><rsub|\<Gamma\>>>. Note that
    <math|<FT|\<phi\><rsub|\<theta\>>>> vanishes at
    <math|-\<theta\><rsub|\<Gamma\>>> while for any
    <math|\<theta\>\<notin\>\<Theta\><rsup|in><rsub|\<Gamma\>>>,
    <math|<FT|\<phi\>>> vanishes on a large neighborhood of
    <math|-\<theta\><rsub|\<Gamma\>>> simply because
    <math|<around*|\||\<theta\><rsub|\<Gamma\>>|\|>\<gtr\><gr>> and
    <math|<spt><FT|\<phi\>>\<subset\>B<rsub|<gr>>>. This brings us to compare
    <math|F<rsup|\<ast\>><around*|(|\<theta\>,\<zeta\>,\<sigma\>|)><around*|[|\<phi\><rsub|\<theta\>>|]>>
    or <math|\<theta\>\<in\>\<Theta\><rsup|in><rsub|\<Gamma\>>> with
    <math|F<rsup|\<ast\>><around*|(|\<theta\><rprime|'>,\<zeta\>,\<sigma\>|)><around*|[|\<phi\><rprime|'><rsub|\<theta\><rprime|'>>|]>>
    for <math|\<theta\><rprime|'>\<in\>\<Theta\><rsup|ex><rsub|\<Gamma\>>>
    and for an appropriate <math|\<phi\><rprime|'><rsub|\<theta\>>\<in\>\<Phi\><rsup|\<infty\>><rsub|16<gr>>>,
    and to expect to be able to bound <math|<LHS|<eqref|eq:unif-lac-size-domination>>>
    by the first addend on <RHS|<eqref|eq:unif-lac-size-domination>>. In
    practice, we also need to control some remainder terms by the boundary
    integral

    <\equation*>
      <around|<left|\<\|\|\>|1>|<1><rsub|<around*|(|V<rsup|+>\<cap\>W<rsup|+>|)>\<setminus\><around*|(|V<rsup|->\<cup\>W<rsup|->|)>>
      <around*|(|<Emb><around*|[|f|]>\<circ\>\<Gamma\>|)>|<right|\<\|\|\>|1>><rsub|\<Gamma\><rsup|\<ast\>><rsup|><SL><rsup|<around*|(|u,1|)>><rsub|<around*|(|\<Theta\>,\<Theta\><rsup|in>|)>><dfct><rsup|N-10><rsub|16<gr>>>.
    </equation*>

    This proof goes along the lines of <cite-detail|amentaBilinearHilbertTransform2020|Lemma
    5.3>, however care is taken to

    <\itemize>
      <item>make sure the estimates are uniform in <math|\<Gamma\>> and in
      particular in the deformation parameter
      <math|\<beta\>\<in\><around*|(|0,1|]>>,

      <item>use the defect size <math|\<Gamma\><rsup|\<ast\>><rsup|><SL><rsup|<around*|(|u,1|)>><rsub|<around*|(|\<Theta\>,\<Theta\><rsup|in>|)>><dfct><rsup|N-10><rsub|16<gr>>>
      instead of the size <math|\<Gamma\><rsup|\<ast\>><SL><rsup|<around|(|\<infty\>,\<infty\>|)>><rsub|\<Theta\>>\<Phi\><rsub|16<gr>><rsup|N-10>>
      that is not available in this setting.\ 
    </itemize>

    Let <math|<mf|b><rsub|+><rsup|\<ast\>>>,
    <math|<mf|b><rsub|-><rsup|\<ast\>>> be the two functions whose graphs are
    the boundaries of <math|E<rsub|+><rsup|\<ast\>>> and
    <math|E<rsub|-><rsup|\<ast\>>> respectively so that
    <math|E<rsub|+><rsup|\<ast\>>\<setminus\>E<rsub|-><rsup|\<ast\>>=<around*|<left|{|1>|<around*|(|\<theta\>,\<zeta\>,\<sigma\>|)>:<mf|b><rsub|-><rsup|\<ast\>><around*|(|\<theta\>,\<zeta\>|)>\<less\>\<sigma\>\<less\><mf|b><rsub|+><rsup|\<ast\>><around*|(|\<theta\>,\<zeta\>|)>|<right|}|1>>>.
    The existence of such functions is guaranteed by
    <smart-ref|lem:geometry-of-boundary>. Our goal is to show that

    <\equation>
      sup<rsub|\<phi\>> <big|int><rsub|<R><rsup|2>><around*|(|<big|int><rsub|<R><rsub|+>><1><rsub|<mT><rsub|\<Theta\><rsub|\<Gamma\>><rsup|in>>><1><rsub|E<rsub|+><rsup|\<ast\>>\<setminus\>E<rsub|-><rsup|\<ast\>>><around*|<left|\||2>|<wpD><rsub|\<zeta\>><around*|(|\<theta\><rsub|\<Gamma\>>|)>F<rsup|\<ast\>><around|(|\<theta\>,\<zeta\>,\<sigma\>|)><around|[|\<phi\>|]>|<right|\||2>><rsup|2><space|0.17em><frac|<dd>\<sigma\>|\<sigma\>>|)><rsup|<frac|u|2>><space|0.17em><frac|<dd>\<zeta\><dd>\<theta\>|<around*|\||\<Theta\>|\|>>\<lesssim\><RHS|<eqref|eq:unif-lac-size-domination>><label|eq:ld:local-coordinates:in>
    </equation>

    with <math|\<phi\>> as before.

    Let us denote <math|\<Theta\><rsup|in><rsub|\<Gamma\>>=<around*|(|\<theta\><rsup|in><rsub|\<Gamma\>->,\<theta\><rsup|in><rsub|\<Gamma\>+>|)>>,
    <math|\<Theta\><rsup|in>=<around*|(|\<theta\><rsup|in><rsub|->,\<theta\><rsup|in><rsub|+>|)>>
    with <math|\<theta\><rsup|in><rsub|\<pm\>>=\<alpha\>\<beta\>\<theta\><rsup|in><rsub|\<Gamma\>\<pm\>>+\<gamma\>>,
    let <math|><math|<wide|\<Theta\>|\<bar\>><rsub|\<Gamma\>><eqd><around*|(|<wide|\<theta\>|\<bar\>><rsub|\<Gamma\>->,<wide|\<theta\>|\<bar\>><rsub|\<Gamma\>+>|)>=<around*|(|\<theta\><rsup|in><rsub|\<Gamma\>->-<around*|(|\<alpha\>\<beta\>|)><rsup|-1>,\<theta\><rsup|in><rsub|\<Gamma\>+>+<around*|(|\<alpha\>\<beta\>|)><rsup|-1>|)>>
    be an enlargement of <math|\<Theta\><rsup|in><rsub|\<Gamma\>>> that still
    satisfies <math|<wide|\<Theta\>|\<bar\>><rsub|\<Gamma\>>\<subset\>\<Theta\>>,
    and let <math|<wide|\<Theta\>|\<bar\>><rsub|\<Gamma\>><rsup|ex>=<wide|\<Theta\>|\<bar\>><rsub|\<Gamma\>><rsup|>\<setminus\>\<Theta\><rsup|in><rsub|\<Gamma\>>>.\ 

    Our main claim is that for any <math|<around|(|\<theta\>,\<zeta\>,\<sigma\>|)>\<in\><mT><rsub|\<Theta\><rsup|in><rsub|\<Gamma\>>>\<cap\><around*|(|E<rsub|+><rsup|\<ast\>>\<setminus\>E<rsub|-><rsup|\<ast\>>|)>>
    and for any <math|\<phi\>\<in\>\<Phi\><rsub|<gr>><rsup|\<infty\>>> with
    <math|<around*|\<\|\|\>|\<phi\>|\<\|\|\>><rsub|\<Phi\><rsub|<gr>><rsup|N>>\<leq\>1>
    we have that

    <\equation>
      <ltae|<tformat|<twith|table-valign|T>|<cwith|1|1|1|1|cell-halign|l>|<table|<row|<cell|<around*|<left|\||1>|<wpD><rsub|\<zeta\>><around*|(|\<theta\><rsub|\<Gamma\>>|)>F<rsup|\<ast\>><around|(|\<theta\>,\<zeta\>,\<sigma\>|)><around|[|\<phi\>|]>|<right|\||1>>>>|<row|<cell|<space|2em>\<lesssim\><tabular*|<tformat|<cwith|2|2|1|1|cell-halign|l>|<cwith|1|1|1|1|cell-halign|l>|<twith|table-valign|T>|<cwith|3|3|1|1|cell-halign|l>|<table|<row|<cell|sup<rsub|<wide|\<phi\>|~>><around*|(|<big|int><rsub|<wide|\<Theta\>|\<bar\>><rsub|\<Gamma\>><rsup|ex>><big|int><rsub|<mf|b><rsub|-><rsup|\<ast\>><around*|(|\<theta\><rprime|'>,\<zeta\>|)>><rsup|<mf|b><rsub|+><rsup|\<ast\>><around*|(|\<theta\><rprime|'>,\<zeta\>|)>>e<rsup|-<around*|\||log<around*|(|<frac|\<sigma\>|\<sigma\><rprime|'>>|)>|\|>><around*|<left|\||1>|F<rsup|\<ast\>><around|(|\<theta\><rprime|'>,\<zeta\>,\<sigma\><rprime|'>|)><around|[|<wide|\<phi\>|~>|]>|<right|\||1>><frac|<dd>\<sigma\><rprime|'>|\<sigma\><rprime|'>><dd>\<theta\><rprime|'>|\<nobracket\>>>>|<row|<cell|<space|2em>+<tabular*|<tformat|<cwith|2|2|1|1|cell-halign|r>|<twith|table-valign|T>|<table|<row|<cell|<big|int><rsub|\<Theta\><rsup|in><rsub|\<Gamma\>>><1><rsub|<mf|b><rsub|-><rsup|\<ast\>><around*|(|\<theta\><rprime|'>,\<zeta\>|)>\<less\><mf|b><rsub|+><rsup|\<ast\>><around*|(|\<theta\><rprime|'>,\<zeta\>|)>><rsub|>e<rsup|-<around*|<left|\||-1>|log<around*|<left|(|-1>|<frac|\<sigma\>|<mf|b><rsub|-><rsup|\<ast\>><around*|(|\<theta\><rprime|'>,\<zeta\>|)>>|<right|)|-1>>|<right|\||-1>>><around*|<left|\||2>|F<rsup|\<ast\>><around|(|\<theta\><rprime|'>,\<zeta\>,<mf|b><rsub|-><rsup|\<ast\>><around*|(|\<theta\><rprime|'>,\<zeta\>|)>|)><around|[|<wide|\<phi\>|~>|]>|<right|\||2>>>>|<row|<cell|<space|2em>\<times\><around*|<left|(|1>|1+\<delta\><around*|(|\<theta\>-\<theta\><rprime|'>|)>|<right|)|1>><dd>\<theta\><rprime|'>>>>>>>>|<row|<cell|<space|2em><around*|<left|\<nobracket\>|1>|+<big|int><rsub|\<Theta\><rsup|in><rsub|\<Gamma\>>><1><rsub|<mf|b><rsub|-><rsup|\<ast\>><around*|(|\<theta\><rprime|'>,\<zeta\>|)>\<less\><mf|b><rsub|+><rsup|\<ast\>><around*|(|\<theta\><rprime|'>,\<zeta\>|)>><rsub|>e<rsup|-<around*|<left|\||-1>|log<around*|<left|(|-1>|<frac|\<sigma\>|<mf|b><rsub|+><rsup|\<ast\>><around*|(|\<theta\><rprime|'>,\<zeta\>|)>>|<right|)|-1>>|<right|\||-1>>><around*|<left|\||2>|F<rsup|\<ast\>><around|(|\<theta\><rprime|'>,\<zeta\>,<mf|b><rsub|+><rsup|\<ast\>><around*|(|\<theta\><rprime|'>,\<zeta\>|)>|)><around|[|<wide|\<phi\>|~>|]>|<right|\||2>><dd>\<theta\><rprime|'>|<right|)|1>>>>>>>>>>>><label|eq:ld:full-decomposition-bound>

      \;
    </equation>

    with the upper bound taken over functions
    <math|<wide|\<phi\>|~>\<in\>\<Phi\><rsub|8<gr>><rsup|N-8>> with
    <math|<around*|\<\|\|\>|<wide|\<phi\>|~>|\<\|\|\>><rsub|\<Phi\><rsub|8<gr>><rsup|N-8>>\<leq\>1>.
    Furthermore, if <math|\<sigma\>\<less\>C<rsub|sep><mf|b><rsub|-><rsup|\<ast\>><around*|(|\<theta\>,\<zeta\>|)>>
    for some fixed large <math|C<rsub|sep>\<gg\>1> the above statement also
    holds for any <math|\<phi\>\<in\>\<Phi\><rsub|4<gr>><rsup|\<infty\>>>
    with <math|<around*|\<\|\|\>|\<phi\>|\<\|\|\>><rsub|\<Phi\><rsub|4<gr>><rsup|N>>\<leq\>1>
    on <LHS|<eqref|eq:ld:full-decomposition-bound>> while the upper bound is
    still taken over <math|<wide|\<phi\>|~>\<in\>\<Phi\><rsub|8<gr>><rsup|N-8>>
    on <RHS|<eqref|eq:ld:full-decomposition-bound>>.\ 

    We now show how this would allow us to conclude that
    <math|<smart-ref|eq:ld:local-coordinates:in>\<lesssim\><RHS|<smart-ref|eq:unif-lac-size-domination>><rsup|u>>,
    as required. Applying <smart-ref|lem:wave-packet-decomposition> we
    represent any <math|<wide|\<phi\>|~>\<in\>\<Phi\><rsub|8<gr>><rsup|N-8>>
    with <math|<around*|\<\|\|\>|<wide|\<phi\>|~>|\<\|\|\>><rsub|\<Phi\><rsub|8<gr>><rsup|N-8>>\<leq\>1>
    as

    <\equation*>
      <wide|\<phi\>|~>=<big|sum><rsub|k\<in\><Z>>a<rsub|k><wide|<rsub|><wide|\<phi\>|~>|~><rsub|k>
    </equation*>

    with <math|<wide|<rsub|><wide|\<phi\>|~>|~><rsub|k>\<in\>\<Phi\><rsub|16<gr>><rsup|N-10>>,
    <math|<around*|\<\|\|\>|<wide|<rsub|><wide|\<phi\>|~>|~><rsub|k>|\<\|\|\>><rsub|\<Phi\><rsub|16<gr>><rsup|N-10>>\<leq\>1>,
    and <math|<around*|\||a<rsub|k>|\|>\<lesssim\><around*|\<langle\>|k|\<rangle\>><rsup|-2>>.
    <math|>Using <eqref|eq:ld:full-decomposition-bound> and the triangle
    inequality we get that <math|<smart-ref|eq:ld:local-coordinates:in>\<lesssim\><math-up|I>+<math-up|I><rsup|->+<math-up|I><rsup|+>>
    where\ 

    <\equation*>
      <tabular|<tformat|<cwith|1|1|1|1|cell-halign|l>|<cwith|2|2|1|1|cell-halign|l>|<cwith|3|3|1|1|cell-halign|l>|<table|<row|<cell|<math-up|I><eqd>sup<rsub|<wide|\<phi\>|~>><tabular*|<tformat|<cwith|1|1|1|1|cell-halign|l>|<twith|table-valign|T>|<table|<row|<cell|<big|int><rsub|\<Theta\><rsub|\<Gamma\>><rsup|in>\<times\>B<rsub|1>><around*|(|<big|int><rsub|<around*|[|0,1|]>><1><rsub|><rsub|<mT><rsub|\<Theta\><rsub|\<Gamma\>><rsup|in>>\<cap\><around*|(|E<rsub|+><rsup|\<ast\>>\<setminus\>E<rsub|-><rsup|\<ast\>>|)>
      ><around*|(|\<theta\>,\<zeta\>,\<sigma\>|)>
      |\<nobracket\>>>>|<row|<cell|<space|2em>\<times\><around*|\<nobracket\>|<around*|<left|(|-1>|<big|int><rsub|<wide|\<Theta\>|\<bar\>><rsub|\<Gamma\>><rsup|ex>><big|int><rsub|<mf|b><rsub|-><rsup|\<ast\>><around*|(|\<theta\><rprime|'>,\<zeta\>|)>><rsup|<mf|b><rsub|+><rsup|\<ast\>><around*|(|\<theta\><rprime|'>,\<zeta\>|)>>e<rsup|-<around*|\||log<around*|(|<frac|\<sigma\>|\<sigma\><rprime|'>>|)>|\|>><around*|<left|\||2>|F<rsup|\<ast\>><around|(|\<theta\><rprime|'>,\<zeta\>,\<sigma\><rprime|'>|)><around|[|<wide|\<phi\>|~>|]>|<right|\||2>><frac|<dd>\<sigma\><rprime|'>|\<sigma\><rprime|'>><dd>\<theta\><rprime|'>|<right|)|-1>><rsup|2><frac|<dd>\<sigma\>|\<sigma\>>|)><rsup|<frac|u|2>><frac|<dd>\<zeta\><dd>\<theta\>|<around*|\||\<Theta\>|\|>>,>>>>>>>|<row|<cell|<math-up|I><rsup|-><eqd>sup<rsub|<wide|\<phi\>|~>><tabular*|<tformat|<twith|table-valign|T>|<cwith|1|1|1|1|cell-halign|l>|<table|<row|<cell|<big|int><rsub|\<Theta\><rsub|\<Gamma\>><rsup|in>\<times\>B<rsub|1>><around*|<left|(|1>|<big|int><rsub|<around*|[|0,1|]>><1><rsub|><rsub|<mT><rsub|\<Theta\><rsub|\<Gamma\>><rsup|in>>\<cap\><around*|(|E<rsub|+><rsup|\<ast\>>\<setminus\>E<rsub|-><rsup|\<ast\>>|)>
      ><around*|(|\<theta\>,\<zeta\>,\<sigma\>|)>
      <around*|(|<big|int><rsub|\<Theta\><rsup|in><rsub|\<Gamma\>>>e<rsup|-<around*|<left|\||-1>|log<around*|<left|(|-1>|<frac|\<sigma\>|<mf|b><rsub|-><rsup|\<ast\>><around*|(|\<theta\><rprime|'>,\<zeta\>|)>>|<right|)|-1>>|<right|\||-1>>>|\<nobracket\>>|<right|\<nobracket\>|1>><space|2em>>>|<row|<cell|<space|2em>\<times\><around*|<left|\<nobracket\>|1>|<around*|<left|\<nobracket\>|3>|<around*|<left|\||2>|F<rsup|\<ast\>><around|(|\<theta\><rprime|'>,\<zeta\>,<mf|b><rsub|-><rsup|\<ast\>><around*|(|\<theta\><rprime|'>,\<zeta\>|)>|)><around|[|<wide|\<phi\>|~>|]>|<right|\||2>><around*|<left|(|1>|1+\<delta\><around*|(|\<theta\>-\<theta\><rprime|'>|)>|<right|)|1>><dd>\<theta\><rprime|'>|<right|)|3>><rsup|2><frac|<dd>\<sigma\>|\<sigma\>>|<right|)|1>><rsup|<frac|u|2>><frac|<dd>\<zeta\><dd>\<theta\>|<around*|\||\<Theta\>|\|>>,>>>>><rsup|>>>|<row|<cell|<math-up|I><rsup|+><eqd>sup<rsub|<wide|\<phi\>|~>><tabular*|<tformat|<twith|table-valign|T>|<cwith|1|1|1|1|cell-halign|l>|<table|<row|<cell|<big|int><rsub|\<Theta\><rsub|\<Gamma\>><rsup|in>\<times\>B<rsub|1>><around*|(|<big|int><rsub|<around*|[|0,1|]>><1><rsub|><rsub|<mT><rsub|\<Theta\><rsub|\<Gamma\>><rsup|in>>\<cap\><around*|(|E<rsub|+><rsup|\<ast\>>\<setminus\>E<rsub|-><rsup|\<ast\>>|)>
      ><around*|(|\<theta\>,\<zeta\>,\<sigma\>|)>
      |\<nobracket\>>>>|<row|<cell|<space|2em>\<times\><around*|\<nobracket\>|<around*|(|<big|int><rsub|\<Theta\><rsup|in><rsub|\<Gamma\>>>e<rsup|-<around*|<left|\||-1>|log<around*|<left|(|-1>|<frac|\<sigma\>|<mf|b><rsub|+><rsup|\<ast\>><around*|(|\<theta\><rprime|'>,\<zeta\>|)>>|<right|)|-1>>|<right|\||-1>>><around*|<left|\||2>|F<rsup|\<ast\>><around|(|\<theta\><rprime|'>,\<zeta\>,<mf|b><rsub|+><rsup|\<ast\>><around*|(|\<theta\><rprime|'>,\<zeta\>|)>|)><around|[|<wide|\<phi\>|~>|]>|<right|\||2>><dd>\<theta\><rprime|'>|)><rsup|2><frac|<dd>\<sigma\>|\<sigma\>>|)><rsup|<frac|u|2>><frac|<dd>\<zeta\><dd>\<theta\>|<around*|\||\<Theta\>|\|>>.>>>>>>>>>>
    </equation*>

    where the upper bound, this time, is \ taken over functions
    <math|<wide|\<phi\>|~>\<in\>\<Phi\><rsub|16<gr>><rsup|N-10>> with
    <math|<around*|\<\|\|\>|<wide|\<phi\>|~>|\<\|\|\>><rsub|\<Phi\><rsub|16<gr>><rsup|N-10>>\<leq\>1>.
    We bound the term <math|<math-up|I>> using the Minkowski inequality and
    using the Young convolution inequality witUniformh respect to the
    multiplicative Haar measure <math|<frac|<dd>\<sigma\><rprime|'>|\<sigma\><rprime|'>>>:

    <\equation*>
      <math-up|I><math-up|><tabular*|<tformat|<cwith|1|1|1|1|cell-halign|l>|<twith|table-valign|T>|<cwith|2|2|1|1|cell-halign|l>|<table|<row|<cell|\<lesssim\>sup<rsub|<wide|\<phi\>|~>><big|int><rsub|<wide|\<Theta\>|\<bar\>><rsub|\<Gamma\>><rsup|ex>\<times\>B<rsub|1>><around*|<left|(|-1>|<big|int><rsub|<mf|b><rsub|-><rsup|\<ast\>><around*|(|\<theta\><rprime|'>,\<zeta\>|)>><rsup|<mf|b><rsub|+><rsup|\<ast\>><around*|(|\<theta\><rprime|'>,\<zeta\>|)>><around*|<left|\||2>|F<rsup|\<ast\>><around|(|\<theta\><rprime|'>,\<zeta\>,\<sigma\><rprime|'>|)><around|[|<wide|\<phi\>|~>|]>|<right|\||2>><rsub|><rsup|2><frac|<dd>\<sigma\><rprime|'>|\<sigma\><rprime|'>>|<right|)|-1>><rsup|<frac|u|2>><space|0.17em><dd>\<zeta\><dd>\<theta\><rprime|'>>>|<row|<cell|\<lesssim\><around|<left|\<\|\|\>|2>|<1><rsub|V<rsup|+>\<setminus\>V<rsup|->><1><rsub|<R><rsup|3><rsub|+>\<setminus\>W<rsup|->><around*|(|<Emb><around*|[|f|]>\<circ\>\<Gamma\>|)>|<right|\<\|\|\>|2>><rsub|\<Gamma\><rsup|\<ast\>><rsup|><SL><rsup|<around|(|u,2|)>><rsub|<around|(|\<Theta\>,\<Theta\><rsup|ex>|)>>\<Phi\><rsub|8<gr>><rsup|N-8><around*|(|T|)>><rsup|u>.>>>>>
    </equation*>

    Bounding the terms <math|<math-up|I><rsup|->> and
    <math|<math-up|I><rsup|+>> makes use of the defect size.\ 

    <\equation*>
      <ltae|<tformat|<cwith|2|2|1|1|cell-halign|r>|<cwith|1|1|1|1|cell-halign|r>|<table|<row|<cell|<math-up|I><rsup|+>\<lesssim\>sup<rsub|<wide|\<phi\>|~>><tabular*|<tformat|<twith|table-valign|T>|<cwith|1|1|1|1|cell-halign|l>|<table|<row|<cell|<big|int><rsub|\<Theta\><rsub|\<Gamma\>><rsup|in>\<times\>B<rsub|1>><around*|\<nobracket\>|<around*|(|<big|int><rsub|\<Theta\><rsup|in><rsub|\<Gamma\>>><1><rsub|<mf|b><rsub|-><rsup|\<ast\>><around*|(|\<theta\><rprime|'>,\<zeta\>|)>\<less\><mf|b><rsub|+><rsup|\<ast\>><around*|(|\<theta\><rprime|'>,\<zeta\>|)>><rsub|><around*|<left|\||2>|F<rsup|\<ast\>><around|(|\<theta\><rprime|'>,\<zeta\>,<mf|b><rsub|+><rsup|\<ast\>><around*|(|\<theta\><rprime|'>,\<zeta\>|)>|)><around|[|<wide|\<phi\>|~>|]>|<right|\||2>><dd>\<theta\><rprime|'>|\<nobracket\>>|)><rsup|<frac|u|2>><frac|<dd>\<zeta\><dd>\<theta\>|<around*|\||\<Theta\>|\|>>>>>>><space|2em>>>|<row|<cell|\<lesssim\>sup<rsub|<wide|\<phi\>|~>><tabular*|<tformat|<twith|table-valign|T>|<cwith|1|1|1|1|cell-halign|l>|<table|<row|<cell|<big|int><rsub|\<Theta\><rsup|in><rsub|\<Gamma\>>\<times\>B<rsub|1>><1><rsub|<mf|b><rsub|-><rsup|\<ast\>><around*|(|\<theta\><rprime|'>,\<zeta\>|)>\<less\><mf|b><rsub|+><rsup|\<ast\>><around*|(|\<theta\><rprime|'>,\<zeta\>|)>><rsub|><around*|<left|\||2>|F<rsup|\<ast\>><around|(|\<theta\><rprime|'>,\<zeta\>,<mf|b><rsub|+><rsup|\<ast\>><around*|(|\<theta\><rprime|'>,\<zeta\>|)>|)><around|[|<wide|\<phi\>|~>|]>|<right|\||2>><rsup|<frac|u|2>><frac|<dd>\<zeta\><dd>\<theta\><rprime|'>|<around*|\||\<Theta\>|\|>>>>>>>\<lesssim\><RHS|><eqref|eq:unif-lac-size-domination><rsup|u>.>>>>>
    </equation*>

    Analogously,\ 

    <\equation*>
      <tabular|<tformat|<cwith|2|2|1|1|cell-halign|r>|<cwith|1|1|1|1|cell-halign|l>|<table|<row|<cell|<math-up|I><rsup|->\<lesssim\>sup<rsub|<wide|\<phi\>|~>><tabular*|<tformat|<twith|table-valign|T>|<cwith|1|1|1|1|cell-halign|l>|<cwith|2|2|1|1|cell-halign|r>|<table|<row|<cell|<big|int><rsub|\<Theta\><rsub|\<Gamma\>><rsup|in>\<times\>B<rsub|1>><around*|(|<big|int><rsub|<wide|\<Theta\>|\<bar\>>><1><rsub|<mf|b><rsub|-><rsup|\<ast\>><around*|(|\<theta\><rprime|'>,\<zeta\>|)>\<less\><mf|b><rsub|+><rsup|\<ast\>><around*|(|\<theta\><rprime|'>,\<zeta\>|)>><rsub|><around*|<left|\||2>|F<rsup|\<ast\>><around|(|\<theta\><rprime|'>,\<zeta\>,<mf|b><rsub|-><rsup|\<ast\>><around*|(|\<theta\><rprime|'>,\<zeta\>|)>|)><around|[|<wide|\<phi\>|~>|]>|<right|\||2>>|\<nobracket\>><space|2em>>>|<row|<cell|\<times\><around*|<left|\<nobracket\>|3>|<around*|<left|(|1>|1+\<delta\><around*|(|\<theta\>-\<theta\><rprime|'>|)>|<right|)|1>><dd>\<theta\><rprime|'>|<right|)|3>><rsup|<frac|u|2>><frac|<dd>\<zeta\><dd>\<theta\>|<around*|\||\<Theta\>|\|>>>>>>>>>|<row|<cell|<space|2em>\<lesssim\>sup<rsub|<wide|\<phi\>|~>><tabular*|<tformat|<twith|table-valign|T>|<cwith|1|1|1|1|cell-halign|l>|<table|<row|<cell|<big|int><rsub|<wide|\<Theta\>|\<bar\>><rsub|\<Gamma\>>\<times\>B<rsub|1>><1><rsub|<mf|b><rsub|-><rsup|\<ast\>><around*|(|\<theta\><rprime|'>,\<zeta\>|)>\<less\><mf|b><rsub|+><rsup|\<ast\>><around*|(|\<theta\><rprime|'>,\<zeta\>|)>><rsub|><around*|<left|\||2>|F<rsup|\<ast\>><around|(|\<theta\><rprime|'>,\<zeta\>,<mf|b><rsub|-><rsup|\<ast\>><around*|(|\<theta\><rprime|'>,\<zeta\>|)>|)><around|[|<wide|\<phi\>|~>|]>|<right|\||2>><rsup|<frac|u|2>><frac|<dd>\<zeta\><dd>\<theta\><rprime|'>|<around*|\||\<Theta\>|\|>>>>>>>\<lesssim\><RHS|><eqref|eq:unif-lac-size-domination><rsup|u>.>>>>>
    </equation*>

    The last inequality in each of the chains above follows from
    <smart-ref|lem:geometry-of-boundary> and in particular from
    <eqref|eq:boundary-singular-size-local>.

    The remaining part of this proof is dedicated to showing that
    <eqref|eq:ld:full-decomposition-bound> holds. In
    <LHS|><eqref|eq:ld:full-decomposition-bound> fix
    <math|<around*|(|\<theta\>,\<zeta\>,\<sigma\>|)>\<in\><mT><rsub|\<Theta\>>\<cap\><around*|(|E<rsub|+><rsup|\<ast\>>\<setminus\>E<rsub|-><rsup|\<ast\>>|)>>
    and <math|\<phi\>\<in\>\<Phi\><rsup|\<infty\>><rsub|<gr>>> with
    <math|<around*|\<\|\|\>|\<phi\>|\<\|\|\>><rsub|\<Phi\><rsup|N><rsub|<gr>>>\<leq\>1>.
    We will discuss two cases. First we consider when
    <math|\<sigma\>\<leq\>C<rsub|sep><mf|b><rsup|\<ast\>><rsub|-><around*|(|\<theta\>,\<zeta\>|)>>
    for some very large <math|C<rsub|sep>\<gg\>1>. This corresponds to the
    point <math|<around*|(|\<theta\>,\<zeta\>,\<sigma\>|)>> being close to
    the boundary of <math|E<rsup|\<ast\>><rsub|->>. We then address the more
    general case when <math|\<sigma\>\<in\><around*|<left|(|2>|C<rsub|sep>
    <mf|b><rsup|\<ast\>><rsub|-><around*|(|\<theta\>,\<zeta\>|)>,
    <mf|b><rsup|\<ast\>><rsub|+><around*|(|\<theta\>,\<zeta\>|)>|<right|)|2>>>.

    We start with the former case. In this regime we also allow
    <math|\<phi\>> to have larger frequency support:
    <math|\<phi\>\<in\>\<Phi\><rsub|4<gr>><rsup|\<infty\>>> with
    <math|<around*|\<\|\|\>|\<phi\>|\<\|\|\>><rsub|\<Phi\><rsub|4<gr>><rsup|N>>\<leq\>1>
    instead of only <math|\<phi\>\<in\>\<Phi\><rsub|<gr>><rsup|\<infty\>>>;
    this will be necessary in the other regime. We further distinguish two
    cases: <with|font-series|bold|Case 1.0> and <with|font-series|bold|Case
    1.5>. The former is when <math|\<sigma\>\<less\><around*|(|1+2<rsup|-10><gr>|)><mf|b><rsup|\<ast\>><rsub|-><around*|(|\<theta\>,\<zeta\>|)>>
    \ or if <math|<around*|\||\<theta\><rsub|\<Gamma\>>|\|>\<less\><gr>>
    while the latter is when <math|\<sigma\>\<leq\>C<rsub|sep><mf|b><rsup|\<ast\>><rsub|-><around*|(|\<theta\>,\<zeta\>|)>>
    but the conditions of <with|font-series|bold|Case 1.0> do not hold.

    <with|font-series|bold|Case 1.0>: Suppose
    \ <math|\<sigma\>\<less\><around*|(|1+2<rsup|-10><gr>|)><mf|b><rsup|\<ast\>><rsub|-><around*|(|\<theta\>,\<zeta\>|)>>
    or <math|<around*|\||\<theta\><rsub|\<Gamma\>>|\|>\<less\><gr>> with
    <math|\<sigma\>\<leq\>C<rsub|sep><mf|b><rsup|\<ast\>><rsub|-><around*|(|\<theta\>,\<zeta\>|)>>.
    We will use the fact that

    <\equation*>
      <ltae|<tformat|<cwith|2|2|1|1|cell-halign|l>|<cwith|3|3|1|1|cell-halign|l>|<table|<row|<cell|<wpD><rsub|\<zeta\>><around*|(|\<theta\>|)>F<rsup|\<ast\>><around|(|\<theta\>,\<zeta\>,\<sigma\>|)><around|[|\<phi\>|]>=F<rsup|\<ast\>><around|(|\<theta\>,\<zeta\>,<mf|b><rsup|\<ast\>><rsub|-><around*|(|\<theta\>,\<zeta\>|)>|)><around|[|<wide|\<phi\>|~><rsub|>|]>,>>|<row|<cell|<wide|\<phi\><rsub|>|~><rsup|\<vee\>><eqd><Mod><rsub|-\<theta\><rsub|\<Gamma\>>><Dil><rsub|><rsub|\<sigma\>/<mf|b><rsup|\<ast\>><rsub|-><around*|(|\<theta\>,\<zeta\>|)>><Mod><rsub|\<theta\><rsub|\<Gamma\>>>\<phi\><rsub|\<theta\>><rsup|\<vee\>>,>>|<row|<cell|\<phi\><rsub|\<theta\>><around*|(|z|)><eqd><around*|(|-d<rsub|z>+2
      \<pi\> i\<theta\><rsub|\<Gamma\>>|)>\<phi\><around*|(|z|)>>>>>>
    </equation*>

    This identity follows from <eqref|eq:embedding> that defines <Emb>. Since

    <\equation*>
      <spt><around*|(|<FT|<Dil><rsub|><rsub|\<sigma\>><Mod><rsub|\<theta\><rsub|\<Gamma\>>>\<phi\><rsub|\<theta\>><rsup|\<vee\>>>|)>\<subset\><around*|<left|(|1>|\<sigma\><rsup|-1><around*|(|\<theta\><rsub|\<Gamma\>>-4<gr>|)>,\<sigma\><rsup|-1><around*|(|\<theta\><rsub|\<Gamma\>>+4<gr>|)>|<right|)|1>>
    </equation*>

    it holds that\ 

    <\equation*>
      <spt><around*|(|<FT|<wide|\<phi\><rsub|><rsup|>|~><rsup|\<vee\>>>|)>\<subset\><around*|<left|(|1>|<frac|<mf|b><rsup|\<ast\>><rsub|-><around*|(|\<theta\>,\<zeta\>|)>|\<sigma\>><around*|(|\<theta\><rsub|\<Gamma\>>-4<gr>|)>-\<theta\><rsub|\<Gamma\>>,<frac|<mf|b><rsup|\<ast\>><rsub|-><around*|(|\<theta\>,\<zeta\>|)>|\<sigma\>><around*|(|\<theta\><rsub|\<Gamma\>>+4<gr>|)>-\<theta\><rsub|\<Gamma\>>|<right|)|1>>.
    </equation*>

    Since <math|\<theta\><rsub|\<Gamma\>>\<in\>\<Theta\>> and thus
    <math|<around*|\||\<theta\><rsub|\<Gamma\>>|\|>\<less\>10> and either
    <math|<around*|\||\<theta\><rsub|\<Gamma\>>|\|>\<less\><gr>> or
    <math|<frac|1|1+2<rsup|-10><gr>>\<less\><frac|<mf|b><rsup|\<ast\>><rsub|-><around*|(|\<theta\>,\<zeta\>|)>|\<sigma\>>\<less\>1>
    we have that <math|<around*|\||<around*|(|<frac|<mf|b><rsup|\<ast\>><rsub|-><around*|(|\<theta\>,\<zeta\>|)>|\<sigma\>>-1|)>\<theta\><rsub|\<Gamma\>>|\|>\<less\>2<gr>><math|>.
    This implies that <math|<wide|\<phi\>|~><rsub|>\<in\>\<Phi\><rsub|8<gr>><rsup|N>>
    with <math|<around*|\<\|\|\>|<wide|\<phi\>|~><rsub|>|\<\|\|\>><rsub|\<Phi\><rsub|8<gr>><rsup|N>>\<lesssim\><rsub|C<rsub|sep>><around*|\<\|\|\>|\<phi\>|\<\|\|\>><rsub|\<Phi\><rsub|4<gr>><rsup|N>>\<leq\>1>.
    This shows bound <eqref|eq:ld:full-decomposition-bound> in this case
    because we have obtained that

    <\equation*>
      <around*|<left|\||1>|<wpD><rsub|\<zeta\>><around*|(|\<theta\><rsub|\<Gamma\>>|)>F<rsup|\<ast\>><around|(|\<theta\>,\<zeta\>,\<sigma\>|)><around|[|\<phi\>|]>|<right|\||1>>\<lesssim\>sup<rsub|<wide|\<phi\>|~>><tabular*|<tformat|<cwith|2|2|1|1|cell-halign|r>|<twith|table-valign|T>|<cwith|1|1|1|1|cell-halign|l>|<table|<row|<cell|<big|int><rsub|\<Theta\><rsup|in><rsub|\<Gamma\>>><1><rsub|<mf|b><rsub|-><rsup|\<ast\>><around*|(|\<theta\><rprime|'>,\<zeta\>|)>\<less\><mf|b><rsub|+><rsup|\<ast\>><around*|(|\<theta\><rprime|'>,\<zeta\>|)>><rsub|>e<rsup|-<around*|<left|\||-1>|log<around*|<left|(|-1>|<frac|\<sigma\>|<mf|b><rsub|-><rsup|\<ast\>><around*|(|\<theta\><rprime|'>,\<zeta\>|)>>|<right|)|-1>>|<right|\||-1>>>>>|<row|<cell|<space|2em>\<times\><around*|<left|\||2>|F<rsup|\<ast\>><around|(|\<theta\><rprime|'>,\<zeta\>,<mf|b><rsub|-><rsup|\<ast\>><around*|(|\<theta\><rprime|'>,\<zeta\>|)>|)><around|[|<wide|\<phi\>|~>|]>|<right|\||2>><around*|<left|(|1>|1+\<delta\><around*|(|\<theta\>-\<theta\><rprime|'>|)>|<right|)|1>><dd>\<theta\><rprime|'>>>>>>
    </equation*>

    \;

    <with|font-series|bold|Case 1.5>: We now suppose that
    <math|1+2<rsup|-10><gr>\<leq\><frac|\<sigma\>|<mf|b><rsup|\<ast\>><rsub|-><around*|(|\<theta\>,\<zeta\>|)>>\<less\>C<rsub|sep>>
    and <math|<around*|\||\<theta\><rsub|\<Gamma\>>|\|>\<gtr\><gr>>. We
    assume that <math|\<theta\>\<gtr\>-\<gamma\>+<frac|<gr>|\<alpha\>\<beta\>>>,
    the case <math|\<theta\>\<less\>-\<gamma\>-<frac|<gr>|\<alpha\>\<beta\>>>
    is dealt with symmetrically. Let <math|<around*|<left|(|1>|\<omega\><rsub|>,<mf|b><rsup|\<ast\>><rsub|-><around*|(|\<omega\>,\<zeta\>|)>|<right|)|1>>>
    be the point in <math|\<Theta\>\<times\><R><rsub|+>> where the segment
    connecting the points <math|<around*|(|\<theta\>,\<sigma\>|)>\<in\>\<Theta\>\<times\><R><rsub|+>>
    and <math|<around*|(|-\<gamma\>,0|)>\<in\>\<Theta\>\<times\><around*|[|0,+\<infty\>|)>>
    intersects the graph of <math|\<theta\><rprime|'>\<mapsto\><mf|b><rsup|\<ast\>><rsub|-><around*|(|\<theta\><rprime|'>,\<zeta\>|)>>.
    We claim that\ 

    <\itemize>
      <item>such a point exists,

      <item>it is unique,

      <item>it holds that <math|<mf|b><rsup|\<ast\>><rsub|-><around*|(|\<omega\>,\<zeta\>|)>\<less\><mf|b><rsup|\<ast\>><rsub|+><around*|(|\<omega\>,\<zeta\>|)>>,

      <item>there exists a small <math|<wide|r|\<bar\>>\<gtr\>0> such that
      <math|<around*|<left|(|1>|\<omega\>,\<omega\>+<wide|r|\<bar\>>|<right|)|1>>\<subset\><around*|<left|(|1>|-\<gamma\>,\<theta\>|<right|)|1>>>
      and <math|<mf|b><rsup|\<ast\>><rsub|-><around*|(|\<theta\><rprime|'>,\<zeta\>|)>\<less\><mf|b><rsup|\<ast\>><rsub|+><around*|(|\<theta\><rprime|'>,\<zeta\>|)>>
      for all <math|\<theta\><rprime|'>\<in\><around*|<left|(|1>|\<omega\>,\<omega\>+<wide|r|\<bar\>>|<right|)|1>>>.
    </itemize>

    Assuming for now that this holds, we define
    <math|<wide|\<phi\>|~><rsub|\<theta\><rprime|'>>> by setting

    <\equation*>
      <Dil><rsub|><rsub|<mf|b><rsup|\<ast\>><rsub|-><around*|(|\<theta\><rprime|'>,\<zeta\>|)>><Mod><rsub|\<theta\><rprime|'><rsub|\<Gamma\>>><wide|\<phi\><rsub|>|~><rsub|\<theta\><rprime|'>><rsup|\<vee\>><eqd><Dil><rsub|><rsub|\<sigma\>><Mod><rsub|\<theta\><rsub|\<Gamma\>>>\<phi\><rsub|\<theta\>><rsup|\<vee\>>
    </equation*>

    so that\ 

    <\equation*>
      <wpD><rsub|\<zeta\>><around*|(|\<theta\><rsub|\<Gamma\>>|)>F<rsup|\<ast\>><around|(|\<theta\>,\<zeta\>,\<sigma\>|)><around|[|\<phi\>|]>=<frac|1|<wide|r|\<bar\>>><big|int><rsub|\<omega\>><rsup|\<omega\>+<wide|r|\<bar\>>>F<rsup|\<ast\>><around|(|\<theta\><rprime|'>,\<zeta\>,<mf|b><rsup|\<ast\>><rsub|-><around*|(|\<theta\><rprime|'>,\<zeta\>|)>|)><around|[|<wide|\<phi\><rsub|>|~><rsub|\<theta\><rprime|'>><rsub|>|]><dd>\<theta\><rprime|'>.
    </equation*>

    It holds that <math|<spt><around*|(|<FT|<wide|\<phi\><rsub|><rsup|>|~><rsub|\<omega\>>>|)>\<subset\>B<rsub|4<gr><frac|<mf|b><rsup|\<ast\>><rsub|-><around*|(|\<omega\>,\<zeta\>|)>|\<sigma\>>>\<subset\>B<rsub|4<gr>>>;
    using bound <eqref|eq:boundary-regularity-local>, and in particular that\ 

    <\equation*>
      e<rsup|-<around*|\||\<theta\><rprime|'>-\<omega\>|\|>>\<less\><frac|<mf|b><rsup|\<ast\>><rsub|-><around*|(|\<theta\><rprime|'>,\<zeta\>|)>|<mf|b><rsup|\<ast\>><rsub|-><around*|(|\<omega\>,\<zeta\>|)>>\<less\>e<rsup|<around*|\||\<theta\><rprime|'>-\<omega\>|\|>>,
    </equation*>

    we deduce, by continuity, that <math|<spt><around*|(|<FT|<wide|\<phi\><rsub|><rsup|>|~><rsub|\<theta\><rprime|'>>>|)>\<subset\>B<rsub|8<gr>>>
    if <math|<wide|r|\<bar\>>\<gtr\>0> is chosen small enough. Furthermore,
    since <math|\<sigma\>\<less\>C<rsub|sep><mf|b><rsup|\<ast\>><rsub|-><around*|(|\<theta\>,\<zeta\>|)>>
    and \ <math|<mf|b><rsup|\<ast\>><rsub|-><around*|(|\<omega\>,\<zeta\>|)>\<gtr\>e<rsup|-<around*|\||\<theta\>-\<gamma\>|\|>><mf|b><rsup|\<ast\>><rsub|-><around*|(|\<theta\>,\<zeta\>|)>>
    it holds that <math|><math|\<sigma\>\<lesssim\>C<rsub|sep><mf|b><rsup|\<ast\>><rsub|-><around*|(|\<omega\>,\<zeta\>|)>>.
    Thus <math|<wide|\<phi\><rsub|>|~><rsub|\<theta\><rprime|'>>\<in\>\<Phi\><rsub|8<gr>><rsup|N>>
    with <math|<around*|\<\|\|\>|<wide|\<phi\><rsub|>|~><rsub|\<theta\><rprime|'>><rsub|>|\<\|\|\>><rsub|\<Phi\><rsub|8<gr>><rsup|N>>\<lesssim\><rsub|C<rsub|sep>><around*|\<\|\|\>|\<phi\>|\<\|\|\>><rsub|\<Phi\><rsub|4<gr>><rsup|N>>\<leq\>1>.
    An application of <smart-ref|lem:wave-packet-decomposition> allows us to
    conclude that\ 

    <\equation*>
      <around*|<left|\||2>|<wpD><rsub|\<zeta\>><around*|(|\<theta\><rsub|\<Gamma\>>|)>F<rsup|\<ast\>><around|(|\<theta\>,\<zeta\>,\<sigma\>|)><around|[|\<phi\>|]>|<right|\||2>>=sup<rsub|<wide|\<phi\>|~>><frac|1|<wide|r|\<bar\>>><big|int><rsub|\<omega\>><rsup|\<omega\>+<wide|r|\<bar\>>><around*|<left|\||2>|F<rsup|\<ast\>><around|(|\<theta\><rprime|'>,\<zeta\>,<mf|b><rsup|\<ast\>><rsub|-><around*|(|\<theta\><rprime|'>,\<zeta\>|)>|)><around|[|<wide|\<phi\><rsub|>|~><rsub|>|]>|<right|\||2>><dd>\<theta\><rprime|'>
    </equation*>

    with the upper bound taken over <math|<wide|\<phi\><rsub|>|~>\<in\>\<Phi\><rsub|16<gr>><rsup|\<infty\>>>
    with <math|<around*|\<\|\|\>|<wide|\<phi\><rsub|>|~><rsub|>|\<\|\|\>><rsub|\<Phi\><rsub|16<gr>><rsup|N-2>>\<lesssim\><rsub|C<rsub|sep>>1.>
    This would conclude showing bound <eqref|eq:ld:full-decomposition-bound>
    in this case. It remains to prove the properties about the point
    <math|<around*|<left|(|1>|\<omega\><rsub|>,<mf|b><rsup|\<ast\>><rsub|-><around*|(|\<omega\>,\<zeta\>|)>|<right|)|1>>>
    claimed above.\ 

    At least one point of intersection between the \ segment connecting
    \ <math|<around*|(|\<theta\>,\<sigma\>|)>\<in\>\<Theta\>\<times\><around*|[|0,+\<infty\>|)>>
    and <math|<around*|(|-\<gamma\>,0|)>\<in\>\<Theta\>\<times\><around*|[|0,+\<infty\>|)>>
    and the graph of <math|\<theta\><rprime|'>\<rightarrow\><mf|b><rsub|-><rsup|\<ast\>><around*|(|\<theta\><rprime|'>,\<zeta\>|)>>
    exists because <math|<mf|b><rsub|-><rsup|\<ast\>><around*|(|-\<gamma\>,\<zeta\>|)>\<gtr\>0>,
    <math|<mf|b><rsub|-><rsup|\<ast\>><around*|(|\<theta\>,\<zeta\>|)>\<less\>\<sigma\>>,
    and <math|\<theta\><rprime|'>\<mapsto\><mf|b><rsub|-><rsup|\<ast\>><around*|(|\<theta\><rprime|'>,\<zeta\>|)>>
    is continuous. Let us call <math|<around*|(|\<omega\>,<mf|b><rsub|-><rsup|\<ast\>><around*|(|\<omega\>,\<zeta\>|)>|)>>
    one such point. Let us show that the intersection is unique. As a matter
    of fact, if <math|<mf|b>> is any function satisfying
    <eqref|eq:boundary-regularity-local> then its graph can only cross the
    segment connecting \ <math|<around*|(|\<theta\>,\<sigma\>|)>\<in\>\<Theta\>\<times\><around*|[|0,+\<infty\>|)>>
    and <math|<around*|(|-\<gamma\>,0|)>\<in\>\<Theta\>\<times\><around*|[|0,+\<infty\>|)>>
    from above to below. To see this suppose that <math|\<theta\><rsub|0>> is
    the <math|\<Theta\>> coordinate of a point of intersection: we then have

    <\equation*>
      <mf|b><around*|(|\<theta\><rsub|0>,\<zeta\>|)>=\<sigma\><frac|\<theta\><rsub|0>+\<gamma\>|\<theta\>+\<gamma\>>.
    </equation*>

    By <eqref|eq:boundary-regularity-local> we have that
    <math|<dd><rsub|\<theta\><rprime|'>><mf|b><rsup|\<ast\>><rsub|><around*|(|\<theta\><rprime|'>,\<zeta\>|)>\<leq\><frac|<mf|b><rsup|\<ast\>><rsub|><around*|(|\<theta\><rprime|'>,\<zeta\>|)>|\<theta\><rprime|'>-\<theta\><rsub|->>>
    from which we get that for any <math|\<theta\><rprime|'>\<gtr\>\<theta\><rsub|0>>

    <\equation*>
      <mf|b><rsup|\<ast\>><around*|(|\<theta\><rprime|'>,\<zeta\>|)>\<leq\><mf|b><rsup|\<ast\>><around*|(|\<theta\><rsub|0>,\<zeta\>|)><frac|\<theta\><rprime|'>-\<theta\><rsub|->|\<theta\><rsub|0>-\<theta\><rsub|->>=\<sigma\><frac|\<theta\><rsub|0>+\<gamma\>|\<theta\>+\<gamma\>><frac|\<theta\><rprime|'>-\<theta\><rsub|->|\<theta\><rsub|0>-\<theta\><rsub|->>\<leq\>\<sigma\><frac|\<theta\><rprime|'>+\<gamma\>|\<theta\>+\<gamma\>>;
    </equation*>

    we used that <math|\<theta\><rsub|0>-\<theta\><rsub|->\<gtr\>\<theta\><rsub|0>+\<gamma\>>.
    This is exactly the property we claimed. By the same reasoning, if we
    were to have <math|<mf|b><rsup|\<ast\>><rsub|+><around*|(|\<omega\>,\<zeta\>|)>\<less\><mf|b><rsup|\<ast\>><rsub|-><around*|(|\<omega\>,\<zeta\>|)>=\<sigma\><frac|\<omega\>+\<gamma\>|\<theta\>+\<gamma\>>>
    then it would holds that\ 

    <\equation*>
      <mf|b><rsup|\<ast\>><rsub|+><around*|(|\<theta\>,\<zeta\>|)>\<leq\>\<sigma\>
    </equation*>

    which is a contradiction to the fact that
    <math|<around*|(|\<theta\>,\<zeta\>,\<sigma\>|)>\<in\><mT><rsub|\<Theta\>>\<cap\><around*|(|E<rsub|+><rsup|\<ast\>>\<setminus\>E<rsub|-><rsup|\<ast\>>|)>>.

    Let us now address the existence of <math|<wide|r|\<bar\>>\<gtr\>0>.
    Since <math|\<sigma\>\<gtr\><mf|b><rsup|\<ast\>><rsub|-><around*|(|\<theta\>,\<zeta\>|)><around*|(|1+2<rsup|-10><gr>|)>>,
    <math|<mf|b><rsup|\<ast\>><rsub|-><around*|(|\<theta\><rprime|'>,\<zeta\>|)>\<less\><mf|b><rsup|\<ast\>><rsub|-><around*|(|\<theta\>,\<zeta\>|)>e<rsup|<around*|\||\<theta\><rprime|'>-\<theta\>|\|>>>
    and the slope of the segment connecting <math|<around*|(|-\<gamma\>,0|)>>
    to <math|<around*|(|\<theta\>,\<sigma\>|)>> is bounded from above by
    <math|><math|\<alpha\>\<beta\><frac|<mf|b><rsup|\<ast\>><rsub|-><around*|(|\<theta\>,\<zeta\>|)>|<gr>>>
    it follows that \ <math|\<omega\>\<less\>\<theta\>-2<wide|r|\<bar\>>> for
    some universal <math|<wide|r|\<bar\>>\<gtr\>0> independent of
    <math|\<Gamma\>>, <math|\<theta\>> and <math|\<zeta\>>. Finally, for any
    \ <math|\<theta\><rprime|'>\<in\><around*|<left|(|1>|\<omega\>,\<omega\>+<wide|r|\<bar\>>|<right|)|1>>>
    it holds that <math|<mf|b<rsup|\<ast\>><rsub|-><around*|(|\<theta\><rprime|'>,\<zeta\>|)>>\<leq\><mf|b<rsup|\<ast\>><rsub|+><around*|(|\<theta\><rprime|'>,\<zeta\>|)>>>
    because otherwise, as before, we would be able to deduce that
    <math|<mf|b><rsup|\<ast\>><rsub|+><around*|(|\<theta\>,\<zeta\>|)>\<leq\>\<sigma\>>
    in contradiction with the fact that <math|<around*|(|\<theta\>,\<zeta\>,\<sigma\>|)>\<in\><mT><rsub|\<Theta\>>\<cap\><around*|(|E<rsub|+><rsup|\<ast\>>\<setminus\>E<rsub|-><rsup|\<ast\>>|)>>.

    <with|font-series|bold|Case 2:> Now let us discuss the case
    <math|\<sigma\>\<gtr\>C<rsub|sep><mf|b><rsup|\<ast\>><rsub|-><around*|(|\<theta\>,\<zeta\>|)>>.
    Let <math|<mf|b><rsup|\<ast\>><rsub|-><around*|(|\<zeta\>|)>=sup<rsub|\<theta\><rprime|'>\<in\><wide|\<Theta\>|\<bar\>><rsub|\<Gamma\>>><mf|b><rsup|\<ast\>><rsub|-><around*|(|\<theta\><rprime|'>,\<zeta\>|)>>
    and <math|<mf|b><rsup|\<ast\>><rsub|-><around*|(|\<zeta\>|)>=inf<rsub|\<theta\><rprime|'>\<in\><wide|\<Theta\>|\<bar\>><rsub|\<Gamma\>>><mf|b><rsup|\<ast\>><rsub|+><around*|(|\<theta\><rprime|'>,\<zeta\>|)>>.
    By <eqref|eq:boundary-regularity-local> and in particular from the fact
    that for any <math|\<theta\><rprime|'>\<in\><wide|\<Theta\>|\<bar\>><rsub|\<Gamma\>>>
    it holds that\ 

    <\equation*>
      e<rsup|-<around*|\||<wide|\<Theta\>|\<bar\>><rsub|\<Gamma\>>|\|>><mf|b><rsup|\<ast\>><rsub|\<pm\>><around*|(|\<theta\>,\<zeta\>|)>\<leq\><mf|b><rsup|\<ast\>><rsub|\<pm\>><around*|(|\<theta\><rprime|'>,\<zeta\>|)>\<leq\>e<rsup|<around*|\||<wide|\<Theta\>|\<bar\>><rsub|\<Gamma\>>|\|>><mf|b><rsup|\<ast\>><rsub|\<pm\>><around*|(|\<theta\>,\<zeta\>|)>
    </equation*>

    so we obtain that <math|<mf|b><rsup|\<ast\>><rsub|-><around*|(|\<theta\>,\<zeta\>|)><mf|\<less\>b><rsup|\<ast\>><rsub|-><around*|(|\<zeta\>|)>\<less\>2<mf|b><rsup|\<ast\>><rsub|-><around*|(|\<theta\>,\<zeta\>|)>>,
    <math|<mf|b><rsup|\<ast\>><rsub|+><around*|(|\<theta\>,\<zeta\>|)><mf|\<less\>b><rsup|\<ast\>><rsub|+><around*|(|\<zeta\>|)>\<less\>2<mf|b><rsup|\<ast\>><rsub|+><around*|(|\<theta\>,\<zeta\>|)>>,
    and in particular <math|<mf|b><rsup|\<ast\>><rsub|+><around*|(|\<zeta\>|)>\<gtr\><frac|C<rsub|sep>|4><mf|b><rsup|\<ast\>><rsub|-><around*|(|\<zeta\>|)>>
    and <math|\<sigma\>\<gtr\><frac|C<rsub|sep>|2><mf|b><rsup|\<ast\>><rsub|-><around*|(|\<zeta\>|)>>.
    We set <math|C<rsub|sep>=2<rsup|11>>. Fix
    <math|\<chi\>\<in\>\<Phi\><rsup|\<infty\>><rsub|2>> with
    <math|<FT|\<chi\>><around*|(|<FT|z>|)>\<in\><around*|[|0,1|]>> and
    <math|<FT|\<chi\>><around*|(|<FT|z>|)>=1> for
    <math|<FT|z>\<in\>B<rsub|7/4>> and let
    <math|\<chi\><rsub|<gr>><around*|(|z|)>=<gr>\<chi\><around*|(|<gr>z|)>>.
    Let us define\ 

    <\equation*>
      M<rsup|+><around*|(|<FT|z>|)>=<big|int><rsub|<wide|\<Theta\>|\<bar\>><rsub|\<Gamma\>>><FT|\<chi\><rsub|<gr>>><around*|(|<mf|b><rsup|\<ast\>><rsub|+><around*|(|\<theta\><rprime|'>,\<zeta\>|)><FT|z>-\<theta\><rprime|'><rsub|\<Gamma\>>|)><dd>\<theta\><rprime|'>.
    </equation*>

    It holds that <math|M<rsup|+><around*|(|<FT|z>|)>\<geq\>0>,
    <math|M<rsup|+><around*|(|<FT|z>|)>\<gtrsim\>1> for
    <math|<around*|\||<FT|z>|\|>\<less\><frac|1|2<mf|b><rsup|\<ast\>><rsub|+><around*|(|\<zeta\>|)>>>,
    and \ <math|<around*|\||\<partial\><rsub|<FT|z>><rsup|n>M<rsup|+><around*|(|<FT|z>|)>|\|>\<lesssim\><mf|b><rsup|\<ast\>><rsub|+><around*|(|\<zeta\>|)><rsup|-n>>.
    Recall that for <math|<around*|(|\<theta\>,\<zeta\>,\<sigma\>|)>\<in\><mT><rsub|\<Theta\>>\<cap\><around*|(|E<rsub|+><rsup|\<ast\>>\<setminus\>E<rsub|-><rsup|\<ast\>>|)>>
    we have <math|<wpD><rsub|\<zeta\>><around*|(|\<theta\><rsub|\<Gamma\>>|)>F<rsup|\<ast\>><around|(|\<theta\>,\<zeta\>,\<sigma\>|)><around|[|\<phi\>|]>=f\<ast\><Dil><rsub|\<sigma\>>\<Upsilon\>
    > with \ <math|\<Upsilon\><rsub|>\<assign\><dd><rsub|z>Mod<rsub|\<theta\><rsub|\<Gamma\>>>\<phi\><rsup|\<vee\>><around*|(|z|)>>;
    we keep the dependence on <math|\<theta\><rsub|\<Gamma\>>> implicit. It
    holds that\ 

    <\equation*>
      <spt><around*|(|<FT|<Dil><rsub|\<sigma\>>\<Upsilon\><rsub|>>|)>\<subset\><around*|<left|(|1>|\<sigma\><rsup|-1><around*|(|\<theta\><rsub|\<Gamma\>>-<gr>|)>,\<sigma\><rsup|-1><around*|(|\<theta\><rsub|\<Gamma\>>+<gr>|)>|<right|)|1>>.
    </equation*>

    Let us decompose\ 

    <\equation*>
      <FT|<Dil><rsub|\<sigma\>>\<Upsilon\><rsub|>><around*|(|<FT|z>|)><tabular*|<tformat|<cwith|2|2|1|1|cell-halign|l>|<twith|table-valign|T>|<table|<row|<cell|=<FT|\<chi\>><around*|<left|(|1>|4<mf|b><rsup|\<ast\>><rsub|+><around*|(|\<zeta\>|)><FT|z>|<right|)|1>><FT|<Dil><rsub|\<sigma\>>\<Upsilon\><rsub|\<theta\><rsub|\<Gamma\>>>><around*|(|<FT|z>|)>+<around*|<left|(|2>|1-<FT|\<chi\>><around*|<left|(|1>|4<mf|b><rsup|\<ast\>><rsub|+><around*|(|\<zeta\>|)><FT|z>|<right|)|1>>|<right|)|2>><FT|<Dil><rsub|\<sigma\>>\<Upsilon\><rsub|>><around*|(|<FT|z>|)>>>|<row|<cell|=<FT|\<Upsilon\><rsub|\<sigma\>><rsup|\<uparrow\>>>+<FT|\<Upsilon\><rsub|\<sigma\>><rsup|0>>.>>>>>
    </equation*>

    It holds that <math|>

    <\equation*>
      <FT|\<Upsilon\><rsub|\<sigma\>><rsup|\<uparrow\>>>=<big|int><rsub|<wide|\<Theta\>|\<bar\>><rsub|\<Gamma\>>><frac|<FT|\<Upsilon\><rsub|\<sigma\>><rsup|\<uparrow\>>><around*|(|<FT|z>|)>|M<rsup|+><around*|(|<FT|z>|)>><FT|\<chi\><rsub|<gr>>><around*|<left|(|1>|<mf|b><rsup|\<ast\>><rsub|+><around*|(|\<theta\><rprime|'>,\<zeta\>|)><FT|z>-\<theta\><rprime|'><rsub|\<Gamma\>>|<right|)|1>><dd>\<theta\><rprime|'>
    </equation*>

    so let us define

    <\equation*>
      <FT|\<phi\><rsub|\<theta\><rprime|'>>><around*|(|<FT|z>|)><eqd><frac|<FT|\<Upsilon\><rsub|\<sigma\>><rsup|\<uparrow\>>><around*|(|<frac|<FT|z>+\<theta\><rprime|'><rsub|\<Gamma\>>|<mf|b><rsup|\<ast\>><rsub|+><around*|(|\<theta\><rprime|'>,\<zeta\>|)>>|)>|M<rsup|+><around*|(|<frac|<FT|z>+\<theta\><rprime|'><rsub|\<Gamma\>>|<mf|b><rsup|\<ast\>><rsub|+><around*|(|\<theta\><rprime|'>,\<zeta\>|)>>|)>><FT|\<chi\><rsub|<gr>>><around*|(|<FT|z>|)>
    </equation*>

    so that <math|\<phi\><rsub|\<theta\><rprime|'>>\<in\>\<Phi\><rsup|\<infty\>><rsub|2<gr>>>,
    <math|<around*|\<\|\|\>|\<phi\><rsub|\<theta\><rprime|'>>|\<\|\|\>><rsub|\<Phi\><rsup|N><rsub|2<gr>>>\<lesssim\>1>
    and\ 

    <\equation*>
      <ltae|<tformat|<cwith|2|2|1|1|cell-halign|r>|<table|<row|<cell|<wpD><rsub|\<zeta\>><around*|(|\<theta\><rsub|\<Gamma\>>|)>F<rsup|\<ast\>><around|(|\<theta\>,\<zeta\>,\<sigma\>|)><around|[|\<phi\>|]>=<big|int><rsub|<wide|\<Theta\>|\<bar\>><rsub|\<Gamma\>><rsup|in>>F<rsup|\<ast\>><around|(|\<theta\><rprime|'>,\<zeta\>,<mf|b><rsup|\<ast\>><rsub|+><around*|(|\<theta\><rprime|'>,\<zeta\>|)>|)><around|[|\<phi\><rsub|\<theta\><rprime|'>>|]><dd>\<theta\><rprime|'><space|2em>>>|<row|<cell|+<big|int><rsub|<wide|\<Theta\>|\<bar\>><rsub|\<Gamma\>><rsup|ex>>F<rsup|\<ast\>><around|(|\<theta\><rprime|'>,\<zeta\>,<mf|b><rsup|\<ast\>><rsub|+><around*|(|\<theta\><rprime|'>,\<zeta\>|)>|)><around|[|\<phi\><rsub|\<theta\><rprime|'>>|]><dd>\<theta\><rprime|'>.>>>>>
    </equation*>

    An application of <smart-ref|lem:wave-packet-decomposition> allows us to
    conclude that\ 

    <\equation*>
      <around*|\||<big|int><rsub|<wide|\<Theta\>|\<bar\>><rsub|\<Gamma\>><rsup|in>>F<rsup|\<ast\>><around|(|\<theta\><rprime|'>,\<zeta\>,<mf|b><rsup|\<ast\>><rsub|+><around*|(|\<theta\><rprime|'>,\<zeta\>|)>|)><around|[|\<phi\><rsub|\<theta\><rprime|'>>|]><dd>\<theta\><rprime|'>|\|>\<lesssim\>sup<rsub|<wide|\<phi\>|~>><around*|\||<big|int><rsub|<wide|\<Theta\>|\<bar\>><rsub|\<Gamma\>><rsup|in>>F<rsup|\<ast\>><around|(|\<theta\><rprime|'>,\<zeta\>,<mf|b><rsup|\<ast\>><rsub|+><around*|(|\<theta\><rprime|'>,\<zeta\>|)>|)><around|[|<wide|\<phi\>|~>|]><dd>\<theta\><rprime|'>|\|>
    </equation*>

    with the upper bound taken over <math|<wide|\<phi\>|~>\<in\>\<Phi\><rsub|4<gr>><rsup|\<infty\>>>
    with <math|<around*|\<\|\|\>|<wide|\<phi\>|~>|\<\|\|\>><rsub|\<Phi\><rsub|4<gr>><rsup|N-4>>\<leq\>1.>
    To bound the second addend, define <math|\<phi\><rsub|\<theta\><rprime|'>,\<sigma\><rprime|'>>>
    for all <math|\<sigma\><rprime|'>\<in\><around*|(|<frac|<mf|b><rsup|\<ast\>><rsub|+><around*|(|\<theta\><rprime|'>,\<zeta\>|)>|1+<wide|r|\<bar\>>>,<mf|b><rsup|\<ast\>><rsub|+><around*|(|\<theta\><rprime|'>,\<zeta\>|)>|)>>
    for some sufficiently small <math|<wide|r|\<bar\>>\<gtr\>0> by setting\ 

    <\equation*>
      <Dil><rsub|\<sigma\><rprime|'>><Mod><rsub|\<theta\><rprime|'><rsub|\<Gamma\>>>\<phi\><rsub|\<theta\><rprime|'>,\<sigma\><rprime|'>>=<Dil><rsub|<mf|b><rsup|\<ast\>><rsub|+><around*|(|\<theta\><rprime|'>,\<zeta\>|)>><Mod><rsub|\<theta\><rprime|'><rsub|\<Gamma\>>>\<phi\><rsub|\<theta\><rprime|'>>.
    </equation*>

    Note that if <math|<wide|r|\<bar\>>\<gtr\>0> is small enough and since
    <math|><math|<mf|b><rsup|\<ast\>><rsub|+><around*|(|\<zeta\>|)>/<mf|b><rsup|\<ast\>><rsub|-><around*|(|\<zeta\>|)>\<gtr\>C<rsub|sep>/4>
    we have that \ <math|<mf|b><rsup|\<ast\>><rsub|-><around*|(|\<theta\><rprime|'>,\<zeta\>|)>\<less\>\<sigma\><rprime|'>\<less\><mf|b><rsup|\<ast\>><rsub|+><around*|(|\<theta\><rprime|'>,\<zeta\>|)>>
    and <math|\<phi\><rsub|\<theta\><rprime|'>,\<sigma\><rprime|'>>\<in\>\<Phi\><rsub|4<gr>><rsup|\<infty\>>>
    with <math|<around*|\<\|\|\>|\<phi\><rsub|\<theta\><rprime|'>,\<sigma\><rprime|'>>|\<\|\|\>><rsub|\<Phi\><rsub|4<gr>><rsup|N-2>>\<lesssim\>1><math|>.
    An application of <smart-ref|lem:wave-packet-decomposition> allows us to
    conclude that\ 

    <\equation*>
      <ltae|<tformat|<table|<row|<cell|<around*|\||<big|int><rsub|<wide|\<Theta\>|\<bar\>><rsub|\<Gamma\>><rsup|in>>F<rsup|\<ast\>><around|(|\<theta\><rprime|'>,\<zeta\>,<mf|b><rsup|\<ast\>><rsub|+><around*|(|\<theta\><rprime|'>,\<zeta\>|)>|)><around|[|\<phi\><rsub|\<theta\><rprime|'>>|]><dd>\<theta\><rprime|'>|\|>\<lesssim\><around*|\||<big|int><rsub|<wide|\<Theta\>|\<bar\>><rsub|\<Gamma\>><rsup|in>><big|int><rsub|<frac|<mf|b><rsup|\<ast\>><rsub|+><around*|(|\<theta\><rprime|'>,\<zeta\>|)>|1+<wide|r|\<bar\>>>><rsup|<mf|b><rsup|\<ast\>><rsub|+><around*|(|\<theta\><rprime|'>,\<zeta\>|)>>F<rsup|\<ast\>><around|(|\<theta\><rprime|'>,\<zeta\>,<mf|b><rsup|\<ast\>><rsub|+><around*|(|\<theta\><rprime|'>,\<zeta\>|)>|)><around|[|\<phi\><rsub|\<theta\><rprime|'>,\<sigma\><rprime|'>>|]><dd>\<theta\><rprime|'><frac|<dd>\<sigma\><rprime|'>|\<sigma\><rprime|'>>|\|>>>|<row|<cell|sup<rsub|<wide|\<phi\>|~>><big|int><rsub|<wide|\<Theta\>|\<bar\>><rsub|\<Gamma\>><rsup|in>><big|int><rsub|<frac|<mf|b><rsup|\<ast\>><rsub|+><around*|(|\<theta\><rprime|'>,\<zeta\>|)>|1+<wide|r|\<bar\>>>><rsup|<mf|b><rsup|\<ast\>><rsub|+><around*|(|\<theta\><rprime|'>,\<zeta\>|)>><around*|<left|\||1>|F<rsup|\<ast\>><around|(|\<theta\><rprime|'>,\<zeta\>,<mf|b><rsup|\<ast\>><rsub|+><around*|(|\<theta\><rprime|'>,\<zeta\>|)>|)><around|[|<wide|\<phi\>|~>|]>|<right|\||1>><dd>\<theta\><rprime|'>>>>>>
    </equation*>

    with the upper bound taken over <math|<wide|\<phi\>|~>\<in\>\<Phi\><rsub|4<gr>><rsup|\<infty\>>>
    with <math|<around*|\<\|\|\>|<wide|\<phi\>|~>|\<\|\|\>><rsub|\<Phi\><rsub|8<gr>><rsup|N-4>>\<leq\>1.>
    It remains to decompose <math|<FT|\<Upsilon\><rsub|\<sigma\>><rsup|0>>>.
    Recall that \ 

    <\equation*>
      <ltae|<tformat|<cwith|2|2|1|1|cell-halign|l>|<table|<row|<cell|<FT|\<Upsilon\><rsub|\<sigma\>><rsup|0>><around*|(|<FT|z>|)>=<around*|<left|(|2>|1-<FT|\<chi\>><around*|<left|(|1>|4<mf|b><rsup|\<ast\>><rsub|+><around*|(|\<zeta\>|)><FT|z>|<right|)|1>>|<right|)|2>><FT|<Dil><rsub|\<sigma\>>\<Upsilon\>><around*|(|<FT|z>|)>,>>|<row|<cell|<spt><around*|(|<FT|\<Upsilon\><rsub|\<sigma\>><rsup|0>>|)>\<subset\>B<rsub|<frac|1+4<gr>|4\<sigma\>>>\<setminus\>B<rsub|<frac|7|16<mf|b><rsub|+><rsup|\<ast\>><around*|(|\<zeta\>|)>>>.>>>>>
    </equation*>

    For any <math|\<theta\><rprime|'>\<in\><wide|\<Theta\>|\<bar\>><rsub|\<Gamma\>><rsup|ex>>
    it holds that <math|\<theta\><rprime|'><rsub|\<Gamma\>>\<gtr\>2<rsup|-4>>
    or <math|3\<less\>\<theta\><rprime|'><rsub|\<Gamma\>>\<less\>-2<rsup|-4>>

    <\equation*>
      m<rsub|\<theta\><rprime|'><rsub|\<Gamma\>>><around*|(|<FT|z>|)><rsup|>=<big|int><rsub|1><rsup|\<infty\>><FT|\<chi\>><around*|(|\<sigma\><FT|z>-\<theta\><rprime|'><rsub|\<Gamma\>>|)><frac|<dd>\<sigma\>|\<sigma\>>.
    </equation*>

    Note that <math|<spt><around*|(|<FT|\<chi\>><around*|(|\<sigma\><FT|z>-\<theta\><rprime|'><rsub|\<Gamma\>>|)>|)>\<subset\><around*|<left|(|2>|\<sigma\><rsup|-1><around*|(|\<theta\><rprime|'><rsub|\<Gamma\>>-2<gr>|)>,\<sigma\><rsup|-1><around*|(|\<theta\><rprime|'><rsub|\<Gamma\>>+2<gr>|)>|<right|)|2>>>
    and \ <math|<FT|\<chi\>><around*|(|\<sigma\><FT|z>-\<theta\><rprime|'><rsub|\<Gamma\>>|)>=1>
    on \ <math|<around*|<left|(|2>|\<sigma\><rsup|-1><around*|(|\<theta\><rprime|'><rsub|\<Gamma\>>-7<gr>/4|)>,\<sigma\><rsup|-1><around*|(|\<theta\><rprime|'><rsub|\<Gamma\>>+7<gr>/4|)>|<right|)|2>>>.
    It follows that if <math|\<theta\><rprime|'><rsub|\<Gamma\>>> then\ 

    <\equation*>
      <spt><around*|<left|(|1>|m<rsub|\<theta\><rprime|'><rsub|\<Gamma\>>><around*|(|<FT|z>|)><rsup|>|<right|)|1>>\<subset\><around*|<left|(|2>|0,\<theta\><rprime|'><rsub|\<Gamma\>>+2<gr>|<right|)|2>>
    </equation*>

    and\ 

    <\equation*>
      m<rsub|\<theta\><rprime|'><rsub|\<Gamma\>>><around*|(|<FT|z>|)>=<big|int><rsub|0><rsup|\<infty\>><FT|\<chi\>><around*|(|<FT|z>-\<theta\><rprime|'><rsub|\<Gamma\>>|)><frac|<dd><FT|z>|<FT|z>>
    </equation*>

    for <math|<FT|z>\<in\><around*|<left|(|1>|0,\<theta\><rprime|'><rsub|\<Gamma\>>-2<gr>|<right|)|1>>>;
    <math|<big|int><rsub|0><rsup|\<infty\>><FT|\<chi\>><around*|(|<FT|z>-\<theta\><rprime|'><rsub|\<Gamma\>>|)><frac|<dd><FT|z>|<FT|z>>>
    is bounded above and away from <math|0> uniformly in
    <math|\<theta\><rprime|'><rsub|\<Gamma\>>>. It follows that\ 

    <\equation*>
      m<around*|(|<FT|z>|)>=<big|int><rsub|<wide|\<Theta\>|\<bar\>><rsup|ex><rsub|\<Gamma\>>>m<rsub|\<theta\><rprime|'><rsub|\<Gamma\>>><around*|(|<FT|z>|)><dd>\<theta\><rprime|'>
    </equation*>

    satisfies

    <\equation*>
      <spt><around*|<left|(|1>|m<around*|(|<FT|z>|)><rsup|>|<right|)|1>>\<subset\><around*|<left|(|2>|-2-2<gr>,2+2<gr>|<right|)|2>>
    </equation*>

    and\ 

    <\equation*>
      m<around*|(|<FT|z>|)>=<big|int><rsub|<wide|\<Theta\>|\<bar\>><rsup|ex><rsub|\<Gamma\>>><big|int><rsub|0><rsup|\<infty\>><FT|\<chi\>><rsub|<gr>><around*|(|<FT|z>-\<theta\><rprime|'><rsub|\<Gamma\>>|)><frac|<dd><FT|z>|<FT|z>><dd>\<theta\><rprime|'>
    </equation*>

    for <math|<FT|z>\<in\>B<rsub|2<rsup|-6>-2<gr>>>. \ Let us re-define
    <math|m<around*|(|0|)>=lim<rsub|<FT|z>\<rightarrow\>0>m<around*|(|<FT|z>|)>>
    to obtain a smooth function <math|<FT|z>\<rightarrow\>m<around*|(|<FT|z>|)>.>
    Now set <math|M<rsub|\<sigma\><rsub|->,\<sigma\><rsub|+>><around*|(|<FT|z>|)><eqd><frac|m<around*|<left|(|1>|\<sigma\><rsub|-><FT|z>|<right|)|1>>-m<around*|(|\<sigma\><rsub|+><FT|z>|)>|m<around*|(|0|)>>>
    for any <math|\<sigma\><rsub|->\<less\>\<sigma\><rsub|+>>. It holds that\ 

    <\equation*>
      <ltae|<tformat|<cwith|2|2|1|1|cell-halign|l>|<cwith|3|3|1|1|cell-halign|l>|<cwith|4|4|1|1|cell-halign|l>|<cwith|1|1|1|1|cell-halign|l>|<table|<row|<cell|M<rsub|\<sigma\><rsub|->,\<sigma\><rsub|+>><around*|(|<FT|z>|)>\<geq\>0,>>|<row|<cell|M<rsub|\<sigma\><rsub|->,\<sigma\><rsub|+>><around*|(|<FT|z>|)>=0<space|2em><text|if
      ><around*|\||<FT|z>|\|>\<gtr\>2\<sigma\><rsub|-><rsup|-1><around*|(|1+<gr>|)>,>>|<row|<cell|M<rsub|\<sigma\><rsub|->,\<sigma\><rsub|+>><around*|(|<FT|z>|)>=0<space|2em><text|if
      ><around*|\||<FT|z>|\|>\<less\>2\<sigma\><rsub|+><rsup|-1><around*|(|2<rsup|-7>-<gr>|)>,>>|<row|<cell|M<rsub|\<sigma\><rsub|->,\<sigma\><rsub|+>><around*|(|<FT|z>|)>=1
      <space|2em><text|if >2\<sigma\><rsub|+><rsup|-1><around*|(|1+<gr>|)>\<less\><around*|\||<FT|z>|\|>\<less\>2\<sigma\><rsub|-><rsup|-1><around*|(|2<rsup|-7>-<gr>|)>.>>>>>
    </equation*>

    The first claim follows from the fact that

    <\equation*>
      M<rsub|\<sigma\><rsub|->,\<sigma\><rsub|+>><around*|(|<FT|z>|)>=<frac|1|m<around*|(|0|)>><big|int><rsub|<wide|\<Theta\>|\<bar\>><rsup|ex><rsub|\<Gamma\>>><big|int><rsub|\<sigma\><rsub|->><rsup|\<sigma\><rsub|+>><FT|\<chi\>><rsub|<gr>><around*|(|\<sigma\><FT|z>-\<theta\><rprime|'><rsub|\<Gamma\>>|)><frac|<dd>\<sigma\>|\<sigma\>><dd>\<theta\><rprime|'>
    </equation*>

    while subsequent claims follow from support considerations on <math|m>
    above. Let us write

    <\equation*>
      <FT|\<Upsilon\><rsub|\<sigma\>><rsup|0>><around*|(|<FT|z>|)>=M<rsub|<mf|b<rsup|>><rsup|\<ast\>><rsub|-><around*|(|\<zeta\>|)>,<mf|b<rsup|>><rsup|\<ast\>><rsub|+><around*|(|\<zeta\>|)>><around*|(|<FT|z>|)><FT|\<Upsilon\><rsub|\<sigma\>><rsup|0>><around*|(|<FT|z>|)>.
    </equation*>

    This identity holds because of support considerations and since
    <math|<frac|<mf|b><rsup|\<ast\>><rsub|-><around*|(|\<zeta\>|)>C<rsub|sep>|2>\<less\>\<sigma\>\<less\><mf|b><rsub|-><rsup|\<ast\>><around*|(|\<zeta\>|)>>.
    We obtain that\ 

    <\equation*>
      <ltae|<tformat|<cwith|1|1|1|1|cell-halign|l>|<table|<row|<cell|<FT|\<Upsilon\><rsub|\<sigma\>><rsup|0>><around*|(|<FT|z>|)>=<big|int><rsub|<wide|\<Theta\>|\<bar\>><rsup|ex><rsub|\<Gamma\>>><big|int><rsub|0><rsup|\<infty\>><FT|\<Upsilon\><rsub|\<sigma\>><rsup|0>><around*|(|<FT|z>|)><FT|\<chi\>><rsub|<gr>><around*|(|\<sigma\><rprime|'><FT|z>-\<theta\><rprime|'><rsub|\<Gamma\>>|)><frac|<dd>\<sigma\><rprime|'>|\<sigma\><rprime|'>><dd>\<theta\><rprime|'>>>|<row|<cell|<space|2em>=<big|int><rsub|<wide|\<Theta\>|\<bar\>><rsup|ex><rsub|\<Gamma\>>><big|int><rsub|0><rsup|\<infty\>><around*|<left|(|2>|1-<FT|\<chi\>><around*|<left|(|1>|4<mf|b><rsup|\<ast\>><rsub|+><around*|(|\<zeta\>|)><FT|z>|<right|)|1>>|<right|)|2>>\<sigma\><FT|z><FT|\<phi\>><around*|(|\<sigma\><FT|z>-\<theta\><rsub|\<Gamma\>>|)><FT|\<chi\>><rsub|<gr>><around*|(|\<sigma\><rprime|'><FT|z>-\<theta\><rprime|'><rsub|\<Gamma\>>|)><frac|<dd>\<sigma\><rprime|'>|\<sigma\><rprime|'>><dd>\<theta\><rprime|'>>>>>>
    </equation*>

    By support considerations it holds that\ 

    <\equation*>
      <FT|\<phi\>><around*|(|\<sigma\><FT|z>-\<theta\><rsub|\<Gamma\>>|)><FT|\<chi\>><rsub|<gr>><around*|(|\<sigma\><rprime|'><FT|z>-\<theta\><rprime|'><rsub|\<Gamma\>>|)>=0
    </equation*>

    unless <math|\<sigma\><rprime|'>\<gtrsim\>\<sigma\>> and
    <math|<around*|<left|(|2>|1-<FT|\<chi\>><around*|<left|(|1>|4<mf|b><rsup|\<ast\>><rsub|+><around*|(|\<zeta\>|)><FT|z>|<right|)|1>>|<right|)|2>><FT|\<chi\>><rsub|<gr>><around*|(|\<sigma\><rprime|'><FT|z>-\<theta\><rprime|'><rsub|\<Gamma\>>|)>=0>
    unless <math|\<sigma\><rprime|'>\<gtrsim\><mf|b><rsup|\<ast\>><rsub|+><around*|(|\<zeta\>|)><FT|z>>.
    It follows that setting\ 

    <\equation*>
      \<phi\><rsub|\<theta\><rprime|'>,\<sigma\><rprime|'>><around*|(|\<sigma\><rprime|'><FT|z>-\<theta\><rprime|'><rsub|\<Gamma\>>|)><eqd><around*|<left|(|2>|1-<FT|\<chi\>><around*|<left|(|1>|4<mf|b><rsup|\<ast\>><rsub|+><around*|(|\<zeta\>|)><FT|z>|<right|)|1>>|<right|)|2>>\<sigma\><rprime|'><FT|z><FT|\<phi\>><around*|(|\<sigma\><FT|z>-\<theta\><rsub|\<Gamma\>>|)><FT|\<chi\>><rsub|<gr>><around*|(|\<sigma\><rprime|'><FT|z>-\<theta\><rprime|'><rsub|\<Gamma\>>|)>
    </equation*>

    we obtain a function <math|\<phi\><rsub|\<theta\><rprime|'>,\<zeta\><rprime|'>,\<sigma\><rprime|'>>\<in\>\<Phi\><rsub|2<gr>><rsup|N>>
    with <math|<around*|\<\|\|\>|\<phi\><rsub|\<theta\><rprime|'>,\<zeta\><rprime|'>,\<sigma\><rprime|'>>|\<\|\|\>><rsub|\<Phi\><rsub|2<gr>><rsup|N>><rsub|>\<lesssim\>1>
    so\ 

    <\equation*>
      <FT|\<Upsilon\><rsub|\<sigma\>><rsup|0>><around*|(|<FT|z>|)>=<big|int><rsub|<wide|\<Theta\>|\<bar\>><rsup|ex><rsub|\<Gamma\>>><big|int><rsub|0><rsup|\<infty\>><frac|\<sigma\>|\<sigma\><rprime|'>><1><rsub|\<sigma\><rprime|'>\<gtr\>a\<sigma\>>\<phi\><rsub|\<theta\><rprime|'>,\<zeta\><rprime|'>,\<sigma\><rprime|'>><around*|(|\<sigma\><rprime|'><FT|z>-\<theta\><rprime|'><rsub|\<Gamma\>>|)><frac|<dd>\<sigma\><rprime|'>|\<sigma\><rprime|'>><dd>\<theta\><rprime|'>.
    </equation*>

    or some <math|a\<gtr\>0>. Making sure to choose
    <math|C<rsub|sep>\<gtr\><frac|4|a>> and applying
    <smart-ref|lem:wave-packet-decomposition> allows us to conclude that\ 

    <\equation*>
      <around*|\||f\<ast\>\<Upsilon\><rsub|\<sigma\>><rsup|0><around*|(|\<zeta\>|)>|\|>\<lesssim\>sup<rsub|<wide|\<phi\>|~>><big|int><rsub|<wide|\<Theta\>|\<bar\>><rsup|ex><rsub|\<Gamma\>>><big|int><rsub|0><rsup|\<infty\>><frac|\<sigma\>|\<sigma\><rprime|'>><1><rsub|\<sigma\><rprime|'>\<gtr\>a\<sigma\>><around*|<left|\||2>|F<rsup|\<ast\>><around*|(|\<theta\><rprime|'>,\<zeta\><rprime|'>,\<sigma\><rprime|'>|)><around*|[|<wide|\<phi\>|~>|]>|<right|\||2>><frac|<dd>\<sigma\><rprime|'>|\<sigma\><rprime|'>><dd>\<theta\><rprime|'>.
    </equation*>

    with the upper bound taken over <math|<wide|\<phi\>|~>\<in\>\<Phi\><rsub|4<gr>><rsup|\<infty\>>>
    with <math|<around*|\<\|\|\>|<wide|\<phi\>|~>|\<\|\|\>><rsub|\<Phi\><rsub|8<gr>><rsup|N-4>>\<leq\>1>,
    as required.\ 
  </proof>

  <\lemma>
    <label|lem:unif-max-size-domination><dueto|Maximal size domination>Let
    <math|V<rsup|+>,V<rsup|->\<in\>\<bbb-D\><rsup|\<cup\>><rsub|\<beta\>>>,
    and let <math|W<rsup|+>,W<rsup|->\<in\><TT><rsub|\<Theta\>><rsup|\<cup\>>>.
    The bounds

    <\equation>
      <ltae|<tformat|<cwith|1|1|1|1|cell-halign|l>|<table|<row|<cell|<around|\<\|\|\>|<1><rsub|<around*|(|V<rsup|+>\<cap\>W<rsup|+>|)>\<setminus\><around*|(|V<rsup|->\<cup\>W<rsup|->|)>><around*|(|<Emb><around*|[|f|]>\<circ\>\<Gamma\>|)>|\<\|\|\>><rsub|\<Gamma\><rsup|\<ast\>><rsup|><SL><rsup|<around*|(|u,\<infty\>|)>><rsub|<around*|(|\<Theta\>,\<Theta\><rsup|in>|)>>\<Phi\><rsub|<gr>><rsup|N>><space|2em>>>|<row|<cell|<space|2em>\<lesssim\>\<beta\><rsup|-<frac|1|u>><around|\<\|\|\>|<1><rsub|<around*|(|V<rsup|+>\<cap\>W<rsup|+>|)>\<setminus\><around*|(|V<rsup|->\<cup\>W<rsup|->|)>><around*|(|<Emb><around*|[|f|]>\<circ\>\<Gamma\>|)>|\<\|\|\>><rsub|<around*|(|\<Gamma\><rsup|\<ast\>><rsup|><SL><rsup|<around|(|u,2|)>><rsub|<around|(|\<Theta\>,\<Theta\><rsup|ex>|)>>\<Phi\><rsub|4<gr>><rsup|N-2>+\<Gamma\><rsup|\<ast\>><rsup|><SL><rsup|<around*|(|u,1|)>><rsub|\<Theta\>><dfct><rsup|N-2><rsub|4<gr>>|)>>,>>>>><label|eq:unif-max-size-domination>
    </equation>

    hold for any <math|f\<in\><Sch><around*|(|<R>|)>> as long as
    <math|u\<in\><around*|[|2,\<infty\>|]>>. The implicit constant is
    independent of <math|f> and of the sets
    <math|V<rsup|\<pm\>>,W<rsup|\<pm\>>>.
  </lemma>

  <\proof>
    Let us fix <math|T\<in\>\<bbb-T\><rsub|\<Theta\>>> and show that\ 

    <\equation*>
      <around|\<\|\|\>|<1><rsub|<around*|(|V<rsup|+>\<cap\>W<rsup|+>|)>\<setminus\><around*|(|V<rsup|->\<cup\>W<rsup|->|)>><around*|(|<Emb><around*|[|f|]>\<circ\>\<Gamma\>|)>|\<\|\|\>><rsub|\<Gamma\><rsup|\<ast\>><rsup|><SL><rsup|<around*|(|u,\<infty\>|)>><rsub|<around*|(|\<Theta\>,\<Theta\><rsup|in>|)>>\<Phi\><rsub|<gr>><rsup|N><around*|(|T|)>>\<lesssim\><RHS|<eqref|eq:unif-lac-size-domination>.>
    </equation*>

    By symmetry, (see <eqref|eq:size-symmetry> and the subsequent
    discussion), we can assume that <math|T=T<rsub|\<Theta\>><rsub|><around*|(|0,0,1|)>>
    so that

    <\equation*>
      \<Gamma\>\<circ\>\<pi\><rsub|T><around*|(|\<theta\>,\<zeta\>,\<sigma\>|)>=<around*|(|\<alpha\>\<beta\><around*|(|\<theta\>+\<gamma\>|)><around*|(|\<beta\>\<sigma\>|)><rsup|-1>,\<zeta\>,\<beta\>\<sigma\>|)>=<around*|<left|(|1>|\<theta\><rsub|\<Gamma\>><around*|(|\<beta\>\<sigma\>|)><rsup|-1>,\<zeta\>,\<beta\>\<sigma\>|<right|)|1>>=\<pi\><rsub|T><around*|(|\<theta\><rsub|\<Gamma\>>,\<zeta\>,\<beta\>\<sigma\>|)>.
    </equation*>

    We use the shorthand <math|E<rsub|+><rsup|\<ast\>>\<assign\><mT><rsub|\<Theta\><rsup|in>><rsup|>\<cap\>\<pi\><rsub|T><rsup|-1><around|(|V<rsup|+>\<cap\>W<rsup|+>|)>>,
    <math|E<rsub|-><rsup|\<ast\>>\<assign\>\<pi\><rsub|T><rsup|-1><around|(|V<rsup|->\<cup\>W<rsup|->|)>>,
    and <math|F<rsup|\<ast\>><eqd><1><rsub|E<rsub|+><rsup|\<ast\>>\<setminus\>E<rsub|-><rsup|\<ast\>>><Emb|><around*|[|f|]>\<circ\>\<Gamma\>\<circ\>\<pi\><rsub|T>>.
    We have that\ 

    <\equation*>
      <ltae|<tformat|<cwith|1|1|1|1|cell-halign|l>|<table|<row|<cell|<around|\<\|\|\>|<1><rsub|<around*|(|V<rsup|+>\<cap\>W<rsup|+>|)>\<setminus\><around*|(|V<rsup|->\<cup\>W<rsup|->|)>><around*|(|<Emb><around*|[|f|]>\<circ\>\<Gamma\>|)>|\<\|\|\>><rsub|\<Gamma\><rsup|\<ast\>><rsup|><SL><rsup|<around*|(|u,\<infty\>|)>><rsub|<around*|(|\<Theta\>,\<Theta\><rsup|in>|)>>\<Phi\><rsub|<gr>><rsup|N><around*|(|T|)>>>>|<row|<cell|=sup<rsub|\<phi\>>
      sup<rsub|\<sigma\>><big|int><rsub|\<Theta\><rsup|in>\<times\>B<rsub|1>>F<rsup|\<ast\>><around*|(|\<theta\>,\<zeta\>,\<sigma\><around*|(|\<theta\>,\<zeta\>|)>|)><around*|[|\<phi\>|]><rsup|u><frac|<dd>\<theta\><dd>\<zeta\>|<around*|\||\<Theta\>|\|>>>>>>>
    </equation*>

    where the upper bound is taken over all
    <math|\<phi\>\<in\>\<Phi\><rsup|\<infty\>><rsub|<gr>>> with
    <math|<around*|\<\|\|\>|\<phi\>|\<\|\|\>><rsub|\<Phi\><rsup|N><rsub|<gr>>>\<leq\>1>
    and over all continuous functions <math|\<sigma\>:\<Theta\>\<times\>B<rsub|1>\<rightarrow\><around*|(|0,+\<infty\>|)>>.
    Let <math|<mf|b><rsub|+><rsup|\<ast\>>>,
    <math|<mf|b><rsub|-><rsup|\<ast\>>> be the two functions whose graphs are
    the boundaries of <math|E<rsub|+><rsup|\<ast\>>> and
    <math|E<rsub|-><rsup|\<ast\>>> respectively so that
    <math|E<rsub|+><rsup|\<ast\>>\<setminus\>E<rsub|-><rsup|\<ast\>>=<around*|<left|{|1>|<around*|(|\<theta\>,\<zeta\>,\<sigma\>|)>:<mf|b><rsub|-><rsup|\<ast\>><around*|(|\<theta\>,\<zeta\>|)>\<less\>\<sigma\>\<less\><mf|b><rsub|+><rsup|\<ast\>><around*|(|\<theta\>,\<zeta\>|)>|<right|}|1>>>.
    The existence of such functions is guaranteed by
    <smart-ref|lem:geometry-of-boundary>. Let <math|<wide|r|\<bar\>>\<gtr\>0>
    be a small absolute constant to depending only on <math|<gr>> be
    determined later. We distinguish the points
    <math|<around*|(|\<theta\>,\<zeta\>|)>> based on how far
    <math|\<sigma\><around*|(|\<theta\>,\<zeta\>|)>> is from the boundary of
    <math|E<rsub|+><rsup|\<ast\>>\<setminus\>E<rsub|-><rsup|\<ast\>>>. Let

    <\equation*>
      <ltae|<tformat|<cwith|1|1|1|1|cell-halign|l>|<cwith|2|2|1|1|cell-halign|l>|<table|<row|<cell|U<rsub|-><eqd><around*|<left|{|2>|<around*|(|\<theta\>,\<zeta\>|)>\<in\>\<Theta\><rsup|in>\<times\>B<rsub|1>\<suchthat\><mf|b><rsub|-><rsup|\<ast\>><around*|(|\<theta\>,\<zeta\>|)>\<leq\>\<sigma\><around*|(|\<theta\>,\<zeta\>|)>\<less\><around*|(|1+<wide|r|\<bar\>>|)><mf|b><rsub|-><rsup|\<ast\>><around*|(|\<theta\>,\<zeta\>|)>|<right|}|2>>,>>|<row|<cell|U<rsub|+><eqd><around*|<left|{|2>|<around*|(|\<theta\>,\<zeta\>|)>\<in\>\<Theta\><rsup|in>\<times\>B<rsub|1>\<suchthat\><around*|(|1-<wide|r|\<bar\>>|)><mf|b><rsub|+><rsup|\<ast\>><around*|(|\<theta\>,\<zeta\>|)>\<less\>\<sigma\><around*|(|\<theta\>,\<zeta\>|)>\<leq\><mf|b><rsub|+><rsup|\<ast\>><around*|(|\<theta\>,\<zeta\>|)>|<right|}|2>>,>>|<row|<cell|U<rsub|0><eqd><around*|<left|{|2>|<around*|(|\<theta\>,\<zeta\>|)>\<in\>\<Theta\><rsup|in>\<times\>B<rsub|1>\<suchthat\><around*|(|1+<wide|r|\<bar\>>|)><mf|b><rsub|-><rsup|\<ast\>><around*|(|\<theta\>,\<zeta\>|)>\<leq\>\<sigma\><around*|(|\<theta\>,\<zeta\>|)>\<leq\><around*|(|1-<wide|r|\<bar\>>|)><mf|b><rsub|+><rsup|\<ast\>><around*|(|\<theta\>,\<zeta\>|)>|<right|}|2>>.>>>>>
    </equation*>

    If <math|<around*|(|\<theta\>,\<zeta\>|)>\<in\>U<rsub|->> we use that\ 

    <\equation*>
      <around*|(|<Emb><around*|[|f|]>\<circ\>\<Gamma\>|)><around*|<left|(|1>|\<theta\>,\<zeta\>,\<sigma\><around*|(|\<theta\>,\<zeta\>|)>|<right|)|1>><around*|[|\<phi\>|]>=<around*|(|<Emb><around*|[|f|]>\<circ\>\<Gamma\>|)><around*|<left|(|1>|\<theta\>,\<zeta\>,<mf|b><rsub|-><rsup|\<ast\>><around*|(|\<theta\>,\<zeta\>|)>|<right|)|1>><around*|[|\<phi\><rsub|<around*|(|\<theta\>,\<zeta\>|)>>|]>
    </equation*>

    with\ 

    <\equation*>
      \<phi\><rsub|<around*|(|\<theta\>,\<zeta\>|)>><eqd><Mod><rsub|\<theta\><rsub|\<Gamma\>>><Dil><rsub|\<sigma\><around*|(|\<theta\>,\<zeta\>|)>/<mf|b><rsub|-><rsup|\<ast\>><around*|(|\<theta\>,\<zeta\>|)>><Mod><rsub|-\<theta\><rsub|\<Gamma\>>>\<phi\>.
    </equation*>

    Since <math|1\<leq\>\<sigma\><around*|(|\<theta\>,\<zeta\>|)>/<mf|b><rsub|-><rsup|\<ast\>><around*|(|\<theta\>,\<zeta\>|)>\<less\>1+<wide|r|\<bar\>>>
    we have that <math|\<phi\><rsub|<around*|(|\<theta\>,\<zeta\>|)>>\<in\>\<Phi\><rsub|2<gr>><rsup|\<infty\>>>
    with <math|<around*|\<\|\|\>|\<phi\><rsub|<around*|(|\<theta\>,\<zeta\>|)>>|\<\|\|\>><rsub|\<Phi\><rsub|2<gr>><rsup|N>>\<lesssim\>1>.
    Using <smart-ref|lem:wave-packet-decomposition> we get that\ 

    <\equation*>
      <ltae|<tformat|<cwith|1|1|1|1|cell-halign|l>|<table|<row|<cell|<big|int><rsub|\<Theta\><rsup|in>\<times\>B<rsub|1>><1><rsub|U<rsub|->><around*|(|\<theta\>,\<zeta\>|)>F<rsup|\<ast\>><around*|(|\<theta\>,\<zeta\>,\<sigma\><around*|(|\<theta\>,\<zeta\>|)>|)><around*|[|\<phi\>|]><rsup|u><frac|<dd>\<theta\><dd>\<zeta\>|<around*|\||\<Theta\>|\|>>>>|<row|<cell|<space|2em>\<lesssim\>sup<rsub|<wide|\<phi\>|~>><big|int><rsub|\<Theta\><rsup|in>\<times\>B<rsub|1>><1><rsub|U<rsub|->><around*|(|\<theta\>,\<zeta\>|)>F<rsup|\<ast\>><around*|<left|(|1>|\<theta\>,\<zeta\>,<mf|b><rsub|-><rsup|\<ast\>><around*|(|\<theta\>,\<zeta\>|)>|<right|)|1>><around*|[|\<phi\>|]><rsup|u><frac|<dd>\<theta\><dd>\<zeta\>|<around*|\||\<Theta\>|\|>>>>>>>
    </equation*>

    with the upper bound taken over <math|<wide|\<phi\>|~>\<in\>\<Phi\><rsub|2<gr>><rsup|\<infty\>>>
    with <math|<around*|\<\|\|\>|<wide|\<phi\>|~>|\<\|\|\>><rsub|\<Phi\><rsub|4<gr>><rsup|N-2>>\<leq\>1>.
    The <RHS|> of the entry above is bounded by
    \ <math|<around|\<\|\|\>|<1><rsub|<around*|(|V<rsup|+>\<cap\>W<rsup|+>|)>\<setminus\><around*|(|V<rsup|->\<cup\>W<rsup|->|)>><around*|(|<Emb><around*|[|f|]>\<circ\>\<Gamma\>|)>|\<\|\|\>><rsub|\<Gamma\><rsup|\<ast\>><rsup|><SL><rsup|<around*|(|u,1|)>><rsub|\<Theta\>><dfct><rsup|N-2><rsub|4<gr>><around*|(|T|)>>>
    and thus by <math|<RHS|<eqref|eq:unif-lac-size-domination><rsup|u>>>, as
    required. The same procedure applies to the case when
    <math|<around*|(|\<theta\>,\<zeta\>|)>\<in\>U<rsub|+>>: Set
    <math|\<phi\><rsub|<around*|(|\<theta\>,\<zeta\>|)>><eqd><Mod><rsub|\<theta\><rsub|\<Gamma\>>><Dil><rsub|\<sigma\><around*|(|\<theta\>,\<zeta\>|)>/<mf|b><rsub|+><rsup|\<ast\>><around*|(|\<theta\>,\<zeta\>|)>><Mod><rsub|-\<theta\><rsub|\<Gamma\>>>\<phi\>>
    to obtain that\ 

    <\equation*>
      <ltae|<tformat|<cwith|1|1|1|1|cell-halign|l>|<table|<row|<cell|<big|int><rsub|\<Theta\><rsup|in>\<times\>B<rsub|1>><1><rsub|U<rsub|+>><around*|(|\<theta\>,\<zeta\>|)>F<rsup|\<ast\>><around*|(|\<theta\>,\<zeta\>,\<sigma\><around*|(|\<theta\>,\<zeta\>|)>|)><around*|[|\<phi\>|]><rsup|u><frac|<dd>\<theta\><dd>\<zeta\>|<around*|\||\<Theta\>|\|>>>>|<row|<cell|<space|2em>\<lesssim\>sup<rsub|<wide|\<phi\>|~>><big|int><rsub|\<Theta\><rsup|in>\<times\>B<rsub|1>><1><rsub|U<rsub|->><around*|(|\<theta\>,\<zeta\>|)>F<rsup|\<ast\>><around*|<left|(|1>|\<theta\>,\<zeta\>,<mf|b><rsub|+><rsup|\<ast\>><around*|(|\<theta\>,\<zeta\>|)>|<right|)|1>><around*|[|\<phi\>|]><rsup|u><frac|<dd>\<theta\><dd>\<zeta\>|<around*|\||\<Theta\>|\|>>\<lesssim\><RHS|<eqref|eq:unif-lac-size-domination><rsup|u>>.>>>>>
    </equation*>

    \;

    In the case <math|<around*|(|\<theta\>,\<zeta\>|)>\<in\>U<rsub|0>> we
    will just show the pointwise bound <math|<around*|<left|\||2>|F<rsup|\<ast\>><around*|(|\<theta\>,\<zeta\>,\<sigma\><around*|(|\<theta\>,\<zeta\>|)>|)><around*|[|\<phi\>|]>|<right|\||2>>\<lesssim\><RHS|<eqref|eq:unif-lac-size-domination>>>.
    Integrating this bound will yield the claim. Let
    <math|<wide|W|~><rsup|-><eqd>W<rsup|->\<cup\>T<rsub|\<Theta\>><around*|(|0,\<zeta\>,\<sigma\><around*|(|\<theta\>,\<zeta\>|)>|)>>;
    let <math|<wide|E|~><rsub|-><rsup|\<ast\>>=E<rsub|-><rsup|\<ast\>>\<cup\>\<pi\><rsub|T><rsup|-1><around*|<left|(|1>|T<rsub|\<Theta\>><around*|(|0,\<zeta\>,\<sigma\><around*|(|\<theta\>,\<zeta\>|)>|)>|<right|)|1>>>
    and let <math|><math|<mf|<wide|b|~><rsub|-><rsup|\<ast\>>>:<R><rsup|2>\<rightarrow\><R><rsub|+>>
    be the function given by <smart-ref|lem:geometry-of-boundary> such that
    its graphs is the boundary of the set
    <math|<wide|E|~><rsub|-><rsup|\<ast\>>>. For any
    <math|<around*|<left|(|1>|\<theta\><rprime|'>,\<zeta\><rprime|'>,<wide|<mf|b>|~><rsub|-><rsup|\<ast\>><around*|(|\<theta\><rprime|'>,\<zeta\><rprime|'>|)>|<right|)|1>>\<in\>E<rsup|\<ast\>><rsub|+>\<setminus\><wide|E|~><rsup|\<ast\>><rsub|->>
    it holds that\ 

    <\equation*>
      F<rsup|\<ast\>><around*|<left|(|1>|\<theta\>,\<zeta\>,\<sigma\><around*|(|\<theta\>,\<zeta\>|)>|<right|)|1>><around*|[|\<phi\>|]>=F<rsup|\<ast\>><around*|<left|(|1>|\<theta\><rprime|'>,\<zeta\><rprime|'>,<wide|<mf|b>|~><rsub|-><rsup|\<ast\>><around*|(|\<theta\><rprime|'>,\<zeta\><rprime|'>|)>|<right|)|1>><around*|[|\<phi\><rsub|<around*|(|\<theta\><rprime|'>,\<zeta\><rprime|'>|)>>|]>
    </equation*>

    with <math|\<phi\><rsub|<around*|(|\<theta\><rprime|'>,\<zeta\><rprime|'>|)>>>
    defined by the relation

    <\equation*>
      <Tr><rsub|\<zeta\><rprime|'>><Dil><rsub|\<beta\><wide|<mf|b>|~><rsub|-><rsup|\<ast\>><around*|(|\<theta\><rprime|'>,\<zeta\><rprime|'>|)>><Mod><rsub|-\<theta\><rsub|\<Gamma\>>>\<phi\><rsub|<around*|(|\<theta\><rprime|'>,\<zeta\><rprime|'>|)>><eqd><Tr><rsub|\<zeta\>><Dil><rsub|\<beta\>\<sigma\><around*|(|\<theta\>,\<zeta\>|)>><Mod><rsub|-\<theta\><rsub|\<Gamma\>>>\<phi\>.
    </equation*>

    If <math|<around*|\||\<zeta\><rprime|'>-\<zeta\>|\|>\<less\><rsup|><wide|r|\<bar\>><rsup|2>\<beta\>
    \<sigma\><around*|(|\<theta\>,\<zeta\>|)>> and
    <math|\<theta\><rprime|'>\<in\>B<rsub|<wide|r|\<bar\>><rsup|2>><around*|(|\<theta\>|)>\<cap\>\<Theta\><rsup|in><rsub|>>
    it holds that <math|><math|<wide|<mf|b>|~><rsub|-><rsup|\<ast\>><around*|(|\<theta\><rprime|'>,\<zeta\><rprime|'>|)>\<less\><mf|b><rsub|+<rsub|>><rsup|\<ast\>><around*|(|\<theta\><rprime|'>,\<zeta\><rprime|'>|)>>
    given the continuity assumptions <eqref|eq:boundary-regularity-local> on
    <math|<wide|<mf|b>|~><rsub|-><rsup|\<ast\>>> and
    <math|<mf|b><rsub|+><rsup|\<ast\>>> and since
    <math|<mf|b><rsub|+<rsub|>><rsup|\<ast\>><around*|(|\<theta\>,\<zeta\>|)>\<gtr\><around*|(|1-<wide|r|\<bar\>>|)><rsup|-1>\<sigma\><around*|(|\<theta\>,\<zeta\>|)>=<wide|<mf|b>|~><rsub|-><rsup|\<ast\>><around*|(|\<theta\>,\<zeta\>|)>>.
    Furthermore, we have that <math|\<phi\><rsub|<around*|(|\<theta\><rprime|'>,\<zeta\><rprime|'>|)>>\<in\>\<Phi\><rsub|2<gr>><rsup|\<infty\>>>
    with <math|<around*|\<\|\|\>|\<phi\><rsub|<around*|(|\<theta\><rprime|'>,\<zeta\><rprime|'>|)>>|\<\|\|\>><rsub|\<Phi\><rsup|N><rsub|2<gr>>>\<lesssim\>1>.
    It follows that\ 

    <\equation*>
      <ltae|<tformat|<cwith|1|1|1|1|cell-halign|l>|<table|<row|<cell|<around*|<left|\||2>|F<rsup|\<ast\>><around*|<left|(|1>|\<theta\>,\<zeta\>,\<sigma\><around*|(|\<theta\>,\<zeta\>|)>|<right|)|1>><around*|[|\<phi\>|]>|<right|\||2>>>>|<row|<cell|<space|2em>\<lesssim\><frac|1|\<beta\>\<sigma\><around*|(|\<theta\>,\<zeta\>|)><wide|r|\<bar\>><rsup|4>>sup<rsub|<wide|\<phi\>|~>><big|int><rsub|<around*|(|B<rsub|<wide|r|\<bar\>><rsup|2>><around*|(|\<theta\>|)>\<cap\>\<Theta\><rsup|in><rsub|>|)>\<cap\><wide|r|\<bar\>><rsup|2>\<beta\>
      \<sigma\><around*|(|\<theta\>,\<zeta\>|)>><rsub|><around*|<left|\||2>|F<rsup|\<ast\>><around*|<left|(|1>|\<theta\><rprime|'>,\<zeta\><rprime|'>,<wide|<mf|b>|~><rsub|-><rsup|\<ast\>><around*|(|\<theta\><rprime|'>,\<zeta\><rprime|'>|)>|<right|)|1>><around*|[|<wide|\<phi\>|~>|]>|<right|\||2>><dd>\<theta\><rprime|'><dd>\<zeta\><rprime|'>>>|<row|<cell|\<lesssim\><around|<left|\<\|\|\>|1>|<1><rsub|<around*|(|V<rsup|+>\<cap\>W<rsup|+>|)>\<setminus\><around*|(|V<rsup|->\<cup\><wide|W|~><rsup|->|)>><around*|(|<Emb><around*|[|f|]>\<circ\>\<Gamma\>|)>|<right|\<\|\|\>|1>><rsub|\<Gamma\><rsup|\<ast\>><rsup|><SL><rsup|<around*|(|1,\<infty\>|)>><rsub|<around*|(|\<Theta\>,\<Theta\><rsup|in>|)>><dfct><rsup|N-2><rsub|4<gr>><around*|(|T<rprime|'>|)>>>>>>>
    </equation*>

    with <math|T<rprime|'>=T<rsub|\<Theta\>><around*|<left|(|2>|0,\<zeta\>,10\<sigma\><around*|(|\<theta\>,\<zeta\>|)>|<right|)|2>>>.
    Since\ 

    <\equation*>
      <ltae|<tformat|<cwith|1|1|1|1|cell-halign|l>|<table|<row|<cell|<around|<left|\<\|\|\>|1>|<1><rsub|<around*|(|V<rsup|+>\<cap\>W<rsup|+>|)>\<setminus\><around*|(|V<rsup|->\<cup\><wide|W|~><rsup|->|)>><around*|(|<Emb><around*|[|f|]>\<circ\>\<Gamma\>|)>|<right|\<\|\|\>|1>><rsub|\<Gamma\><rsup|\<ast\>><rsup|><SL><rsup|<around*|(|1,\<infty\>|)>><rsub|<around*|(|\<Theta\>,\<Theta\><rsup|in>|)>><dfct><rsup|N-2><rsub|4<gr>><around*|(|T<rprime|'>|)>>>>|<row|<cell|<space|2em>\<lesssim\><around|<left|\<\|\|\>|1>|<1><rsub|<around*|(|V<rsup|+>\<cap\>W<rsup|+>|)>\<setminus\><around*|(|V<rsup|->\<cup\><wide|W|~><rsup|->|)>><around*|(|<Emb><around*|[|f|]>\<circ\>\<Gamma\>|)>|<right|\<\|\|\>|1>><rsub|\<Gamma\><rsup|\<ast\>><rsup|><SL><rsup|<around*|(|u,\<infty\>|)>><rsub|<around*|(|\<Theta\>,\<Theta\><rsup|in>|)>><dfct><rsup|N-2><rsub|4<gr>><around*|(|T<rprime|'>|)>>>>>>>
    </equation*>

    This concludes the proof.\ 
  </proof>

  \;

  <section|Uniform embedding bounds - bilinear case
  <label|sec:uniform-embeddings:bilinear>>

  In this section we prove the bilinear embedding bounds
  <smart-ref|eq:embedding-bound:bilinear> of
  <smart-ref|thm:uniform-embedding-bounds:bilinear>. It is noteworthy that
  all but the last size <math|\<Gamma\><rsub|\<times\>><rsup|\<ast\>><SL><rsub|<around*|(|\<Theta\><rsub|>,\<Theta\><rsup|in>|)>><rsup|<around*|(|u<rsub|>,1|)>><dfct><rsub|<gr>><rsup|N<rsup|>>>
  appearing in the expression of <math|<SU><rsup|u<rsub|>><rsub|\<Gamma\><rsub|\<times\>>>\<Phi\><rsub|<mf|r>><rsup|N>>
  can be bound using sizes <math|<SU><rsup|u><rsub|\<Gamma\><rsub|j>>\<Phi\><rsub|<mf|r>><rsup|N>>,
  <math|j\<in\><around*|{|2,3|}>>. Thus, an application of the outer Hölder
  inequality (<smart-ref|cor:outer-holder-classical>) can yields bounds
  <smart-ref|eq:embedding-bound:bilinear> with
  <math|<SO><rsup|u<rsub|\<times\>>><rsub|\<Gamma\><rsub|\<times\>>>\<Phi\><rsub|<gr>><rsup|N>>
  in place of <math|<SU><rsup|u<rsub|>><rsub|\<Gamma\><rsub|\<times\>>>\<Phi\><rsub|<mf|r>><rsup|N>>
  where\ 

  <\equation>
    <ltae|<tformat|<table|<row|<cell|<SO><rsup|u<rsub|\<times\>>><rsub|\<Gamma\><rsub|\<times\>>>\<Phi\><rsub|<gr>><rsup|N><eqd><tabular|<tformat|<cwith|1|1|1|1|cell-halign|l>|<twith|table-valign|T>|<cwith|2|2|1|1|cell-halign|l>|<table|<row|<cell|\<beta\><rsup|<frac|1|u<rsub|\<times\>>>><around*|(|\<Gamma\><rsub|\<times\>><rsup|\<ast\>><SL><rsub|<around*|(|\<Theta\>,\<Theta\><rsup|in>|)><rsub|>><rsup|<around*|(|u<rsub|\<times\>><rsub|>,2|)>><around*|(|\<Phi\>\<otimes\><wpD>|)><rsub|<gr>><rsup|N>+\<Gamma\><rsub|\<times\>><rsup|\<ast\>><SL><rsub|<around*|(|\<Theta\>,\<Theta\><rsup|in>|)><rsub|>><rsup|<around*|(|u<rsub|\<times\>><rsub|>,2|)>><around*|(|<wpD>\<otimes\>\<Phi\>|)><rsub|<gr>><rsup|N>+\<Gamma\><rsub|\<times\>><rsup|\<ast\>><SL><rsup|><rsub|><rsup|<around*|(|u<rsub|\<times\>>,\<infty\>|)>><rsub|
    <around*|(|\<Theta\>,\<Theta\><rsup|in>|)>><around*|(|\<Phi\>\<otimes\>\<Phi\>|)><rsub|<gr>><rsup|N<rsup|>>|)>>>|<row|<cell|<space|2.0em>+\<Gamma\><rsub|\<times\>><rsup|\<ast\>><SL><rsup|><rsub|><rsup|<around*|(|u<rsub|\<times\>>,1|)>><rsub|
    \<Theta\>><around*|(|<wpD>\<otimes\><wpD>|)><rsub|<gr>><rsup|N<rsup|>>.>>>>>>>>>><label|eq:uniform-embedding-full-size:bilinear-holder>

    \;
  </equation>

  We show this in <smart-ref|prop:bilinear-holder-bound>. It then remains to
  show the validity of bound <smart-ref|eq:embedding-bound:bilinear> with the
  size <math|\<Gamma\><rsub|\<times\>><rsup|\<ast\>><SL><rsub|<around*|(|\<Theta\><rsub|>,\<Theta\><rsup|in>|)>><rsup|<around*|(|u<rsub|>,1|)>><dfct><rsub|<gr>><rsup|N<rsup|>>>
  in place of <math|<SU><rsup|u<rsub|>><rsub|\<Gamma\><rsub|\<times\>>>\<Phi\><rsub|<mf|r>><rsup|N>>.
  This is done in <smart-ref|prop:bilinear-bidefect-bound>.

  <\proposition>
    <label|prop:bilinear-holder-bound>The bound\ 

    <\equation>
      <around*|<left|\<\|\|\>|2>|F<rsub|2>F<rsub|3>|<right|\<\|\|\>|2>><rsub|L<rsup|p<rsub|\<times\>>><rsub|\<nu\><rsub|\<beta\>>>X<rsup|q<rsub|\<times\>>,r<rsub|\<times\>>,+><rsub|\<mu\><rsub|\<Theta\>><rsup|1>,\<nu\><rsub|\<beta\>>><SO><rsup|u<rsub|\<times\>>><rsub|\<Gamma\><rsub|\<times\>>>\<Phi\><rsub|<gr>><rsup|N>>\<lesssim\><big|prod><rsub|j=2><rsup|3><around*|\<\|\|\>|F<rsub|j>|\<\|\|\>><rsub|L<rsup|p<rsub|j>><rsub|\<nu\><rsub|\<beta\><rsup|>>>X<rsub|\<mu\><rsub|\<Theta\>><rsup|1>,\<nu\><rsub|\<beta\><rsup|>>><rsup|q<rsub|j>,r<rsub|j>,+><SU><rsup|u<rsub|j>><rsub|\<Gamma\><rsub|j>>\<Phi\><rsub|<mf|r>><rsup|N>><label|eq:bound:bilinear-holder>
    </equation>

    holds for any <math|F<rsub|j>\<in\>L<rsup|p<rsub|j>><rsub|\<nu\><rsub|\<beta\><rsup|>>>X<rsub|\<mu\><rsub|\<Theta\>><rsup|1>,\<nu\><rsub|\<beta\><rsup|>>><rsup|q<rsub|j>,r<rsub|j>,+><SU><rsup|u<rsub|j>><rsub|\<Gamma\><rsub|j>>\<Phi\><rsub|<mf|r>><rsup|N>>
    with\ 

    <\equation*>
      <ltae|<tformat|<cwith|2|2|1|1|cell-halign|l>|<cwith|1|1|1|1|cell-halign|l>|<table|<row|<cell|p<rsub|\<times\>><rsup|-1>=p<rsub|2><rsup|-1>+p<rsub|3><rsup|-1><space|2em>q<rsub|\<times\>><rsup|-1>=q<rsub|2><rsup|-1>+q<rsub|3><rsup|-1>>>|<row|<cell|r<rsub|\<times\>><rsup|-1>=r<rsub|2><rsup|-1>+r<rsub|3><rsup|-1><space|2em>u<rsub|\<times\>><rsup|-1>=u<rsub|2><rsup|-1>+u<rsub|3><rsup|-1>>>>>>
    </equation*>

    as long as \ <math|p<rsub|j>\<in\><around*|(|1,\<infty\>|]>> and
    <math|r<rsub|j>\<leq\>q<rsub|j>>, <math|j\<in\><around*|{|2,3|}>>. As a
    consequence, the bound

    <\equation>
      <around*|<left|\<\|\|\>|2>|<Emb><around*|[|f<rsub|2>|]>\<circ\>\<Gamma\><rsub|2>
      <Emb><around*|[|f<rsub|3>|]>\<circ\>\<Gamma\><rsub|3>|<right|\<\|\|\>|2>><rsub|L<rsup|p<rsub|\<times\>>><rsub|\<nu\><rsub|\<beta\>>>X<rsup|q<rsub|\<times\>>,r<rsub|\<times\>>,+><rsub|\<mu\><rsub|\<Theta\>><rsup|1>,\<nu\><rsub|\<beta\>>><SO><rsup|u<rsub|\<times\>>><rsub|\<Gamma\><rsub|\<times\>>>\<Phi\><rsub|<gr>><rsup|N>>\<lesssim\><around*|\<\|\|\>|f<rsub|2>|\<\|\|\>><rsub|L<rsup|p<rsub|2>><around*|(|<R>|)>><around*|\<\|\|\>|f<rsub|2>|\<\|\|\>><rsub|L<rsup|p<rsub|3>><around*|(|<R>|)>>.<label|eq:embedding-bound:bilinear-holder>
    </equation>

    holds for any <math|p<rsub|j>\<in\><around*|(|1,\<infty\>|]>> as long as
    <math|q<rsub|\<times\>><rsup|-1>\<less\>min<around*|(|<frac|1|2>,1-p<rsub|2><rsup|-1>|)>+min<around*|(|<frac|1|2>,1-p<rsub|3><rsup|-1>|)>>
    and as long as <math|1\<leq\>u<rsub|\<times\>>\<less\>r<rsub|\<times\>>\<less\>q<rsub|\<times\>>>.
    The implicit constant is independent of
    <math|\<beta\>\<in\><around*|(|0,1|]>>, that determines
    <math|<around*|(|\<alpha\><rsub|j>,\<beta\><rsub|j>,\<gamma\><rsub|j>|)>>
    and <math|\<Gamma\><rsub|j>>, <math|j\<in\><around*|{|2,3|}>>, and of
    <math|F<rsub|2>,F<rsub|3>>.\ 
  </proposition>

  <\proof>
    Bound <eqref|eq:embedding-bound:bilinear-holder> follows from bound
    <eqref|eq:bound:bilinear-holder> thanks to the linear embedding bounds
    <eqref|eq:embedding-bounds:uniform-iterated>. As a matter of fact, fix
    <math|1\<leq\>u<rsub|\<times\>>\<less\>r<rsub|\<times\>>\<less\>q<rsub|\<times\>>>
    with <math|q<rsub|\<times\>><rsup|-1>\<less\>min<around*|(|<frac|1|2>,1-p<rsub|2><rsup|-1>|)>+min<around*|(|<frac|1|2>,1-p<rsub|3><rsup|-1>|)>>
    and set\ 

    <\equation*>
      <ltae|<tformat|<cwith|1|1|1|1|cell-halign|l>|<cwith|2|2|1|1|cell-halign|l>|<cwith|3|3|1|1|cell-halign|l>|<table|<row|<cell|q<rsub|j><rsup|-1>=min<around*|<left|(|-1>|<frac|1|2>,1-p<rsub|j><rsup|-1>|<right|)|-1>>-\<varepsilon\><rsub|q>/2,>>|<row|<cell|r<rsub|j><rsup|-1>=q<rsub|j><rsup|-1>-\<varepsilon\><rsub|r>/2,>>|<row|<cell|u<rsub|j>=r<rsub|j>-\<varepsilon\><rsub|u>/2.>>>>>
    </equation*>

    with

    <\equation*>
      <ltae|<tformat|<cwith|2|2|1|1|cell-halign|l>|<cwith|3|3|1|1|cell-halign|l>|<table|<row|<cell|\<varepsilon\><rsub|q><eqd>q<rsub|\<times\>><rsup|-1>-min<around*|(|<frac|1|2>,1-p<rsub|2><rsup|-1>|)>-min<around*|(|<frac|1|2>,1-p<rsub|3><rsup|-1>|)>\<gtr\>0,>>|<row|<cell|\<varepsilon\><rsub|r><eqd>r<rsub|\<times\>><rsup|-1>-q<rsub|\<times\>><rsup|-1>\<gtr\>0,>>|<row|<cell|\<varepsilon\><rsub|r><eqd>u<rsub|\<times\>><rsup|-1>-r<rsub|\<times\>><rsup|-1>\<gtr\>0.>>>>>
    </equation*>

    For such a choice of <math|<around*|(|q<rsub|j>,r<rsub|j>,u<rsub|j>|)>>,
    <smart-ref|thm:uniform-embedding-bounds:linear> holds so
    <math|<RHS|><eqref|eq:bound:bilinear-holder>\<lesssim\><RHS|<eqref|eq:embedding-bound:bilinear-holder>>>
    proving our claim.\ 

    Let us now prove <eqref|eq:bound:bilinear-holder> by appropriately
    applying the outer Hölder inequality (<smart-ref|cor:outer-holder-classical>).
    For any <math|F<rsub|j>\<in\><Rad><around*|(|<R><rsup|3><rsub|+>|)>\<otimes\>\<Phi\><rsup|\<infty\>><rsub|<gr>>>,
    <math|j\<in\><around*|{|2,3|}>>, it holds that that

    <\equation*>
      \<nu\><rsub|\<beta\>><around|(|<around*|\<\|\|\>|F<rsub|2>F<rsub|3>|\<\|\|\>><rsub|X<rsup|q<rsub|\<times\>>,r<rsub|\<times\>>,+><rsub|\<mu\><rsub|\<Theta\>><rsup|1>,\<nu\><rsub|\<beta\>>><SO><rsup|u<rsub|\<times\>>,N><rsub|<gr>>>\<gtr\>0|)>\<leq\>
      min<rsub|j=2,3> \<nu\><rsub|\<beta\>><around|<left|(|1>|<around*|\<\|\|\>|F<rsub|j>|\<\|\|\>><rsub|X<rsub|\<mu\><rsub|\<Theta\>><rsup|1>,\<nu\><rsub|\<beta\><rsup|>>><rsup|q<rsub|j>,r<rsub|j>,+><SU><rsup|u<rsub|j>><rsub|\<Gamma\><rsub|j>>\<Phi\><rsub|<mf|r>><rsup|N>>\<gtr\>0|<right|)|1>>
    </equation*>

    since for any <math|V<rsup|->\<in\><DD><rsub|\<beta\>><rsup|\<cup\>>> it
    holds that if <math|<1><rsub|<R><rsup|3><rsub|+>\<setminus\>V<rsup|->>F<rsub|j>=0>
    for <math|j=2> or <math|j=3> then, trivially,
    <math|<1><rsub|<R><rsup|3><rsub|+>\<setminus\>V<rsup|->>F<rsub|2>F<rsub|3>=0>.
    To apply the outer Hölder inequality we must check that for any
    <math|F<rsub|j>\<in\><Rad><around*|(|<R><rsup|3><rsub|+>|)>\<otimes\>\<Phi\><rsup|\<infty\>><rsub|<gr>>>,
    <math|j\<in\><around*|{|2,3|}>> it holds that\ 

    <\equation*>
      <around*|<left|\<\|\|\>|2>|F<rsub|2>F<rsub|3>|<right|\<\|\|\>|2>><rsub|X<rsup|q<rsub|\<times\>>,r<rsub|\<times\>>,+><rsub|\<mu\><rsub|\<Theta\>><rsup|1>,\<nu\><rsub|\<beta\>>><SO><rsup|u<rsub|\<times\>>><rsub|\<Gamma\><rsub|\<times\>>>\<Phi\><rsub|<gr>><rsup|N>>\<lesssim\><big|prod><rsub|j=2><rsup|3><around*|\<\|\|\>|F<rsub|j>|\<\|\|\>><rsub|X<rsub|\<mu\><rsub|\<Theta\>><rsup|1>,\<nu\><rsub|\<beta\><rsup|>>><rsup|q<rsub|j>,r<rsub|j>,+><SU><rsup|u<rsub|j>><rsub|\<Gamma\><rsub|j>>\<Phi\><rsub|<mf|r>><rsup|N>>.
    </equation*>

    The sizes <math|><math|X<rsup|q<rsub|\<times\>>,r<rsub|\<times\>>,+><rsub|\<mu\><rsub|\<Theta\>><rsup|1>,\<nu\><rsub|\<beta\>>><SO><rsup|u<rsub|\<times\>>><rsub|\<Gamma\><rsub|\<times\>>>\<Phi\><rsub|<gr>><rsup|N>>
    are themselves (localized) outer Lebesgue norms. According to
    <eqref|eq:X-size>, it is sufficient to check that for any
    <math|V<rsup|+>\<in\><DD><rsub|\<beta\>><rsup|\<cup\>>> and any
    <math|W<rsup|+>\<in\><TT><rsub|\<Theta\>><rsup|\<cup\>>> one has

    <\equation*>
      <ltae|<tformat|<cwith|1|1|1|1|cell-halign|l>|<table|<row|<cell|\<nu\><rsub|\<beta\>><around*|(|V<rsup|+>|)><rsup|-<frac|1|r<rsub|\<times\>>>>\<mu\><rsup|\<infty\>><rsub|\<Theta\>><around*|(|W<rsup|+>|)><rsup|<frac|1|q<rsub|\<times\>>>-<frac|1|r<rsub|\<times\>>>><around*|\<\|\|\>|<1><rsub|<around*|(|V<rsup|+>\<cap\>W<rsup|+>|)>>F<rsub|2>F<rsub|3>|\<\|\|\>><rsub|L<rsup|r<rsub|\<times\>>><rsub|\<mu\><rsub|\<Theta\>><rsup|1>><SO><rsup|u<rsub|\<times\>>><rsub|\<Gamma\><rsub|\<times\>>>\<Phi\><rsub|<gr>><rsup|N>>>>|<row|<cell|<space|2em>\<lesssim\><big|prod><rsub|j=2><rsup|3><around*|(|\<nu\><rsub|\<beta\>><around*|(|V<rsup|+>|)><rsup|-<frac|1|r<rsub|j>>>\<mu\><rsup|\<infty\>><rsub|\<Theta\>><around*|(|W<rsup|+>|)><rsup|<frac|1|q<rsub|j>>-<frac|1|r<rsub|j>>><around*|\<\|\|\>|<1><rsub|<around*|(|V<rsup|+>\<cap\>W<rsup|+>|)>>F<rsub|j>|\<\|\|\>><rsub|L<rsup|r<rsub|j>><rsub|\<mu\><rsub|\<Theta\>><rsup|1>><SU><rsup|u<rsub|j>><rsub|\<Gamma\><rsub|j>>\<Phi\><rsub|<mf|r>><rsup|N>>|)>>>>>>
    </equation*>

    that boils down to showing

    <\equation*>
      <around*|\<\|\|\>|<1><rsub|<around*|(|V<rsup|+>\<cap\>W<rsup|+>|)>>F<rsub|2>F<rsub|3>|\<\|\|\>><rsub|L<rsup|r<rsub|\<times\>>><rsub|\<mu\><rsub|\<Theta\>><rsup|1>><SO><rsup|u<rsub|\<times\>>><rsub|\<Gamma\><rsub|\<times\>>>\<Phi\><rsub|<gr>><rsup|N>>\<lesssim\><big|prod><rsub|j=2><rsup|3><around*|\<\|\|\>|<1><rsub|<around*|(|V<rsup|+>\<cap\>W<rsup|+>|)>>F<rsub|j>|\<\|\|\>><rsub|L<rsup|r<rsub|j>><rsub|\<mu\><rsub|\<Theta\>><rsup|1>><SU><rsup|u<rsub|j>><rsub|\<Gamma\><rsub|j>>\<Phi\><rsub|<mf|r>><rsup|N>>.
    </equation*>

    This amounts to the outer Hölder inequality at the level of the outer
    Lebesgue norms <math|L<rsup|r<rsub|\<times\>>><rsub|\<mu\><rsub|\<Theta\>><rsup|1>><SO><rsup|u<rsub|\<times\>>><rsub|\<Gamma\><rsub|\<times\>>>\<Phi\><rsub|<gr>><rsup|N>>
    and <math|L<rsup|r<rsub|j>><rsub|\<mu\><rsub|\<Theta\>><rsup|1>><SU><rsup|u<rsub|j>><rsub|\<Gamma\><rsub|j>>\<Phi\><rsub|<mf|r>><rsup|N>>,
    <math|j\<in\><around*|{|2,3|}>>.

    Using that <math|\<mu\><rsub|\<Theta\>><rsup|1><around|(|<around*|\<\|\|\>|F<rsub|2>F<rsub|3>|\<\|\|\>><rsub|<SO><rsup|u<rsub|\<times\>>><rsub|\<Gamma\><rsub|\<times\>>>\<Phi\><rsub|<gr>><rsup|N>>\<gtr\>0|)>\<leq\>
    min<rsub|j=2,3> \<mu\><rsub|\<Theta\>><rsup|1><around|<left|(|1>|<around*|\<\|\|\>|F<rsub|j>|\<\|\|\>><rsub|<SU><rsup|u<rsub|j>><rsub|\<Gamma\><rsub|j>>\<Phi\><rsub|<mf|r>><rsup|N>>\<gtr\>0|<right|)|1>>>,
    we can apply the Hölder inequality to obtain the above bound as long as
    it holds that\ 

    <\equation*>
      <around*|\<\|\|\>|<1><rsub|<around*|(|V<rsup|+>\<cap\>W<rsup|+>|)>>F<rsub|2>F<rsub|3>|\<\|\|\>><rsub|<SO><rsup|u<rsub|\<times\>>><rsub|\<Gamma\><rsub|\<times\>>>\<Phi\><rsub|<gr>><rsup|N>>\<lesssim\><big|prod><rsub|j=2><rsup|3><around*|\<\|\|\>|<1><rsub|<around*|(|V<rsup|+>\<cap\>W<rsup|+>|)>>F<rsub|j>|\<\|\|\>><rsub|<SU><rsup|u<rsub|j>><rsub|\<Gamma\><rsub|j>>\<Phi\><rsub|<mf|r>><rsup|N>>.
    </equation*>

    This however is a simple consequence of the classical Hölder inequality
    and the definitions <eqref|eq:product-tensor-sizes> of the sizes in play.
    We immediately have

    <\equation*>
      <ltae|<tformat|<cwith|2|2|1|1|cell-halign|l>|<cwith|3|3|1|1|cell-halign|l>|<cwith|4|4|1|1|cell-halign|l>|<table|<row|<cell|<around*|<left|\<\|\|\>|2>|<1><rsub|<around*|(|V<rsup|+>\<cap\>W<rsup|+>|)>>F<rsub|2>F<rsub|3>|<right|\<\|\|\>|2>><rsub|\<beta\><rsup|<frac|1|u<rsub|\<times\>><rsub|>>>\<Gamma\><rsub|\<times\>><rsup|\<ast\>><SL><rsup|><rsub|><rsup|<around*|(|u<rsub|\<times\>>,\<infty\>|)>><rsub|
      \<Theta\>><around*|(|\<Phi\>\<otimes\>\<Phi\>|)><rsub|<gr>><rsup|N<rsup|>>>\<lesssim\><big|prod><rsub|j=2><rsup|3>\<beta\><rsup|<frac|1|u<rsub|j><rsub|>>><around*|\<\|\|\>|<1><rsub|<around*|(|V<rsup|+>\<cap\>W<rsup|+>|)>>F<rsub|j>|\<\|\|\>><rsub|\<Gamma\><rsub|j><rsup|\<ast\>><SL><rsup|><rsub|><rsup|<around*|(|u<rsub|j>,\<infty\>|)>><rsub|
      <around*|(|\<Theta\>,\<Theta\><rsup|in>|)>>\<Phi\><rsub|<mf|r>><rsup|N>>,>>|<row|<cell|<around*|<left|\<\|\|\>|2>|<1><rsub|<around*|(|V<rsup|+>\<cap\>W<rsup|+>|)>>F<rsub|2>F<rsub|3>|<right|\<\|\|\>|2>><rsub|\<beta\><rsup|<frac|1|u<rsub|\<times\>><rsub|>>>\<Gamma\><rsub|\<times\>><rsup|\<ast\>><SL><rsup|><rsub|><rsup|<around*|(|u<rsub|\<times\>>,1|)>><rsub|
      \<Theta\>><around*|(|\<Phi\>\<otimes\><wpD>|)><rsub|<gr>><rsup|N<rsup|>>>\<lesssim\><tabular*|<tformat|<twith|table-valign|T>|<cwith|1|1|1|1|cell-halign|l>|<table|<row|<cell|\<beta\><rsup|<frac|1|u<rsub|2>>><around*|<left|\<\|\|\>|2>|<1><rsub|<around*|(|V<rsup|+>\<cap\>W<rsup|+>|)>>F<rsub|2>|<right|\<\|\|\>|2>><rsub|\<Gamma\><rsub|2><rsup|\<ast\>><SL><rsup|><rsub|><rsup|<around*|(|u<rsub|2>,\<infty\>|)>><rsub|
      <around*|(|\<Theta\>,\<Theta\><rsup|in>|)>>\<Phi\><rsub|<mf|r>><rsup|N>>>>|<row|<cell|\<times\>\<beta\><rsup|<frac|1|u<rsub|3><rsub|>>><around*|<left|\<\|\|\>|2>|<1><rsub|<around*|(|V<rsup|+>\<cap\>W<rsup|+>|)>>F<rsub|3>|<right|\<\|\|\>|2>><rsub|\<Gamma\><rsub|3><rsup|\<ast\>><SL><rsup|><rsub|><rsup|<around*|(|u<rsub|3>,2|)>><rsub|
      \<Theta\>><wpD><rsub|<mf|r>><rsup|N>>,>>>>>>>|<row|<cell|<around*|<left|\<\|\|\>|2>|<1><rsub|<around*|(|V<rsup|+>\<cap\>W<rsup|+>|)>>F<rsub|2>F<rsub|3>|<right|\<\|\|\>|2>><rsub|\<beta\><rsup|<frac|1|u<rsub|\<times\>><rsub|>>>\<Gamma\><rsub|\<times\>><rsup|\<ast\>><SL><rsup|><rsub|><rsup|<around*|(|u<rsub|\<times\>>,1|)>><rsub|
      \<Theta\>><around*|(|\<Phi\>\<otimes\><wpD>|)><rsub|<gr>><rsup|N<rsup|>>>\<lesssim\><tabular*|<tformat|<twith|table-valign|T>|<cwith|1|1|1|1|cell-halign|l>|<table|<row|<cell|\<beta\><rsup|<frac|1|u<rsub|2>>><around*|<left|\<\|\|\>|1>|<1><rsub|<around*|(|V<rsup|+>\<cap\>W<rsup|+>|)>>F<rsub|2>|<right|\<\|\|\>|1>><rsub|\<Gamma\><rsub|2><rsup|\<ast\>><SL><rsup|><rsub|><rsup|<around*|(|u<rsub|2>,\<infty\>|)>><rsub|
      \<Theta\>><wpD><rsub|<mf|r>><rsup|N>>>>|<row|<cell|\<times\>\<beta\><rsup|<frac|1|u<rsub|3><rsub|>>><around*|<left|\<\|\|\>|1>|<1><rsub|<around*|(|V<rsup|+>\<cap\>W<rsup|+>|)>>F<rsub|3>|<right|\<\|\|\>|1>><rsub|\<Gamma\><rsub|3><rsup|\<ast\>><SL><rsup|><rsub|><rsup|<around*|(|u<rsub|3>,\<infty\>|)>><rsub|
      <around*|(|\<Theta\>,\<Theta\><rsup|in>|)>>\<Phi\><rsub|<mf|r>><rsup|N>>,>>>>>>>|<row|<cell|<around*|<left|\<\|\|\>|2>|<1><rsub|<around*|(|V<rsup|+>\<cap\>W<rsup|+>|)>>F<rsub|2>F<rsub|3>|<right|\<\|\|\>|2>><rsub|\<Gamma\><rsub|\<times\>><rsup|\<ast\>><SL><rsup|><rsub|><rsup|<around*|(|u<rsub|\<times\>>,1|)>><rsub|
      \<Theta\>><around*|(|<wpD>\<otimes\><wpD>|)><rsub|<gr>><rsup|N<rsup|>>>\<lesssim\><big|prod><rsub|j=2><rsup|3><around*|\<\|\|\>|<1><rsub|<around*|(|V<rsup|+>\<cap\>W<rsup|+>|)>>F<rsub|j>|\<\|\|\>><rsub|\<Gamma\><rsub|j><rsup|\<ast\>><SL><rsup|><rsub|><rsup|<around*|(|u<rsub|j>,2|)>><rsub|
      \<Theta\>><wpD><rsub|<mf|r>><rsup|N>>.>>>>>
    </equation*>

    \;
  </proof>

  <\proposition>
    <label|prop:bilinear-bidefect-bound>The bound\ 

    <\equation*>
      <around*|<left|\<\|\|\>|2>|<Emb><around*|[|f<rsub|2>|]>\<circ\>\<Gamma\><rsub|2>
      <Emb><around*|[|f<rsub|3>|]>\<circ\>\<Gamma\><rsub|3>|<right|\<\|\|\>|2>><rsub|L<rsup|p<rsub|\<times\>>><rsub|\<nu\><rsub|\<beta\>>>X<rsup|q<rsub|\<times\>>,r<rsub|\<times\>>,+><rsub|\<mu\><rsub|\<Theta\>><rsup|1>,\<nu\><rsub|\<beta\>>>\<Gamma\><rsub|\<times\>><rsup|\<ast\>><SL><rsub|<around*|(|\<Theta\><rsub|>,\<Theta\><rsup|in>|)>><rsup|<around*|<left|(|-1>|u<rsub|\<times\>><rsub|>,1
      |<right|)|-1>>><dfct><rsub|<gr>><rsup|N<rsup|>>>\<lesssim\><around*|\<\|\|\>|f<rsub|2>|\<\|\|\>><rsub|L<rsup|p<rsub|2>><around*|(|<R>|)>><around*|\<\|\|\>|f<rsub|2>|\<\|\|\>><rsub|L<rsup|p<rsub|3>><around*|(|<R>|)>>
    </equation*>

    holds for any <math|f<rsub|j>\<in\><Sch><around*|(|<R>|)>>, and any
    <math|> <math|p<rsub|j>\<in\><around*|(|1,\<infty\>|]>>,
    <math|j\<in\><around*|{|2,3|}>>, as long as
    <math|p<rsub|\<times\>><rsup|-1>=p<rsub|2><rsup|-1>+p<rsub|3><rsup|-1>>
    and as long as <math|q<rsub|\<times\>>\<in\><around*|(|0,+\<infty\>|]>>
    with <math|q<rsub|\<times\>><rsup|-1>\<less\>min<around*|(|<frac|1|2>,1-p<rsub|2><rsup|-1>|)>+min<around*|(|<frac|1|2>,1-p<rsub|3><rsup|-1>|)>>
    and as long as <math|1\<leq\>u<rsub|\<times\>>\<less\>r<rsub|\<times\>>\<leq\>q<rsub|\<times\>>.>
    The implicit constant is independent of
    <math|\<beta\>\<in\><around*|(|0,1|]>>, that determines
    <math|<around*|(|\<alpha\><rsub|j>,\<beta\><rsub|j>,\<gamma\><rsub|j>|)>>
    and <math|\<Gamma\><rsub|j>>, <math|j\<in\><around*|{|2,3|}>>, and of
    <math|f<rsub|2>,f<rsub|3>>.\ 
  </proposition>

  We believe that the bounds above cannot be obtained as in the case of
  <smart-ref|prop:bilinear-holder-bound> from linear embeddings. This is
  because the expressions <eqref|eq:product-space-defect> and
  <eqref|eq:product-scale-defect> for the sizes
  <math|<dfct><rsub|\<zeta\>,<gr><rsub|>><rsup|N<rsup|>>> and
  <math|<dfct><rsub|\<sigma\>,<gr><rsub|>><rsup|N<rsup|>>> are intrinsically
  bilinear and cannot be controlled through a classical Hölder inequality. In
  the subsequent proof we mimic the parts of
  <smart-ref|sec:uniform-embeddings:linear> related to bounding the defect
  sizes.\ 

  <\proof>
    Using homogeneity let us assume that <math|<around*|\<\|\|\>|f<rsub|j>|\<\|\|\>><rsub|L<rsup|p<rsub|j>><around*|(|<R>|)>>=1>.
    Fix <math|q<rsub|j>\<in\><around*|(|max<around*|(|2,p<rsub|j><rprime|'>|)>,\<infty\>|]>>
    such that <math|q<rsub|\<times\>><rsup|-1>=q<rsub|2><rsup|-1>+q<rsub|3><rsup|-1>>
    and select <math|u<rsub|j>> and <math|r<rsub|j>>,
    <math|j\<in\><around*|{|2,3|}>>, so that
    <math|1\<leq\>u<rsub|j>\<leq\>r<rsub|j>\<leq\>q<rsub|j>> and
    <math|r<rsub|\<times\>><rsup|-1>=r<rsub|2><rsup|-2>+r<rsub|3><rsup|-2>>
    and <math|u<rsub|\<times\>><rsup|-1>=u<rsub|2><rsup|-2>+u<rsub|3><rsup|-2>>.
    Under these conditions <smart-ref|thm:uniform-embedding-bounds:linear>
    holds for the exponents <math|<around*|(|u<rsub|j>,r<rsub|j>,q<rsub|j>,p<rsub|j>|)>>
    for <math|j\<in\><around*|{|2,3|}>>. According to the discussion in
    Remark <smart-ref|rmk:iterated-outer-bounds-explicit> this means that for
    <math|j\<in\><around*|{|2,3|}>> there exists a choice of sets
    <math|V<rsup|-><rsub|j><around*|(|\<lambda\>|)>\<in\><DD><rsup|\<cup\>><rsub|\<beta\>>>
    such that\ 

    <\equation*>
      <ltae|<tformat|<cwith|1|1|1|1|cell-halign|l>|<table|<row|<cell|<big|int><rsub|0><rsup|\<infty\>>
      \<nu\><rsub|\<beta\>><around*|<left|(|1>|V<rsup|-><rsub|j><rsup|><around*|(|\<lambda\><rsup|1/p<rsub|j>>|)>|<right|)|1>>\<mathd\>\<lambda\>\<lesssim\>1,<space|2em><around*|<left|\<\|\|\>|2>|<1><rsub|<R><rsup|3><rsub|+>\<setminus\>V<rsup|-><rsub|j><around*|(|\<lambda\>|)>>
      <Emb><around*|[|f<rsub|j>|]>|<right|\<\|\|\>|2>><rsub|X<rsup|q<rsub|j>,r<rsub|j>,+><rsub|\<mu\><rsub|\<Theta\>><rsup|1>,\<nu\><rsub|\<beta\>>><wide|F|~><rsup|u<rsub|j>><rsub|\<Gamma\><rsub|j>>\<Phi\><rsub|<gr>><rsup|N<rsup|>>>\<lesssim\>\<lambda\>.>>>>>
    </equation*>

    Unwrapping the definition of the size
    <math|X<rsup|q<rsub|j>,r<rsub|j>,+><rsub|\<mu\><rsub|\<Theta\>><rsup|1>,\<nu\><rsub|\<beta\>>><wide|F|~><rsup|u<rsub|j>><rsub|\<Gamma\><rsub|j>>\<Phi\><rsub|<gr>><rsup|N<rsup|>>>
    this means that for any any \ <math|<wide|r|\<bar\>><rsub|j>\<in\><around*|{|r<rsub|j>,q<rsub|j>|}>>,
    any \ <math|V<rsup|+>\<in\>\<bbb-D\><rsub|\<beta\>><rsup|\<cup\>>>, any
    <math|W<rsup|+>\<in\>\<bbb-T\><rsub|\<Theta\>><rsup|\<cup\>>>, and any
    <math|\<tau\>\<gtr\>0> there exists a choice of
    <math|W<rsup|-><rsub|j><around*|(|\<tau\>|)>\<in\><TT><rsub|\<Theta\>><rsup|\<cup\>>>
    such that\ 

    <\equation*>
      <ltae|<tformat|<cwith|2|2|1|1|cell-halign|l>|<cwith|1|1|1|1|cell-halign|l>|<table|<row|<cell|<big|int><rsub|0><rsup|\<infty\>>
      \<mu\><rsup|1><rsub|\<Theta\>><around*|<left|(|-1>|W<rsup|-><rsub|j><around*|<left|(|-1>|\<tau\><rsup|1/<wide|r|\<bar\>><rsub|j>>|<right|)|-1>>|<right|)|-1>>\<mathd\>\<tau\>\<lesssim\>1,>>|<row|<cell|<around*|<left|\<\|\|\>|2>|<1><rsub|<around*|(|V<rsup|+>\<cap\>W<rsup|+>|)>\<setminus\><around*|(|V<rsup|-><rsub|j><around*|(|\<lambda\>|)>\<cup\>W<rsup|-><rsub|j><around*|(|\<tau\>|)>|)>>
      <Emb><around*|[|f<rsub|j>|]>|<right|\<\|\|\>|2>><rsub|<wide|F|~><rsup|u<rsub|j>><rsub|\<Gamma\><rsub|j>>\<Phi\><rsub|<gr>><rsup|N<rsup|>>>\<lesssim\>\<tau\>\<lambda\>\<nu\><rsub|\<beta\>><around*|(|V<rsup|+>|)><rsup|1/<wide|r|\<bar\>><rsub|j>>\<mu\><rsup|\<infty\>><rsub|\<Theta\>><around*|(|W<rsup|+>|)><rsup|<frac|1|<wide|r|\<bar\>><rsub|j>>-<frac|1|q<rsub|j>>>.>>>>>
    </equation*>

    Note that for any <math|V<rsup|+>,V<rsup|->\<in\><DD><rsup|\<cup\>><rsub|\<beta\>>>
    and <math|W<rsup|+>,W<rsup|->\<in\><TT><rsub|\<Theta\>><rsup|\<cup\>>> we
    have

    \;

    <\equation*>
      <tabular|<tformat|<cwith|1|1|1|1|cell-halign|l>|<table|<row|<cell|<around*|<left|\<\|\|\>|2>|<1><rsub|<around*|(|V<rsup|<rsub|+>>\<cap\>W<rsup|<rsub|+>>|)>\<setminus\><around*|(|V<rsup|->\<cup\>W<rsup|->|)>><Emb><around*|[|f<rsub|2>|]>\<circ\>\<Gamma\><rsub|2>
      <Emb><around*|[|f<rsub|3>|]>\<circ\>\<Gamma\><rsub|3>|<right|\<\|\|\>|2>><rsub|\<Gamma\><rsub|\<times\>><rsup|\<ast\>><SL><rsub|<around*|(|\<Theta\><rsub|>,\<Theta\><rsup|in>|)>><rsup|<around*|<left|(|-1>|u<rsub|\<times\>><rsub|>,1
      |<right|)|-1>>><dfct><rsub|<gr>><rsup|N<rsup|>><around*|(|T|)>>>>|<row|<cell|<space|2em>\<lesssim\><tabular*|<tformat|<twith|table-valign|T>|<cwith|1|1|1|1|cell-halign|l>|<table|<row|<cell|<around*|<left|\<\|\|\>|2>|<around*|<left|(|1>|<Emb><around*|[|f<rsub|2>|]>\<circ\>\<Gamma\><rsub|2>
      <Emb><around*|[|f<rsub|3>|]>\<circ\>\<Gamma\><rsub|3>|<right|)|1>><around*|(|\<eta\>,y,t|)>|<right|.>>>>|<row|<cell|<space|2em>\<times\><around*|<left|.>|
      t<dd><rsub|t><around*|<left|(|1>|<1><rsub|<around*|(|V<rsup|<rsub|+>>\<cap\>W<rsup|<rsub|+>>|)>\<setminus\><around*|(|V<rsup|->\<cup\>W<rsup|->|)>><around*|(|\<eta\>,y,t|)>|<right|)|1>>|<right|\<\|\|\>|2>><rsub|\<Gamma\><rsub|\<times\>><rsup|\<ast\>><SL><rsub|<around*|(|\<Theta\><rsub|>,\<Theta\><rsup|in>|)>><rsup|<around*|<left|(|-1>|u<rsub|\<times\>><rsub|>,1
      |<right|)|-1>>><dfct><rsub|<gr>><rsup|N<rsup|>><around*|(|T|)>>>>>>>>>|<row|<cell|<space|2em>\<lesssim\><tabular*|<tformat|<twith|table-valign|T>|<cwith|1|1|1|1|cell-halign|l>|<table|<row|<cell|<around*|<left|\<\|\|\>|2>|<around*|<left|(|1>|<Emb><around*|[|f<rsub|2>|]>\<circ\>\<Gamma\><rsub|2>
      <Emb><around*|[|f<rsub|3>|]>\<circ\>\<Gamma\><rsub|3>|<right|)|1>><around*|(|\<eta\>,y,t|)>|<right|.>>
      <1><rsub|<around*|(|V<rsup|<rsub|+>>\<cap\>W<rsup|<rsub|+>>|)>\<setminus\><around*|(|V<rsup|->\<cup\>W<rsup|->|)>><around*|(|\<eta\>,y,t|)>>>|<row|<cell|<space|2em>\<times\><around*|<left|.>|
      <around*|<left|(|2>|t\<delta\><around*|<left|(|1>|t-<mf|b<rsub|+>><around*|(|\<eta\>,y|)>|<right|)|1>>+t\<delta\><around*|<left|(|1>|t-<mf|b<rsub|->><around*|(|\<eta\>,y|)>|<right|)|1>>|<right|.>><rsub|>|<right|\<\|\|\>|2>><rsub|\<Gamma\><rsub|\<times\>><rsup|\<ast\>><SL><rsub|<around*|(|\<Theta\><rsub|>,\<Theta\><rsup|in>|)>><rsup|<around*|<left|(|-1>|u<rsub|\<times\>><rsub|>,1
      |<right|)|-1>>><around*|(|\<Phi\>\<otimes\>\<Phi\>|)><rsub|<gr>><rsup|N<rsup|>><around*|(|T|)>>>>>>>>>|<row|<cell|<space|2em>\<lesssim\><big|prod><rsub|j=2><rsup|3><tabular*|<tformat|<cwith|1|1|1|1|cell-halign|l>|<twith|table-valign|T>|<table|<row|<cell|<around*|<left|\<\|\|\>|2>|<around*|<left|(|1>|<Emb><around*|[|f<rsub|j>|]>\<circ\>\<Gamma\><rsub|j>
      |<right|)|1>><around*|(|\<eta\>,y,t|)>|<right|.>>
      <1><rsub|<around*|(|V<rsup|<rsub|+>>\<cap\>W<rsup|<rsub|+>>|)>\<setminus\><around*|(|V<rsup|->\<cup\>W<rsup|->|)>><around*|(|\<eta\>,y,t|)>>>|<row|<cell|<space|2em>\<times\><around*|<left|.>|
      <around*|<left|(|2>|t\<delta\><around*|<left|(|1>|t-<mf|b<rsub|+>><around*|(|\<eta\>,y|)>|<right|)|1>>+t\<delta\><around*|<left|(|1>|t-<mf|b<rsub|->><around*|(|\<eta\>,y|)>|<right|)|1>>|<right|.>><rsub|>|<right|\<\|\|\>|2>><rsub|\<Gamma\><rsub|j><rsup|\<ast\>><SL><rsub|<around*|(|\<Theta\><rsub|>,\<Theta\><rsup|in>|)>><rsup|<around*|<left|(|-1>|u<rsub|j><rsub|>,1
      |<right|)|-1>>>\<Phi\><rsub|<gr>><rsup|N<rsup|>>>.>>>>>>>>>>
    </equation*>

    On the other hand\ 

    <\equation*>
      <ltae|<tformat|<twith|table-valign|T>|<cwith|2|2|1|1|cell-halign|l>|<table|<row|<cell|<tabular*|<tformat|<cwith|2|2|1|1|cell-halign|l>|<cwith|1|1|1|1|cell-halign|l>|<table|<row|<cell|<around*|<left|\<\|\|\>|2>|<around*|<left|(|1>|<Emb><around*|[|f<rsub|j>|]>\<circ\>\<Gamma\><rsub|j>
      |<right|)|1>><around*|(|\<eta\>,y,t|)>|<right|.>>
      <1><rsub|<around*|(|V<rsup|<rsub|+>>\<cap\>W<rsup|<rsub|+>>|)>\<setminus\><around*|(|V<rsup|->\<cup\>W<rsup|->|)>><around*|(|\<eta\>,y,t|)>>>|<row|<cell|<space|4em>\<times\><around*|<left|.>|
      <around*|<left|(|2>|t\<delta\><around*|<left|(|1>|t-<mf|b<rsub|+>><around*|(|\<eta\>,y|)>|<right|)|1>>+t\<delta\><around*|<left|(|1>|t-<mf|b<rsub|->><around*|(|\<eta\>,y|)>|<right|)|1>>|<right|.>><rsub|>|<right|\<\|\|\>|2>><rsub|\<Gamma\><rsub|j><rsup|\<ast\>><SL><rsub|<around*|(|\<Theta\><rsub|>,\<Theta\><rsup|in>|)>><rsup|<around*|<left|(|-1>|u<rsub|j><rsub|>,1
      |<right|)|-1>>>\<Phi\><rsub|<gr>><rsup|N<rsup|>>>>>>>>>>|<row|<cell|<space|2em>\<lesssim\><around*|<left|\<\|\|\>|2>|<1><rsub|<around*|(|V<rsup|+>\<cap\>W<rsup|+>|)>\<setminus\><around*|(|V<rsup|-><rsub|>\<cup\>W<rsup|->|)>>
      <Emb><around*|[|f<rsub|j>|]>|<right|\<\|\|\>|2>><rsub|<wide|F|~><rsup|u<rsub|j>><rsub|\<Gamma\><rsub|j>>\<Phi\><rsub|<gr>><rsup|N<rsup|>>>.>>>>>
    </equation*>

    Based on the above two bounds, the rest of the proof is merely an
    unwrapping of definitions of iterated outer Lebesgue norms. We set
    <math|V<rsup|-><rsub|\<times\>><around*|(|\<lambda\>|)>=<big|cup><rsub|j\<in\><around*|{|2,3|}>>V<rsup|-><rsub|j><rsup|><around*|(|\<lambda\><rsup|p<rsub|\<times\>>/p<rsub|j>>|)>>
    so that\ 

    <\equation*>
      <big|int><rsub|0><rsup|\<infty\>> \<nu\><rsub|\<beta\>><around*|<left|(|1>|V<rsup|-><rsub|\<times\>><rsup|><around*|(|\<lambda\><rsup|1/p<rsub|\<times\>>>|)>|<right|)|1>>\<mathd\>\<lambda\>\<leq\><big|sum><rsub|j\<in\><around*|{|2,3|}>><big|int><rsub|0><rsup|\<infty\>>
      \<nu\><rsub|\<beta\>><around*|<left|(|1>|V<rsup|-><rsub|j><rsup|><around*|(|\<lambda\><rsup|1/p<rsub|j>>|)>|<right|)|1>>\<mathd\>\<lambda\>\<lesssim\>1.
    </equation*>

    We claim that\ 

    <\equation*>
      <around*|<left|\<\|\|\>|2>|<1><rsub|<R><rsup|3><rsub|+>\<setminus\>V<rsup|-><rsub|\<times\>><rsup|><around*|(|\<lambda\>|)>><Emb><around*|[|f<rsub|2>|]>\<circ\>\<Gamma\><rsub|2>
      <Emb><around*|[|f<rsub|3>|]>\<circ\>\<Gamma\><rsub|3>|<right|\<\|\|\>|2>><rsub|X<rsup|q<rsub|j>,r<rsub|j>,+><rsub|\<mu\><rsub|\<Theta\>><rsup|1>,\<nu\><rsub|\<beta\>>>\<Gamma\><rsub|\<times\>><rsup|\<ast\>><SL><rsub|<around*|(|\<Theta\><rsub|>,\<Theta\><rsup|in>|)>><rsup|<around*|<left|(|-1>|u<rsub|\<times\>><rsub|>,1
      |<right|)|-1>>><dfct><rsub|<gr>><rsup|N<rsup|>><around*|(|T|)>>\<lesssim\>\<lambda\>
    </equation*>

    i.e. that for <math|<wide|r|\<bar\>><rsub|\<times\>>\<in\><around*|{|r<rsub|\<times\>>,q<rsub|\<times\>>|}>>
    and for any <math|V<rsup|+>\<in\>\<bbb-D\><rsub|\<beta\>><rsup|\<cup\>>>,
    any <math|W<rsup|+>\<in\>\<bbb-T\><rsub|\<Theta\>><rsup|\<cup\>>>, and
    for any <math|\<tau\>\<gtr\>0> there exists
    <math|W<rsup|-><rsub|\<times\>><around*|(|\<tau\>|)>\<in\><TT><rsub|\<Theta\>><rsup|\<cup\>>>
    such that\ 

    <\equation*>
      <big|int><rsub|0><rsup|\<infty\>> \<mu\><rsup|1><rsub|\<Theta\>><around*|(|W<rsup|-><rsub|\<times\>><around*|(|\<tau\><rsup|1/<wide|r|\<bar\>><rsub|\<times\>>>|)>|)>\<mathd\>\<tau\>\<lesssim\>1
    </equation*>

    and\ 

    <\equation*>
      <ltae|<tformat|<cwith|2|2|1|1|cell-halign|l>|<table|<row|<cell|<around*|<left|\<\|\|\>|2>|<1><rsub|<around*|(|V<rsup|<rsub|+>>\<cap\>W<rsup|<rsub|+>>|)>\<setminus\><around*|(|V<rsup|-><rsub|\<times\>><rsup|><around*|(|\<lambda\>|)>\<cup\>W<rsup|-><rsub|\<times\>><around*|(|\<tau\>|)>|)>><Emb><around*|[|f<rsub|2>|]>\<circ\>\<Gamma\><rsub|2>
      <Emb><around*|[|f<rsub|3>|]>\<circ\>\<Gamma\><rsub|3>|<right|\<\|\|\>|2>><rsub|\<Gamma\><rsub|\<times\>><rsup|\<ast\>><SL><rsub|<around*|(|\<Theta\><rsub|>,\<Theta\><rsup|in>|)>><rsup|<around*|<left|(|-1>|u<rsub|\<times\>><rsub|>,1
      |<right|)|-1>>><dfct><rsub|<gr>><rsup|N<rsup|>><around*|(|T|)>>>>|<row|<cell|<space|2em>\<lesssim\>\<tau\>\<lambda\>\<nu\><rsub|\<beta\>><around*|(|V<rsup|+>|)><rsup|1/<wide|r|\<bar\>><rsub|\<times\>>>\<mu\><rsup|\<infty\>><rsub|\<Theta\>><around*|(|W<rsup|+>|)><rsup|<frac|1|<wide|r|\<bar\>><rsub|\<times\>>>-<frac|1|q<rsub|\<times\>>>>>>>>>.
    </equation*>

    It is sufficient to set <math|W<rsup|-><rsub|\<times\>><around*|(|\<tau\>|)>=<big|cup><rsub|j\<in\><around*|{|2,3|}>>W<rsup|-><rsub|j><rsup|><around*|(|\<tau\><rsup|<wide|r|\<bar\>><rsub|\<times\>>/<wide|r|\<bar\>><rsub|j>>|)>>
    where <math|W<rsup|-><rsub|j><rsup|><around*|(|\<tau\>|)>\<in\><TT><rsub|\<Theta\>><rsup|\<cup\>>>
    is such that\ 

    <\equation*>
      <tabular|<tformat|<cwith|2|2|1|1|cell-halign|l>|<cwith|1|1|1|1|cell-halign|l>|<table|<row|<cell|<big|int><rsub|0><rsup|\<infty\>>
      \<mu\><rsup|1><rsub|\<Theta\>><around*|<left|(|-1>|W<rsup|-><rsub|j><around*|<left|(|-1>|\<tau\><rsup|1/<wide|r|\<bar\>><rsub|j>>|<right|)|-1>>|<right|)|-1>>\<mathd\>\<tau\>\<lesssim\>1,>>|<row|<cell|<around*|<left|\<\|\|\>|2>|<1><rsub|<around*|(|V<rsup|+>\<cap\>W<rsup|+>|)>\<setminus\><around*|(|V<rsup|-><rsub|j><around*|(|\<lambda\><rsup|p<rsub|\<times\>>/p<rsub|j>>|)>\<cup\>W<rsup|-><rsub|j><around*|(|\<tau\>|)>|)>>
      <Emb><around*|[|f<rsub|j>|]>|<right|\<\|\|\>|2>><rsub|<SU><rsup|u<rsub|j>><rsub|\<Gamma\><rsub|j>>\<Phi\><rsub|<gr>><rsup|N<rsup|>>>\<lesssim\>\<tau\>\<lambda\><rsup|p<rsub|\<times\>>/p<rsub|j>>\<nu\><rsub|\<beta\>><around*|(|V<rsup|+>|)><rsup|1/<wide|r|\<bar\>><rsub|j>>\<mu\><rsup|\<infty\>><rsub|\<Theta\>><around*|(|W<rsup|+>|)><rsup|<frac|1|<wide|r|\<bar\>><rsub|j>>-<frac|1|q<rsub|j>>>.>>>>>
    </equation*>

    The claim follows.
  </proof>

  <section|Summary and proof of uniform bounds><label|sec:final-summary>

  Here we summarize the main results of the paper that are used to prove
  <smart-ref|thm:main-1>.\ 

  \;

  \;

  <\theorem>
    <dueto|Linear uniform embedding bounds><label|thm:uniform-embedding-bounds:linear>
    Let <math|\<Gamma\>=\<Gamma\><rsub|<around*|(|\<alpha\>,\<beta\>,\<gamma\>|)>>>
    be as in <eqref|eq:gamma>. Let <math|\<Theta\>> be a open interval with
    <math|B<rsub|4>\<subsetneq\>\<Theta\>\<subsetneq\>B<rsub|2<rsup|8>>>, and
    let <math|\<Theta\><rsup|in>> be a bounded open interval with
    <math|B<rsub|2<rsup|-5>><around*|(|-\<gamma\>|)>\<subsetneq\>\<Theta\><rsup|in>\<subsetneq\>B<rsub|2<rsup|-3>><around*|(|-\<gamma\>|)>>.
    Let the size <math|<SU><rsup|u><rsub|\<Gamma\>>\<Phi\><rsub|<mf|r>><rsup|N>>
    be given by\ 

    <\equation>
      <label|eq:uniform-embedding-full-size:linear><SU><rsup|u><rsub|\<Gamma\>>\<Phi\><rsub|<mf|r>><rsup|N><eqd>\<beta\><rsup|<frac|1|u>><rsup|>\<Gamma\><rsup|\<ast\>><SL><rsup|<around|(|u,\<infty\>|)>><rsub|\<Theta\>>\<Phi\><rsub|<gr>><rsup|N>+\<Gamma\><rsup|\<ast\>><SL><rsup|<around|(|u,2|)>><rsub|\<Theta\>><wpD><rsub|<gr>><rsup|N>+\<Gamma\><rsup|\<ast\>><SL><rsup|<around|(|u,1|)>><rsub|<around*|(|\<Theta\>,\<Theta\><rsup|in>|)>><dfct><rsup|N><rsub|<gr>>,
    </equation>

    with each of the summands defined in <smart-ref|sec:derived-sizes>.

    The bound <eqref|eq:embedding-bounds:uniform-iterated> holds with
    <math|\<Gamma\><rsub|j>=\<Gamma\>> and with
    <math|<around*|(|p<rsub|j>,q<rsub|j>,r<rsub|j>,u<rsub|j>|)>=<around*|(|p,q,r,u|)>>
    for all <math|f\<in\><Sch><around*|(|<R>|)>>, as long as
    <math|p\<in\><around*|(|1,\<infty\>|]>>,
    <math|q\<in\><around*|<left|(|1>|max<around*|(|p<rprime|'>,2|)>,\<infty\>|<right|]|1>>>,
    and <math|1\<leq\>u\<less\>r\<less\>q.> The implicit constant is
    independent of <math|\<alpha\>>, <math|\<beta\>>, and <math|\<gamma\>>,
    that determine <math|\<Gamma\><rsub|<around*|(|\<alpha\>,\<beta\>,\<gamma\>|)>>>.
  </theorem>

  <\theorem>
    <dueto|Bilinear uniform embedding bounds><label|thm:uniform-embedding-bounds:bilinear>Let
    <math|\<Gamma\><rsub|j>=\<Gamma\><rsub|<around*|(|\<alpha\><rsub|j>,\<beta\><rsub|j>,\<gamma\><rsub|j>|)>>>,
    <math|j\<in\><around*|{|2,3|}>> with <math|<around*|(|\<alpha\><rsub|j>,\<beta\><rsub|j>,\<gamma\><rsub|j>|)>>
    as in <smart-ref|eq:gamma:params>. Let <math|\<Theta\>> and
    <math|\<Theta\><rsup|in>> be as in <smart-ref|thm:uniform-embedding-bounds:linear>.
    Let the size <math|<SU><rsup|u<rsub|>><rsub|\<Gamma\><rsub|\<times\>>>\<Phi\><rsub|<mf|r>><rsup|N>>
    be given by\ 

    <\equation>
      <label|eq:uniform-embedding-full-size:bilinear><SU><rsup|u<rsub|>><rsub|\<Gamma\><rsub|\<times\>>>\<Phi\><rsub|<mf|r>><rsup|N><eqd><ltae|<tformat|<table|<row|<cell|\<beta\><rsup|<frac|1|u<rsub|>>><ltae|<tformat|<table|<row|<cell|<around*|<left|(|1>|\<Gamma\><rsub|\<times\>><rsup|\<ast\>><SL><rsub|<around*|(|\<Theta\>,\<Theta\><rsup|in>|)><rsub|>><rsup|<around*|(|u<rsub|>,\<infty\>|)>><around*|(|\<Phi\>\<otimes\>\<Phi\>|)><rsub|<gr>><rsup|N>+\<Gamma\><rsub|\<times\>><rsup|\<ast\>><SL><rsub|<around*|(|\<Theta\>,\<Theta\><rsup|in>|)><rsub|>><rsup|<around*|(|u<rsub|>,2|)>><around*|(|\<Phi\>\<otimes\><wpD>|)><rsub|<gr>><rsup|N>|<right|.>>>>|<row|<cell|<space|1em><around*|<left|.>|+\<Gamma\><rsub|\<times\>><rsup|\<ast\>><SL><rsub|<around*|(|\<Theta\>,\<Theta\><rsup|in>|)><rsub|>><rsup|<around*|(|u<rsub|>,2|)>><around*|(|<wpD>\<otimes\>\<Phi\>|)><rsub|<gr>><rsup|N>|<right|)|1>>+\<Gamma\><rsub|\<times\>><rsup|\<ast\>><SL><rsup|><rsub|><rsup|<around*|(|u,1|)>><rsub|
      \<Theta\>><around*|(|<wpD>\<otimes\><wpD>|)><rsub|<gr>><rsup|N<rsup|>>+\<Gamma\><rsub|\<times\>><rsup|\<ast\>><SL><rsub|<around*|(|\<Theta\><rsub|>,\<Theta\><rsup|in>|)>><rsup|<around*|(|u<rsub|>,1|)>><dfct><rsub|<gr>><rsup|N<rsup|>>,>>>>>>>>>>
    </equation>

    with each of the summands defined in <smart-ref|sec:derived-sizes>.\ 

    The bound <smart-ref|eq:embedding-bound:bilinear> holds for all
    <math|f<rsub|2>,f<rsub|3>\<in\><Sch><around*|(|<R>|)>> as long as
    <math|<around*|(|p<rsub|2>,p<rsub|3>|)>\<in\><around*|(|1,\<infty\>|]>>,
    <math|q<rsub|\<times\>><rsup|-1>\<less\>min<around*|(|1-<frac|1|p<rsub|2>>,<frac|1|2>|)><rsup|>+min<around*|(|1-<frac|1|p<rsub|3>>,<frac|1|2>|)>>,
    <math|1\<leq\>u<rsub|\<times\>>\<less\>r<rsub|\<times\>>\<less\>q<rsub|\<times\>>.>
    The implicit constant is independent of
    <math|\<beta\>\<in\><around*|(|0,1|]>>, that determines
    <math|<around*|(|\<alpha\><rsub|j>,\<beta\><rsub|j>,\<gamma\><rsub|j>|)>>
    and <math|\<Gamma\><rsub|j>>, <math|j\<in\><around*|{|2,3|}>>.\ 
  </theorem>

  We do not prove Theorems <reference|thm:uniform-embedding-bounds:linear>
  and <reference|thm:uniform-embedding-bounds:bilinear> directly by analyzing
  the function <math|f<rsub|j>> as was done in
  <cite|amentaBilinearHilbertTransform2020> and
  <cite-detail|doTheoryOuterMeasures2015|Theorem 5.1>. Instead, we obtain the
  uniform embeddings by using interpolation properties of iterated outer
  Lebesgue spaces and geometric covering Lemmata
  <reference|lem:ext-tree-covering> and <reference|lem:singular-tree-covering>.
  The latter encode the interaction of the geometry of the space
  <math|<R><rsup|3><rsub|+>> and of the \Pdeformation maps\Q
  <math|\<Gamma\><rsub|j>> of <eqref|eq:gamma:params>. The geometric covering
  lemmata are inspired those in <cite|doTheoryOuterMeasures2015>.\ 

  \;

  We conclude by reviewing the steps to prove <smart-ref|thm:main-1> outlined
  in <smart-ref|sec:outline-uniform> and making sure that the numerology of
  the exponents is compatible with the theorems above.

  <\render-proof|Proof of <smart-ref|thm:main-1>>
    It is sufficient to prove the claim for
    <math|<around*|(|p<rsub|1>,p<rsub|2>,p|)>\<in\><around*|(|1,\<infty\>|)><rsup|3>>
    with <math|p<rsub|1<rsup|>><rsup|-1>+p<rsub|2><rsup|-1>=p<rsup|-1>>; the
    complete claim follows by interpolating with
    \ <cite-detail|liUniformBoundsBilinear2006|Theorem 2>. By duality and
    using the wave packet representation <eqref|eq:BHT-wave-packet-representation>
    (shown in <smart-ref|prop:wave-packet-represetion>), it is sufficient to
    prove that bound <eqref|eq:BHT-dual-bounds> holds. Using bound
    <eqref|eq:RN-domination-BHT> one can reduce to proving that\ 

    <\equation*>
      <RHS|<eqref|eq:RN-domination-BHT>>\<lesssim\><RHS|<eqref|eq:BHT-dual-bounds>>
    </equation*>

    i.e. that\ 

    <\equation*>
      <LHS|<eqref|eq:iterated-Holder-type-bounds:linear>>\<lesssim\><big|prod><rsub|j=1><rsup|3><around*|\<\|\|\>|f<rsub|j>|\<\|\|\>><rsub|L<rsup|p<rsub|j>><around*|(|<R>|)>><infix-and><LHS|<eqref|eq:iterated-Holder-type-bounds:bilinear>>\<lesssim\><big|prod><rsub|j=1><rsup|3><around*|\<\|\|\>|f<rsub|j>|\<\|\|\>><rsub|L<rsup|p<rsub|j>><around*|(|<R>|)>>.
    </equation*>

    \;

    For the former bound it remains to exhibit a choice of
    <math|<around*|(|q<rsub|1>,q<rsub|2>,q<rsub|3>|)>>,
    <math|<around*|(|r<rsub|1>,r<rsub|2>,r<rsub|3>|)>>, and
    <math|<around*|(|u<rsub|1>,u<rsub|2>,u<rsub|3>|)>> so that bounds
    <eqref|eq:iterated-Holder-type-bounds:linear>,
    <eqref|eq:embedding-bounds:non-uniform-iterated>, and
    <eqref|eq:embedding-bounds:uniform-iterated> hold. According to
    <smart-ref|prop:holder-bound-trilinear>,
    <smart-ref|thm:non-uniform-embedding-bounds>, and
    <smart-ref|thm:uniform-embedding-bounds:linear>, the bounds of interest
    hold as long as\ 

    <\itemize>
      <item><math|q<rsub|j>\<gtr\>max<around*|(|2,p<rsub|j><rprime|'>|)>>,
      <math|j\<in\><around*|{|1,2,3|}>>,

      <item><math|<big|sum><rsub|j=1><rsup|3>q<rsub|j><rsup|-1>\<gtr\>1\<gtr\>q<rsub|2><rsup|-1>+q<rsub|3><rsup|-1>>,

      <item><math|1\<less\>r<rsub|j>\<less\>q<rsub|j>>,
      <math|j\<in\><around*|{|2,3|}>>, and
      <math|r<rsub|2><rsup|-1>+r<rsub|3><rsup|-1>\<gtr\>p<rsub|2><rsup|-1>+p<rsub|3><rsup|-1>>,

      <item><math|u<rsub|1>\<in\><around*|(|1,\<infty\>|)>>,
      <math|u<rsub|j>\<less\>r<rsub|j>>, <math|j\<in\><around*|{|2,3|}>>, and
      <math|<big|sum><rsub|j=1><rsup|3>u<rsub|j><rsup|-1>\<leq\>1>.
    </itemize>

    First of all, let <math|q<rsub|j>=max<around*|(|2,p<rsub|j><rprime|'>|)>+\<varepsilon\>>
    so that <math|<big|sum><rsub|j=1><rsup|3>q<rsub|j><rsup|-1>\<gtr\>1\<gtr\>q<rsub|2><rsup|-1>+q<rsub|3><rsup|-1>>
    for any <math|\<varepsilon\>\<gtr\>0> sufficiently mall. As a matter of
    fact the second inequality follows immediately; for the first inequality
    note that

    <\equation*>
      <big|sum><rsub|j=1><rsup|3>min<around*|(|<frac|1|2>,1-<frac|1|p<rsub|j>>|)>\<gtr\>1
    </equation*>

    because \ <math|p<rsub|j>\<less\>2> for at most 1 index
    <math|j=j<rsub|\<less\>>\<in\><around*|{|1,2,3|}>> (since
    \ <math|<big|sum><rsub|j=1<rsup|>><rsup|3>p<rsub|j><rsup|-1>=1>). This
    gives that either

    <\equation*>
      <big|sum><rsub|j=1><rsup|3>min<around*|(|<frac|1|2>,1-<frac|1|p<rsub|j>>|)>=3-<big|sum><rsub|j=1><rsup|3><frac|1|p<rsub|j>>=2
    </equation*>

    or

    <\equation*>
      <big|sum><rsub|j=1><rsup|3>min<around*|(|<frac|1|2>,1-<frac|1|p<rsub|j>>|)>=<frac|1|2>-<around*|(|1-<frac|1|p<rsub|j<rsub|\<less\>>>>|)>+<big|sum><rsub|j=1><rsup|3><around*|(|1-<frac|1|p<rsub|j>>|)>=<frac|1|p<rsub|j<rsub|\<less\>>>>-<frac|1|2>+2.
    </equation*>

    Next, let <math|r<rsub|j>=2+\<varepsilon\><rprime|'>> so that
    <math|r<rsub|j>\<less\>q<rsub|j>> as long as
    <math|\<varepsilon\><rprime|'>\<less\>\<varepsilon\>>. Note that

    <\equation*>
      r<rsub|2><rsup|-1>+r<rsub|3><rsup|-1>=<frac|2|2+\<varepsilon\><rprime|'>>\<gtr\>1-p<rsub|1><rsup|-1>=p<rsub|2><rsup|-1>+p<rsub|3><rsup|-1>
    </equation*>

    as long as <math|\<varepsilon\><rprime|'>\<gtr\>0> is chosen small
    enough. Finally, set <math|u<rsub|j>=2+\<varepsilon\><rprime|''>>,
    <math|j\<in\><around*|{|2,3|}>> and <math|u<rsub|1>=<frac|2+\<varepsilon\><rprime|''>|\<varepsilon\><rprime|''>>>.
    If <math|\<varepsilon\><rprime|''>\<less\>\<varepsilon\><rprime|'>> then
    <math|u<rsub|j>\<less\>r<rsub|j>> for <math|j\<in\><around*|{|2,3|}>>, as
    required. This satisfies all the conditions above.\ 

    For the latter bound

    <\equation*>
      <LHS|<eqref|eq:iterated-Holder-type-bounds:bilinear>>\<lesssim\><big|prod><rsub|j=1><rsup|3><around*|\<\|\|\>|f<rsub|j>|\<\|\|\>><rsub|L<rsup|p<rsub|j>><around*|(|<R>|)>>.
    </equation*>

    it remains to exhibit a choice of <math|<around*|(|q<rsub|1>,q<rsub|\<times\>>|)>>,
    <math|<around*|(|r<rsub|1>,r<rsub|\<times\>>|)>>, and
    <math|<around*|(|u<rsub|1>,u<rsub|\<times\>>|)>> so that bounds
    <eqref|eq:iterated-Holder-type-bounds:linear>,
    <eqref|eq:embedding-bounds:non-uniform-iterated>, and
    <smart-ref|eq:iterated-Holder-type-bounds:bilinear> hold. According to
    <smart-ref|prop:holder-bound-trilinear>,
    <smart-ref|thm:non-uniform-embedding-bounds>, and
    <smart-ref|thm:uniform-embedding-bounds:bilinear>, the bounds of interest
    hold as long as

    <\itemize>
      <item><math|q<rsub|1>\<gtr\>max<around*|(|2,p<rsub|j><rprime|'>|)>> and
      <math|q<rsub|\<times\>>\<gtr\><around*|(|min<around*|(|1-<frac|1|p<rsub|2>>,<frac|1|2>|)><rsup|>+min<around*|(|1-<frac|1|p<rsub|3>>,<frac|1|2>|)>|)><rsup|-1>>,

      <item> <math|q<rsub|1><rsup|-1>+q<rsub|\<times\>><rsup|-1>\<gtr\>1\<gtr\>q<rsub|\<times\>><rsup|-1>>,

      <item><math|1\<less\>r<rsub|\<times\>>\<less\>q<rsub|\<times\>>>,
      <math|j\<in\><around*|{|2,3|}>>, and
      <math|r<rsub|\<times\>><rsup|-1>\<gtr\>p<rsub|2><rsup|-1>+p<rsub|3><rsup|-1>>,

      <item><math|u<rsub|1>\<in\><around*|(|1,\<infty\>|)>>,
      <math|u<rsub|\<times\>>\<less\>r<rsub|\<times\>>>, and
      <math|u<rsub|1><rsup|-1>+u<rsub|\<times\>><rsup|-1>\<leq\>1>.
    </itemize>

    Using the exponents selected for the former bound and setting
    <math|q<rsub|\<times\>><rsup|-1><eqd>q<rsub|2><rsup|-1>+q<rsub|3><rsup|-1>>,
    <math|r<rsub|\<times\>><rsup|-1><eqd>r<rsub|2><rsup|-1>+r<rsub|3><rsup|-1>>,
    and <math|u<rsub|\<times\>><rsup|-1><eqd>u<rsub|2><rsup|-1>+u<rsub|3><rsup|-1>>
    the result follows.\ 
  </render-proof>

  <section|Extra>

  As mentioned before, we do not prove these results directly but rather we
  deduce them from the non-uniform bounds
  <eqref|eq:embedding-bounds:non-uniform-iterated>, that in turn follow from
  <cite|amentaBilinearHilbertTransform2020>. To do so we make use of covering
  lemmata depending on the geometry of the outer measure space
  <math|<R><rsup|3><rsub|+>>. The arguments involded in the proof of the
  above results are purely positive and can be interpreted as boundedness
  properties of the map <math|F\<mapsto\>F\<circ\>\<Gamma\>> in terms of
  outer Lebesgue quasi-norms. As a matter of fact, with few exceptions, the
  functions <math|F\<in\><Rad><around*|(|<R><rsup|3><rsub|+>|)>\<otimes\>\<Phi\><rsup|\<infty\>><rsub|<gr>><rprime|'>>
  in play need not be of the form <math|F=<Emb><around*|[|f|]>> for some
  <math|f\<in\><Sch><around*|(|<R>|)>>. We are hopeful that appropriate
  refinements can lead to completely removing such assumptions in the
  intermediate lemmata.\ 

  Finally,\ 

  <specific|latex|% !!!!begin[TeXmacs][bibliography]>

  <\bibliography|bib|tm-alpha|ubht.bib>
    \;
  </bibliography>

  <specific|latex|% !!!!end[TeXmacs][bibliography]>

  <specific|latex|% !!!!begin[LaTeX][bibliography]>

  <specific|latex|\\printbibliography>

  <inactive|<specific|latex|% !!!!end[LaTeX][bibliography]>>
</body>

<\initial>
  <\collection>
    <associate|global-title|Uniform bounds for the bilinear Hilbert
    transform>
    <associate|info-flag|short>
    <associate|magnification|1>
    <associate|page-breaking|sloppy>
    <associate|page-crop-marks|a4>
    <associate|page-height|auto>
    <associate|page-medium|paper>
    <associate|page-screen-margin|false>
    <associate|page-type|a4>
    <associate|page-width|auto>
    <associate|preamble|false>
    <associate|project-flag|false>
    <associate|stem-doc-id|68107229-B8F6-4D30-8275-52D69B1E7480>
  </collection>
</initial>

<\attachments>
  <\collection>
    <\associate|bib-bibliography>
      <\db-entry|+1wKhZj9A2FpOzxjC|article|laceyEstimatesBilinearHilbert1997>
        <db-field|contributor|guraltsev>

        <db-field|modus|imported>

        <db-field|date|1672266577>

        <db-field|date|1997>
      <|db-entry>
        <db-field|author|M. <name|Lacey><name-sep>C. Lp <name|Thiele>>

        <db-field|title|Estimates on the bilinear Hilbert transform for
        2<math|\<less\>> p<math|\<less\>\<infty\>>>

        <db-field|volume|146>

        <db-field|pages|693\U724>

        <db-field|journaltitle|Ann. Math>
      </db-entry>

      <\db-entry|+1wKhZj9A2FpOzxjB|article|laceyCalderonConjectureBilinear1998>
        <db-field|contributor|guraltsev>

        <db-field|modus|imported>

        <db-field|date|1672266577>

        <db-field|date|1998>
      <|db-entry>
        <db-field|author|Michael T. <name|Lacey><name-sep>Christoph M.
        <name|Thiele>>

        <db-field|title|On Calderón's conjecture for the bilinear Hilbert
        transform>

        <db-field|volume|95>

        <db-field|number|9>

        <db-field|pages|4828>

        <db-field|journaltitle|Proceedings of the National Academy of
        Sciences of the United States of America>

        <db-field|doi|ttps://doi.org/10.1073/pnas.95.9.4828>
      </db-entry>

      <\db-entry|+1wKhZj9A2FpOzxjK|book|thieleWavePacketAnalysis2006>
        <db-field|contributor|guraltsev>

        <db-field|modus|imported>

        <db-field|date|1672266577>

        <db-field|date|2006>
      <|db-entry>
        <db-field|author|Christoph <name|Thiele>>

        <db-field|title|Wave packet analysis>

        <db-field|publisher|Published for the Conference Board of the
        Mathematical Sciences, Washington, DC; by the American Mathematical
        Society, Providence, RI>

        <db-field|volume|105>

        <db-field|series|CBMS Regional Conference Series in Mathematics>

        <db-field|ids|thieleWavePacketAnalysis2006a,thieleWavePacketAnalysis2006c>

        <db-field|doi|10.1090/cbms/105>

        <db-field|url|<slink|http://www.ams.org/mathscinet-getitem?mr=2199086>>

        <db-field|isbn|978-0-8218-3661-3>

        <db-field|mrnumber|2199086>

        <db-field|pagetotal|vi+86>
      </db-entry>

      <\db-entry|+1wKhZj9A2FpOzxiz|article|carlesonConvergenceGrowthPartial1966>
        <db-field|contributor|guraltsev>

        <db-field|modus|imported>

        <db-field|date|1672266577>

        <db-field|date|1966>
      <|db-entry>
        <db-field|author|Lennart <name|Carleson>>

        <db-field|title|On convergence and growth of partial sums of Fourier
        series>

        <db-field|volume|116>

        <db-field|number|0>

        <db-field|pages|135\U157>

        <db-field|journaltitle|Acta Mathematica>

        <db-field|shortjournal|Acta Math.>

        <db-field|issn|0001-5962>

        <db-field|doi|10.1007/BF02392815>

        <db-field|url|<slink|http://projecteuclid.org/euclid.acta/1485889479>>

        <db-field|langid|english>
      </db-entry>

      <\db-entry|+1wKhZj9A2FpOzxj5|article|feffermanPointwiseConvergenceFourier1973>
        <db-field|contributor|guraltsev>

        <db-field|modus|imported>

        <db-field|date|1672266577>

        <db-field|date|1973-11>
      <|db-entry>
        <db-field|author|Charles <name|Fefferman>>

        <db-field|title|Pointwise convergence of Fourier series>

        <db-field|volume|98>

        <db-field|number|3>

        <db-field|pages|551>

        <db-field|journaltitle|The Annals of Mathematics>

        <db-field|shortjournal|The Annals of Mathematics>

        <db-field|issn|0003486X>

        <db-field|doi|10.2307/1970917>

        <db-field|url|<slink|https://www.jstor.org/stable/1970917?origin=crossref>>
      </db-entry>

      <\db-entry|+1wKhZj9A2FpOzxjJ|article|thieleUniformEstimate2002>
        <db-field|contributor|guraltsev>

        <db-field|modus|imported>

        <db-field|date|1672266577>

        <db-field|date|2002-09>
      <|db-entry>
        <db-field|author|Christoph <name|Thiele>>

        <db-field|title|A Uniform Estimate>

        <db-field|volume|156>

        <db-field|number|2>

        <db-field|pages|519\U563>

        <db-field|journaltitle|The Annals of Mathematics>

        <db-field|shortjournal|The Annals of Mathematics>

        <db-field|issn|0003486X>

        <db-field|doi|10.2307/3597197>

        <db-field|url|<slink|https://www.jstor.org/stable/3597197?origin=crossref>>
      </db-entry>

      <\db-entry|+1wKhZj9A2FpOzxj6|article|grafakosUniformBoundsBilinear2004>
        <db-field|contributor|guraltsev>

        <db-field|modus|imported>

        <db-field|date|1672266577>

        <db-field|date|2004-05-01>
      <|db-entry>
        <db-field|author|Loukas <name|Grafakos><name-sep>Xiaochun <name|Li>>

        <db-field|title|Uniform bounds for the bilinear Hilbert transforms,
        I>

        <db-field|volume|159>

        <db-field|number|3>

        <db-field|pages|889\U933>

        <db-field|journaltitle|Annals of Mathematics>

        <db-field|shortjournal|Ann. Math.>

        <db-field|issn|0003-486X>

        <db-field|doi|10.4007/annals.2004.159.889>

        <db-field|url|<slink|http://annals.math.princeton.edu/2004/159-3/p01>>

        <db-field|langid|english>
      </db-entry>

      <\db-entry|+1wKhZj9A2FpOzxjF|article|liUniformBoundsBilinear2006>
        <db-field|contributor|guraltsev>

        <db-field|modus|imported>

        <db-field|date|1672266577>

        <db-field|date|2006>
      <|db-entry>
        <db-field|author|Xiaochun <name|Li>>

        <db-field|title|Uniform bounds for the bilinear Hilbert transforms,
        II>

        <db-field|volume|22>

        <db-field|number|3>

        <db-field|pages|1069\U1126>

        <db-field|journaltitle|Revista Matemática Iberoamericana>

        <db-field|shortjournal|Rev. Mat. Iberoamericana>

        <db-field|issn|0213-2230>

        <db-field|doi|10.4171/RMI/483>

        <db-field|url|<slink|http://www.ems-ph.org/doi/10.4171/RMI/483>>

        <db-field|langid|english>
      </db-entry>

      <\db-entry|+1wKhZj9A2FpOzxjA|article|laceyBilinearMaximalFunctions2000a>
        <db-field|contributor|guraltsev>

        <db-field|modus|imported>

        <db-field|date|1672266577>

        <db-field|date|2000>
      <|db-entry>
        <db-field|author|Michael T. <name|Lacey>>

        <db-field|title|The bilinear maximal functions map into
        <math|L<rsup|p>> for <math|2/3\<less\>p\<leq\>1>>

        <db-field|volume|151>

        <db-field|number|1>

        <db-field|pages|35\U57>

        <db-field|journaltitle|Annals of Mathematics>

        <db-field|publisher|Annals of Mathematics>

        <db-field|issn|0003-486X>

        <db-field|doi|10.2307/121111>

        <db-field|url|<slink|https://www.jstor.org/stable/121111>>
      </db-entry>

      <\db-entry|+1wKhZj9A2FpOzxjI|article|oberlinNewUniformBounds2011>
        <db-field|contributor|guraltsev>

        <db-field|modus|imported>

        <db-field|date|1672266577>

        <db-field|date|2011>
      <|db-entry>
        <db-field|author|Richard <name|Oberlin><name-sep>Christoph
        <name|Thiele>>

        <db-field|title|New Uniform Bounds for a Walsh Model of the Bilinear
        Hilbert Transform>

        <db-field|volume|60>

        <db-field|number|5>

        <db-field|pages|1693\U1711>

        <db-field|journaltitle|Indiana University Mathematics Journal>

        <db-field|publisher|Indiana University Mathematics Department>

        <db-field|issn|0022-2518>

        <db-field|doi|10.1512/iumj.2011.60.4445>

        <db-field|url|<slink|https://www.jstor.org/stable/24903841>>
      </db-entry>

      <\db-entry|+1wKhZj9A2FpOzxiy|article|calderonCommutatorsSingularIntegral1965>
        <db-field|contributor|guraltsev>

        <db-field|modus|imported>

        <db-field|date|1672266577>

        <db-field|date|1965-05-01>
      <|db-entry>
        <db-field|author|A. P. <name|Calderón>>

        <db-field|title|Commutators of singular integral operators>

        <db-field|volume|53>

        <db-field|number|5>

        <db-field|pages|1092\U1099>

        <db-field|journaltitle|Proceedings of the National Academy of
        Sciences>

        <db-field|issn|0027-8424, 1091-6490>

        <db-field|doi|10.1073/pnas.53.5.1092>

        <db-field|url|<slink|http://www.pnas.org/cgi/doi/10.1073/pnas.53.5.1092>>

        <db-field|langid|english>
      </db-entry>

      <\db-entry|+1wKhZj9A2FpOzxjG|article|muscaluCalderonCommutatorsCauchy2014>
        <db-field|contributor|guraltsev>

        <db-field|modus|imported>

        <db-field|date|1672266577>

        <db-field|date|2014>
      <|db-entry>
        <db-field|author|Camil <name|Muscalu>>

        <db-field|title|Calderón commutators and the Cauchy integral on
        Lipschitz curves revisited I. First commutator and generalizations>

        <db-field|volume|30>

        <db-field|number|2>

        <db-field|pages|727\U750>

        <db-field|journaltitle|Revista Matemática Iberoamericana>

        <db-field|shortjournal|Rev. Mat. Iberoamericana>

        <db-field|issn|0213-2230>

        <db-field|doi|10.4171/RMI/798>

        <db-field|url|<slink|http://www.ems-ph.org/doi/10.4171/RMI/798>>

        <db-field|langid|english>
      </db-entry>

      <\db-entry|+1wKhZj9A2FpOzxjH|book|muscaluClassicalMultilinearHarmonic2013a>
        <db-field|contributor|guraltsev>

        <db-field|modus|imported>

        <db-field|date|1672266577>

        <db-field|date|2013>
      <|db-entry>
        <db-field|author|Camil <name|Muscalu><name-sep>Wilhelm <name|Schlag>>

        <db-field|title|Classical and multilinear harmonic analysis. Vol. II>

        <db-field|publisher|Cambridge University Press, Cambridge>

        <db-field|volume|138>

        <db-field|series|Cambridge Studies in Advanced Mathematics>

        <db-field|url|<slink|http://www.ams.org/mathscinet-getitem?mr=3052499>>

        <db-field|isbn|978-1-107-03182-1>

        <db-field|mrnumber|3052499>

        <db-field|pagetotal|xvi+324>
      </db-entry>

      <\db-entry|+1wKhZj9A2FpOzxj7|article|gressmanTrilinearSingularIntegral2016>
        <db-field|contributor|guraltsev>

        <db-field|modus|imported>

        <db-field|date|1672266577>

        <db-field|date|2016>
      <|db-entry>
        <db-field|author|Philip <name|Gressman><name-sep>Danqing
        <name|He><name-sep>Vjekoslav <name|Kova£><name-sep>Brian
        <name|Street><name-sep>Christoph <name|Thiele><name-sep>Po-Lam
        <name|Yung>>

        <db-field|title|On a trilinear singular integral form with
        determinantal kernel>

        <db-field|volume|144>

        <db-field|number|8>

        <db-field|pages|3465\U3477>

        <db-field|journaltitle|Proceedings of the American Mathematical
        Society>

        <db-field|publisher|American Mathematical Society>

        <db-field|issn|0002-9939>

        <db-field|doi|10.1090/proc/13007>

        <db-field|url|<slink|https://www.jstor.org/stable/procamermathsoci.144.8.3465>>
      </db-entry>

      <\db-entry|+1wKhZj9A2FpOzxj0|article|demeterTwodimensionalBilinearHilbert2010>
        <db-field|contributor|guraltsev>

        <db-field|modus|imported>

        <db-field|date|1672266577>

        <db-field|date|2010>
      <|db-entry>
        <db-field|author|Ciprian <name|Demeter><name-sep>Christoph
        <name|Thiele>>

        <db-field|title|On the two-dimensional bilinear Hilbert transform>

        <db-field|volume|132>

        <db-field|number|1>

        <db-field|pages|201\U256>

        <db-field|journaltitle|American Journal of Mathematics>

        <db-field|shortjournal|American Journal of Mathematics>

        <db-field|issn|1080-6377>

        <db-field|doi|10.1353/ajm.0.0101>

        <db-field|url|http://muse.jhu.edu/content/crossref/journals/american<rsub|j>ournal<rsub|o>f<rsub|m>athematics/v132/132.1.demeter.html>

        <db-field|langid|english>
      </db-entry>

      <\db-entry|+1wKhZj9A2FpOzxj8|article|kovacBoundednessTwistedParaproduct2012>
        <db-field|contributor|guraltsev>

        <db-field|modus|imported>

        <db-field|date|1672266577>

        <db-field|date|2012>
      <|db-entry>
        <db-field|author|Vjekoslav <name|Kova£>>

        <db-field|title|Boundedness of the twisted paraproduct>

        <db-field|volume|28>

        <db-field|number|4>

        <db-field|pages|1143\U1164>

        <db-field|ids|KovacBoundednesstwistedparaproduct2012>

        <db-field|journaltitle|Revista Matemática Iberoamericana>

        <db-field|issn|0213-2230>

        <db-field|doi|10.4171/RMI/707>

        <db-field|url|<slink|http://www.ems-ph.org/doi/10.4171/RMI/707>>

        <db-field|langid|english>
      </db-entry>

      <\db-entry|+1wKhZj9A2FpOzxj9|article|kovacDyadicTriangularHilbert2015>
        <db-field|contributor|guraltsev>

        <db-field|modus|imported>

        <db-field|date|1672266577>

        <db-field|date|2015-11>
      <|db-entry>
        <db-field|author|Vjekoslav <name|Kova£><name-sep>Christoph
        <name|Thiele><name-sep>Pavel <name|Zorin-Kranich>>

        <db-field|title|Dyadic triangular hilbert transform of two general
        functions and one not too general function>

        <db-field|volume|3>

        <db-field|journaltitle|Forum of Mathematics, Sigma>

        <db-field|issn|2050-5094>

        <db-field|doi|10.1017/fms.2015.25>

        <db-field|url|<slink|https://www.cambridge.org/core/journals/forum-of-mathematics-sigma/article/dyadic-triangular-hilbert-transform-of-two-general-functions-and-one-not-too-general-function/AD580A2871040CFCC90068661D3733CF>>

        <db-field|langid|english>
      </db-entry>

      <\db-entry|+1wKhZj9A2FpOzxj3|article|doTheoryOuterMeasures2015>
        <db-field|contributor|guraltsev>

        <db-field|modus|imported>

        <db-field|date|1672266577>

        <db-field|date|2015>
      <|db-entry>
        <db-field|author|Yen <name|Do><name-sep>Christoph <name|Thiele>>

        <db-field|title|<math|L<rsup|p>> theory for outer measures and two
        themes of Lennart Carleson united>

        <db-field|volume|52>

        <db-field|number|2>

        <db-field|pages|249\U296>

        <db-field|journaltitle|Bulletin of the American Mathematical Society>

        <db-field|url|<slink|http://www.ams.org/bull/2015-52-02/S0273-0979-2014-01474-0/>>
      </db-entry>

      <\db-entry|+1wKhZj9A2FpOzxjL|misc|uraltsevVariationalCarlesonEmbeddings2016>
        <db-field|contributor|guraltsev>

        <db-field|modus|imported>

        <db-field|date|1672266577>

        <db-field|date|2016-10-24>
      <|db-entry>
        <db-field|author|Gennady <name|Uraltsev>>

        <db-field|title|Variational Carleson embeddings into the upper
        3-space>

        <db-field|eprint|1610.07657>

        <db-field|eprinttype|arxiv>

        <db-field|url|<slink|http://arxiv.org/abs/1610.07657>>

        <db-field|archiveprefix|arXiv>
      </db-entry>

      <\db-entry|+1wKhZj9A2FpOzxj1|article|diplinioModulationInvariantCarleson2018>
        <db-field|contributor|guraltsev>

        <db-field|modus|imported>

        <db-field|date|1672266577>

        <db-field|date|2018-06-01>
      <|db-entry>
        <db-field|author|Francesco <name-von|di>
        <name|Plinio><name-sep>Yumeng <name|Ou>>

        <db-field|title|A modulation invariant Carleson embedding theorem
        outside local L2>

        <db-field|volume|135>

        <db-field|number|2>

        <db-field|pages|675\U711>

        <db-field|options|useprefix=true>

        <db-field|journaltitle|Journal d'Analyse Mathématique>

        <db-field|shortjournal|JAMA>

        <db-field|issn|1565-8538>

        <db-field|doi|10.1007/s11854-018-0049-4>

        <db-field|url|<slink|https://doi.org/10.1007/s11854-018-0049-4>>

        <db-field|langid|english>
      </db-entry>

      <\db-entry|+1wKhZj9A2FpOzxix|article|amentaBilinearHilbertTransform2020>
        <db-field|contributor|guraltsev>

        <db-field|modus|imported>

        <db-field|date|1672266577>

        <db-field|date|2020-12-01>
      <|db-entry>
        <db-field|author|Alex <name|Amenta><name-sep>Gennady <name|Uraltsev>>

        <db-field|title|The bilinear Hilbert transform in UMD spaces>

        <db-field|volume|378>

        <db-field|number|3>

        <db-field|pages|1129\U1221>

        <db-field|journaltitle|Mathematische Annalen>

        <db-field|shortjournal|Math. Ann.>

        <db-field|issn|1432-1807>

        <db-field|doi|10.1007/s00208-020-02052-y>

        <db-field|url|<slink|https://doi.org/10.1007/s00208-020-02052-y>>

        <db-field|langid|english>
      </db-entry>

      <\db-entry|+1wKhZj9A2FpOzxj2|unpublished|diplinioWeaktypeCarlesonTheorem2022>
        <db-field|contributor|guraltsev>

        <db-field|modus|imported>

        <db-field|date|1672266577>

        <db-field|date|2022-04-17>
      <|db-entry>
        <db-field|author|Francesco <name|Di Plinio><name-sep>Anastasios
        <name|Fragkos>>

        <db-field|title|The weak-type Carleson theorem via wave packet
        estimates>

        <db-field|number|arXiv:2204.08051>

        <db-field|eprint|2204.08051>

        <db-field|eprinttype|arxiv>

        <db-field|primaryclass|math>

        <db-field|publisher|arXiv>

        <db-field|doi|10.48550/arXiv.2204.08051>

        <db-field|url|<slink|http://arxiv.org/abs/2204.08051>>

        <db-field|archiveprefix|arXiv>
      </db-entry>

      <\db-entry|+1wKhZj9A2FpOzxj4|book|federerGeometricMeasureTheory1996>
        <db-field|contributor|guraltsev>

        <db-field|modus|imported>

        <db-field|date|1672266577>

        <db-field|date|1996>
      <|db-entry>
        <db-field|author|Herbert <name|Federer>>

        <db-field|editor|B. <name|Eckmann><name-sep>B. L. <name-von|van der>
        <name|Waerden>>

        <db-field|title|Geometric Measure Theory>

        <db-field|publisher|Springer Berlin Heidelberg>

        <db-field|series|Classics in Mathematics>

        <db-field|options|useprefix=true>

        <db-field|location|Berlin, Heidelberg>

        <db-field|doi|10.1007/978-3-642-62010-2>

        <db-field|url|<slink|http://link.springer.com/10.1007/978-3-642-62010-2>>

        <db-field|isbn|978-3-540-60656-7 978-3-642-62010-2>
      </db-entry>

      <\db-entry|+1wKhZj9A2FpOzxiw|article|amentaBanachvaluedModulationInvariant2020>
        <db-field|contributor|guraltsev>

        <db-field|modus|imported>

        <db-field|date|1672266577>

        <db-field|date|2020-06-22>
      <|db-entry>
        <db-field|author|Alex <name|Amenta><name-sep>Gennady <name|Uraltsev>>

        <db-field|title|Banach-valued modulation invariant Carleson
        embeddings and outer - <math|L<rsup|p>> spaces: the Walsh case>

        <db-field|volume|26>

        <db-field|number|4>

        <db-field|pages|53>

        <db-field|shorttitle|Banach-Valued Modulation Invariant Carleson
        Embeddings and Outer-$$L<math|<wide|<text|p>|^>>$$Spaces>

        <db-field|journaltitle|Journal of Fourier Analysis and Applications>

        <db-field|shortjournal|J Fourier Anal Appl>

        <db-field|issn|1531-5851>

        <db-field|doi|10.1007/s00041-020-09768-0>

        <db-field|url|<slink|https://doi.org/10.1007/s00041-020-09768-0>>

        <db-field|langid|english>
      </db-entry>
    </associate>
  </collection>
</attachments>

<\references>
  <\collection>
    <associate|auto-1|<tuple|1|19>>
    <associate|auto-10|<tuple|2.2.3|16>>
    <associate|auto-11|<tuple|2.2.4|?>>
    <associate|auto-12|<tuple|2.3|?>>
    <associate|auto-13|<tuple|2.3.1|?>>
    <associate|auto-14|<tuple|2.4|?>>
    <associate|auto-15|<tuple|3|?>>
    <associate|auto-2|<tuple|1.1|19>>
    <associate|auto-3|<tuple|1.1|14>>
    <associate|auto-4|<tuple|1.2|15>>
    <associate|auto-5|<tuple|1.3|15>>
    <associate|auto-6|<tuple|2.1|15>>
    <associate|auto-7|<tuple|2.2|15>>
    <associate|auto-8|<tuple|2.2.1|15>>
    <associate|auto-9|<tuple|2.2.2|16>>
    <associate|eq:BHT|<tuple|1.1|1>>
    <associate|eq:BHT-bounds|<tuple|1.2|2>>
    <associate|eq:BHT-dual-bounds|<tuple|1.7|4>>
    <associate|eq:BHT-symmetry-relations|<tuple|1.4|4>>
    <associate|eq:BHT-wave-packet-representation|<tuple|1.5|4>>
    <associate|eq:embedding|<tuple|1.6|4>>
    <associate|eq:gamma:params|<tuple|1.8|5>>
    <associate|eq:symmetries|<tuple|1.3|4>>
    <associate|fig:triangle|<tuple|1.1|3>>
    <associate|sec:bound-exterior-size|<tuple|4.1|15>>
    <associate|sec:derived-sizes|<tuple|2.3|11>>
    <associate|sec:final-summary|<tuple|6|19>>
    <associate|sec:forest|<tuple|2|14>>
    <associate|sec:intro|<tuple|1.3|1>>
    <associate|sec:localized-outer-lebesgue|<tuple|2.4|12>>
    <associate|sec:non-unif:counting-function-improvement|<tuple|3.2|15>>
    <associate|sec:non-uniform|<tuple|3|14>>
    <associate|sec:non-uniform:SIO|<tuple|3.1|15>>
    <associate|sec:outer-generalities|<tuple|2.1|8>>
    <associate|sec:outer-space|<tuple|7|7>>
    <associate|sec:outline-non-uniform|<tuple|1.3|5>>
    <associate|sec:outline-uniform|<tuple|1|6>>
    <associate|sec:single-tree|<tuple|7|13>>
    <associate|sec:size-motivation|<tuple|2.2.4|10>>
    <associate|sec:sizes|<tuple|2.2.2|9>>
    <associate|sec:time-frequency-outer-lebesgue|<tuple|2.2|9>>
    <associate|sec:unif-bounds:singular|<tuple|4.2|15>>
    <associate|sec:unif-derived-size-bound|<tuple|4.3|16>>
    <associate|sec:uniform-embeddings:bilinear|<tuple|5|16>>
    <associate|sec:uniform-embeddings:linear|<tuple|7|15>>
    <associate|sec:wave-packet-representation|<tuple|1|7>>
    <associate|thm:main-1|<tuple|1.1|2>>
  </collection>
</references>

<\auxiliary>
  <\collection>
    <\associate|bib>
      amentaBilinearHilbertTransform2020

      doTheoryOuterMeasures2015

      doTheoryOuterMeasures2015

      amentaBilinearHilbertTransform2020
    </associate>
    <\associate|toc>
      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|<locus|<id|%14B5AB5ECB8-14B2FD5EF10-494689CA>|<link|hyperlink|<id|%14B5AB5ECB8-14B2FD5EF10-494689CA>|<url|#auto-1>>|1<space|2spc>Summary
      and proof of uniform bounds>><datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.05fn>.<space|0.05fn>>>>>|<htab|5mm>><no-break><pageref|auto-1><vspace|0.5fn>

      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|<locus|<id|%14B5AB5ECB8-14B2FD1C958-494689CA>|<link|hyperlink|<id|%14B5AB5ECB8-14B2FD1C958-494689CA>|<url|#auto-2>>|2<space|2spc>Extra>><datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.05fn>.<space|0.05fn>>>>>|<htab|5mm>><no-break><pageref|auto-2><vspace|0.5fn>
    </associate>
  </collection>
</auxiliary>