$PBExportHeader$w_new_empre.srw
forward
global type w_new_empre from window
end type
type cb_2 from commandbutton within w_new_empre
end type
type cb_1 from commandbutton within w_new_empre
end type
type dw_1 from datawindow within w_new_empre
end type
end forward

global type w_new_empre from window
integer width = 2917
integer height = 1012
boolean titlebar = true
string title = "Inserción o Modificación de Empresas"
boolean controlmenu = true
windowtype windowtype = response!
long backcolor = 67108864
cb_2 cb_2
cb_1 cb_1
dw_1 dw_1
end type
global w_new_empre w_new_empre

type variables
datawindowchild ciudad
end variables

event open;this.x=(ancho - this.width)/2
this.y=(alto - this.height)/2
dw_1.retrieve(w_tablas.cemp)
end event

on w_new_empre.create
this.cb_2=create cb_2
this.cb_1=create cb_1
this.dw_1=create dw_1
this.Control[]={this.cb_2,&
this.cb_1,&
this.dw_1}
end on

on w_new_empre.destroy
destroy(this.cb_2)
destroy(this.cb_1)
destroy(this.dw_1)
end on

type cb_2 from commandbutton within w_new_empre
integer x = 1367
integer y = 808
integer width = 343
integer height = 100
integer taborder = 30
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Cancelar"
end type

event clicked;close(parent)
end event

type cb_1 from commandbutton within w_new_empre
integer x = 946
integer y = 808
integer width = 379
integer height = 104
integer taborder = 20
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Guardar"
end type

event clicked;if dw_1.update()=-1 then
	rollback;
else
	commit;
	w_tablas.pb_4.triggerevent(clicked!)
	close(parent)
end if
end event

type dw_1 from datawindow within w_new_empre
integer x = 46
integer y = 56
integer width = 2793
integer height = 728
integer taborder = 10
string title = "none"
string dataobject = "dw_new_empre"
boolean border = false
boolean livescroll = true
end type

event constructor;this.getchild("cciudad",ciudad)
ciudad.settransobject(sqlca)
ciudad.retrieve()
this.settransobject(sqlca)
end event

event retrieveend;if this.rowcount()=0 then
	this.insertrow(1)
	this.setitem(1,1,w_tablas.cemp)
end if
end event

event itemchanged;this.accepttext()
if this.getcolumnname()="cdepto" then
	ciudad.setfilter("cdepto='"+data+"'")
	ciudad.filter()
	this.setitem(1,"cciudad","")
end if
end event

