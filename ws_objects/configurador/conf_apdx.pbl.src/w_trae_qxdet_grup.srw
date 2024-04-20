$PBExportHeader$w_trae_qxdet_grup.srw
forward
global type w_trae_qxdet_grup from window
end type
type pb_2 from picturebutton within w_trae_qxdet_grup
end type
type pb_1 from picturebutton within w_trae_qxdet_grup
end type
type dw_1 from datawindow within w_trae_qxdet_grup
end type
end forward

global type w_trae_qxdet_grup from window
integer width = 2089
integer height = 1004
boolean titlebar = true
string title = "Servicios de Procedimiento por Grupo"
boolean controlmenu = true
windowtype windowtype = response!
long backcolor = 67108864
string icon = "Information!"
pb_2 pb_2
pb_1 pb_1
dw_1 dw_1
end type
global w_trae_qxdet_grup w_trae_qxdet_grup

on w_trae_qxdet_grup.create
this.pb_2=create pb_2
this.pb_1=create pb_1
this.dw_1=create dw_1
this.Control[]={this.pb_2,&
this.pb_1,&
this.dw_1}
end on

on w_trae_qxdet_grup.destroy
destroy(this.pb_2)
destroy(this.pb_1)
destroy(this.dw_1)
end on

type pb_2 from picturebutton within w_trae_qxdet_grup
integer x = 1038
integer y = 760
integer width = 151
integer height = 132
integer taborder = 30
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string picturename = "cancelar.GIF"
string disabledname = "d_cancelar.GIF"
alignment htextalign = left!
string powertiptext = "Cerrar Ventana"
end type

event clicked;close(parent)
end event

type pb_1 from picturebutton within w_trae_qxdet_grup
integer x = 869
integer y = 760
integer width = 151
integer height = 132
integer taborder = 20
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string picturename = "aceptar.gif"
alignment htextalign = left!
end type

event clicked;dw_1.triggerevent(doubleclicked!)
end event

type dw_1 from datawindow within w_trae_qxdet_grup
integer x = 37
integer y = 20
integer width = 2025
integer height = 724
integer taborder = 10
string title = "none"
string dataobject = "dw_trae_qxdet_grup"
boolean hscrollbar = true
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event doubleclicked;long cual,donde
cual=this.getrow()
if cual<1 then return
if w_qxconf.dw_qxdet.find("proced_hijo='"+this.getitemstring(cual,"codservicio")+"'",1,w_qxconf.dw_qxdet.rowcount())=0 then
	donde=w_qxconf.dw_qxdet.insertrow(0)
	w_qxconf.dw_qxdet.setitem(donde,"codmanual",w_qxconf.manual)
	w_qxconf.dw_qxdet.setitem(donde,"proced",w_qxconf.dw_servicios.getitemstring(w_qxconf.dw_servicios.getrow(),"proced"))
	w_qxconf.dw_qxdet.setitem(donde,"proced_hijo",this.getitemstring(cual,"codservicio"))
	w_qxconf.dw_qxdet.setitem(donde,"codigocobro",this.getitemstring(cual,"codcobro"))
	w_qxconf.dw_qxdet.setitem(donde,"grupo",this.getitemstring(cual,"grupo"))
	w_qxconf.dw_qxdet.setitem(donde,"ctlqx",'1')
	w_qxconf.dw_qxdet.setitem(donde,"descripcion",this.getitemstring(cual,"descripcion"))
	w_qxconf.dw_qxdet.scrolltorow(donde)
else
	messagebox("Atención","Este procedimento ya está adicionado")
end if

end event

event constructor;this.settransobject(sqlca)
this.retrieve(w_qxconf.manual,w_qxconf.grupo)

end event

