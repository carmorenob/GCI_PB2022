$PBExportHeader$w_biometria_usuarios.srw
forward
global type w_biometria_usuarios from window
end type
type huella_usuario from olecustomcontrol within w_biometria_usuarios
end type
type dw_biometria from datawindow within w_biometria_usuarios
end type
type pb_1 from picturebutton within w_biometria_usuarios
end type
type pb_veri from picturebutton within w_biometria_usuarios
end type
type dw_huella from datawindow within w_biometria_usuarios
end type
type mle_1 from multilineedit within w_biometria_usuarios
end type
type cbx_log from checkbox within w_biometria_usuarios
end type
type pb_salir from picturebutton within w_biometria_usuarios
end type
type pb_save from picturebutton within w_biometria_usuarios
end type
type log_es from listbox within w_biometria_usuarios
end type
type u_imagen from picture within w_biometria_usuarios
end type
end forward

global type w_biometria_usuarios from window
integer width = 1947
integer height = 1640
boolean titlebar = true
string title = "Biometria"
windowtype windowtype = child!
long backcolor = 67108864
string icon = "AppIcon!"
boolean center = true
huella_usuario huella_usuario
dw_biometria dw_biometria
pb_1 pb_1
pb_veri pb_veri
dw_huella dw_huella
mle_1 mle_1
cbx_log cbx_log
pb_salir pb_salir
pb_save pb_save
log_es log_es
u_imagen u_imagen
end type
global w_biometria_usuarios w_biometria_usuarios

type variables
st_usuarios l_prof_recibe
Integer ContDedos= 0, pos_x,pos_y, lu_contexto 
String documentos
Long il_resolucion, il_height, il_width
st_biometria u_template
Blob lblob_image
Boolean l_captura=false,l_huella=false
end variables

on w_biometria_usuarios.create
this.huella_usuario=create huella_usuario
this.dw_biometria=create dw_biometria
this.pb_1=create pb_1
this.pb_veri=create pb_veri
this.dw_huella=create dw_huella
this.mle_1=create mle_1
this.cbx_log=create cbx_log
this.pb_salir=create pb_salir
this.pb_save=create pb_save
this.log_es=create log_es
this.u_imagen=create u_imagen
this.Control[]={this.huella_usuario,&
this.dw_biometria,&
this.pb_1,&
this.pb_veri,&
this.dw_huella,&
this.mle_1,&
this.cbx_log,&
this.pb_salir,&
this.pb_save,&
this.log_es,&
this.u_imagen}
end on

on w_biometria_usuarios.destroy
destroy(this.huella_usuario)
destroy(this.dw_biometria)
destroy(this.pb_1)
destroy(this.pb_veri)
destroy(this.dw_huella)
destroy(this.mle_1)
destroy(this.cbx_log)
destroy(this.pb_salir)
destroy(this.pb_save)
destroy(this.log_es)
destroy(this.u_imagen)
end on

event open;If g_biometria='1' then
	integer l_k
	byte majorVersion=0, minorVersion=0
	string l_version,l_errors
	
	l_prof_recibe=message.powerobjectparm
	documentos=l_prof_recibe.usuario
	title='Biometria para: '+l_prof_recibe.clave
	
	huella_usuario.Object.DestroyContext(lu_contexto)
	huella_usuario.Object.Finalize()
	l_error=huella_usuario.object.Initialize()
	If l_error < 0 Then
		l_errors=f_biometria_error(l_error)
		f_biometria_escribe_log(log_es,l_errors)
		return -1
	Else
		f_biometria_escribe_log(log_es,"Biométrica Inicializada Satisfactoriamente")
	End If
	
	l_error =huella_usuario.object.GetGrFingerVersion(ref majorVersion, ref minorVersion)
	If l_error = GRFINGER_FULL Then l_version = "FULL"
	If l_error  = GRFINGER_LIGHT Then l_version = "LIGHT"
	f_biometria_escribe_log(log_es,'Version SDK Griaule '+string(majorVersion) +'.' +string(minorVersion) + '.' +' Licencia Tipo '+l_version)
	huella_usuario.Object.CapInitialize() 
	dw_huella.retrieve(documentos)
	dw_biometria.Modify("p_mano.FileName = '"+ f_biometria_muestra_imagen(dw_huella,'',documentos,ContDedos,'usuario')+"'")
Else
	close(w_biometria_usuarios)
End IF
end event

event close;huella_usuario.Object.DestroyContext(lu_contexto)
huella_usuario.Object.Finalize()
FileDelete(gbiometria_filePathName )
end event

type huella_usuario from olecustomcontrol within w_biometria_usuarios
event sensorplug ( string idsensor )
event sensorunplug ( string idsensor )
event fingerup ( string idsensor )
event fingerdown ( string idsensor )
event imageacquired ( string idsensor,  long ocx_width,  long ocx_height,  any rawimage,  long res )
boolean visible = false
integer x = 1093
integer y = 1420
integer width = 146
integer height = 128
integer taborder = 40
borderstyle borderstyle = stylelowered!
boolean focusrectangle = false
string binarykey = "w_biometria_usuarios.win"
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
end type

event sensorplug(string idsensor);Object.CapStartCapture(idSensor)
f_biometria_escribe_log(log_es,"Sensor: " + idSensor)

end event

event sensorunplug(string idsensor);Object.CapStopCapture(idSensor)
end event

event imageacquired(string idsensor, long ocx_width, long ocx_height, any rawimage, long res); st_biometria lu_test
integer lu_ret

//String ls_test
//ulong ll_handle
//il_height = ocx_height
//il_width  = ocx_width
//il_resolucion = res
u_imagen.picturename = ''
FileDelete(gbiometria_filePathName)
//Graba la imagen en archivo para poder mostrarla
huella_usuario.Object.CapSaveRawImageToFile(rawimage, ocx_width, ocx_Height,gbiometria_filePathName , GRCAP_IMAGE_FORMAT_BMP);
lu_test.size = 10000
lu_test.template = Blob(Space(lu_test.size))
lu_ret=huella_usuario.Object.Extract(ref rawimage, ocx_Width, ocx_Height, Res, Ref lu_test.template,Ref  lu_test.size, lu_contexto);
If lu_ret = GR_BAD_QUALITY Then
	u_imagen.picturename = "Erroneo.png"
 	return 
ElseIf lu_ret = GR_MEDIUM_QUALITY Then
		u_imagen.picturename = "Erroneo.png"
		Return 
  ElseIf lu_ret = GR_HIGH_QUALITY Then
		f_biometria_escribe_log(w_biometria_usuarios.log_es,"Huella Dactilar Extraida Satisfactoriamente. Calidad Excelente.")
End If
u_template =  lu_test
u_imagen.picturename = gbiometria_filePathName 
u_imagen.originalsize=false
u_imagen.resize(914,936)
pb_save.enabled=true
l_captura=true
l_huella=false
end event

type dw_biometria from datawindow within w_biometria_usuarios
integer x = 987
integer y = 196
integer width = 914
integer height = 936
integer taborder = 20
string dataobject = "dw_biometria_imagen"
boolean livescroll = true
borderstyle borderstyle = styleraised!
end type

event constructor;dw_biometria.InsertRow(0)
end event

event clicked;if 	l_captura=false  then 
	If 	dwo.name='p_indice' then
		ContDedos=2
		this.SetItem(row, 'indice', 1)
		f_biometria_escribe_log(log_es,"Capture Huella del dedo INDICE ")
		dw_biometria.Modify("p_mano.FileName = '"+ f_biometria_muestra_imagen(dw_huella,'cc',documentos,ContDedos,'usuario')+"'")
		dw_biometria.enabled=false
	End if
	
	If dwo.name='p_medio' then
		ContDedos=3
		this.SetItem(row, 'medio', 1)
		f_biometria_escribe_log(log_es,"Capture Huella del dedo MEDIO ")
		dw_biometria.Modify("p_mano.FileName = '"+ f_biometria_muestra_imagen(dw_huella,'cc',documentos,ContDedos,'usuario')+"'")
	end if
	
	If dwo.name='p_anular' then
		ContDedos=4
		this.SetItem(row, 'anular', 1)
		f_biometria_escribe_log(log_es,"Capture Huella del dedo ANULAR")
		dw_biometria.Modify("p_mano.FileName = '"+ f_biometria_muestra_imagen(dw_huella,'cc',documentos,ContDedos,'usuario')+"'")
	end if
	
	//If (pos_x>=905 and pos_x<=1042) and (pos_y>=884 and pos_y<=808) then
	//	ContDedos=1
	//     f_biometria_escribe_log(log_es,"Capture Huella del dedo PULGAR")
	//		p_dedo.picturename=f_biometria_muestra_imagen(dw_huella,'cc',documentos,ContDedos)
	//end if
	
	//If (pos_x>=1315 and pos_x<=1481) and (pos_y>=476 and pos_y<=540) then
	//	ContDedos=5
	//     f_biometria_escribe_log(log_es,"Capture Huella del dedo MEÑIQUE")
	//		p_dedo.picturename=f_biometria_muestra_imagen(dw_huella,'cc',documentos,ContDedos)
	//end if
end if
	

end event

type pb_1 from picturebutton within w_biometria_usuarios
boolean visible = false
integer x = 261
integer y = 1412
integer width = 151
integer height = 132
integer taborder = 40
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string picturename = "verificad.gif"
string disabledname = "d_verificad.gif"
alignment htextalign = left!
end type

event clicked;String l_rec[2]

l_rec=f_biometria_valida_paciente(u_template,'%','%',dw_huella,GR_MATCH,huella_usuario,'usuario')
if l_rec[1]<> '-1' then
messagebox('1',l_rec[1])
messagebox('2',l_rec[2])
end if


end event

type pb_veri from picturebutton within w_biometria_usuarios
boolean visible = false
integer x = 489
integer y = 1416
integer width = 151
integer height = 132
integer taborder = 40
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string picturename = "verificad.gif"
string disabledname = "d_verificad.gif"
alignment htextalign = left!
end type

event clicked;String l_rec[2]

l_rec=f_biometria_valida_paciente(u_template,'tipdoc','docu',dw_huella,GR_MATCH,huella_usuario,'usuario')
messagebox('1',l_rec[1])
messagebox('2',l_rec[2])


end event

type dw_huella from datawindow within w_biometria_usuarios
boolean visible = false
integer x = 1344
integer y = 1436
integer width = 539
integer height = 96
integer taborder = 30
string title = "none"
string dataobject = "dw_biometria_usuarios"
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event constructor;settransobject(sqlca)
end event

type mle_1 from multilineedit within w_biometria_usuarios
integer x = 41
integer y = 12
integer width = 1861
integer height = 172
integer taborder = 10
integer textsize = -7
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 15793151
string text = "Para captuar la huella dactilar, haga click en el dedo de la mano.  Puede borrar la huella haciendo click sobre el dedo.  Los dedos inscritos aparecen en color verde o de manera resaltada."
borderstyle borderstyle = stylelowered!
end type

type cbx_log from checkbox within w_biometria_usuarios
integer x = 50
integer y = 1180
integer width = 942
integer height = 72
integer textsize = -7
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Mostar Log del Lector de Huellas"
boolean checked = true
end type

event clicked;if cbx_log.checked then
    log_es.visible = True
Else
    log_es.visible= False
end If
end event

type pb_salir from picturebutton within w_biometria_usuarios
integer x = 878
integer y = 1416
integer width = 151
integer height = 132
integer taborder = 30
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string picturename = "puerta.gif"
alignment htextalign = left!
end type

event clicked;If g_biometria='1' then
	huella_usuario.Object.DestroyContext(lu_contexto)
	huella_usuario.Object.Finalize()
End If
FileDelete(gbiometria_filePathName )
close(parent)
end event

type pb_save from picturebutton within w_biometria_usuarios
integer x = 704
integer y = 1416
integer width = 151
integer height = 132
integer taborder = 30
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
boolean enabled = false
string picturename = "guardar.gif"
string disabledname = "d_guardar.gif"
alignment htextalign = left!
end type

event clicked;long	l_fila,ll_handle
String ls_error, ls_test
Blob  lblob_aux
int donde

l_captura=false
ls_test="usuario='"+documentos+"' and dedo="+string(ContDedos)
l_fila=dw_huella.find(ls_test,1,dw_huella.rowcount())
if l_fila=0 then
	l_fila	= dw_huella.InsertRow(0)
	dw_huella.setitem(l_fila,'usuario',documentos)
	dw_huella.setitem(l_fila,'dedo',ContDedos)
end if
ll_handle = FileOpen(gbiometria_filePathName , StreamMode!)
if ll_handle < 1 then
	f_biometria_escribe_log(log_es,'Error al abrir el archivo temporal de imagen')
	return -1
End if
FileReadEx(ll_handle, lblob_image)
FileClose(ll_handle)

if dw_huella.update()=-1 then
	rollback;
	f_biometria_escribe_log(log_Es,'Error grabando datos Biometricos')
	return -1
end if

UPDATEBLOB usuarios_biometria SET datos_huella =  :u_template.template
WHERE (((usuario)=:documentos) AND (dedo=:ContDedos));		
if SQLCA.SQLCode <> 0 then
	Rollback;
	MessageBox( 'Error', 'Error al Grabar el Patrón de la Huella ')
	Return -1
Else
	Commit;
End if
dw_huella.retrieve(documentos)
dw_biometria.enabled=true
u_imagen.picturename = "Erroneo.png"
return 1
end event

type log_es from listbox within w_biometria_usuarios
integer x = 32
integer y = 1252
integer width = 1861
integer height = 152
integer taborder = 10
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 15793151
boolean vscrollbar = true
boolean sorted = false
borderstyle borderstyle = stylelowered!
end type

type u_imagen from picture within w_biometria_usuarios
integer x = 41
integer y = 196
integer width = 914
integer height = 936
boolean originalsize = true
string picturename = "erroneo.png"
boolean border = true
borderstyle borderstyle = styleraised!
boolean focusrectangle = false
end type


Start of PowerBuilder Binary Data Section : Do NOT Edit
03w_biometria_usuarios.bin 
2B00000600e011cfd0e11ab1a1000000000000000000000000000000000003003e0009fffe00000006000000000000000000000001000000010000000000001000fffffffe00000000fffffffe0000000000000000fffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffdfffffffeffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff006f00520074006f004500200074006e00790072000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000050016ffffffffffffffffffffffff000000000000000000000000000000000000000000000000000000000000000000000000fffffffe00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000ffffffffffffffffffffffff0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000ffffffffffffffffffffffff0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000ffffffffffffffffffffffff000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
13w_biometria_usuarios.bin 
End of PowerBuilder Binary Data Section : No Source Expected After This Point
