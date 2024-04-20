$PBExportHeader$w_conecta_val.srw
forward
global type w_conecta_val from window
end type
type st_3 from statictext within w_conecta_val
end type
type dw_hingreso from datawindow within w_conecta_val
end type
type huella_ingreso from olecustomcontrol within w_conecta_val
end type
type c_imagen from picture within w_conecta_val
end type
type p_1 from picture within w_conecta_val
end type
type st_1 from statictext within w_conecta_val
end type
type pb_cancel from picturebutton within w_conecta_val
end type
type pb_aceptar from picturebutton within w_conecta_val
end type
type sle_passwd from singlelineedit within w_conecta_val
end type
type sle_usuario from singlelineedit within w_conecta_val
end type
type gb_1 from groupbox within w_conecta_val
end type
type gb_2 from groupbox within w_conecta_val
end type
end forward

global type w_conecta_val from window
integer x = 302
integer y = 300
integer width = 1509
integer height = 664
windowtype windowtype = response!
long backcolor = 67108864
string pointer = "Arrow!"
boolean clientedge = true
boolean center = true
st_3 st_3
dw_hingreso dw_hingreso
huella_ingreso huella_ingreso
c_imagen c_imagen
p_1 p_1
st_1 st_1
pb_cancel pb_cancel
pb_aceptar pb_aceptar
sle_passwd sle_passwd
sle_usuario sle_usuario
gb_1 gb_1
gb_2 gb_2
end type
global w_conecta_val w_conecta_val

type variables
int intentos,c_contexto
st_ordenes st_p
string i_profe='!',i_cancel='!'
Boolean lc_huella=false
st_biometria c_template
end variables

on w_conecta_val.create
this.st_3=create st_3
this.dw_hingreso=create dw_hingreso
this.huella_ingreso=create huella_ingreso
this.c_imagen=create c_imagen
this.p_1=create p_1
this.st_1=create st_1
this.pb_cancel=create pb_cancel
this.pb_aceptar=create pb_aceptar
this.sle_passwd=create sle_passwd
this.sle_usuario=create sle_usuario
this.gb_1=create gb_1
this.gb_2=create gb_2
this.Control[]={this.st_3,&
this.dw_hingreso,&
this.huella_ingreso,&
this.c_imagen,&
this.p_1,&
this.st_1,&
this.pb_cancel,&
this.pb_aceptar,&
this.sle_passwd,&
this.sle_usuario,&
this.gb_1,&
this.gb_2}
end on

on w_conecta_val.destroy
destroy(this.st_3)
destroy(this.dw_hingreso)
destroy(this.huella_ingreso)
destroy(this.c_imagen)
destroy(this.p_1)
destroy(this.st_1)
destroy(this.pb_cancel)
destroy(this.pb_aceptar)
destroy(this.sle_passwd)
destroy(this.sle_usuario)
destroy(this.gb_1)
destroy(this.gb_2)
end on

event open;st_p.cesp = '!'
st_p.cprof= '!'
st_p.clugar='!'
i_profe=message.stringparm
intentos=0
string usu
setnull (usu)
if i_profe<>'' then
	sle_passwd.setfocus()
else
	sle_usuario.displayonly=false
	sle_usuario.setfocus()
end if
sle_usuario.text=i_profe
//INICIA BIOMETRIA
If g_biometria='1' then
	huella_ingreso.object.Initialize()
	If l_error < 0 Then
		return -1
	Else
		huella_ingreso.Object.DestroyContext(c_contexto)
		huella_ingreso.Object.Finalize()
		huella_ingreso.Object.CapInitialize()
	End If
	//FIN BIOMETRIA
end if



end event

event close;If g_biometria='1' then
	huella_ingreso.Object.DestroyContext(c_contexto)
	huella_ingreso.Object.Finalize()
end if
FileDelete(gbiometria_filePathName)
//closewithreturn(this,i_cancel)
st_p.cprof= i_profe
closewithreturn(this,st_p)
end event

type st_3 from statictext within w_conecta_val
boolean visible = false
integer x = 64
integer y = 480
integer width = 471
integer height = 40
integer textsize = -6
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Small Fonts"
long textcolor = 255
long backcolor = 67108864
string text = "Coloque Dedo sobre Lector"
alignment alignment = center!
boolean focusrectangle = false
end type

type dw_hingreso from datawindow within w_conecta_val
boolean visible = false
integer x = 1495
integer y = 376
integer width = 146
integer height = 128
integer taborder = 60
string title = "none"
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

type huella_ingreso from olecustomcontrol within w_conecta_val
event sensorplug ( string idsensor )
event sensorunplug ( string idsensor )
event fingerup ( string idsensor )
event fingerdown ( string idsensor )
event imageacquired ( string idsensor,  long ocx_width,  long ocx_height,  any rawimage,  long res )
boolean visible = false
integer x = 1490
integer y = 216
integer width = 146
integer height = 128
integer taborder = 50
borderstyle borderstyle = stylelowered!
boolean focusrectangle = false
string binarykey = "w_conecta_val.win"
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
end type

event sensorplug(string idsensor);if isnull(idSensor) or idSensor='' or  Upper(idSensor)=Upper('file') then
	p_1.x=82
	p_1.y=120
	p_1.width=379
	p_1.height=	160
	p_1.picturename='conecta.gif'	
	p_1.border=false
	p_1.originalsize=true
	st_3.visible=false
else
	p_1.x=78
	p_1.y=64
	p_1.width=434
	p_1.height=	240
	p_1.picturename='conecta1.jpg'
	st_3.visible=true
	p_1.border=true
end if
Object.CapStartCapture(idSensor)
end event

event sensorunplug(string idsensor);Object.CapStopCapture(idSensor)
end event

event imageacquired(string idsensor, long ocx_width, long ocx_height, any rawimage, long res);st_biometria lc_test
integer lc_ret

c_imagen.picturename = ''
FileDelete(gbiometria_filePathName)
//Graba la imagen en archivo para poder mostrarla
huella_ingreso.Object.CapSaveRawImageToFile(rawimage, ocx_width, ocx_Height,gbiometria_filePathName , GRCAP_IMAGE_FORMAT_BMP);
lc_test.size = 10000
lc_test.template = Blob(Space(lc_test.size))
lc_ret=huella_ingreso.Object.Extract(ref rawimage, ocx_Width, ocx_Height, Res, Ref lc_test.template,Ref  lc_test.size, c_contexto);
c_template =  lc_test
c_imagen.picturename = gbiometria_filePathName
c_imagen.originalsize=false
c_imagen.resize(174,132)
c_imagen.visible=true
lc_huella=true
pb_aceptar.postevent(clicked!) 
end event

type c_imagen from picture within w_conecta_val
boolean visible = false
integer x = 1463
integer y = 48
integer width = 174
integer height = 132
boolean originalsize = true
boolean focusrectangle = false
end type

type p_1 from picture within w_conecta_val
integer x = 91
integer y = 56
integer width = 443
integer height = 412
boolean originalsize = true
string picturename = "gci.jpg"
boolean focusrectangle = false
end type

type st_1 from statictext within w_conecta_val
integer x = 567
integer y = 60
integer width = 343
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
string text = "Inicio Evolución"
boolean focusrectangle = false
end type

type pb_cancel from picturebutton within w_conecta_val
integer x = 928
integer y = 440
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

event clicked;//If g_biometria='1' then
//	huella_ingreso.Object.DestroyContext(c_contexto)
//	huella_ingreso.Object.Finalize()
//end if
//FileDelete(gbiometria_filePathName)
st_p.clugar='!'
closewithreturn(parent,i_cancel)

end event

type pb_aceptar from picturebutton within w_conecta_val
integer x = 722
integer y = 436
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

event clicked;string clave,estado,USU,tp
if trim(sle_usuario.text)="" then 
	sle_usuario.setfocus()
	return
end if
if trim(sle_passwd.text)=""  or isnull(sle_passwd.text) then
  messagebox("Atención",'El Password no puede ser Null') 
  sle_passwd.setfocus()
  return
end if
usu=trim(sle_usuario.text)
select clave,estado, fecinicio, cfecfin,tp
into :clave , :estado,:usu_fecha_ini,:usu_fecha_fin,:tp from usuarios where usuario=:usu;
if isnull(estado) or estado="" or estado="2" then
	messagebox("Atención","Usuario no existe, o no está activo")
	intentos++
	if intentos>2 then closewithreturn(parent,i_cancel)
	return
else
	if  today()<usu_fecha_ini or today()> usu_fecha_fin  then
		Messagebox("Error","Su contaseña ha Caducado Renuevala")
		intentos++
		if intentos>2 then closewithreturn(parent,i_cancel)
		return
	else
		if sle_passwd.text<>f_descripta_new(clave,tp) or isnull(clave) then
			Messagebox("Error","Contraseña no válida")
			intentos++
			if intentos>2 then closewithreturn(parent,i_cancel)
			return
		end if
		double dias_faltan
		dias_faltan=DaysAfter( today(), usu_fecha_fin )
		If dias_faltan>0 and dias_faltan<=10 then 
			Messagebox("Atención","Faltan dias "+string(dias_faltan)+" Para Renovar Su Clave")
		End If
	End If
end if
i_cancel=sle_usuario.text
st_p.clugar='1'
close(parent)
end event

type sle_passwd from singlelineedit within w_conecta_val
integer x = 571
integer y = 308
integer width = 800
integer height = 92
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
string placeholder = "Contraseña"
end type

type sle_usuario from singlelineedit within w_conecta_val
integer x = 571
integer y = 172
integer width = 800
integer height = 92
integer taborder = 10
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
integer limit = 15
boolean displayonly = true
borderstyle borderstyle = stylelowered!
string placeholder = "Digita tu usuario"
end type

type gb_1 from groupbox within w_conecta_val
integer x = 50
integer y = 4
integer width = 1413
integer height = 600
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

type gb_2 from groupbox within w_conecta_val
integer y = 396
integer width = 1536
integer height = 12
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
end type


Start of PowerBuilder Binary Data Section : Do NOT Edit
0Cw_conecta_val.bin 
2B00000600e011cfd0e11ab1a1000000000000000000000000000000000003003e0009fffe00000006000000000000000000000001000000010000000000001000fffffffe00000000fffffffe0000000000000000fffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffdfffffffeffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff006f00520074006f004500200074006e00790072000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000050016ffffffffffffffffffffffff000000000000000000000000000000000000000000000000000000000000000000000000fffffffe00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000ffffffffffffffffffffffff0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000ffffffffffffffffffffffff0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000ffffffffffffffffffffffff000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
1Cw_conecta_val.bin 
End of PowerBuilder Binary Data Section : No Source Expected After This Point
