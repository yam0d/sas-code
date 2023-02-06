data mydata.customers_trans;
	format Date MMDDYY10.;  * visual date;
	input Price DOLLAR6. Region $ Date MMDDYY10.;
	datalines;
$20.21 NW 01/15/2023
;
run;

data customers_trans1;
	set mydata.customers_trans;
	Rounded_price = ceil(Price);
	Month = month(Date);
	Day = day(Date);
	Year = year(Date);
run;

data make_model_set;
	set sashelp.cars;
	Make_Model = catx(' - ', Make, Model);
run;


