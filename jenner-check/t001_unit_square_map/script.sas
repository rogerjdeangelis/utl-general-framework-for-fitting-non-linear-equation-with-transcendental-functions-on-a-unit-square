/* t001_unit_square_map
 *
 * Source: utl-general-framework-for-fitting-non-linear-equation-with-
 *         transcendental-functions-on-a-unit-square.sas
 *
 * The repo's signature step: take the raw titration data (XS, YS) and map
 * it onto the unit square so every value falls in [0,1] on both axes, then
 * draw the line-printer plot of the mapped curve.
 *
 * The XS/YS values below are the exact CARDS4 input from the repo. The
 * PROC SQL normalization and the PROC PLOT are copied verbatim from the
 * "map to unit square" section of the source script.
 */

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
data rwant;
 merge xs ys;
run;quit;

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
     rwant
;quit;

options ls=90 ps=44;
proc plot data= nrmbfr;
 plot ys*xs='*' /box haxis=0 to 1 by .2;
run;quit;
options ps=65 ls=171;

proc print data=nrmbfr(obs=5);
 var xorg yorg xs ys;
 format xs ys 8.6;
run;quit;
