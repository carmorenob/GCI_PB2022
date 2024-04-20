$PBExportHeader$w_cambia_clave_usuario.srw
forward
global type w_cambia_clave_usuario from window
end type
type sle_fin from singlelineedit within w_cambia_clave_usuario
end type
type st_6 from statictext within w_cambia_clave_usuario
end type
type sle_ini from singlelineedit within w_cambia_clave_usuario
end type
type st_5 from statictext within w_cambia_clave_usuario
end type
type pb_cancela from picturebutton within w_cambia_clave_usuario
end type
type pb_aceptar from picturebutton within w_cambia_clave_usuario
end type
type st_3 from statictext within w_cambia_clave_usuario
end type
type st_2 from statictext within w_cambia_clave_usuario
end type
type st_4 from statictext within w_cambia_clave_usuario
end type
type sle_nueva from singlelineedit within w_cambia_clave_usuario
end type
type sle_confirma from singlelineedit within w_cambia_clave_usuario
end type
type st_1 from statictext within w_cambia_clave_usuario
end type
type sle_actual from singlelineedit within w_cambia_clave_usuario
end type
type gb_1 from groupbox within w_cambia_clave_usuario
end type
end forward

global type w_cambia_clave_usuario from window
integer width = 1417
integer height = 904
boolean titlebar = true
boolean controlmenu = true
windowtype windowtype = response!
long backcolor = 67108864
sle_fin sle_fin
st_6 st_6
sle_ini sle_ini
st_5 st_5
pb_cancela pb_cancela
pb_aceptar pb_aceptar
st_3 st_3
st_2 st_2
st_4 st_4
sle_nueva sle_nueva
sle_confirma sle_confirma
st_1 st_1
sle_actual sle_actual
gb_1 gb_1
end type
global w_cambia_clave_usuario w_cambia_clave_usuario

type variables
st_usuarios st_usu
end variables

on w_cambia_clave_usuario.create
this.sle_fin=create sle_fin
this.st_6=create st_6
this.sle_ini=create sle_ini
this.st_5=create st_5
this.pb_cancela=create pb_cancela
this.pb_aceptar=create pb_aceptar
this.st_3=create st_3
this.st_2=create st_2
this.st_4=create st_4
this.sle_nueva=create sle_nueva
this.sle_confirma=create sle_confirma
this.st_1=create st_1
this.sle_actual=create sle_actual
this.gb_1=create gb_1
this.Control[]={this.sle_fin,&
this.st_6,&
this.sle_ini,&
this.st_5,&
this.pb_cancela,&
this.pb_aceptar,&
this.st_3,&
this.st_2,&
this.st_4,&
this.sle_nueva,&
this.sle_confirma,&
this.st_1,&
this.sle_actual,&
this.gb_1}
end on

on w_cambia_clave_usuario.destroy
destroy(this.sle_fin)
destroy(this.st_6)
destroy(this.sle_ini)
destroy(this.st_5)
destroy(this.pb_cancela)
destroy(this.pb_aceptar)
destroy(this.st_3)
destroy(this.st_2)
destroy(this.st_4)
destroy(this.sle_nueva)
destroy(this.sle_confirma)
destroy(this.st_1)
destroy(this.sle_actual)
destroy(this.gb_1)
end on

event open;this.x=(ancho -this.width)/2
this.y=(alto -this.height)/2
st_usu= Message.PowerObjectParm	
title='Cambio de Clave para: -- '+st_usu.usuario
int l_dias
SELECT ENTERO into :l_dias
FROM parametros_gen
WHERE (((codigo_para)=7));
if sqlca.sqlnrows=0 then
	messagebox('Atencíon','No hay parametro 7')
	return -1
end if

sle_ini.text=string(today())
sle_fin.text=string(RelativeDate(today(),l_dias))
end event

type sle_fin from singlelineedit within w_cambia_clave_usuario
integer x = 494
integer y = 284
integer width = 498
integer height = 72
integer taborder = 30
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
integer limit = 10
boolean displayonly = true
borderstyle borderstyle = stylelowered!
end type

event modified;if st_usu.clave<>sle_actual.text then
	messagebox("Error","No coinciden las clave con el registro")
	sle_actual.setfocus()
end if
end event

type st_6 from statictext within w_cambia_clave_usuario
integer x = 119
integer y = 284
integer width = 361
integer height = 72
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 16777215
string text = "Fecha Final"
boolean border = true
borderstyle borderstyle = stylelowered!
boolean focusrectangle = false
end type

type sle_ini from singlelineedit within w_cambia_clave_usuario
integer x = 494
integer y = 200
integer width = 498
integer height = 72
integer taborder = 20
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
integer limit = 10
boolean displayonly = true
borderstyle borderstyle = stylelowered!
end type

event modified;if st_usu.clave<>sle_actual.text then
	messagebox("Error","No coinciden las clave con el registro")
	sle_actual.setfocus()
end if
end event

type st_5 from statictext within w_cambia_clave_usuario
integer x = 119
integer y = 196
integer width = 361
integer height = 72
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 16777215
string text = "Fecha Inicial"
boolean border = true
borderstyle borderstyle = stylelowered!
boolean focusrectangle = false
end type

type pb_cancela from picturebutton within w_cambia_clave_usuario
string tag = "Cancelar"
integer x = 1088
integer y = 208
integer width = 146
integer height = 128
integer taborder = 70
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
boolean originalsize = true
string picturename = "cancelar.GIF"
string disabledname = "d_cancelar.GIF"
end type

event clicked;closewithreturn(parent,'-1')

end event

type pb_aceptar from picturebutton within w_cambia_clave_usuario
string tag = "Guardar"
integer x = 1088
integer y = 68
integer width = 146
integer height = 128
integer taborder = 60
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
boolean originalsize = true
string picturename = "guardar.gif"
string disabledname = "d_guardar.gif"
end type

event clicked;string ocultar
date ini,fin
ini=date(sle_ini.text)
fin=date(sle_fin.text)
if ini>fin then 
	messagebox("Error","Fecha Inicial mayor que fecha Final")
	return
end if
//if fin<st_usu.fin then
//	messagebox("Error","Fecha Final debe ser mayor que "+string(st_usu.fin ))
//	return
//end if
if isnull(sle_nueva.text)  or sle_nueva.text='' then 
	messagebox("Error","Clave nueva no puede ser null")
	return
end If
if isnull(sle_confirma.text) or sle_confirma.text='' then 
	messagebox("Error","Clave confirmar no puede ser null")
	return
end If
if sle_nueva.text<>sle_confirma.text then 
	messagebox("Error","No coinciden las claves")
	return
end if
ocultar=f_encripta_new(sle_nueva.text)
If f_valida_usuario(usuario,sle_nueva.text)<>0 then
	return -1
End If

UPDATE Usuarios SET clave = :ocultar,fecinicio=:ini ,cfecfin=:fin,intento=0,tp='1'
WHERE (((usuario)=:usuario));
if sqlca.sqlcode=-1 then
	messagebox("Error Actualizando Clave",sqlca.sqlerrtext)
	rollback;
	return
else
	commit;
end if
closewithreturn(parent,'0')

end event

type st_3 from statictext within w_cambia_clave_usuario
integer x = 114
integer y = 112
integer width = 361
integer height = 72
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 16777215
string text = "Clave Actual"
boolean border = true
borderstyle borderstyle = stylelowered!
boolean focusrectangle = false
end type

type st_2 from statictext within w_cambia_clave_usuario
integer x = 119
integer y = 368
integer width = 361
integer height = 72
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 16777215
string text = "Clave Nueva"
boolean border = true
borderstyle borderstyle = stylelowered!
boolean focusrectangle = false
end type

type st_4 from statictext within w_cambia_clave_usuario
integer x = 119
integer y = 460
integer width = 361
integer height = 72
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 16777215
string text = "Confirma Clave"
boolean border = true
borderstyle borderstyle = stylelowered!
boolean focusrectangle = false
end type

type sle_nueva from singlelineedit within w_cambia_clave_usuario
integer x = 494
integer y = 368
integer width = 498
integer height = 72
integer taborder = 40
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
boolean password = true
integer limit = 10
borderstyle borderstyle = stylelowered!
end type

type sle_confirma from singlelineedit within w_cambia_clave_usuario
integer x = 494
integer y = 460
integer width = 498
integer height = 72
integer taborder = 50
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
boolean password = true
integer limit = 10
borderstyle borderstyle = stylelowered!
end type

type st_1 from statictext within w_cambia_clave_usuario
integer x = 32
integer y = 592
integer width = 1179
integer height = 132
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 134217752
string text = "Digite la Clave Actual, recuerde que tiene que coindidir con el registro existente"
alignment alignment = center!
boolean border = true
borderstyle borderstyle = stylelowered!
boolean focusrectangle = false
end type

type sle_actual from singlelineedit within w_cambia_clave_usuario
integer x = 494
integer y = 116
integer width = 498
integer height = 72
integer taborder = 10
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
boolean password = true
integer limit = 10
borderstyle borderstyle = stylelowered!
end type

event modified;
if st_usu.clave<>sle_actual.text then
	messagebox("Error","No coinciden las clave con el registro")
	sle_actual.setfocus()
end if
end event

type gb_1 from groupbox within w_cambia_clave_usuario
integer x = 37
integer y = 28
integer width = 1015
integer height = 544
integer textsize = -6
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Small Fonts"
long textcolor = 33554432
long backcolor = 67108864
string text = "CAMBIO CLAVE"
borderstyle borderstyle = styleraised!
end type

