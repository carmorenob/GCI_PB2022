$PBExportHeader$clientes.sra
$PBExportComments$Generated Application Object
forward
global type clientes from application
end type
global transaction sqlca
global dynamicdescriptionarea sqlda
global dynamicstagingarea sqlsa
global error error
global message message
end forward

global variables
string usuario,dw_entrada,entrada 
long ancho,alto
string nombre
long numero

end variables

global type clientes from application
string appname = "clientes"
string appruntimeversion = "22.0.0.1892"
end type
global clientes clientes

on clientes.create
appname="clientes"
message=create message
sqlca=create transaction
sqlda=create dynamicdescriptionarea
sqlsa=create dynamicstagingarea
error=create error
end on

on clientes.destroy
destroy(sqlca)
destroy(sqlda)
destroy(sqlsa)
destroy(error)
destroy(message)
end on

event open;open(w_conecta)
end event

