%let pgm=utl-general-framework-for-fitting-non-linear-equation-with-transcendental-functions-on-a-unit-square;

General framework for fitting non linear equation with transcendental functions on a unit square

/*               _     _                   __ _ _     _   _     _
 _ __  _ __ ___ | |__ | | ___ _ __ ___    / _(_) |_  | |_| |__ (_)___
| `_ \| `__/ _ \| `_ \| |/ _ \ `_ ` _ \  | |_| | __| | __| `_ \| / __|
| |_) | | | (_) | |_) | |  __/ | | | | | |  _| | |_  | |_| | | | \__ \
| .__/|_|  \___/|_.__/|_|\___|_| |_| |_| |_| |_|\__|  \__|_| |_|_|___/
|_|
*/

https://tinyurl.com/4e335xb9
https://github.com/rogerjdeangelis/utl-general-framework-for-fitting-non-linear-equation-with-transcendental-functions-on-a-unit-square/blob/main/pltgrf.pdf


 Regression cannot easily handle an almost perfectly vertical line segment.
 Regression may not be appropriate for this problem. However, this solution
 provides the methodology to handle other complex non-linear fits.

 What is remarkable about this fit is that it only needs 3 coefficients.
 I have seen models using a knot that do not seem to fit that much better with 8 parameters.
 A knot provides for a knot and two equations and two sets of parameters

A general framework for non-linear fits?

1 The unit square refers to transforming your data so that all
  values fall within a square with sides of length 1 (from 0 to 1 on both axes). This normalization
  technique can make certain mathematical operations and comparisons easier.
  The unit square has special significance ii complex numbers.

2 Transcendental functions whose Y aor X domains often map to the unit square and can adapt to many data patterns.
  These functions are often orthogonal and independent of each other, which can be useful in modeling complex
  relationships.

3 Transcendental functions include sine, cosine, and tangent functions. They're periodic and can model
  cyclical patterns in data. Which are independent, orthogonal and partition the mean square error
  exclusively. They can naturally map into a unit square,

4 The simple beta, cdf, and pdf, have only two parameters and is well defined in the unit square.
  The distribution function (CDF) and probability density function (PDF) can model various
  shapes. The most flexible of all cdfs and pdfs?

  The combination of these techniques
  and functions allow for modeling many different types of relationships and patterns in data.


https://stackoverflow.com/questions/78915512/using-python-to-calculate-pka-from-titration-curve-for-diprotic-acid

Related repos

https://github.com/rogerjdeangelis/utl-roots-of-a-non-linear-function-using-python-sympy
https://github.com/rogerjdeangelis/utl_using_nonlinear_optimization_to_fit_an_arc_tangent_curve
https://github.com/rogerjdeangelis/utl_solving_a_system_of_nonlinear_equations
https://github.com/rogerjdeangelis/utl_complex_weighted_non_linear_least_squares_fit_five_parameter_function

       CONTENTS

           1 input - smoothed & mapped
           2 process - fitting
           3 output mapped
           4 transform back
           5 ops solution
/*   _                   _                                       _   _        ___                                          _
/ | (_)_ __  _ __  _   _| |_           ___ _ __ ___   ___   ___ | |_| |__    ( _ )    _ __ ___   __ _ _ __  _ __   ___  __| |
| | | | `_ \| `_ \| | | | __|  _____  / __| `_ ` _ \ / _ \ / _ \| __| `_ \   / _ \/\ | `_ ` _ \ / _` | `_ \| `_ \ / _ \/ _` |
| | | | | | | |_) | |_| | |_  |_____| \__ \ | | | | | (_) | (_) | |_| | | | | (_>  < | | | | | | (_| | |_) | |_) |  __/ (_| |
|_| |_|_| |_| .__/ \__,_|\__|         |___/_| |_| |_|\___/ \___/ \__|_| |_|  \___/\/ |_| |_| |_|\__,_| .__/| .__/ \___|\__,_|
            |_|                                                                                      |_|   |_|
*/

libname sd1 "d:/sd1";

proc datasets lib=work nolist nodetails kill;
run;quit;

proc datasets lib=sd1 nolist nodetails;
delete rwant have;
run;quit;

data ys;
input ys @@;
cards4;
2.22 2.25 2.28 2.31 2.34 2.38 2.42 2.46 2.51 2.56 2.62 2.69 2.73 2.77 2.83 2.88 2.94 3.01 3.05 3.09 3.14 3.19
3.26 3.33 3.41 3.52 3.66 3.87 4.54 5.8 7.23 7.73 7.94 8.12 8.43 8.63 8.76 8.87 8.96 9.12 9.24 9.36 9.46 9.54 9.63
9.71 9.78 9.86 9.93 10.01 10.08 10.15 10.23 10.32 10.4 10.49 10.59 10.69 10.81 10.93 11.05 11.18 11.3 11.41 11.51
11.61 11.69 11.76 11.83 11.89 11.94 11.99 12.04 12.08 12.12 12.16 12.18 12.21 12.24 12.3 12.36 12.41 12.45 12.49
;;;;
run;quit;

data xs;
input xs @@;
cards4;
0 20 40 60 80 100 120 140 160 180 200 220 230 240 250 260 270 275 280 285
290 295 300 305 310 315 320 325 330 332 335 337 340 342 347 352 357 362 367
377 387 397 407 417 427 437 447 457 467 477 487 497 507 517 527 537 547 557
567 577 587 597 607 617 627 637 647 657 667 677 687 697 707 717 727 737 747
757 767 787 807 827 847 867
;;;;
run;quit;

options validvarname=upcase;
libname sd1 "d:/sd1";
data sd1.have ;
 merge xs ys;
run;quit;

 /**************************************************************************************************************************/
 /*                                                                                                                        */
 /* SD1.HAVE total obs=84                                                                                                  */
 /*                                                                                                                        */
 /*  Obs      XS     YS                                                                                                    */
 /*                                                                                                                        */
 /*    1       0    2.22                                                                                                   */
 /*    2      20    2.25                                                                                                   */
 /*    3      40    2.28                                                                                                   */
 /*    4      60    2.31                                                                                                   */
 /*    5      80    2.34                                                                                                   */
 /*    6     100    2.38                                                                                                   */
 /*    7     120    2.42                                                                                                   */
 /*    8     140    2.46                                                                                                   */
 /*    9     160    2.51                                                                                                   */
 /*                                                                                                                        */
 /* ...                                                                                                                    */
 /*                                                                                                                        */
 /*   75     727    12.12                                                                                                  */
 /*   76     737    12.16                                                                                                  */
 /*   77     747    12.18                                                                                                  */
 /*   78     757    12.21                                                                                                  */
 /*   79     767    12.24                                                                                                  */
 /*   80     787    12.30                                                                                                  */
 /*   81     807    12.36                                                                                                  */
 /*   82     827    12.41                                                                                                  */
 /*   83     847    12.45                                                                                                  */
 /*   84     867    12.49                                                                                                  */
 /*                                                                                                                        */
 /**************************************************************************************************************************/

/*                         _   _           _       _
 ___ _ __ ___   ___   ___ | |_| |__     __| | __ _| |_ __ _
/ __| `_ ` _ \ / _ \ / _ \| __| `_ \   / _` |/ _` | __/ _` |
\__ \ | | | | | (_) | (_) | |_| | | | | (_| | (_| | || (_| |
|___/_| |_| |_|\___/ \___/ \__|_| |_|  \__,_|\__,_|\__\__,_|

*/
proc datasets lib=sd1 nodetails nolist;
  delete rwant;
run;quit;

%utl_rbeginx;
parmcards4;
library(haven)
library(tidyr)
library(zoo)
source("c:/oto/fn_tosas9x.R")
have<-read_sas("d:/sd1/have.sas7bdat")
have;
want<- complete(have, XS = full_seq(XS, 1))
want$YS <- na.approx(want$YS)
want
fn_tosas9x(
      inp    = want
     ,outlib ="d:/sd1/"
     ,outdsn ="rwant"
     );
;;;;
%utl_rendx;

options ls=90 ps=44;
proc plot data= sd1.rwant;
 plot ys*xs='*' /box;
run;quit;
options ps=65 ls=171;

/**************************************************************************************************************************/
/*                                                                                                                        */
/*                                              XS                                                                        */
/*        0        110       220       330       440       550       660       770       880                              */
/*     ---+---------+---------+---------+---------+---------+---------+---------+---------+---                            */
/*     |                                                                                     |                            */
/*  14 +                                                                                     + 14                         */
/*     |   Snoothed original data not mapped to unit square                                  |                            */
/*     |                                                                                     |                            */
/*     |   SD1.RWANT total obs=868                                                           |                            */
/*     |                                                                       ***********   |                            */
/*  12 +     XS      YS                                               *********              + 12                         */
/*     |                                                          *****                      |                            */
/*     |      0    2.2200                                      ****                          |                            */
/*     |      1    2.2215                                   ****                             |                            */
/*     |      2    2.2230                               *****                                |                            */
/*  10 +     ..                                    ******                                    + 10                         */
/*     |     865   12.484                     ******                                         |                            */
/*     |     866   12.486                   ***                                              |                            */
/*  YS |     867   12.488                 ***                                                | YS                         */
/*     |     868   12.490                **                                                  |                            */
/*   8 +                                 *                                                   + 8                          */
/*     |                                 *                                                   |                            */
/*     |                                *                                                    |                            */
/*     |                                *  pKa of an acid from titration                     |                            */
/*     |                                *                                                    |                            */
/*   6 +                                *  Difficult to fit a very near vertical line        + 6                          */
/*     |                                   with non-linear or linear regression?             |                            */
/*     |                                *                                                    |                            */
/*     |                                   I don't see how a physical process can            |                            */
/*     |                                *  instantly have two y states?                      |                            */
/*   4 +                               **                                                    + 4                          */
/*     |                              **                                                     |                            */
/*     |                           **** |                                                    |                            */
/*     |                    ********    |  PKa equivalence point                             |                            */
/*     |  *******************           |  ~330                                              |                            */
/*   2 +                                |                                                    + 2                          */
/*     |                                |                                                    |                            */
/*     ---+---------+---------+---------+---------+---------+---------+---------+---------+---                            */
/*        0        110       220       330       440       550       660       770       880                              */
/*                                                                                                                        */
/**************************************************************************************************************************/

/*                       _                      _ _
 _ __ ___   __ _ _ __   | |_ ___    _   _ _ __ (_) |_   ___  __ _ _   _  __ _ _ __ ___
| `_ ` _ \ / _` | `_ \  | __/ _ \  | | | | `_ \| | __| / __|/ _` | | | |/ _` | `__/ _ \
| | | | | | (_| | |_) | | || (_) | | |_| | | | | | |_  \__ \ (_| | |_| | (_| | | |  __/
|_| |_| |_|\__,_| .__/   \__\___/   \__,_|_| |_|_|\__| |___/\__, |\__,_|\__,_|_|  \___|
                |_|                                            |_|
*/

proc sql;
  create
     table nrmbfr as
  select
     xs as xorg
    ,ys as yorg
    ,(-min(xs)+xs)/(max(xs)-min(xs)) as xs
    ,(-min(ys)+ys)/(max(ys)-min(ys)) as ys
  from
     sd1.rwant
;quit;


options ls=90 ps=44;
proc plot data= nrmbfr;
 plot ys*xs='*' /box haxis=0 to 1 by .2;
run;quit;
options ps=65 ls=171;

/**************************************************************************************************************************/
/*                                                                                                                        */
/*                                                                                                                        */
/*                             Plot of YS*XS.  Symbol used is '*'.                                                        */
/*                                                                                                                        */
/*      --+---------------+---------------+---------------+---------------+---------------+---                            */
/*   YS |                                                                                    |                            */
/*      |  MAPPED TO UNIT SQUARE                                                             |                            */
/*  1.0 +                                                                          ********  +                            */
/*      |  WORK.NRMBFR total obs=868                                      **********         |                            */
/*      |                                                            ******                  |                            */
/*      |  ROW       XS          YS                            ****                          |                            */
/*      |                        ****                                                        |                            */
/*      |    0    0.000000    .0000000                    ***                                |                            */
/*  0.8 +    1    0.001153    .0001461                *****                                  +                            */
/*      |    2    0.002307    .0002921            *****                                      |                            */
/*      |    3    0.003460    .0004382           *****                                       |                            */
/*      |                                     ****                                           |                            */
/*      |  865    0.99769      0.99961      ***                                              |                            */
/*      |  866    0.99885      0.99981    **                                                 |                            */
/*  0.6 +  867    1.00000      1.00000    *                                                  +                            */
/*      |                                **                                                  |                            */
/*      |                                *                                                   |                            */
/*      |                                *                                                   |                            */
/*      |                                                                                    |                            */
/*      |                                *                                                   |                            */
/*  0.4 +                                *                                                   +                            */
/*      |                                                                                    |                            */
/*      |                                *                                                   |                            */
/*      |                                *                                                   |                            */
/*      |                                                                                    |                            */
/*      |                               *                                                    |                            */
/*  0.2 +                               *                                                    +                            */
/*      |                               *                                                    |                            */
/*      |                              **                                                    |                            */
/*      |                           ****                                                     |                            */
/*      |                      ******                                                        |                            */
/*      |           ************                                                             |                            */
/*  0.0 + ***********                                                                        +                            */
/*      |                                                                                    |                            */
/*      --+---------------+---------------+---------------+---------------+---------------+---                            */
/*       0.0             0.2             0.4             0.6             0.8             1.0                              */
/*                                                                                                                        */
/**************************************************************************************************************************/


/*___                                                 __ _ _   _   _
|___ \   _ __  _ __ ___   ___ ___  ___ ___           / _(_) |_| |_(_)_ __   __ _
  __) | | `_ \| `__/ _ \ / __/ _ \/ __/ __|  _____  | |_| | __| __| | `_ \ / _` |
 / __/  | |_) | | | (_) | (_|  __/\__ \__ \ |_____| |  _| | |_| |_| | | | | (_| |
|_____| | .__/|_|  \___/ \___\___||___/___/         |_| |_|\__|\__|_|_| |_|\__, |
        |_|_     _                _       _     _                           |___/
  __ _  __| | __| | __      _____(_) __ _| |__ | |_ ___
 / _` |/ _` |/ _` | \ \ /\ / / _ \ |/ _` | `_ \| __/ __|
| (_| | (_| | (_| |  \ V  V /  __/ | (_| | | | | |_\__ \
 \__,_|\__,_|\__,_|   \_/\_/ \___|_|\__, |_| |_|\__|___/
                                    |___/
*/

data addweights;
 set nrmbfr;
  weights=1;
  if .35 <xs < .38 then weights=10;
  if .39 <xs < .45 then weights=10;
run;quit;

/*__ _ _
 / _(_) |_
| |_| | __|
|  _| | |_
|_| |_|\__|

*/

ods trace on;
ods output parameterestimates=est;
proc nlin data=addweights method=MARQUARDT CONVERGE=0.1;;
  parms A = 8
        B = 5
        c = 2
        ;
  model ys = sqrt(xs)*CDF('BETA', xs, a, b) + c*sin(1.57*xs) ;
  output out=results p=predicted r=residual;
run;quit;
ods trace off;

proc print data=est;
format _numeric_ 8.5;
run;quit;

options ls=90 ps=44;
proc plot data=results;
 plot residual*xs='*' /box;
 plot   ys*xs='*' predicted*xs='P' ys*xs='*' / overlay box
         haxis=0 to 1 by .1
         vaxis=0 to 1 by .1;
 plot predicted*ys='*' /box;
run;quit;

/*____               _               _                                         _
|___ /    ___  _   _| |_ _ __  _   _| |_  _ __ ___   __ _ _ __  _ __   ___  __| |
  |_ \   / _ \| | | | __| `_ \| | | | __|| `_ ` _ \ / _` | `_ \| `_ \ / _ \/ _` |
 ___) | | (_) | |_| | |_| |_) | |_| | |_ | | | | | | (_| | |_) | |_) |  __/ (_| |
|____/   \___/ \__,_|\__| .__/ \__,_|\__||_| |_| |_|\__,_| .__/| .__/ \___|\__,_|
                        |_|                              |_|   |_|
*/

/**************************************************************************************************************************/
/*                                                                                                                        */
/*  Only 4 parameters                                                                                                     */
/*                                                                                                                        */
/*  MODEL  YS = YS = SQRT(XS) * CDF('BETA', XS, A, B) + C*SIN(1.57*XS)                                                    */
/*                                                                                                                        */
/*                                    Sum of        Mean               Approx                                             */
/*  Source                    DF     Squares      Square    F Value    Pr > F                                             */
/*                                                                                                                        */
/*  Model                      3       395.9       132.0     210152    <.0001                                             */
/*  Error                    865      0.5431    0.000628                                                                  */
/*  Uncorrected Total        868       396.4                                                                              */
/*                                                                                                                        */
/*                                                                                                                        */
/*                         Approx                                                                                         */
/*  Parameter Estimate    Std Error                                                                                       */
/*                                                                                                                        */
/*  A                     Approx                                                                                          */
/*  B      Estimate    Std Error                                                                                          */
/*  C                                                                                                                     */
/*  D         307.4      17.5242                                                                                          */
/*            500.4      28.5116                                                                                          */
/*                                                                                                                        */
/*  ys=sqrt  0.0422      0.00123(xs)*CDF('BETA',xs,a,b)+c*sin(1.57*xs)+                                                   */
/*                                                                                                                        */
/*  PREDICTED AND OBSERVED DATA                                                                                           */
/*                                                                                                                        */
/*                                                                                                                        */
/*              0.0    0.1    0.2    0.3    0.4    0.5    0.6    0.7    0.8    0.9    1.0                                 */
/*            ---+------+------+------+------+------+------+------+------+------+------+---                               */
/*            |                                                                           |                               */
/*            |  PREDICTED AND OBSERVED DATA                                              |                               */
/*            |                                                                           |                               */
/*            |                                                                           |                               */
/*            |  y =sqrt(x)*CDF('BETA',x,a,b) + c*in(1.57*x)                              |                               */
/*            |                                                                           |                               */
/*            |  * = Original mapped data                                                 |                               */
/*            |  p = Original and mapped poins (most of the points)                       |                               */
/*  PREDICTED |                                                                     PPPP  |                               */
/*        1.0 +                                                                PPPPP****  + 1.0                           */
/*            |                                                          **PPPPP**        |                               */
/*            |                                                      **PPPPP              |                               */
/*        0.9 +                                                   *PPPPP                  + 0.9                           */
/*            |                                                PPPPP                      |                               */
/*            |                                             PPPP*                         |                               */
/*        0.8 +                                          PPPP*                            + 0.8                           */
/*            |                                      PPPP**                               |                               */
/*            |                                   PPPP**                                  |                               */
/*        0.7 +                                PPPP*                                      + 0.7                           */
/*            |                               PP*                                         |                               */
/*            |                              PP                                           |                               */
/*        0.6 +                              P                                            + 0.6                           */
/*            |                             *P                                            |                               */
/*            |                             *P                                            |                               */
/*        0.5 +                             PP                                            + 0.5                           */
/*            |                             P                                             |                               */
/*            |                             P                                             |                               */
/*        0.4 +                             P                                             + 0.4                           */
/*            |                             P                                             |                               */
/*            |                             P                                             |                               */
/*        0.3 +                            PP                                             + 0.3                           */
/*            |                            P*                                             |                               */
/*            |                            P*                                             |                               */
/*        0.2 +                            P*                                             + 0.2                           */
/*            |                            P                                              |                               */
/*            |                           PP                                              |                               */
/*        0.1 +                         **P                                               + 0.1                           */
/*            |                     ***** P                                               |                               */
/*            |           *********PPPPPPPP                                               |                               */
/*        0.0 +  PPPPPPPPPPPPPPPPPPP                                                      + 0.0                           */
/*            ---+------+------+------+------+------+------+------+------+------+------+---                               */
/*              0.0    0.1    0.2    0.3    0.4    0.5    0.6    0.7    0.8    0.9    1.0                                 */
/*                                                                                                                        */
/*                                                 XS                                                                     */
/*  RESUDUALS                                                                                                             */
/*                                                                                                                        */
/*                                                                                                                        */
/*                          Plot of RESIDUAL*XS.  Symbol used is '*'.                                                     */
/*                                                                                                                        */
/*                                                                                                                        */
/*            0.0000   0.1244   0.2488   0.3733   0.4977   0.6221   0.7465   0.8710   0.9954                              */
/*            ---+--------+--------+--------+--------+--------+--------+--------+--------+---                             */
/*   RESIDUAL |                                                                             |                             */
/*       0.10 +                                                                             +  0.10                       */
/*            |  RESUDUALS VS OBSERVED X                                                    |                             */
/*            |                                                                             |                             */
/*            |                              *                                              |                             */
/*            |                          **  *                                              |                             */
/*            |                         **** **                                             |                             */
/*       0.05 +                        **  *  *                                             +  0.05                       */
/*            |                      ***   *  *                                             |                             */
/*            |                    ***     *  *                                             |                             */
/*            |                  ***       * **                                             |                             */
/*            |              ****          *  *                     *********               |                             */
/*            |       *******              *  *                    **       ****            |                             */
/*       0.00 +  ******                    *   *                 ***           **           +  0.00                       */
/*            |                            *   * ******         **               ***        |                             */
/*            |                             *  ***    **********                   ***      |                             */
/*            |                             *                                        ***    |                             */
/*            |                             **                                         **   |                             */
/*            |                             *                                           **  |                             */
/*      -0.05 +                                                                             + -0.05                       */
/*            |                             **                                              |                             */
/*            |                             *                                               |                             */
/*            |                             *                                               |                             */
/*            |                              *  pKa equivalece point (issue)                |                             */
/*            |                             *                                               |                             */
/*      -0.10 +                             **                                              + -0.10                       */
/*            |                                                                             |                             */
/*            |                                                                             |                             */
/*            ---+--------+--------+--------+--------+--------+--------+--------+--------+---                             */
/*            0.0000   0.1244   0.2488   0.3733   0.4977   0.6221   0.7465   0.8710   0.9954                              */
/*                                                                                                                        */
/*                                                  XS                                                                    */
/*                                                                                                                        */
/*   PREDICTED VS OBSERVED DEPENDANT VARIABLE(Y)                                                                          */
/*                                                                                                                        */
/*             ---+------------+------------+------------+------------+------------+---                                   */
/*   PREDICTED |                                                                      |                                   */
/*         1.2 +  PREDICTED VS OBSERVED DEPENDANT VARIABLE(Y)                         +                                   */
/*             |                                                                      |                                   */
/*             |                                                                      |                                   */
/*             |                                                                      |                                   */
/*             |                                                                   *  |                                   */
/*         1.0 +                                                                 ***  +                                   */
/*             |                                                                **    |                                   */
/*             |                                                              ***     |                                   */
/*             |                                                          *****       |                                   */
/*             |                                                      *****           |                                   */
/*         0.8 +                                                    ***               +                                   */
/*             |                                                 ****                 |                                   */
/*             |                                               ***                    |                                   */
/*             |                                            ****                      |                                   */
/*             |                                           **                         |                                   */
/*         0.6 +                                          **                          +                                   */
/*             |                                        **                            |                                   */
/*             |                                       **                             |                                   */
/*             |                                      *                               |                                   */
/*             |                                   ***                                |                                   */
/*         0.4 +                             *    *                                   +                                   */
/*             |                   *  *  *                                            |                                   */
/*             |                **                                                    |                                   */
/*             |             ***                                                      |                                   */
/*             |            *                                                         |                                   */
/*         0.2 +           **                                                         +                                   */
/*             |           *                                                          |                                   */
/*             |          **                                                          |                                   */
/*             |         **                                                           |                                   */
/*             |       ***                                                            |                                   */
/*         0.0 +  ******                                                              +                                   */
/*             |                                                                      |                                   */
/*             ---+------------+------------+------------+------------+------------+---                                   */
/*               0.0          0.2          0.4          0.6          0.8          1.0                                     */
/*                                                                                                                        */
/*                                                YS                                                                      */
/*                                                                                                                        */
/**************************************************************************************************************************/

/*  _     _                        __                       _                _
| || |   | |_ _ __ __ _ _ __  ___ / _| ___  _ __ _ __ ___  | |__   __ _  ___| | __
| || |_  | __| `__/ _` | `_ \/ __| |_ / _ \| `__| `_ ` _ \ | `_ \ / _` |/ __| |/ /
|__   _| | |_| | | (_| | | | \__ \  _| (_) | |  | | | | | || |_) | (_| | (__|   <
   |_|    \__|_|  \__,_|_| |_|___/_|  \___/|_|  |_| |_| |_||_.__/ \__,_|\___|_|\_\
*/


data back;
  set results;
  xt=xs*867;
  yt = 2.22 + (12.49-2.22)*ys;
  pt = 2.22 + (12.49-2.22)*predicted ;
  keep xt yt pt ox oy;
run;quit;

options ls=90 ps=44;
proc plot data= back;
 plot yt*xt='*' /box vaxis=2.20 to 12.5 by 1;
run;quit;
options ps=65 ls=171;

*/ /**************************************************************************************************************************/
*/ /*
*/ /*  TRANFORM BACK (SAME AS ORIGINAL PLOT
*/ /*
*/ /*
*/ /*       0        110       220       330       440       550       660       770       880
*/ /*       --+---------+---------+---------+---------+---------+---------+---------+---------+--
*/ /*    YT |                                                                                   |
*/ /*       |                                                                          ******   |
*/ /*  12.2 +   TRANSFORMATIONS BACK FROM UNIT SQUARE                        ***********        + 12.2
*/ /*       |                                                            ******                 |
*/ /*       |   xt=x *867;                                          ****                        |
*/ /*  11.2 +   yt = 2.22 + (12.49-2.22)*y ;                     ****                           + 11.2
*/ /*       |                                                    ***                            |
*/ /*       |                                                 ****                              |
*/ /*  10.2 +                                             ****                                  + 10.2
*/ /*       |                                         *****                                     |
*/ /*       |                                     *****                                         |
*/ /*   9.2 +                                   ***                                             +  9.2
*/ /*       |                                 ***                                               |
*/ /*       |                                **                                                 |
*/ /*   8.2 +                                * After fitting you want an estamte                +  8.2
*/ /*       |                                * in origial units                                 |
*/ /*       |                                *                                                  |
*/ /*   7.2 +                               *  Plug xmapped =657/867 = 0.7612456747  into       +  7.2
*/ /*       |                               *                                                   |
*/ /*       |                                  ymapped =sqrt(xmapped)*CDF('BETA',xmapped,a,b)   |
*/ /*   6.2 +                               *    + c*sin(1.57*mapped)                           +  6.2
*/ /*       |                               *                                                   |
*/ /*       |                                  y_back=miny+(maxy-miny)*ymapped;                 |
*/ /*   5.2 +                               *                                                   +  5.2
*/ /*       |                                  Check Model                                      |
*/ /*       |                               *                                                   |
*/ /*   4.2 +                               *  data _null_;                                     +  4.2
*/ /*       |                              **    x =657/867;                                    |
*/ /*       |                             **     y =2.22 + (sqrt(x)*CDF('BETA',x,307.3,500.4)   |
*/ /*   3.2 +                          ****         + 0.04218*sin(1.57*x))*(12.49-2.22);        +  3.2
*/ /*       |                     ******         put y=;                                        |
*/ /*       |          ************            run;quit;                                        |
*/ /*   2.2 + *********                                                                         +  2.2
*/ /*       |                                   Comparison Predicted vs Observed                |
*/ /*       |                                              X       Y                            |
*/ /*       |                                   Observed  657    11.76                          |
*/ /*       |                                  Predicted  657    11.56                          |
*/ /*       |                                                                                   |
*/ /*       |                                                                                   |
*/ /*       |                                                                                   |
*/ /*       |                                                                                   |
*/ /*       --+---------+---------+---------+---------+---------+---------+---------+---------+--
*/ /*         0        110       220       330       440       550       660       770       880
*/ /*                                           xt
*/ /*
*/ /**************************************************************************************************************************/

/*___                                _       _   _
| ___|    ___  _ __  ___   ___  ___ | |_   _| |_(_) ___  _ __
|___ \   / _ \| `_ \/ __| / __|/ _ \| | | | | __| |/ _ \| `_ \
 ___) | | (_) | |_) \__ \ \__ \ (_) | | |_| | |_| | (_) | | | |
|____/   \___/| .__/|___/ |___/\___/|_|\__,_|\__|_|\___/|_| |_|
              |_|
*/


data  check;

   a=8.8179917838  ;
   b=0.9573331691  ;
   c=341.0840722484;
   d=2.3689668227  ;
   e=1 ;
   set sd1.rwant;
   py = A/(1 + B**(xs - C)) + D;
   row=_n_;
run;quit;

* join with ops solution;
options validvarname=v7;
proc sql;
  create
     table addorg as
  select
     l.py as ops_y
    ,l.xs
    ,l.ys
    ,r.pt as Roger
  from
     check as l, back as r
  where
     l.xs = r.xt
     and ys < 12.49
     and pt > 1
;quit;


options ls=100 ps=65;
proc plot data=addorg;
 plot   ys*xs='.' ops_y*xs='o' roger*xs='r'/ overlay box  vaxis=2.20 to 12.5 by 1;
run;quit;

/**************************************************************************************************************************/
/*                                                                                                                        */
/*                                                                                                                        */
/*   POSTED SOLUTION ON STACKOVERFLOW COMPARED TO MY SOLUTION                                                                                                                     */
/*                                                                                                                        */
/*                                                                                                                        */
/*       --+---------+---------+---------+---------+---------+---------+---------+---------+---------+--                  */
/*       |                                                                                             |                  */
/*       |                                                                                             |                  */
/*       |  OPS FIT ='o'                    ROGER = 'r'                   ORIGINAL DATA='.'            |                  */
/*       |                                                                                             |                  */
/*       |  a=8.8179917838                  A =  307.4                                                 |                  */
/*       |  b=0.9573331691                  B =  500.4                                                 |                  */
/*       |  c=341.0840722484                C = 0.0422                                                 |                  */
/*       |  d=2.3689668227                                                                             |                  */
/*       |  e=1 ;                                                                                      |                  */
/*       |                                                                                             |
/*       |  py = A/(1 + B**(xs - C)) + D    Ymapped =sqrt(x)*CDF('BETA',x,a,b) + c*sin(1.57*x)         |                  */
/*       |                                                                                             |                  */
/*       |                                                                                             |                  */
/*       |                                                                                             |                  */
/*       --+---------+---------+---------+---------+---------+---------+---------+---------+---------+--                  */
/*       | 0        100       200       300       400       500       600       700       800       900|                  */
/*       |                                                                                             |                  */
/*    YS |                                                                                 rrrr        |                  */
/*       |                                                                               rr.........   |                  */
/*  12.2 +                                                                          ........           + 12.2             */
/*       |                                                                     .....rr                 |                  */
/*       |                                                                  ....rrr                    |                  */
/*       |                                                                ...rrr                       |                  */
/*       |                                                              ...rr                          |                  */
/*  11.2 +                                              oooooooooooooo...oooooooooooooooooooooooooo    + 11.2             */
/*       |                                           oooo           r..                                |                  */
/*       |                          'o'=ops fit-->  oo           rr..                                  |                  */
/*       |                                         oo          rr...                                   |                  */
/*       |                                        oo        rrr...                                     |                  */
/*  10.2 +                                        o       rr...                                        + 10.2             */
/*       |                                       oo     r....   <- '.' and 'r' roger fit               |                  */
/*       |                                       o   rr...                                             |                  */
/*       |                                       o r....       '.' may overwrite roger                 |                  */
/*       |                                      or...                                                  |                  */
/*   9.2 +                                      o..                                                    +  9.2             */
/*       |                                     ...                                                     |                  */
/*       |                 'r'=rogers fit --> r.o                                                      |                  */
/*       |                                    .o                                                       |                  */
/*       |                                    .o                                                       |                  */
/*   8.2 +                                   .ro                                                       +  8.2             */
/*       |                                   .oo                                                       |                  */
/*       |                                   .o                                                        |                  */
/*       |                                   ro                                                        |                  */
/*       |                                   .o                                                        |                  */
/*   7.2 +                                   .o                                                        +  7.2             */
/*       |                                   o                                                         |                  */
/*       |                                  .o                                                         |                  */
/*       |                                   o                                                         |                  */
/*       |                                  ro                                                         |                  */
/*   6.2 +                                  .o                                                         +  6.2             */
/*       |                                  o                                                          |                  */
/*       |                                  .                                                          |                  */
/*       |                                  o                                                          |                  */
/*       |                                  o                                                          |                  */
/*   5.2 +                                 o.                                                          +  5.2             */
/*       |                                 or                                                          |                  */
/*       |                                 or                                                          |                  */
/*       |                                 o.                                                          |                  */
/*       |                                or.                                                          |                  */
/*   4.2 +                                or.                                                          +  4.2             */
/*       |                                or.                                                          |                  */
/*       |                               oo..                                                          |                  */
/*       |                               o .                                                           |                  */
/*       |                              o..r                                                           |                  */
/*   3.2 +                              ..r                                                            +  3.2             */
/*       |                           .... r                                                            |                  */
/*       |                          ..oo  r                                                            |                  */
/*       |                 .......  ooo  rr                                                            |                  */
/*       | ooooo............oooooo  rrrrrr                                                             |                  */
/*   2.2 + ......rrrrr                                                                                 +  2.2             */
/*       |                                                                                             |                  */
/*       --+---------+---------+---------+---------+---------+---------+---------+---------+---------+--                  */
/*         0        100       200       300       400       500       600       700       800       900                   */
/*                                                                                                                        */
/**************************************************************************************************************************/

ods graphics on / width=10in height=7in;
ods pdf file="d:/pdf/pltgrf.pdf" style=journal;

title "pKa of an acid from titration";
proc sgplot data=addorg;
label  ys="Original"
       ops_y="Stackoverflow"
;
 series x=xs y=roger    / lineattrs=(thickness=1pt color=blue);
 series x=xs y=ys    / lineattrs=(thickness=1pt  color=green);
 series x=xs y=ops_y / lineattrs=(thickness=1pt color=red);
 inset ( " " ="Stackoverflow fit "
         " " ="a=8.8179917838    "
         " " ="b=0.9573331691    "
         " " ="c=341.0840722484  "
         " " ="d=2.3689668227    "
         " " ="e=1 ;             "
         " " ="y = A/(1 + B**(xs - C)) + D"
 ) / position=topleft textattrs=( Size=12pt color=red) valuealign=left;
 inset ( " " ="Rogers fit "
         " " ="a =  307.4 "
         " " ="b =  500.4 "
         " " ="c = 0.0422 "
         " " ="e=1 ;      "
         " " ="Ymapped =sqrt(x)*CDF('BETA',x,a,b) + c*sin(1.57*x)"
 ) / position=bottomright textattrs=( Size=12pt color=blue) valuealign=left;
 inset ( " " ="Original Data "
 ) / position=right textattrs=( Size=12pt color=green) valuealign=left;
 inset ( " " ="Rogers fit "
         " " ="a =  307.4 "
         " " ="b =  500.4 "
         " " ="c = 0.0422 "
         " " ="e=1 ;      "
         " " ="Ymapped =sqrt(x)*CDF('BETA',x,a,b) + c*sin(1.57*x)"
 ) / position=bottomright textattrs=( Size=12pt color=blue) valuealign=left;

keylegend / location = inside position=left;

run;quit;
ods pdf close;
ods graphics off;

/*              _
  ___ _ __   __| |
 / _ \ `_ \ / _` |
|  __/ | | | (_| |
 \___|_| |_|\__,_|

*/
