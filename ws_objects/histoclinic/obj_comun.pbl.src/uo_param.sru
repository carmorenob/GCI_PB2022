$PBExportHeader$uo_param.sru
forward
global type uo_param from userobject
end type
type dw_1 from datawindow within uo_param
end type
type st_label from statictext within uo_param
end type
end forward

global type uo_param from userobject
integer width = 485
integer height = 128
long backcolor = 67108864
string text = "none"
long tabtextcolor = 33554432
long picturemaskcolor = 536870912
dw_1 dw_1
st_label st_label
end type
global uo_param uo_param

type variables
datawindowchild dw_s,dw_n
uo_datastore ids_filtro_de

end variables

forward prototypes
public subroutine tipomask ()
end prototypes

public subroutine tipomask ();
end subroutine

on uo_param.create
this.dw_1=create dw_1
this.st_label=create st_label
this.Control[]={this.dw_1,&
this.st_label}
end on

on uo_param.destroy
destroy(this.dw_1)
destroy(this.st_label)
end on

event constructor;ids_filtro_de=create uo_datastore
ids_filtro_de.dataobject='dw_filtro_de'
end event

type dw_1 from datawindow within uo_param
integer y = 52
integer width = 489
integer height = 76
integer taborder = 1
string title = "none"
string dataobject = "dw_xa_param"
boolean border = false
boolean livescroll = true
end type

event constructor;this.insertrow(1)
this.getchild('param_dws',dw_s)
this.getchild('param_dwn',dw_n)
end event

event itemchanged;accepttext()
long j
for j=1 to ids_filtro_de.rowcount()
	w_reporte_gral.f_filtrar(ids_filtro_de.getitemnumber(j,'filtro_de'),dw_1.getitemstring(1,'tipo'),data)
next

end event

event losefocus;THIS.accepttext()
end event

type st_label from statictext within uo_param
integer x = 5
integer width = 361
integer height = 60
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
boolean focusrectangle = false
end type

