$PBExportHeader$w_af_bplaca.srw
forward
global type w_af_bplaca from window
end type
type st_1 from statictext within w_af_bplaca
end type
type dw_placa from datawindow within w_af_bplaca
end type
end forward

global type w_af_bplaca from window
integer width = 2793
integer height = 996
boolean titlebar = true
string title = "Busca Activos Fijos - Placa"
boolean controlmenu = true
windowtype windowtype = response!
long backcolor = 67108864
string icon = "registro.ico"
st_1 st_1
dw_placa dw_placa
end type
global w_af_bplaca w_af_bplaca

type variables
st_placa st_p

end variables

on w_af_bplaca.create
this.st_1=create st_1
this.dw_placa=create dw_placa
this.Control[]={this.st_1,&
this.dw_placa}
end on

on w_af_bplaca.destroy
destroy(this.st_1)
destroy(this.dw_placa)
end on

event open;st_p = Message.PowerObjectParm

if isValid(st_p.dw_obj) then
	if not isNull(st_p.dw_obj.GetItemString(st_p.dw_obj.GetRow(),'codarticulo')) then
		dw_placa.SetFilter("carticulo='" + st_p.dw_obj.GetItemString(st_p.dw_obj.GetRow(),'codarticulo') + "'")
	end if
end if
string filtro
int ret
filtro = dw_placa.GetSQLSelect()
if not isNull(st_p.filtro) and trim(st_p.filtro) <> '' then ret = dw_placa.SetSQLSelect(filtro + 'AND ' +st_p.filtro)
dw_placa.Retrieve()

end event

type st_1 from statictext within w_af_bplaca
integer x = 55
integer y = 764
integer width = 485
integer height = 64
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 134217752
string text = "doble click para llevar"
boolean focusrectangle = false
end type

type dw_placa from datawindow within w_af_bplaca
integer x = 37
integer y = 56
integer width = 2693
integer height = 696
integer taborder = 10
string dataobject = "dw_af_bplaca"
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event doubleclicked;if isValid(st_p.dw_obj) then
	st_p.dw_obj.SetItem(st_p.dw_obj.GetRow(),st_p.dw_obj.GetColumn(),this.GetItemString(row,'placa'))
elseif isValid(st_p.sle_obj) then
	st_p.sle_obj.Text = this.GetItemString(row,'placa')
	st_p.sle_obj.triggerEvent(modified!)	
end if
close(parent)

end event

event rbuttondown;st_dw_xa_funciones st_dw
st_dw.dw=this
st_dw.dwo=dwo
st_dw.row=row
openwithparm(w_funcion_dw,st_dw)
end event

event constructor;dw_placa.SetTransObject(SQLCA)
end event

event clicked;if row > 0 then
	if row <> Getrow() then SetRow(row)
end if

end event

