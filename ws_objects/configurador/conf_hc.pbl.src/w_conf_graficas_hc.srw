$PBExportHeader$w_conf_graficas_hc.srw
forward
global type w_conf_graficas_hc from window
end type
type st_campo from statictext within w_conf_graficas_hc
end type
type st_4 from statictext within w_conf_graficas_hc
end type
type st_dest from statictext within w_conf_graficas_hc
end type
type st_3 from statictext within w_conf_graficas_hc
end type
type pb_9 from picturebutton within w_conf_graficas_hc
end type
type st_2 from statictext within w_conf_graficas_hc
end type
type dw_2 from datawindow within w_conf_graficas_hc
end type
type st_1 from statictext within w_conf_graficas_hc
end type
type pb_guardar from picturebutton within w_conf_graficas_hc
end type
type pb_ad_grup from picturebutton within w_conf_graficas_hc
end type
type pb_del_grupo from picturebutton within w_conf_graficas_hc
end type
type dw_1 from datawindow within w_conf_graficas_hc
end type
end forward

global type w_conf_graficas_hc from window
integer width = 3314
integer height = 1068
boolean titlebar = true
string title = "Graficas para Campo"
boolean controlmenu = true
windowtype windowtype = response!
long backcolor = 67108864
string icon = "AppIcon!"
boolean center = true
st_campo st_campo
st_4 st_4
st_dest st_dest
st_3 st_3
pb_9 pb_9
st_2 st_2
dw_2 dw_2
st_1 st_1
pb_guardar pb_guardar
pb_ad_grup pb_ad_grup
pb_del_grupo pb_del_grupo
dw_1 dw_1
end type
global w_conf_graficas_hc w_conf_graficas_hc

type variables
st_rte i_st
string plan,campo
end variables

on w_conf_graficas_hc.create
this.st_campo=create st_campo
this.st_4=create st_4
this.st_dest=create st_dest
this.st_3=create st_3
this.pb_9=create pb_9
this.st_2=create st_2
this.dw_2=create dw_2
this.st_1=create st_1
this.pb_guardar=create pb_guardar
this.pb_ad_grup=create pb_ad_grup
this.pb_del_grupo=create pb_del_grupo
this.dw_1=create dw_1
this.Control[]={this.st_campo,&
this.st_4,&
this.st_dest,&
this.st_3,&
this.pb_9,&
this.st_2,&
this.dw_2,&
this.st_1,&
this.pb_guardar,&
this.pb_ad_grup,&
this.pb_del_grupo,&
this.dw_1}
end on

on w_conf_graficas_hc.destroy
destroy(this.st_campo)
destroy(this.st_4)
destroy(this.st_dest)
destroy(this.st_3)
destroy(this.pb_9)
destroy(this.st_2)
destroy(this.dw_2)
destroy(this.st_1)
destroy(this.pb_guardar)
destroy(this.pb_ad_grup)
destroy(this.pb_del_grupo)
destroy(this.dw_1)
end on

event open;i_st=message.powerobjectparm
select desplantilla into :plan  from hclin_plant where codplantilla=:i_st.codplantilla;
select descampo  into :campo from hclin_plantcampo where  codplantilla=:i_st.codplantilla AND numcampo=:i_st.numcampo;
st_dest.text=plan
st_campo.text=campo
dw_2.retrieve(i_st.codplantilla,i_st.numcampo)

end event

type st_campo from statictext within w_conf_graficas_hc
integer x = 1920
integer y = 20
integer width = 1221
integer height = 72
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
boolean border = true
borderstyle borderstyle = stylelowered!
boolean focusrectangle = false
end type

type st_4 from statictext within w_conf_graficas_hc
integer x = 1755
integer y = 28
integer width = 201
integer height = 52
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
string text = "Campo"
boolean focusrectangle = false
end type

type st_dest from statictext within w_conf_graficas_hc
integer x = 242
integer y = 20
integer width = 1221
integer height = 72
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
boolean border = true
borderstyle borderstyle = stylelowered!
boolean focusrectangle = false
end type

type st_3 from statictext within w_conf_graficas_hc
integer x = 50
integer y = 28
integer width = 201
integer height = 52
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
string text = "Plantilla"
boolean focusrectangle = false
end type

type pb_9 from picturebutton within w_conf_graficas_hc
integer x = 1591
integer y = 624
integer width = 142
integer height = 124
integer taborder = 50
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string picturename = "puerta.gif"
alignment htextalign = left!
string powertiptext = "Salir y Cancelar"
end type

event clicked;close(parent)
end event

type st_2 from statictext within w_conf_graficas_hc
integer x = 1755
integer y = 108
integer width = 507
integer height = 52
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
string text = "Gráficas Seleccionadas"
boolean focusrectangle = false
end type

type dw_2 from datawindow within w_conf_graficas_hc
integer x = 1755
integer y = 172
integer width = 1499
integer height = 748
integer taborder = 10
string title = "none"
string dataobject = "dw_campohc_graficas"
boolean hscrollbar = true
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event constructor;settransobject(sqlca)

end event

type st_1 from statictext within w_conf_graficas_hc
integer x = 50
integer y = 112
integer width = 443
integer height = 52
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
string text = "Gráficas Disponibles"
boolean focusrectangle = false
end type

type pb_guardar from picturebutton within w_conf_graficas_hc
string tag = "&Guardar Configuración Plan"
integer x = 1586
integer y = 476
integer width = 142
integer height = 124
integer taborder = 20
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string text = "           &g"
string picturename = "guardar2.GIF"
string disabledname = "d_guardar2.GIF"
alignment htextalign = left!
end type

event clicked;if dw_2.update()= -1 then
	rollback;
else
	commit;
end if
end event

type pb_ad_grup from picturebutton within w_conf_graficas_hc
string tag = "Agregar &Grafica a la Variable"
integer x = 1582
integer y = 196
integer width = 142
integer height = 124
integer taborder = 50
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string text = "           &g"
string picturename = "llevar.GIF"
string disabledname = "d_llevar.GIF"
alignment htextalign = left!
string powertiptext = "Agregar &Grafica a la Variable"
end type

event clicked;if dw_1.rowcount()<1 then return

string c_graf,des_graf,l_xy
long fila
fila=dw_1.getrow()
c_graf=dw_1.getitemstring(fila,1)
des_graf=dw_1.getitemstring(fila,2)
l_xy=dw_1.getitemstring(fila,3)
choose case l_xy
	case  '0'
	fila=dw_2.find("codgrafica='"+c_graf+"'",1,dw_2.rowcount())
	if fila=0 then
		fila=dw_2.insertrow(0)
		dw_2.setitem(fila,1,i_st.codplantilla)
		dw_2.setitem(fila,2,i_st.numcampo)
		dw_2.setitem(fila,3,c_graf)
		dw_2.setitem(fila,4,des_graf)
	end if
	
	if fila<>dw_2.getrow() then
		dw_2.scrolltorow(fila)
	end if

	case  '1','2'
		i_st.dw_data=dw_2
		i_st.empresa=c_graf
		i_st.c_otro=l_xy
		openwithparm(w_edita_xy,i_st)

end choose

end event

type pb_del_grupo from picturebutton within w_conf_graficas_hc
string tag = "&Borrar grupo del plan"
integer x = 1586
integer y = 336
integer width = 142
integer height = 124
integer taborder = 40
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string text = "             &"
string picturename = "borrar_fila.GIF"
string disabledname = "d_borrar_fila.GIF"
alignment htextalign = left!
string powertiptext = "&Borrar grupo del plan"
end type

event clicked;dw_2.deleterow(dw_2.getrow())
if dw_2.update()<1 then
	rollback;
//	dw_plan.triggerevent(rowfocuschanged!)
else
	commit;
end if
end event

type dw_1 from datawindow within w_conf_graficas_hc
integer x = 50
integer y = 172
integer width = 1499
integer height = 748
integer taborder = 10
string title = "none"
string dataobject = "dw_hclin_graficas_act"
boolean hscrollbar = true
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event constructor;settransobject(sqlca)
retrieve()
end event

