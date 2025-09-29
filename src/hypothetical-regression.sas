* hypothetical-regression.sas
* author: Steve Simon
* creation date: 2025-09-29
* purpose: display analysis of variance table
* license: public domain;


* Using https://documentation.sas.com/doc/en/pgmsascdc/9.4_3.5/lepg/p1tzew1omlzfryn1g6cpkenhsjb9.htm;

filename chol temp;                 /*1*/
proc http                           /*2*/
     url="https://raw.githubusercontent.com/pmean/data/refs/heads/main/files/hypothetical-regression.csv"
     out=web_data;
quit;
proc import datafile=wb_data
     out=hypothetical
     dbms=csv                       
     replace;
run;

proc print
    data=hypotethcial(obs=2);
  title1 "First two rows of data";
run;
