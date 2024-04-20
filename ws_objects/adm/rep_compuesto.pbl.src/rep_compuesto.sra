$PBExportHeader$rep_compuesto.sra
$PBExportComments$Generated Application Object
forward
global type rep_compuesto from application
end type
global transaction sqlca
global dynamicdescriptionarea sqlda
global dynamicstagingarea sqlsa
global error error
global message message
end forward

global type rep_compuesto from application
string appname = "rep_compuesto"
end type
global rep_compuesto rep_compuesto

on rep_compuesto.create
appname = "rep_compuesto"
message = create message
sqlca = create transaction
sqlda = create dynamicdescriptionarea
sqlsa = create dynamicstagingarea
error = create error
end on

on rep_compuesto.destroy
destroy( sqlca )
destroy( sqlda )
destroy( sqlsa )
destroy( error )
destroy( message )
end on

