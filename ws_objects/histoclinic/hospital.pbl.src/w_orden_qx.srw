$PBExportHeader$w_orden_qx.srw
forward
global type w_orden_qx from window
end type
type st_3 from statictext within w_orden_qx
end type
type tiempo from singlelineedit within w_orden_qx
end type
type st_1 from statictext within w_orden_qx
end type
type l_ate from datawindow within w_orden_qx
end type
type via from datawindow within w_orden_qx
end type
type st_5 from statictext within w_orden_qx
end type
type st_2 from statictext within w_orden_qx
end type
type mle_1 from multilineedit within w_orden_qx
end type
type pb_aceptar from picturebutton within w_orden_qx
end type
end forward

global type w_orden_qx from window
integer width = 2098
integer height = 568
boolean titlebar = true
string title = "Orden Qx"
windowtype windowtype = response!
long backcolor = 67108864
string icon = "Question!"
boolean center = true
st_3 st_3
tiempo tiempo
st_1 st_1
l_ate l_ate
via via
st_5 st_5
st_2 st_2
mle_1 mle_1
pb_aceptar pb_aceptar
end type
global w_orden_qx w_orden_qx

type variables
datawindow dw_cpo
datawindowchild late,tanes
string l_ta,l_cd
end variables

event open;dw_cpo=message.powerobjectparm
mle_1.text=dw_cpo.getitemstring(dw_cpo.getrow(),'descripcion')
tiempo.text=string(dw_cpo.getitemnumber(dw_cpo.getrow(),'tiempo_cirugia'))
if isnull(tiempo.text) then tiempo.text='1'
mle_1.SelectText ( 1, 1)
end event

on w_orden_qx.create
this.st_3=create st_3
this.tiempo=create tiempo
this.st_1=create st_1
this.l_ate=create l_ate
this.via=create via
this.st_5=create st_5
this.st_2=create st_2
this.mle_1=create mle_1
this.pb_aceptar=create pb_aceptar
this.Control[]={this.st_3,&
this.tiempo,&
this.st_1,&
this.l_ate,&
this.via,&
this.st_5,&
this.st_2,&
this.mle_1,&
this.pb_aceptar}
end on

on w_orden_qx.destroy
destroy(this.st_3)
destroy(this.tiempo)
destroy(this.st_1)
destroy(this.l_ate)
destroy(this.via)
destroy(this.st_5)
destroy(this.st_2)
destroy(this.mle_1)
destroy(this.pb_aceptar)
end on

type st_3 from statictext within w_orden_qx
integer x = 846
integer y = 368
integer width = 343
integer height = 60
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Minutos"
boolean focusrectangle = false
end type

type tiempo from singlelineedit within w_orden_qx
integer x = 471
integer y = 356
integer width = 343
integer height = 76
integer taborder = 30
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 15793151
borderstyle borderstyle = stylelowered!
end type

type st_1 from statictext within w_orden_qx
integer x = 59
integer y = 352
integer width = 293
integer height = 84
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Tiempo Qx"
boolean focusrectangle = false
end type

type l_ate from datawindow within w_orden_qx
integer x = 466
integer y = 260
integer width = 1253
integer height = 76
integer taborder = 20
string dataobject = "dw_combo_lateralidad_new"
borderstyle borderstyle = stylelowered!
end type

event constructor;settransobject(sqlca)
insertrow(1)
getchild("cod_lat",late)
late.settransobject(sqlca)
late.retrieve()
end event

event itemchanged;l_cd=gettext()
end event

type via from datawindow within w_orden_qx
integer x = 466
integer y = 144
integer width = 1253
integer height = 84
integer taborder = 10
string dataobject = "dw_combo_tipo_anes"
borderstyle borderstyle = stylelowered!
end type

event constructor;settransobject(sqlca)
insertrow(1)
getchild("codtipoanestesia",tanes)
tanes.settransobject(sqlca)
tanes.retrieve()

end event

event itemchanged;l_ta=gettext()
end event

type st_5 from statictext within w_orden_qx
integer x = 64
integer y = 260
integer width = 293
integer height = 84
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Lateralidad"
boolean focusrectangle = false
end type

type st_2 from statictext within w_orden_qx
integer x = 64
integer y = 148
integer width = 384
integer height = 84
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Tipo Anestesia"
boolean focusrectangle = false
end type

type mle_1 from multilineedit within w_orden_qx
integer x = 23
integer y = 16
integer width = 2007
integer height = 108
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 15793151
boolean displayonly = true
borderstyle borderstyle = stylelowered!
end type

type pb_aceptar from picturebutton within w_orden_qx
integer x = 1856
integer y = 148
integer width = 146
integer height = 128
integer taborder = 40
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
boolean default = true
boolean originalsize = true
string picturename = "aceptar.GIF"
string disabledname = "d_aceptar.GIF"
alignment htextalign = left!
end type

event clicked;if long(tiempo.text)<1 then return
if long(tiempo.text)>3600 then
	if messagebox('Atención','La cantidad es superior a 3600 desea continuar aún así?',question!,yesno!,2)=2 then
		tiempo.text='0'
		return 2
	end if
end if
string pasa
dw_cpo.setitem(dw_cpo.getrow(),"tiempo_cirugia",long(tiempo.text))
dw_cpo.setitem(dw_cpo.getrow(),"codtipoanestesia",l_ta)
dw_cpo.setitem(dw_cpo.getrow(),"cod_late",l_cd)
texto_np=' Tiempo Qx: '+tiempo.text+' minutos'
tanes.setfilter(" codtipoanestesia ='"+l_ta+"'")
texto_np=texto_np + ' Tipo Anestesia: '+tanes.getitemstring(tanes.getrow(),'descripcion')
late.setfilter(" cod_lat  ='"+l_cd+"'")
texto_np=texto_np + ' Lateralidad: '+late.getitemstring(late.getrow(),'desp_lat')
close(parent)
end event

