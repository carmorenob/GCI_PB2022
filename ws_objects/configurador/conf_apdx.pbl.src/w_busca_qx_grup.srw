$PBExportHeader$w_busca_qx_grup.srw
forward
global type w_busca_qx_grup from window
end type
type pb_2 from picturebutton within w_busca_qx_grup
end type
type pb_1 from picturebutton within w_busca_qx_grup
end type
type st_1 from statictext within w_busca_qx_grup
end type
type st_2 from statictext within w_busca_qx_grup
end type
type dw_1 from datawindow within w_busca_qx_grup
end type
end forward

global type w_busca_qx_grup from window
integer width = 2290
integer height = 1100
boolean titlebar = true
string title = "Servicios Quirúrquicos de Grupo"
boolean controlmenu = true
windowtype windowtype = response!
long backcolor = 67108864
string icon = "Information!"
pb_2 pb_2
pb_1 pb_1
st_1 st_1
st_2 st_2
dw_1 dw_1
end type
global w_busca_qx_grup w_busca_qx_grup

on w_busca_qx_grup.create
this.pb_2=create pb_2
this.pb_1=create pb_1
this.st_1=create st_1
this.st_2=create st_2
this.dw_1=create dw_1
this.Control[]={this.pb_2,&
this.pb_1,&
this.st_1,&
this.st_2,&
this.dw_1}
end on

on w_busca_qx_grup.destroy
destroy(this.pb_2)
destroy(this.pb_1)
destroy(this.st_1)
destroy(this.st_2)
destroy(this.dw_1)
end on

type pb_2 from picturebutton within w_busca_qx_grup
integer x = 1111
integer y = 840
integer width = 146
integer height = 128
integer taborder = 30
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
boolean originalsize = true
string picturename = "cancelar.GIF"
alignment htextalign = left!
end type

event clicked;close(parent)
end event

type pb_1 from picturebutton within w_busca_qx_grup
integer x = 937
integer y = 844
integer width = 146
integer height = 128
integer taborder = 30
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
boolean originalsize = true
string picturename = "aceptar.gif"
alignment htextalign = left!
end type

event clicked;dw_1.triggerevent(doubleclicked!)
end event

type st_1 from statictext within w_busca_qx_grup
integer x = 91
integer y = 24
integer width = 2103
integer height = 72
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 15793151
string text = "Escoja el procedimiento a agregar, con click derecho puede filtrar o buscar"
boolean border = true
borderstyle borderstyle = stylelowered!
boolean focusrectangle = false
end type

type st_2 from statictext within w_busca_qx_grup
integer x = 1673
integer y = 844
integer width = 517
integer height = 64
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
alignment alignment = center!
boolean border = true
borderstyle borderstyle = stylelowered!
boolean focusrectangle = false
end type

type dw_1 from datawindow within w_busca_qx_grup
integer x = 91
integer y = 100
integer width = 2103
integer height = 724
integer taborder = 10
string title = "none"
string dataobject = "dw_serv_d"
boolean hscrollbar = true
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event doubleclicked;long cual,donde
cual=this.getrow()
if cual<1 then return
if w_qxconf.dw_servicios.find("proced='"+this.getitemstring(cual,"codservicio")+"'",1,w_qxconf.dw_servicios.rowcount())=0 then
	donde=w_qxconf.dw_servicios.insertrow(0)
	w_qxconf.dw_servicios.setitem(donde,"codmanual",w_qxconf.manual)
	w_qxconf.dw_servicios.setitem(donde,"proced",this.getitemstring(cual,"codservicio"))
	w_qxconf.dw_servicios.setitem(donde,"grupo",this.getitemstring(cual,"grupo"))
	w_qxconf.dw_servicios.setitem(donde,"ctlqx",'1')
	w_qxconf.dw_servicios.setitem(donde,"descripcion",this.getitemstring(cual,"descripcion"))
	w_qxconf.dw_servicios.scrolltorow(donde)
	w_qxconf.dw_servicios.triggerevent(rowfocuschanged!)
else
	messagebox("Atención","Este procedimento ya está configurado")
end if

end event

event constructor;this.settransobject(sqlca)
this.retrieve(w_qxconf.manual)
this.setfilter("tiposervicio='Q'")
this.filter()
end event

event rowfocuschanged;st_2.text='Reg. '+string(currentrow)+' de ' +string(this.rowcount())
end event

event rbuttondown;st_dw_xa_funciones st_dw
st_dw.dw=this
st_dw.dwo=dwo
st_dw.row=row
st_dw.color_fondo=string(rgb(255,255,255))
openwithparm(w_funcion_dw,st_dw)
end event

