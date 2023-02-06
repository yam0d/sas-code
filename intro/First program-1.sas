data mydata.class_female_report;
	set sashelp.class;  * built in dataset;
	if Sex = 'F';  * filters for female;
	put 'female observation';
run;

* creating my own library called "mydata";
libname mydata '/home/u63242051/datasets';
run;

* can use the following code to import .xlsx file;
/* LIBNAME sasfiles ''
PROC IMPORT DATAFILE = '' OUT = sasfiles.magnolia
DBS = XLSX REPLACE;
RUN;*/

* creates a manual data set callest test_set;
data mydata.test_set;
	input Name $ Height Weight;
	datalines;
	Hinat 154 182
	;
run;

* creates a manual data set callest try_set with infile;
data mydata.test_set;
	infile '';
	input Name $ Height Weight;
	datalines;
	Hinat 154 182
	;
run;
	
data mydata.test_set;
	input Name $ 1-6 Height 7-9 Weight 11-13;
	datalines;
	Hinat 154 182
	;
run;

* conditional;
data cars_cylinders;
	length Car_size $20.;
	set sashelp.cars;
	if Cylinders = 4 then Car_size = 'small';
	else if Cylinders = 6 then Car_size = 'medium';
	else Car_size = 'large';
run;

data mydata.cars_cylinders;
	length Car_size $20.;
	set sashelp.cars;
	if Cylinders = 4 then do;
	Car_size = 'Small';
	Popularity = 'High Demand';
	end;
run;	
	
	
	
	
	
	
	
	
	
	
	
	
