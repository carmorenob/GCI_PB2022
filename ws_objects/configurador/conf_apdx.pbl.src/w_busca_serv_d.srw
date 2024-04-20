$PBExportHeader$w_busca_serv_d.srw
forward
global type w_busca_serv_d from window
end type
type pb_2 from picturebutton within w_busca_serv_d
end type
type pb_1 from picturebutton within w_busca_serv_d
end type
type dw_1 from datawindow within w_busca_serv_d
end type
end forward

global type w_busca_serv_d from window
integer width = 2290
integer height = 1100
boolean titlebar = true
string title = "Servicios de Derecho de Grupo"
boolean controlmenu = true
windowtype windowtype = response!
long backcolor = 67108864
string icon = "Information!"
pb_2 pb_2
pb_1 pb_1
dw_1 dw_1
end type
global w_busca_serv_d w_busca_serv_d

on w_busca_serv_d.create
this.pb_2=create pb_2
this.pb_1=create pb_1
this.dw_1=create dw_1
this.Control[]={this.pb_2,&
this.pb_1,&
this.dw_1}
end on

on w_busca_serv_d.destroy
destroy(this.pb_2)
destroy(this.pb_1)
destroy(this.dw_1)
end on

type pb_2 from picturebutton within w_busca_serv_d
integer x = 1189
integer y = 848
integer width = 151
integer height = 132
integer taborder = 40
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string picturename = "cancelar.GIF"
alignment htextalign = left!
end type

event clicked;close(parent)
end event

type pb_1 from picturebutton within w_busca_serv_d
integer x = 1010
integer y = 848
integer width = 151
integer height = 132
integer taborder = 20
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

type dw_1 from datawindow within w_busca_serv_d
integer x = 87
integer y = 88
integer width = 2025
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
if w_liq_grupo_soat.dw_servicios.find("codservicio='"+this.getitemstring(cual,"codservicio")+"'",1,w_liq_grupo_soat.dw_servicios.rowcount())=0 then
	donde=w_liq_grupo_soat.dw_servicios.insertrow(0)
	w_liq_grupo_soat.dw_servicios.setitem(donde,"codmanual",w_liq_grupo_soat.dw_manual.getitemstring(w_liq_grupo_soat.dw_manual.getrow(),"codmanual"))
	w_liq_grupo_soat.dw_servicios.setitem(donde,"codservicio",this.getitemstring(cual,"codservicio"))
	w_liq_grupo_soat.dw_servicios.setitem(donde,"descripcion",this.getitemstring(cual,"descripcion"))
	if w_liq_grupo_soat.rb_2.checked then
		w_liq_grupo_soat.dw_servicios.setitem(donde,"grupo",'9999')
		w_liq_grupo_soat.dw_servicios.setitem(donde,"codcobro",'99')
	else
		w_liq_grupo_soat.dw_servicios.setitem(donde,"grupo",w_liq_grupo_soat.dw_grupo.getitemstring(w_liq_grupo_soat.dw_grupo.getrow(),1))
	end if
	w_liq_grupo_soat.dw_servicios.scrolltorow(donde)
else
	messagebox("Atención","Este procedimento ya existe para ese Grupo Quirúrgico o ya está configurado como paquete")
end if

end event

event constructor;this.settransobject(sqlca)
this.retrieve(w_liq_grupo_soat.dw_manual.getitemstring(w_liq_grupo_soat.dw_manual.getrow(),"codmanual"))
if w_liq_grupo_soat.rb_2.checked then
	this.setfilter("tiposervicio='P'")
else
	this.setfilter("tiposervicio='D' or tiposervicio='G'")
end if
this.filter()
end event

