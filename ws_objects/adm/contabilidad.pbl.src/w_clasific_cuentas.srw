$PBExportHeader$w_clasific_cuentas.srw
forward
global type w_clasific_cuentas from w_center
end type
type dw_2 from datawindow within w_clasific_cuentas
end type
type dw_1 from datawindow within w_clasific_cuentas
end type
end forward

global type w_clasific_cuentas from w_center
string tag = "Cambió la clasificación de las Cuentas, desea guardar los cambios ?"
integer width = 2757
integer height = 1364
string title = "Clasificación de Cuentas"
boolean maxbox = false
boolean resizable = false
windowtype windowtype = popup!
string icon = "plan.ico"
boolean clientedge = true
boolean center = false
dw_2 dw_2
dw_1 dw_1
end type
global w_clasific_cuentas w_clasific_cuentas

forward prototypes
public function integer grabar ()
end prototypes

public function integer grabar ();long j
for j=1 to dw_1.rowcount()
	if dw_1.getitemstring(j,'t_estado')='R' and isnull(dw_1.getitemstring(j,'t_pyg')) then
		messagebox("Atención",'Debe escoger el tipo en el PyG de la cuentas de Estado de Resultados')
		dw_1.scrolltorow(j)
		dw_1.setfocus()
		return -1
	end if
next
if dw_1.update()=-1 then
	rollback;
	return -1
else
	commit;
	cambio=false
	return 1
end if
end function

event resize;call super::resize;this.resize(2738,1500)

end event

on w_clasific_cuentas.create
int iCurrent
call super::create
this.dw_2=create dw_2
this.dw_1=create dw_1
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.dw_2
this.Control[iCurrent+2]=this.dw_1
end on

on w_clasific_cuentas.destroy
call super::destroy
destroy(this.dw_2)
destroy(this.dw_1)
end on

type pb_grabar from w_center`pb_grabar within w_clasific_cuentas
integer x = 1138
integer y = 1100
end type

event pb_grabar::clicked;call super::clicked;grabar()
end event

type dw_2 from datawindow within w_clasific_cuentas
integer x = 37
integer y = 4
integer width = 1093
integer height = 148
integer taborder = 10
boolean bringtotop = true
string title = "none"
string dataobject = "dw_combo_cont_empresa"
boolean border = false
boolean livescroll = true
end type

event constructor;settransobject(sqlca)
insertrow(1)
end event

event itemchanged;string actual
actual=getitemstring(1,1)
choose case f_pregunta()
	case 1
		if grabar()=-1 then 
			setitem(1,1,actual)
			return 1
		end if
	case 2
		cambio=false
	case 3
		setitem(1,1,actual)
		return 1
end choose
accepttext()
f_revisa_clasif_cta(data)
dw_1.retrieve(data)
end event

type dw_1 from datawindow within w_clasific_cuentas
integer x = 27
integer y = 164
integer width = 2619
integer height = 912
integer taborder = 10
boolean bringtotop = true
string title = "none"
string dataobject = "dw_clasif_cuenta"
boolean hscrollbar = true
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event constructor;this.settransobject(sqlca)
end event

event itemchanged;cambio=true
this.accepttext()
end event

