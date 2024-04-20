$PBExportHeader$uo_datawindow.sru
forward
global type uo_datawindow from datawindow
end type
end forward

global type uo_datawindow from datawindow
integer width = 1705
integer height = 736
boolean livescroll = true
borderstyle borderstyle = stylelowered!
event key pbm_dwnkey
end type
global uo_datawindow uo_datawindow

type variables

end variables

on uo_datawindow.create
end on

on uo_datawindow.destroy
end on

event constructor;settransobject(sqlca)

end event

event dberror;rollback;
if sqldbcode=26 then
	disconnect;
	connect;
	if sqlca.sqlcode =-1 then
		messagebox('uo_datawindow Error de SQL','Se perdió la conexión al servidor y no se pudo restablecer')
		return 1
	end if
	settransobject(sqlca)
else
	if left(sqlerrtext,47)='Database transaction information not available.' then
		settransobject(sqlca)
	else
		string ls_error
		if not isnull(dataobject) then ls_error='Datawindow: ~r~n'+dataobject+'~r~n~r~n'
		if not isnull(sqldbcode) then ls_error+='Código de error SQLSTATE:~r~n'+string(sqldbcode)+'~r~n~r~n'
		if not isnull(sqlerrtext) then ls_error+='Descripción del error:~r~n'+sqlerrtext+'~r~n~r~n'
		if not isnull(sqlsyntax) then ls_error+='Sentencia de SQL:~r~n'+sqlsyntax
		messagebox('Error de SQL!!',ls_error)
	end if
end if

return 1 //no muestra el mensaje que viene por defecto
end event

event clicked;if row<1 then return
if row<>getrow() then setrow(row)
end event

event error;messagebox('Error de DW '+dataobject,errortext)
end event

