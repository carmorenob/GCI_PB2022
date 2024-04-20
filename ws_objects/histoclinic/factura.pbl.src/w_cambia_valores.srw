$PBExportHeader$w_cambia_valores.srw
forward
global type w_cambia_valores from w_center
end type
type dw_cambia from datawindow within w_cambia_valores
end type
type pb_cancelar from picturebutton within w_cambia_valores
end type
end forward

global type w_cambia_valores from w_center
integer width = 1998
integer height = 1132
string title = "Cambiar Monto de Empresa"
boolean minbox = false
boolean maxbox = false
boolean resizable = false
windowtype windowtype = response!
string icon = "DataPipeline!"
dw_cambia dw_cambia
pb_cancelar pb_cancelar
end type
global w_cambia_valores w_cambia_valores

type variables
datawindow dw_factura
long fila
end variables

event open;call super::open;dw_factura=message.PowerObjectParm
dw_cambia.insertrow(1)
fila=dw_factura.getrow()
dw_cambia.setitem(1,'cproced',dw_factura.getitemstring(fila,'cproc'))
dw_cambia.setitem(1,'desproced',dw_factura.getitemstring(fila,'descripcion'))
dw_cambia.setitem(1,'quepaga',upper(dw_factura.getitemstring(fila,'que_paga')))
//dw_cambia.setitem(1,'fija',dw_factura.getitemstring(fila,''))
dw_cambia.setitem(1,'por_empr',100 - dw_factura.getitemnumber(fila,'percent_pac'))
dw_cambia.setitem(1,'vproced',dw_factura.getitemnumber(fila,'vt_proc'))
dw_cambia.setitem(1,'vpaciente',dw_factura.getitemnumber(fila,'vt_pac'))
dw_cambia.setitem(1,'v_emp',dw_factura.getitemnumber(fila,'vt_emp'))
dw_cambia.setitem(1,'particular',dw_factura.getitemnumber(fila,'v_part'))
if dw_factura.getitemnumber(fila,'cuanto_fijo')>0 then dw_cambia.setitem(1,'fija','1')
dw_cambia.setitem(1,'emp_hasta',dw_cambia.getitemnumber(1,"vproced") -dw_cambia.getitemnumber(1,"particular"))
dw_cambia.setcolumn("emp_hasta")
dw_cambia.triggerevent(itemchanged!)
end event

on w_cambia_valores.create
int iCurrent
call super::create
this.dw_cambia=create dw_cambia
this.pb_cancelar=create pb_cancelar
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.dw_cambia
this.Control[iCurrent+2]=this.pb_cancelar
end on

on w_cambia_valores.destroy
call super::destroy
destroy(this.dw_cambia)
destroy(this.pb_cancelar)
end on

type pb_grabar from w_center`pb_grabar within w_cambia_valores
string tag = "&Aceptar"
integer x = 773
integer y = 868
string text = "         &a"
boolean default = true
string picturename = "Aceptar.gif"
string disabledname = "d_Aceptar.gif"
end type

event pb_grabar::clicked;call super::clicked;dw_cambia.accepttext()
dw_factura.setitem(fila,'vt_pac',dw_cambia.getitemnumber(1,'vpaciente'))
dw_factura.setitem(fila,'vt_emp',dw_cambia.getitemnumber(1,'v_emp'))
dw_factura.setitem(fila,'v_part',dw_cambia.getitemnumber(1,'particular'))
dw_factura.setitem(fila,'iva_crm',dw_cambia.getitemnumber(1,'vpaciente')*dw_factura.getitemnumber(fila,'por_iva_crm')/100)
if dw_cambia.getitemstring(1,'fija')='1' then dw_factura.setitem(fila,'cuanto_fijo',dw_cambia.getitemnumber(1,'vpaciente'))
//if dw_cambia.getitemnumber(1,'vpaciente')=0 then dw_factura.setitem(fila,'que_paga','nada')
dw_factura.accepttext()
closewithreturn(parent,'si')
end event

type dw_cambia from datawindow within w_cambia_valores
integer x = 50
integer width = 1874
integer height = 848
integer taborder = 20
boolean bringtotop = true
string title = "none"
string dataobject = "dw_cambia_val"
boolean border = false
boolean livescroll = true
end type

event itemchanged;accepttext()
choose case getcolumnname()
	case 'vpaciente'
		setitem(1,'v_emp',getitemnumber(1,'vproced') - getitemnumber(1,'vpaciente'))
	case 'emp_hasta'
		if getitemstring(1,"fija")='1' then
			if getitemnumber(1,"emp_hasta") - getitemnumber(1,"vpaciente")>=0 then
				setitem(1,"v_emp",getitemnumber(1,"emp_hasta") - getitemnumber(1,"vpaciente"))
			else
				setitem(1,"v_emp",0)
			end if
			setitem(1,"particular",getitemnumber(1,"vproced") - getitemnumber(1,"v_emp") - getitemnumber(1,"vpaciente"))
		else
			if TRUNCATE(getitemnumber(1,"emp_hasta")*getitemnumber(1,"por_empr")/100,2)>=0 then
				setitem(1,"v_emp",TRUNCATE(getitemnumber(1,"emp_hasta")*getitemnumber(1,"por_empr")/100,2))
			else
				setitem(1,"v_emp",0)
			end if
			setitem(1,"vpaciente",getitemnumber(1,"emp_hasta") - getitemnumber(1,"v_emp"))
			setitem(1,"particular",getitemnumber(1,"vproced") - getitemnumber(1,"v_emp") - getitemnumber(1,"vpaciente"))
		end if
		setitem(1,"por_hasta",truncate(100*getitemnumber(1,"emp_hasta")/getitemnumber(1,"vproced"),2))
	case "por_hasta"
		if getitemstring(1,"fija")='1' then
			if getitemdecimal(1,"por_hasta")*getitemnumber(1,"vproced")/100 - getitemnumber(1,"vpaciente")>=0 then
				setitem(1,"v_emp",getitemdecimal(1,"por_hasta")*getitemnumber(1,"vproced")/100 - getitemnumber(1,"vpaciente"))
			else
				setitem(1,"v_emp",0)
			end if
			setitem(1,"particular",getitemnumber(1,"vproced") - getitemnumber(1,"v_emp") - getitemnumber(1,"vpaciente"))
		else
			if TRUNCATE(getitemdecimal(1,"por_hasta")*getitemnumber(1,"vproced")*getitemnumber(1,"por_empr")/10000,2)>=0 then
				setitem(1,"v_emp",TRUNCATE(getitemdecimal(1,"por_hasta")*getitemnumber(1,"vproced")*getitemnumber(1,"por_empr")/10000,2))
			else
				setitem(1,"v_emp",0)
			end if
			setitem(1,"vpaciente",getitemdecimal(1,"por_hasta")*getitemnumber(1,"vproced")/100 - getitemnumber(1,"v_emp"))
			setitem(1,"particular",getitemnumber(1,"vproced") - getitemnumber(1,"v_emp") - getitemnumber(1,"vpaciente"))
		end if
		setitem(1,"emp_hasta",getitemdecimal(1,"por_hasta")*getitemnumber(1,"vproced")/100)
end choose
end event

type pb_cancelar from picturebutton within w_cambia_valores
event mousemove pbm_mousemove
integer x = 942
integer y = 868
integer width = 146
integer height = 128
integer taborder = 30
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "       &c"
boolean cancel = true
boolean originalsize = true
string picturename = "cancelar.gif"
string disabledname = "d_cancelar.gif"
alignment htextalign = left!
string powertiptext = "Cancelar [Alt+C ]"
end type

event mousemove;//muestra2(this.tag,xpos,ypos)
end event

event pb_cancelar::clicked;call super::clicked;close(parent)
end event

