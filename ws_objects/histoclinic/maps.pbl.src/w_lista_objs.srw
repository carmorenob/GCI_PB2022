$PBExportHeader$w_lista_objs.srw
forward
global type w_lista_objs from window
end type
type pb_ok from picturebutton within w_lista_objs
end type
type pb_cancel from picturebutton within w_lista_objs
end type
type st_1 from statictext within w_lista_objs
end type
type dw_ls from datawindow within w_lista_objs
end type
end forward

global type w_lista_objs from window
integer width = 2025
integer height = 1164
boolean titlebar = true
string title = "Objetos"
boolean controlmenu = true
windowtype windowtype = response!
long backcolor = 67108864
string icon = "AppIcon!"
boolean center = true
pb_ok pb_ok
pb_cancel pb_cancel
st_1 st_1
dw_ls dw_ls
end type
global w_lista_objs w_lista_objs

type variables
datawindow dw_o
string cod_mapa

end variables

on w_lista_objs.create
this.pb_ok=create pb_ok
this.pb_cancel=create pb_cancel
this.st_1=create st_1
this.dw_ls=create dw_ls
this.Control[]={this.pb_ok,&
this.pb_cancel,&
this.st_1,&
this.dw_ls}
end on

on w_lista_objs.destroy
destroy(this.pb_ok)
destroy(this.pb_cancel)
destroy(this.st_1)
destroy(this.dw_ls)
end on

event open;dw_o = Message.PowerObjectParm
long i, f
for i = 1 to dw_o.RowCount()
	if dw_o.GetItemString(i,'con_mapa') = '1' then Continue
	f = dw_ls.InsertRow(0)
	dw_ls.SetItem(f,'cod_obj',dw_o.GetItemString(i,'cod_obj'))
	dw_ls.SetItem(f,'descripcion',dw_o.GetItemString(i,'nombre'))
next

end event

type pb_ok from picturebutton within w_lista_objs
integer x = 736
integer y = 908
integer width = 146
integer height = 128
integer taborder = 30
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string text = "            &a"
boolean default = true
boolean originalsize = true
string picturename = "aceptar.gif"
alignment htextalign = left!
string powertiptext = "Llevar Seleccionado"
end type

event clicked;if dw_ls.RowCount() > 0 then
	dw_ls.event doubleclicked(0,0,dw_ls.GetRow(),dw_ls.object.cod_obj)
end if

end event

type pb_cancel from picturebutton within w_lista_objs
integer x = 882
integer y = 908
integer width = 146
integer height = 128
integer taborder = 20
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string text = "         &c"
boolean cancel = true
boolean originalsize = true
string picturename = "Cancelar.gif"
alignment htextalign = left!
string powertiptext = "Cancelar [Alt+C]"
end type

event clicked;close(parent)

end event

type st_1 from statictext within w_lista_objs
integer x = 73
integer y = 44
integer width = 754
integer height = 64
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Pendientes de ubicar"
boolean focusrectangle = false
end type

type dw_ls from datawindow within w_lista_objs
integer x = 64
integer y = 108
integer width = 1829
integer height = 784
integer taborder = 10
string title = "none"
string dataobject = "dw_lista_objs"
boolean hscrollbar = true
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event constructor;setTransObject(SQLCA)

end event

event doubleclicked;if row < 1 then Return 0
long fila
fila = dw_o.Find("cod_obj='"+GetItemString(row,'cod_obj')+"'",1,dw_o.RowCount())
if fila > 0 then
	if dw_o.GetItemString(fila,'con_mapa') = '1' then
		MessageBox('Atención','El objeto ya existe')
	else
		closewithreturn(parent,GetItemString(row,'cod_obj'))
	end if
end if

end event

event rbuttondown;st_dw_xa_funciones st_dw
st_dw.dw=this
st_dw.dwo=dwo
st_dw.row=row
openwithparm(w_funcion_dw,st_dw)

end event

