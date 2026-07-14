* patient-type-download-from-oracle.sas (compatibility form)
* written by Steve Simon
* purpose: pull a table and write it out as a csv;
*
* The upstream script reads or_link.&table_name over an Oracle
* libname (schema='ehr') that needs live credentials. This form
* keeps the same PROC SQL select-into-a-table and PROC EXPORT
* dbms=csv logic, but stands a small in-memory patient_type
* table in for the Oracle source so the flow runs anywhere.;

%let table_name=patient_type;

data or_link_&table_name;
  length patient_type_code $2 patient_type_desc $24;
  input patient_type_code $ patient_type_desc $32.;
  datalines;
IP Inpatient
OP Outpatient
ED Emergency Department
OB Observation
SD Same Day Surgery
;
run;

proc sql;
  create table table_data as
    select *
  from or_link_&table_name;
quit;

proc export
    data=table_data
    dbms=csv
    outfile="./&table_name._oracle.csv"
  replace;
run;

proc print data=table_data;
  title1 "Contents of the &table_name table exported to csv";
run;
