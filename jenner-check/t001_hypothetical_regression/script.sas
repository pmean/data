* hypothetical-regression.sas
* author: Steve Simon
* purpose: display analysis of variance table
* license: public domain;

* Hypothetical data set for regression. The x/y values are
* chosen to simplify the sums of squares calculations
* (from files/hypothetical-regression.csv in this repo).;

data hypothetical;
  input x y;
  datalines;
4 34
6 20
8 10
10 32
12 6
14 24
;
run;

proc print data=hypothetical(obs=2);
  title1 "First two rows of data";
run;

proc reg data=hypothetical;
  model y = x;
  title1 "Analysis of variance table for the regression of y on x";
run;
quit;
