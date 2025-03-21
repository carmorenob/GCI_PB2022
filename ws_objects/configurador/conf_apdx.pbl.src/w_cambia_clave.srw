$PBExportHeader$w_cambia_clave.srw
forward
global type w_cambia_clave from window
end type
type pb_2 from picturebutton within w_cambia_clave
end type
type pb_1 from picturebutton within w_cambia_clave
end type
type st_1 from statictext within w_cambia_clave
end type
type sle_1 from singlelineedit within w_cambia_clave
end type
end forward

global type w_cambia_clave from window
integer width = 910
integer height = 528
boolean titlebar = true
string title = "Cambiar Clave Aplicación"
boolean controlmenu = true
windowtype windowtype = response!
long backcolor = 67108864
boolean center = true
pb_2 pb_2
pb_1 pb_1
st_1 st_1
sle_1 sle_1
end type
global w_cambia_clave w_cambia_clave

type variables

end variables

on w_cambia_clave.create
this.pb_2=create pb_2
this.pb_1=create pb_1
this.st_1=create st_1
this.sle_1=create sle_1
this.Control[]={this.pb_2,&
this.pb_1,&
this.st_1,&
this.sle_1}
end on

on w_cambia_clave.destroy
destroy(this.pb_2)
destroy(this.pb_1)
destroy(this.st_1)
destroy(this.sle_1)
end on

event open;this.x=(ancho -this.width)/2
this.y=(alto -this.height)/2


end event

type pb_2 from picturebutton within w_cambia_clave
integer x = 462
integer y = 312
integer width = 146
integer height = 128
integer taborder = 50
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

type pb_1 from picturebutton within w_cambia_clave
integer x = 293
integer y = 312
integer width = 146
integer height = 128
integer taborder = 40
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

event clicked;string l_lice,l_nom_regis,l_activacion,l_aplicativo,esta,val_hast,cual
l_nom_regis=w_para_grales_new.sle_3.text
esta=l_nom_regis
if w_para_grales_new.c_asis.checked then
	l_lice=w_para_grales_new.em_3.text
	l_aplicativo=w_para_grales_new.ddlb_4.text
	choose case l_aplicativo
		case "CONSULTORIO"
			cual="1"
		case "APOYO DIAGNOSTICO"
			cual="2"
		case "ESPECIALISTA"
			cual="3"
		case "CONSULTA EXTERNA"
			cual="4"
		case "CLINICA"
			cual="5"
		case "HOSPITAL"
			cual="6"
		case "ODONTOLOGIA"
			cual="7"
		case "CONSULTORIO + APIDOCKER"
			cual="8"
		case "APOYO DIAGNOSTICO + APIDOCKER"
			cual="9"
		case "ESPECIALISTA + APIDOCKER"
			cual="10"
		case "CONSULTA EXTERNA + APIDOCKER"
			cual="11"
		case "CLINICA + APIDOCKER"
			cual="12"
		case "HOSPITAL + APIDOCKER"
			cual="13"
		case "ODONTOLOGIA + APIDOCKER"
			cual="14"					
	end choose
	l_aplicativo=cual
	esta+=l_lice+l_aplicativo
	esta+=left(trim(w_para_grales_new.sle_vers_as.text),5)
else
	l_lice='0'
end if
val_hast=w_para_grales_new.em_2.text
l_activacion=sle_1.text
if w_para_grales_new.rb_2.checked then esta+=val_hast
string temp='0'
if w_para_grales_new.c_con.checked then temp=w_para_grales_new.em_con.text
esta+=temp
if w_para_grales_new.c_con.checked and w_para_grales_new.em_cont.text<>"0000/00" then esta+=w_para_grales_new.em_cont.text
temp='0'
if w_para_grales_new.c_tes.checked then temp=w_para_grales_new.em_tes.text
esta+=temp
if w_para_grales_new.c_tes.checked and w_para_grales_new.em_teso.text<>"0000/00" then esta+=w_para_grales_new.em_teso.text
temp='0'
if w_para_grales_new.c_sum.checked then temp=w_para_grales_new.em_sum.text
esta+=temp
if w_para_grales_new.c_sum.checked and w_para_grales_new.em_sumi.text<>"0000/00" then esta+=w_para_grales_new.em_sumi.text
temp='0'
if w_para_grales_new.c_car.checked then temp=w_para_grales_new.em_car.text
esta+=temp
if w_para_grales_new.c_car.checked and w_para_grales_new.em_cart.text<>"0000/00" then esta+=w_para_grales_new.em_cart.text
temp='0'
if w_para_grales_new.c_act.checked then temp=w_para_grales_new.em_act.text
esta+=temp
if w_para_grales_new.c_act.checked and w_para_grales_new.em_acti.text<>"0000/00" then esta+=w_para_grales_new.em_acti.text
temp='0'
if w_para_grales_new.c_nom.checked then temp=w_para_grales_new.em_nom.text
esta+=temp
if w_para_grales_new.c_nom.checked and w_para_grales_new.em_nomi.text<>"0000/00" then esta+=w_para_grales_new.em_nomi.text
temp='0'
if w_para_grales_new.c_cos.checked then temp=w_para_grales_new.em_cos.text
esta+=temp
if w_para_grales_new.c_cos.checked and w_para_grales_new.em_cost.text<>"0000/00" then esta+=w_para_grales_new.em_cost.text
temp='0'
if w_para_grales_new.c_pre.checked then temp=w_para_grales_new.em_pre.text
esta+=temp
if w_para_grales_new.c_pre.checked and w_para_grales_new.em_pres.text<>"0000/00" then esta+=w_para_grales_new.em_pres.text
if w_para_grales_new.c_con.checked or w_para_grales_new.c_tes.checked or w_para_grales_new.c_sum.checked or w_para_grales_new.c_car.checked or w_para_grales_new.c_act.checked or w_para_grales_new.c_nom.checked or w_para_grales_new.c_cos.checked or w_para_grales_new.c_pre.checked then esta+=left(trim(w_para_grales_new.sle_vers_adm.text),5)
if f_checksum(esta,l_activacion)=false then
	messagebox("Error","Esta clave no es válida para los parámetros que tiene")
	return 
end if
w_para_grales_new.sle_5.text=sle_1.text
close(parent)
end event

type st_1 from statictext within w_cambia_clave
integer x = 14
integer y = 12
integer width = 855
integer height = 188
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 134217752
string text = "Digite la Nueva Clave, recuerde que tiene que ver con los parámetros de Instalación"
alignment alignment = center!
boolean border = true
borderstyle borderstyle = stylelowered!
boolean focusrectangle = false
end type

type sle_1 from singlelineedit within w_cambia_clave
integer x = 14
integer y = 224
integer width = 855
integer height = 84
integer taborder = 10
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
borderstyle borderstyle = stylelowered!
end type

