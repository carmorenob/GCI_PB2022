$PBExportHeader$w_insumos.srw
forward
global type w_insumos from window
end type
type st_1 from statictext within w_insumos
end type
type dw_1 from datawindow within w_insumos
end type
end forward

global type w_insumos from window
integer width = 2167
integer height = 1048
boolean titlebar = true
string title = "Insumos"
boolean controlmenu = true
windowtype windowtype = response!
long backcolor = 67108864
string icon = "AppIcon!"
boolean center = true
st_1 st_1
dw_1 dw_1
end type
global w_insumos w_insumos

type variables
datawindow dw_obj

end variables

on w_insumos.create
this.st_1=create st_1
this.dw_1=create dw_1
this.Control[]={this.st_1,&
this.dw_1}
end on

on w_insumos.destroy
destroy(this.st_1)
destroy(this.dw_1)
end on

event open;dw_obj = Message.PowerObjectParm
dw_1.Retrieve()
if isValid(dw_obj) then
	string insumo
	long fila
	insumo = dw_obj.GetItemString(dw_obj.GetRow(),'cod_insumo')
	if not isNull(insumo) then
		fila = dw_1.Find("cod_insumo='"+insumo+"'",1,dw_1.RowCount())
		if fila > 0 then dw_1.ScrolltoRow(fila)
	end if
end if

end event

type st_1 from statictext within w_insumos
integer x = 1399
integer y = 884
integer width = 649
integer height = 68
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 134217752
string text = "Doble click para seleccionar"
boolean focusrectangle = false
end type

type dw_1 from datawindow within w_insumos
integer x = 87
integer y = 68
integer width = 1957
integer height = 788
integer taborder = 10
string title = "none"
string dataobject = "dw_insumo"
boolean hscrollbar = true
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event constructor;setTransObject(SQLCA)

end event

event doubleclicked;dw_obj.SetItem(dw_obj.getRow(),'cod_insumo',getItemString(row,'cod_insumo'))
close(parent)

end event

event rbuttondown;st_dw_xa_funciones st_dw
st_dw.dw = this
st_dw.dwo = dwo
st_dw.row = row
openwithparm(w_funcion_dw,st_dw)

end event

