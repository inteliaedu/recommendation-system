proc import datafile="C:\Users\Hp\OneDrive\Documentos\Master\TFM\Recursos\Desarrollo\Excel\clientes_porcentaje_consumo.csv" 
out=TFM.CLIENTES_CLUSTER dbms=csv;
run;


proc fastclus data=TFM.CLIENTES_CLUSTER   maxc=4 out=solo_cl
OUTSTAT=CLIENTES_CL STD distance ;
var COLAS -- SABORES;
ID CLIENTE_ID;
run;

proc candisc data=solo_cl out=Can noprint; 
class Cluster; 
var  COLAS -- SABORES;
run;


proc sgplot data=Can; 
scatter y=Can2 x=Can1/group=Cluster; 
run;


title1 " Consumo de colas y sabor por clúster ";
proc sgplot data=solo_cl ;
hbox COLAS / category=Cluster;
hbox SABORES / category=Cluster;
run;

title1 " Consumo de otros y hogar por clúster ";
proc sgplot data=solo_cl ;
hbox OTROS / category=Cluster;
hbox HOGAR / category=Cluster;
run;

