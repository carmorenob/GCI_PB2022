$PBExportHeader$w_conecta_enf.srw
forward
global type w_conecta_enf from window
end type
type st_3 from statictext within w_conecta_enf
end type
type dw_1 from datawindow within w_conecta_enf
end type
type dw_usuario from datawindow within w_conecta_enf
end type
type p_1 from picture within w_conecta_enf
end type
type st_1 from statictext within w_conecta_enf
end type
type pb_cancel from picturebutton within w_conecta_enf
end type
type pb_aceptar from picturebutton within w_conecta_enf
end type
type sle_passwd from singlelineedit within w_conecta_enf
end type
type gb_1 from groupbox within w_conecta_enf
end type
end forward

global type w_conecta_enf from window
integer x = 302
integer y = 300
integer width = 1536
integer height = 1176
boolean titlebar = true
string title = "Inicio Enfermeria"
windowtype windowtype = response!
long backcolor = 67108864
string pointer = "Arrow!"
boolean clientedge = true
boolean center = true
st_3 st_3
dw_1 dw_1
dw_usuario dw_usuario
p_1 p_1
st_1 st_1
pb_cancel pb_cancel
pb_aceptar pb_aceptar
sle_passwd sle_passwd
gb_1 gb_1
end type
global w_conecta_enf w_conecta_enf

type variables
int intentos
datawindowchild dwc_p
st_ordenes st_p
string usu

end variables

on w_conecta_enf.create
this.st_3=create st_3
this.dw_1=create dw_1
this.dw_usuario=create dw_usuario
this.p_1=create p_1
this.st_1=create st_1
this.pb_cancel=create pb_cancel
this.pb_aceptar=create pb_aceptar
this.sle_passwd=create sle_passwd
this.gb_1=create gb_1
this.Control[]={this.st_3,&
this.dw_1,&
this.dw_usuario,&
this.p_1,&
this.st_1,&
this.pb_cancel,&
this.pb_aceptar,&
this.sle_passwd,&
this.gb_1}
end on

on w_conecta_enf.destroy
destroy(this.st_3)
destroy(this.dw_1)
destroy(this.dw_usuario)
destroy(this.p_1)
destroy(this.st_1)
destroy(this.pb_cancel)
destroy(this.pb_aceptar)
destroy(this.sle_passwd)
destroy(this.gb_1)
end on

event open;//backcolor=rgb(220,220,220)
//gb_1.backcolor=rgb(220,220,220)
//st_1.backcolor=rgb(220,220,220)
//st_2.backcolor=rgb(220,220,220)
intentos=0
st_p.cprof = '!'
st_p.cesp = '!'

long conteo,f
setnull (usu)
select count(*) into :conteo from profe where usuario=:usuario;
if conteo = 1 then
	select codprof into :usu from profe where usuario = :usuario;
end if
if isnull(usu) then
	dw_usuario.SetFocus()
	return
end if
sle_passwd.setfocus()
dw_usuario.SetItem(1,1,usuario)
dw_1.Retrieve(usu)
/*para ubuicar el usraio y valide bien el profesional*/
f=dwc_p.find ("upper(usuario)='"+upper(usuario)+"'",1,dwc_p.rowcount())
if f>0 then
	dwc_p.setrow(f)
else
	MessageBox('Atención','El profesional no tiene especialidad')
end if

if dw_1.RowCount() = 1 then
	st_p.cesp = dw_1.GetItemString(1,'cesp')
	dw_1.SelectRow(1,TRUE)
elseif dw_1.RowCount() = 0 then
	MessageBox('Atención','El profesional no tiene especialidad')
else
	dw_1.SelectRow(1,TRUE)
end if

end event

event close;closewithreturn(this,st_p)
end event

type st_3 from statictext within w_conecta_enf
integer x = 59
integer y = 508
integer width = 347
integer height = 56
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
string text = "Especialidades"
boolean focusrectangle = false
end type

type dw_1 from datawindow within w_conecta_enf
integer x = 41
integer y = 568
integer width = 1422
integer height = 352
integer taborder = 30
string title = "none"
string dataobject = "dw_espprof"
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event constructor;setTransObject(SQLCA)

end event

event clicked;if row <= 0 then return
long i
for i = 1 to RowCount()
	selectRow(i,FALSE)
next
selectRow(row,TRUE)

end event

type dw_usuario from datawindow within w_conecta_enf
integer x = 571
integer y = 160
integer width = 809
integer height = 84
integer taborder = 20
string title = "none"
string dataobject = "dw_ext_profe"
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event constructor;setTransObject(SQLCA)
dw_usuario.GetChild('codprof',dwc_p)
dwc_p.SetTransObject(SQLCA)
if dwc_p.Retrieve() = 0 then
	dwc_p.InsertRow(0)
	MessageBox('Atención','No hay profesionales de enfermería')
End if
insertrow(0)

end event

event itemchanged;dw_1.Retrieve(dwc_p.GetItemString(dwc_p.GetRow(),'codprof'))
if dw_1.RowCount() = 1 then
	st_p.cesp = dw_1.GetItemString(1,'cesp')
elseif dw_1.RowCount() = 0 then
	MessageBox('Atención','El profesional no tiene especialidad')
else
	dw_1.SelectRow(1,TRUE)
end if

end event

type p_1 from picture within w_conecta_enf
integer x = 91
integer y = 60
integer width = 443
integer height = 412
boolean originalsize = true
string picturename = "gci.jpg"
boolean focusrectangle = false
end type

type st_1 from statictext within w_conecta_enf
boolean visible = false
integer x = 658
integer y = 56
integer width = 375
integer height = 48
string dragicon = "none!"
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string pointer = "Arrow!"
long textcolor = 33554432
long backcolor = 67108864
string text = "Inicio Enfermeria"
boolean focusrectangle = false
end type

type pb_cancel from picturebutton within w_conecta_enf
integer x = 795
integer y = 928
integer width = 146
integer height = 128
integer taborder = 40
string dragicon = "none!"
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string pointer = "Arrow!"
boolean cancel = true
boolean originalsize = true
string picturename = "cancelar.gif"
end type

event clicked;close(parent)
end event

type pb_aceptar from picturebutton within w_conecta_enf
integer x = 622
integer y = 928
integer width = 146
integer height = 128
integer taborder = 30
string dragicon = "none!"
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string pointer = "Arrow!"
boolean default = true
boolean originalsize = true
string picturename = "aceptar.gif"
end type

event clicked;string clave,estado,tp
long i
if isNull(dw_usuario.GetItemString(1,1)) then 
	dw_usuario.setfocus()
	return
end if
usu = dw_usuario.GetItemString(1,1)
select clave,estado, fecinicio, cfecfin,tp into :clave , :estado,:usu_fecha_ini,:usu_fecha_fin,:tp
from usuarios where usuario=:usu;
if isnull(estado) or estado="" or estado="2" then
	messagebox("Atención","Usuario no existe, o no está activo")
	intentos++
	if intentos>2 then closewithreturn(parent,'!')
	return
else
	if  today()<usu_fecha_ini or today()> usu_fecha_fin  then
		Messagebox("Error","Su contaseña ha Caducado Renuevala")
		intentos++
		if intentos>2 then closewithreturn(parent,'!')
		return
	else
		if sle_passwd.text<>f_descripta_new(clave,tp) or isnull(clave) then
			Messagebox("Error","Contraseña no válida")
			intentos++
			if intentos>2 then closewithreturn(parent,'!')
			return
		end if
	end If
end if
int conteo
select count(*) into :conteo from profe where usuario=:usu
and enfermero ='1';
if conteo = 0 then
	MessageBox('Atención','El usuario no aparece como enfermero en la tabla de profesionales')
	Return -1
end if
st_p.cprof = dwc_p.GetItemString(dwc_p.GetRow(),'codprof')
for i = 1 to dw_1.RowCount()
	if dw_1.isSelected(i) then
		st_p.cesp = dw_1.GetItemString(i,'cesp')
	end if
next
if isNull(st_p.cesp) or st_p.cesp = '' then
	if dw_1.RowCount() > 0 then st_p.cesp = dw_1.GetItemString(i,'cesp')
end if
st_p.cprof = dwc_p.GetItemString(dwc_p.GetRow(),'codprof')
st_p.usu=usu
close(parent)


end event

type sle_passwd from singlelineedit within w_conecta_enf
integer x = 571
integer y = 288
integer width = 800
integer height = 84
integer taborder = 20
string dragicon = "none!"
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string pointer = "ibeam!"
long textcolor = 33554432
long backcolor = 16777215
boolean password = true
integer limit = 10
borderstyle borderstyle = stylelowered!
boolean hideselection = false
end type

type gb_1 from groupbox within w_conecta_enf
integer x = 37
integer y = 4
integer width = 1426
integer height = 496
string dragicon = "none!"
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string pointer = "Arrow!"
long textcolor = 33554432
long backcolor = 67108864
borderstyle borderstyle = styleraised!
end type

