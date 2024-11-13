$PBExportHeader$w_conecta_evol.srw
forward
global type w_conecta_evol from window
end type
type dw_usuario from datawindow within w_conecta_evol
end type
type dw_1 from datawindow within w_conecta_evol
end type
type st_2 from statictext within w_conecta_evol
end type
type st_3 from statictext within w_conecta_evol
end type
type dw_hingreso from datawindow within w_conecta_evol
end type
type huella_ingreso from olecustomcontrol within w_conecta_evol
end type
type c_imagen from picture within w_conecta_evol
end type
type p_1 from picture within w_conecta_evol
end type
type pb_cancel from picturebutton within w_conecta_evol
end type
type pb_aceptar from picturebutton within w_conecta_evol
end type
type sle_passwd from singlelineedit within w_conecta_evol
end type
type gb_1 from groupbox within w_conecta_evol
end type
type gb_2 from groupbox within w_conecta_evol
end type
end forward

global type w_conecta_evol from window
integer x = 302
integer y = 300
integer width = 1573
integer height = 1364
windowtype windowtype = response!
long backcolor = 67108864
string pointer = "Arrow!"
boolean clientedge = true
boolean center = true
dw_usuario dw_usuario
dw_1 dw_1
st_2 st_2
st_3 st_3
dw_hingreso dw_hingreso
huella_ingreso huella_ingreso
c_imagen c_imagen
p_1 p_1
pb_cancel pb_cancel
pb_aceptar pb_aceptar
sle_passwd sle_passwd
gb_1 gb_1
gb_2 gb_2
end type
global w_conecta_evol w_conecta_evol

type variables
int intentos,c_contexto
st_ordenes st_p
st_usuarios st_u
string i_profe='!',i_cancel='!',usu,ls_orden='!'
Boolean lc_huella=false
st_biometria c_template
datawindowchild dwc_p
end variables

on w_conecta_evol.create
this.dw_usuario=create dw_usuario
this.dw_1=create dw_1
this.st_2=create st_2
this.st_3=create st_3
this.dw_hingreso=create dw_hingreso
this.huella_ingreso=create huella_ingreso
this.c_imagen=create c_imagen
this.p_1=create p_1
this.pb_cancel=create pb_cancel
this.pb_aceptar=create pb_aceptar
this.sle_passwd=create sle_passwd
this.gb_1=create gb_1
this.gb_2=create gb_2
this.Control[]={this.dw_usuario,&
this.dw_1,&
this.st_2,&
this.st_3,&
this.dw_hingreso,&
this.huella_ingreso,&
this.c_imagen,&
this.p_1,&
this.pb_cancel,&
this.pb_aceptar,&
this.sle_passwd,&
this.gb_1,&
this.gb_2}
end on

on w_conecta_evol.destroy
destroy(this.dw_usuario)
destroy(this.dw_1)
destroy(this.st_2)
destroy(this.st_3)
destroy(this.dw_hingreso)
destroy(this.huella_ingreso)
destroy(this.c_imagen)
destroy(this.p_1)
destroy(this.pb_cancel)
destroy(this.pb_aceptar)
destroy(this.sle_passwd)
destroy(this.gb_1)
destroy(this.gb_2)
end on

event open;st_p.cesp = '!'
st_p.cprof= '!'
st_p.clugar='!'
st_u= Message.PowerObjectParm
i_profe=st_u.usuario
intentos=0
setnull (usu)
if st_u.destino='ATOS' then 
	ls_orden='1'
else
	ls_orden='0'	
end if

if i_profe<>'' then
	select usuario into :usu from profe where codprof=:i_profe;
	if isnull(usu) then
		messagebox("Atención",'Este profesional no tiene relación con usuarios, no puede Continuar')
		closewithreturn(this,i_cancel)
		return
	end if
	dw_usuario.SetItem(1,1,i_profe)	
else
	select codprof into :i_profe from profe where usuario=:usuario;
	select usuario into :usu from profe where codprof=:i_profe;
	if isnull(i_profe) then
		messagebox("Atención",'Este usuario no tiene relación con profesionales, no puede Continuar')
		closewithreturn(this,i_cancel)
		return
	end if
	dw_usuario.SetItem(1,1,usuario)	
	usu=usuario
end if

sle_passwd.setfocus()
dw_1.retrieve(i_profe)
if dw_1.RowCount() = 1 then
	dw_1.SelectRow(1,TRUE)
	st_p.cesp = dw_1.GetItemString(1,'cesp')
	elseif dw_1.RowCount() = 0 then
		MessageBox('Atención','El profesional no tiene especialidad')
		return -1
	else
		st_p.cesp = dw_1.GetItemString(1,'cesp')
		dw_1.SelectRow(1,TRUE)
	end if

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
st_p.cprof = dwc_p.GetItemString(dwc_p.GetRow(),'codprof')
if dw_1.RowCount() >0  then
	st_p.cesp = dw_1.GetItemString(dw_1.getrow(),'cesp')
end if
closewithreturn(this,st_p)
end event

type dw_usuario from datawindow within w_conecta_evol
integer x = 370
integer y = 468
integer width = 809
integer height = 76
integer taborder = 10
string title = "none"
string dataobject = "dw_usu_evoluciona"
boolean hscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event constructor;if g_motor='postgres' then
	dw_usuario.dataobject='dw_usu_evoluciona_postgres'
else
	dw_usuario.dataobject='dw_usu_evoluciona'
end if
dw_usuario.settransobject(sqlca)
dw_usuario.GetChild('codprof',dwc_p)
dwc_p.SetTransObject(SQLCA)
if dwc_p.Retrieve() = 0 then
	dwc_p.InsertRow(0)
	MessageBox('Atención','No hay profesionales de enfermería')
End if
insertrow(0)

end event

event itemchanged;dw_1.Retrieve(dwc_p.GetItemString(dwc_p.GetRow(),'codprof'))
usu=data
if dw_1.RowCount() = 1 then
	st_p.cesp = dw_1.GetItemString(1,'cesp')
	st_p.cprof = dwc_p.GetItemString(dwc_p.GetRow(),'codprof')
elseif dw_1.RowCount() = 0 then
	MessageBox('Atención','El profesional no tiene especialidad')
else
	dw_1.SelectRow(1,TRUE)
end if

end event

type dw_1 from datawindow within w_conecta_evol
integer x = 55
integer y = 804
integer width = 1426
integer height = 352
integer taborder = 50
string title = "none"
string dataobject = "dw_espprof"
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event clicked;if row <= 0 then return
long i
for i = 1 to RowCount()
	selectRow(i,FALSE)
next
selectRow(row,TRUE)

end event

event constructor;setTransObject(SQLCA)

end event

type st_2 from statictext within w_conecta_evol
integer x = 59
integer y = 736
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

type st_3 from statictext within w_conecta_evol
boolean visible = false
integer x = 197
integer y = 416
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

type dw_hingreso from datawindow within w_conecta_evol
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

type huella_ingreso from olecustomcontrol within w_conecta_evol
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
string binarykey = "w_conecta_evol.win"
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

type c_imagen from picture within w_conecta_evol
boolean visible = false
integer x = 1463
integer y = 48
integer width = 174
integer height = 132
boolean originalsize = true
boolean focusrectangle = false
end type

type p_1 from picture within w_conecta_evol
integer x = 370
integer y = 84
integer width = 805
integer height = 328
string picturename = "gci_new.jpg"
boolean focusrectangle = false
end type

type pb_cancel from picturebutton within w_conecta_evol
integer x = 809
integer y = 1184
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

type pb_aceptar from picturebutton within w_conecta_evol
integer x = 599
integer y = 1184
integer width = 146
integer height = 128
integer taborder = 30
string dragicon = "none!"
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string pointer = "Arrow!"
boolean default = true
boolean originalsize = true
string picturename = "aceptar.gif"
end type

event clicked;string clave,estado,tp,evol
if isNull(dw_usuario.GetItemString(1,1)) then 
	dw_usuario.setfocus()
	return
end if
if isnull(usu) then usu = dw_usuario.GetItemString(1,1)
select clave,usuarios.estado, fecinicio, cfecfin,tp,profe.evoluciona
into :clave , :estado,:usu_fecha_ini,:usu_fecha_fin,:tp,:evol
from usuarios inner join profe on usuarios.usuario = profe.usuario
where usuarios.usuario=:usu;
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
if ls_orden<>'1' then
	if isnull(evol) or evol='0' then
		Messagebox("Error","No tiene permisos par acceder a esta opción")
		return
	end if
end if
i_cancel=usu
st_p.clugar=clugar
st_p.cesp = dw_1.GetItemString(dw_1.getrow(),'cesp')
st_p.cprof = dwc_p.GetItemString(dwc_p.GetRow(),'codprof')
st_p.usu=usu
close(parent)
end event

type sle_passwd from singlelineedit within w_conecta_evol
integer x = 375
integer y = 556
integer width = 800
integer height = 96
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

type gb_1 from groupbox within w_conecta_evol
integer x = 59
integer y = 20
integer width = 1426
integer height = 696
string dragicon = "none!"
integer textsize = -7
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Small Fonts"
string pointer = "Arrow!"
long textcolor = 33554432
long backcolor = 67108864
string text = "Inicio Evolución"
borderstyle borderstyle = styleraised!
end type

type gb_2 from groupbox within w_conecta_evol
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
0Fw_conecta_evol.bin 
2B00000600e011cfd0e11ab1a1000000000000000000000000000000000003003e0009fffe00000006000000000000000000000001000000010000000000001000fffffffe00000000fffffffe0000000000000000fffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffdfffffffeffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff006f00520074006f004500200074006e00790072000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000050016ffffffffffffffffffffffff000000000000000000000000000000000000000000000000000000000000000000000000fffffffe00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000ffffffffffffffffffffffff0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000ffffffffffffffffffffffff0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000ffffffffffffffffffffffff000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
1Fw_conecta_evol.bin 
End of PowerBuilder Binary Data Section : No Source Expected After This Point
