$PBExportHeader$u_parm.sru
forward
global type u_parm from nonvisualobject
end type
end forward

global type u_parm from nonvisualobject
end type
global u_parm u_parm

type variables
uo_datastore dw_parm
end variables

forward prototypes
public function integer setparm (string cadena)
public function string parmtosyntax ()
end prototypes

public function integer setparm (string cadena);string pedazo, parametros
long posic, fila

parametros = cadena
parametros = parametros + '~n'
dw_parm.Reset()
do while TRUE
	posic = pos(parametros, '~t')
	if posic > 0 then
		fila = dw_parm.InsertRow(0)
		dw_parm.SetItem(fila,'campo',trim(left(parametros, posic - 1)))
		parametros = mid(parametros,posic + 1)
		posic = pos(parametros, '~n')
		dw_parm.SetItem(fila,'tipo',trim(left(parametros, posic - 1)))
		parametros = mid(parametros,posic + 1)
	else
		EXIT
	end if
loop

Return (dw_parm.RowCount())

end function

public function string parmtosyntax ();long i = 1
if dw_parm.RowCount() = 0 then
	Return ''
end if
string argum = "arguments=("
for i = 1 to dw_parm.RowCount()
	argum = argum + '("' + dw_parm.GetItemString(i,'campo') + '",' + dw_parm.GetItemString(i,'tipo') + "),"
Next
argum = left(argum,len(argum) - 1)
argum = argum + ") "

return argum

end function

on u_parm.create
call super::create
TriggerEvent( this, "constructor" )
end on

on u_parm.destroy
TriggerEvent( this, "destructor" )
call super::destroy
end on

event constructor;dw_parm = CREATE uo_datastore
dw_parm.DataObject = 'dw_gr_parm'
dw_parm.SetTransObject(SQLCA)

end event

